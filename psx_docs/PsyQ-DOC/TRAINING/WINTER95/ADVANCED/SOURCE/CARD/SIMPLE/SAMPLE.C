/*
	sample.c
*/

#include <kernel.h>
#include <sys/file.h>
#include <sys/types.h>

#define NO_WAIT_ACCESS	1	/* O_NOWAIT で read/write */

/* イベント情報 */
#define CARD_IOE	1	/* IOE */
#define CARD_ERROR	2	/* ERROR */
#define CARD_TIMEOUT	3	/* TIMEOUT */
#define CARD_NEWCARD	4	/* NEW CARD */

#define BLOCK_SIZE	8192	/* ブロックサイズ */
#define MAX_BLOCK	15	/* MAX ブロック/カード */
#define MAX_FNAME	21	/* ファイル名の最大文字数 */

#define	EXIST_FILE	0	/* 既存ファイル */
#define	NEW_FILE	1	/* 新規ファイル */

/* カードステータス情報 */
#define	CARDSTS_OK	1	/* 正常 */
#define	CARDSTS_NEW	2	/* 新規カード */
#define	CARDSTS_NONE	-1	/* カードが挿入されていない */
#define	CARDSTS_UNFMT	-2	/* フォーマットされていない */
#define	CARDSTS_ERR	-3	/* 原因不明エラー */

unsigned long ev0,ev1,ev2,ev3;		/* SwCARD イベントディスクリプタ */
unsigned long ev10,ev11,ev12,ev13;	/* HwCARD イベントディスクリプタ */
struct DIRENTRY SLOT_DIR[MAX_BLOCK];	/* ディレクトリエントリ */

extern struct DIRENTRY *firstfile(), *nextfile();

void InitMemCard(long val);
void StopMemCard(void);
int _card_event(void);
int _card_event_NW(void);
void _clear_event(void);
int _card_event_x(void);
void _clear_event_x(void);
int GetCardEntry(int cnct, int slot);
int GetCardSpace(int file_num);
int CheckFileExist(int filenum, char *fname);
int ReadCardFile(int cnct, int slot, char *fname, char *buf, long block);
int WriteCardFile(int cnct,int slot,char *fname,char *buf,long block,int new);
int CheckCardStatus(int cnct, int slot);
int FormatCard(int cnct, int slot);


/* メモリカード制御モジュールの初期化 */
/* in  : val	0 or 1 (コントローラとの併用 : 1) */
void InitMemCard(long val)
{
	InitCARD(val);		/* 通常 val=1 : コントローラと併用 */
	StartCARD();
	_bu_init();
	ChangeClearPAD(0);

	EnterCriticalSection();
	ev0  = OpenEvent(SwCARD, EvSpIOE, EvMdNOINTR, NULL);
	ev1  = OpenEvent(SwCARD, EvSpERROR, EvMdNOINTR, NULL);
	ev2  = OpenEvent(SwCARD, EvSpTIMOUT, EvMdNOINTR, NULL);
	ev3  = OpenEvent(SwCARD, EvSpNEW, EvMdNOINTR, NULL);
	ev10 = OpenEvent(HwCARD, EvSpIOE, EvMdNOINTR, NULL);
	ev11 = OpenEvent(HwCARD, EvSpERROR, EvMdNOINTR, NULL);
	ev12 = OpenEvent(HwCARD, EvSpTIMOUT, EvMdNOINTR, NULL);
	ev13 = OpenEvent(HwCARD, EvSpNEW, EvMdNOINTR, NULL);
	ExitCriticalSection();

	EnableEvent(ev0);
	EnableEvent(ev1);
	EnableEvent(ev2);
	EnableEvent(ev3);
	EnableEvent(ev10);
	EnableEvent(ev11);
	EnableEvent(ev12);
	EnableEvent(ev13);

}

/* メモリカード制御モジュールの終了 */
void StopMemCard(void)
{
	EnterCriticalSection();
	CloseEvent(ev0);
	CloseEvent(ev1);
	CloseEvent(ev2);
	CloseEvent(ev3);
	CloseEvent(ev10);
	CloseEvent(ev11);
	CloseEvent(ev12);
	CloseEvent(ev13);
	ExitCriticalSection();
#if 0
	StopCARD();
#endif
}

/* 原因ディスクリプタトSwCARDイベントチェック */
int _card_event(void)
{
	while(1) {
		if(TestEvent(ev0)==1) return CARD_IOE;		/* IOE */
		if(TestEvent(ev1)==1) return CARD_ERROR;	/* ERROR */
		if(TestEvent(ev2)==1) return CARD_TIMEOUT;	/* TIMEOUT */
		if(TestEvent(ev3)==1) return CARD_NEWCARD;	/* NEW CARD */
	}
}

/* 原因ディスクリプタトSwCARDイベントチェック(NO_WAIT) */
int _card_event_NW(void)
{
	if(TestEvent(ev0)==1) return CARD_IOE;		/* IOE */
	if(TestEvent(ev1)==1) return CARD_ERROR;	/* ERROR */
	if(TestEvent(ev2)==1) return CARD_TIMEOUT;	/* TIMEOUT */
	if(TestEvent(ev3)==1) return CARD_NEWCARD;	/* NEW CARD */
	return(0);					/* イベント未発生 */
}

/* 原因ディスクリプタトSwCARDイベントクリア */
void _clear_event(void)
{
	TestEvent(ev0);
	TestEvent(ev1);
	TestEvent(ev2);
	TestEvent(ev3);
}

/* 原因ディスクリプタトHwCARDイベントチェック */
int _card_event_x(void) {

	while(1) {
		if(TestEvent(ev10)==1) return CARD_IOE;		/* IOE */
		if(TestEvent(ev11)==1) return CARD_ERROR;	/* ERROR */
		if(TestEvent(ev12)==1) return CARD_TIMEOUT;	/* TIMEOUT */
		if(TestEvent(ev13)==1) return CARD_NEWCARD;	/* NEW CARD */
	}
}

/* 原因ディスクリプタトHwCARDイベントクリア */
void _clear_event_x(void) {

	TestEvent(ev10);
	TestEvent(ev11);
	TestEvent(ev12);
	TestEvent(ev13);
}

/* 指定スロットの全ディレクトリエントリの取得 */
/* in  : cnct	コネクタ No.(0 or 1)
	 slot	スロット No.(通常 0、マルチタップ 0～3)
   out : 0～15	使用ファイル数
*/
int GetCardEntry(int cnct, int slot)
{
	long i = 0;
	char key[32];
	struct DIRENTRY *d;

	sprintf(key, "bu%1d%1d:*", cnct, slot);	/* cnct:コネクタ番号 */
						/* slot:スロット番号 */
	d = SLOT_DIR;
	if(firstfile(key, d) == d)	/* d:バッファポインタ */
	{
		do {
			i++;
			d++;
		} while(nextfile(d) == d);
	}

	return i;			/* 使用ファイル数 */
}

/* ディレクトリエントリからの空きブロックの取得 */
/* in  : filenum メモリーカード内のファイル数
   out : 0～15	 使用ブロック数
*/
int GetCardSpace(int file_num)
{
	int	ret, i;
	long	size = 0;
	struct DIRENTRY *d;

	d = SLOT_DIR;
	for(i=0; i<file_num; i++)
		size += d[i].size;

	size /= BLOCK_SIZE;

	return (MAX_BLOCK - size);		/* 空きブロック数 */
}

/* 同名ファイルの存在チェック */
/* in  : filenum チェックしたいファイル名の総数
	 *fname  ファイル名の文字列
   out : 0 存在しない	1 存在する */
int CheckFileExist(int filenum, char *fname)
{
	int	i, j, flag, ret;
	struct DIRENTRY *d;

	d = SLOT_DIR;
	ret = 0;
	for(i=0; i<filenum; i++) {
		flag = 0;
		for(j=0; j<MAX_FNAME; j++) {
			if(fname[j]==0) break;
			if(fname[j]!=d[i].name[j]) {
				flag++;
				break;
			}
		}
		if(!flag) {
			ret = 1;
			break;
		}
		
	}
	return(ret);
}

/* 指定したスロットからのファイルの読みだし */
/* in  : cnct	コネクタ No.(0 or 1)
	 slot	スロット No.(通常 0、マルチタップ 0～3)
	 *fname	ファイル名(MAX 20 byte + 0x00)
	 *buf	読み込み領域へのポインタ
	 block	読み込みブロック数(1～15)
   out : 0	成功
   	 -1	失敗
*/
int ReadCardFile(int cnct, int slot, char *fname, char *buf, long block)
{
	int	ret;
	long	fd;
	char	key[32];
	long	read_size;

	sprintf(key, "bu%1d%1d:%s", cnct, slot, fname);

	read_size = BLOCK_SIZE * block;		/* block:ブロック数 */
#ifdef NO_WAIT_ACCESS	/* O_NOWAIT モードで READ */
	if((fd = open(key, O_RDONLY|O_NOWAIT)) != -1) {
	        _clear_event();
		read(fd, buf, read_size);	/* 返り値は常に 0 */
		while(1) {
			/* SwCARD イベントで終了を検知 */
       	       		if(ret = _card_event_NW()) break;
		}
		if(ret==CARD_IOE) ret = 0;	/* 読み込み成功 */
		else		  ret = -1;	/* 読み込みエラー */
		close(fd);
	}
	else ret = -1;		/* 書き込みエラー */
#else			/* BLOCK モードで READ */
	if ((fd = open(key, O_RDONLY)) != -1) {
		if((ret = read(fd, buf, read_size)) == read_size) {
			ret = 0;		/* 読み込み成功 */
		}
		else ret = -1;	/* 読み込みエラー */
		close(fd);
	}
	else ret = -1;		/* 読み込みエラー */
#endif

	return ret;
}

/* 指定したスロットへのファイルの書き込み */
/* in  : cnct	コネクタ No.(0 or 1)
	 slot	スロット No.(通常 0、マルチタップ 0～3)
	 *fname	ファイル名(MAX 20 byte + 0x00)
	 *buf	書き込み領域へのポインタ
	 block	書き込みブロック数(1～15)
	 new	EXIST_FILE:既存ファイル	NEW_FILE:既存ファイル
   out : 0	成功
   	 -1	失敗
*/
int WriteCardFile(int cnct,int slot,char *fname,char *buf,long block,int new)
{
	int	ret, i;
	long	fd;
	char	key[32];
	long	write_size;

	sprintf(key, "bu%1d%1d:%s", cnct, slot, fname);

	/* 新規作成？ */
	if(new==NEW_FILE) {
		if ((fd = open(key, O_CREAT|(block<<16))) != -1) {
			close(fd);		/* いったん CLOSE */
		}
		else return(ret = -1);		/* 書き込みエラー */
	}
	write_size = block * BLOCK_SIZE;
#ifdef NO_WAIT_ACCESS	/* O_NOWAIT モードで WRITE */
	if((fd = open(key, O_WRONLY|O_NOWAIT)) != -1) {
	        _clear_event();
		write(fd, buf, write_size);	/* 返り値は常に 0 */
		while(1) {
			/* SwCARD イベントで終了を検知 */
       	       		if(ret = _card_event_NW()) break;
		}
		if(ret==CARD_IOE) ret = 0;	/* 書き込み成功 */
		else		  ret = -1;	/* 書き込みエラー */
		close(fd);
	}
	else ret = -1;		/* 書き込みエラー */
#else			/* BLOCK モードで WRITE */
	if((fd = open(key, O_WRONLY)) != -1) {
		if((ret = write(fd, buf, write_size)) == write_size) {
			ret = 0;	/* 書き込み成功 */
		}
		else ret = -1;		/* 書き込みエラー */
		close(fd);
	}
	else ret = -1;		/* 書き込みエラー */
#endif
	return ret;
}

/* 指定スロットの状態チェック */
/* in  : cnct	コネクタ No.(0 or 1)
	 slot	スロット No.(通常 0、マルチタップ 0～3)
   out : CARDSTS_OK	1	正常
	 CARDSTS_NEW	2	新規カード
	 CARDSTS_NONE	-1	カードが挿入されていない
	 CARDSTS_UNFMT	-2	フォーマットされていない
	 CARDSTS_ERR	-3	原因不明エラー
*/
int CheckCardStatus(int cnct, int slot)
{
	long	chan;
	int	ret, rval;

	chan = cnct * 16 + slot;
	_card_info(chan);
	ret = _card_event();

	switch(ret) {
	case CARD_IOE:			/* カードが存在する */
		rval = CARDSTS_OK;
		break;
	case CARD_TIMEOUT:		/* カードが存在しない */
		rval = CARDSTS_NONE;
		break;
	case CARD_NEWCARD:		/* 新たにカードが挿入された */
		rval = CARDSTS_NEW;
		_clear_event_x();
		_card_clear(chan);
		ret = _card_event_x();
		break;
	case CARD_ERROR:		/* 原因不明 */
	default:
		rval = CARDSTS_ERR;
		break;
	}

	if((rval==CARDSTS_NONE)||(rval==CARDSTS_ERR)) goto EXIT_CARDCHECK;

	_clear_event();
	_card_load(chan);
	ret = _card_event();

	switch(ret) {
	case CARD_IOE:			/* フォーマット済み */
		break;
	case CARD_TIMEOUT:		/* カードは存在しない */
		rval = CARDSTS_NONE;
		break;
	case CARD_NEWCARD:		/* フォーマットされていない */
		rval = CARDSTS_UNFMT;
		break;
	case CARD_ERROR:		/* 原因不明 */
	default:
		rval = CARDSTS_ERR;
		break;
	}

EXIT_CARDCHECK:
	return (rval);
}

/* 指定スロットのカードのフォーマット */
/* ret = CARDSTS_OK	1	正常
	 CARDSTS_NONE	-1	カードが挿入されていない
	 CARDSTS_ERR	-3	原因不明エラー */
int FormatCard(int cnct, int slot)
{
	int	ret;
	char	fs[6];

	sprintf(fs, "bu%1d%1d:", cnct, slot);
	_clear_event_x();
	format(fs);	/* format() は成否にかかわらず常に 1 を返す！ */
	ret = _card_event_x();
	if(ret == CARD_IOE)		ret = CARDSTS_OK;
	else if(ret == CARD_TIMEOUT)	ret = CARDSTS_NONE;
	else				ret = CARDSTS_ERR;
	return ret;
}

