/*
	card.c
*/

#include <r3000.h>
#include <asm.h>
#include <kernel.h>
#include <sys/file.h>
#include <sys/types.h>
#include <libgte.h>
#include <libgpu.h>
#include <libetc.h>
#include "card.h"

#define	TIME_OUT_MAX	120		/* 適当 */

unsigned long ev0,ev1,ev2,ev3;		/* SwCARD イベントディスクリプタ */
unsigned long ev10,ev11,ev12,ev13;	/* HwCARD イベントディスクリプタ */
struct DIRENTRY SLOT_DIR[MAX_BLOCK];	/* ディレクトリエントリ */

int EVENT_TIME_OUT;		/* イベントチェックのタイムアウト用ベース値 */
int CARD_STS;			/* カードチェック結果 */
int CARD_STS_TMP;		/* テンポラリのカードチェック値 */
int CARD_STS_MODE;		/* カードステータスチェック用状態遷移モード */
int CARD_LOAD_FLAG = CARD_LOAD_NG;	/* すでに _card_load チェック済みか
					どうかの判定フラグ */

long	FILE_DSCRPTR;	/* 非同期 SAVE/LOAD 時のファイルディスクリプタ */

extern struct DIRENTRY *firstfile(), *nextfile();

void InitMemCard(long val);
void StopMemCard(void);
int _card_event(void);
void _clear_event(void);
void _clear_event_NW(void);
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
void InitMemCard(long val)
{
	InitCARD(val);
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

/* 原因ディスクリプタ SwCARD イベントチェック */
int _card_event(void)
{
	int ret = 0;

	if(TestEvent(ev0)==1) ret = CARD_IOE;		/* IOE */
	if(TestEvent(ev1)==1) ret = CARD_ERROR;		/* ERROR */
	if(TestEvent(ev2)==1) ret = CARD_TIMEOUT;	/* TIMEOUT */
	if(TestEvent(ev3)==1) ret = CARD_NEWCARD;	/* NEW CARD */
	/* ハングアップを回避 */
	if(EVENT_TIME_OUT++ >= TIME_OUT_MAX) {
/*		printf("time out!=%d\n",EVENT_TIME_OUT);*/
		ret = CARD_ERROR;
	}
	return(ret);
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

/* 原因ディスクリプタ SwCARD イベントクリア */
void _clear_event(void)
{
	TestEvent(ev0);
	TestEvent(ev1);
	TestEvent(ev2);
	TestEvent(ev3);
}

/* 原因ディスクリプタ HwCARD イベントチェック */
int _card_event_x()
{
	while(1) {
		if(TestEvent(ev10)==1) return CARD_IOE;		/* IOE */
		if(TestEvent(ev11)==1) return CARD_ERROR;	/* ERROR */
		if(TestEvent(ev12)==1) return CARD_TIMEOUT;	/* TIMEOUT */
		if(TestEvent(ev13)==1) return CARD_NEWCARD;	/* NEW CARD */
	}
}

/* 原因ディスクリプタ HwCARD イベントクリア */
void _clear_event_x(void)
{

	TestEvent(ev10);
	TestEvent(ev11);
	TestEvent(ev12);
	TestEvent(ev13);
}

/* スロットの全ディレクトリエントリの取得 */
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

/* 指定スロットの空きブロックの取得 */
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

/* 同名ファイルの存在チェック
	ret = 0:存在しない 1:存在する */
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

/* 指定したスロット/ファイルからの読みだし */
/* in  : cnct	コネクタ No.(0 or 1)
	 slot	スロット No.(通常 0、マルチタップ 0～3)
	 *fname	ファイル名(MAX 20 byte + 0x00)
	 *buf	読み込み領域へのポインタ
	 block	読み込みブロック数(1～15)
   out : 0	読み込み開始
   	 -1	失敗
*/
int ReadCardFile(int cnct, int slot, char *fname, char *buf, long block)
{
	int	ret;
	long	fd;
	char	key[32];
	long	read_size;
	int	retry = CARD_READ_RETRY;

	sprintf(key, "bu%1d%1d:%s", cnct, slot, fname);

	read_size = BLOCK_SIZE * block;		/* block:ブロック数 */
	/* O_NOWAIT モードで READ */
	if((fd = open(key, O_RDONLY|O_NOWAIT)) != -1) {
		FILE_DSCRPTR = fd;
	        _clear_event();
		read(fd, buf, read_size);	 /* 返り値は常に 0 */
		ret = 0;	/* 読み込み開始 */
	}
	else ret = -1;		/* 読み込みエラー */
	return ret;
}

/* 指定したスロット/ファイルへの書き込み */
/* in  : cnct	コネクタ No.(0 or 1)
	 slot	スロット No.(通常 0、マルチタップ 0～3)
	 *fname	ファイル名(MAX 20 byte + 0x00)
	 *buf	書き込み領域へのポインタ
	 block	書き込みブロック数(1～15)
	 new	EXIST_FILE:既存ファイル	NEW_FILE:既存ファイル
   out : 0	書き込み開始
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
			close(fd);
		}
		else return(ret = -1);		/* 書き込みエラー */
	}
	write_size = block * BLOCK_SIZE;
	/* O_NOWAIT モードで WRITE */
	if((fd = open(key, O_WRONLY|O_NOWAIT)) != -1) {
		FILE_DSCRPTR = fd;
	        _clear_event();
		write(fd, buf, write_size);	 /* 返り値は常に 0 */
		ret = 0;	/* 書き込み開始 */
	}
	else ret = -1;		/* 書き込みエラー */
	return ret;
}

/* 指定スロットの状態チェック 
     CARD_STS : CARDSTS_BUSY	0	状態チェック中
		CARDSTS_OK	1	正常
		CARDSTS_NEW	2	新規カード
		CARDSTS_NONE	-1	カードが挿入されていない
		CARDSTS_UNFMT	-2	フォーマットされていない
		CARDSTS_ERR	-3	原因不明エラー */
int CheckCardStatus(int cnct, int slot)
{
	long	chan;
	int	ret;

	chan = cnct * 16 + slot;
	switch(CARD_STS_MODE) {
	/* カードの状態チェック */
	case CARD_INFO_MODE:
		_card_info(chan);
		CARD_STS_MODE = CARD_INFO_WAIT_MODE;
		EVENT_TIME_OUT = 0;
		/* カードチェック中にセット */
		CARD_STS = CARDSTS_BUSY;
		break;
	/* イベント待ち＆チェック */
	case CARD_INFO_WAIT_MODE:
		if(!(ret = _card_event())) break;
		switch(ret) {
		case CARD_IOE:		/* カードが存在する */
			CARD_STS_TMP = CARDSTS_OK;
			/* カードがすでにアクセスできる状態であれば
			初期化チェックは行わない */
			if(CARD_LOAD_FLAG==CARD_LOAD_OK)
				CARD_STS_MODE = CARD_CHK_END_MODE;
			else	CARD_STS_MODE = FORMAT_CHK_MODE;
			break;
		case CARD_TIMEOUT:	/* カードが存在しない */					CARD_STS_TMP = CARDSTS_NONE;
			CARD_STS_MODE = CARD_CHK_END_MODE;
			/* 次回チェックで _card_load まで行う */
			CARD_LOAD_FLAG = CARD_LOAD_NG;
			break;
		case CARD_NEWCARD:	/* 新たにカードが挿入された */
			CARD_STS_TMP = CARDSTS_NEW;
			_clear_event_x();
			_card_clear(chan);
			_card_event_x();
			CARD_STS_MODE = FORMAT_CHK_MODE;
			/* 次回チェックで _card_load まで行う */
			CARD_LOAD_FLAG = CARD_LOAD_NG;
			break;
		case CARD_ERROR:	/* 原因不明エラー */
		default:
			CARD_STS_TMP = CARDSTS_ERR;
			CARD_STS_MODE = CARD_CHK_END_MODE;
			/* 次回チェックで _card_load まで行う */
			CARD_LOAD_FLAG = CARD_LOAD_NG;
			break;
		}
		break;
	/* フォーマット済みチェック */
	case FORMAT_CHK_MODE:
		_clear_event();
		_card_load(chan);
		CARD_STS_MODE = FORMAT_WAIT_MODE;
		EVENT_TIME_OUT = 0;
		break;
	/* イベント待ち＆チェック */
	case FORMAT_WAIT_MODE:
		if(!(ret = _card_event())) break;
		CARD_STS_MODE = CARD_CHK_END_MODE;
		switch(ret) {
		case CARD_IOE:		/* フォーマット済み */
			/* カードが正しくセットされフォーマット済み */
			CARD_LOAD_FLAG = CARD_LOAD_OK;
			break;
		case CARD_TIMEOUT:	/* カードは存在しない */
			CARD_STS_TMP = CARDSTS_NONE;
			/* 次回チェックで _card_load まで行う */
			CARD_LOAD_FLAG = CARD_LOAD_NG;
			break;
		case CARD_NEWCARD:	/* フォーマットされていない */
			CARD_STS_TMP = CARDSTS_UNFMT;
			/* 次回チェックで _card_load まで行う */
			CARD_LOAD_FLAG = CARD_LOAD_NG;
			break;
		case CARD_ERROR:	/* 原因不明 */
		default:
			CARD_STS_TMP = CARDSTS_ERR;
			/* 次回チェックで _card_load まで行う */
			CARD_LOAD_FLAG = CARD_LOAD_NG;
			break;
		}
		break;
	/* カードの状態を取得 */
	case CARD_CHK_END_MODE:
		CARD_STS = CARD_STS_TMP;	/* ステータス確定 */
		CARD_STS_MODE = CARD_INFO_MODE;
/*printf("sts=%d\n",CARD_STS);*/
		break;
	}
	return(CARD_STS);
}

/* 指定スロットのカードのフォーマット
   ret = CARDSTS_OK	1	正常
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