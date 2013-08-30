/*			
 *	 		balls: sample program
 *		   (メモリーカードの非同期アクセス)
 *
 *		Copyright (C) 1996 by Sony Computer Entertainment
 *			All rights Reserved
 */

#include <sys/types.h>
#include <libetc.h>
#include <libgte.h>
#include <libgpu.h>
#include <libsn.h>
#include "card.h"
#include "cardicon.h"

/*
 * Kanji Printf
 */
#define KANJI

/*
 * Primitive Buffer
 */
#define OTSIZE		16			/* size of ordering table */
#define MAXOBJ		4000			/* max sprite number */
typedef struct {		
	DRAWENV		draw;			/* drawing environment */
	DISPENV		disp;			/* display environment */
	u_long		ot[OTSIZE];		/* ordering table */
	SPRT_16		sprt[MAXOBJ];		/* 16x16 fixed-size sprite */
} DB;

/*
 * Position Buffer
 */
typedef struct {		
	u_short x, y;			/* current point */
	u_short dx, dy;			/* verocity */
} POS;

/*
 * Limitations
 */
#define	FRAME_X		320		/* frame size (320x240) */
#define	FRAME_Y		240
#define WALL_X		(FRAME_X-16)	/* reflection point */
#define WALL_Y		(FRAME_Y-16)

u_long	padd, oldpad;

/* メモリーカード処理状態 */
#define	EXEC_NONE	0	/* 処理なし */
#define	EXEC_READY0	1	/* キー入力後アクセス可能状態まで待機 
						(SAVE or FORMAT ) */
#define	EXEC_READY1	2	/* キー入力後アクセス可能状態まで待機 
						(LOAD) */
#define	EXEC_SAVE	3	/* セーブ開始 */
#define	EXEC_SAVE_NOW	4	/* セーブ中 */
#define	EXEC_LOAD	5	/* ロード開始 */
#define	EXEC_LOAD_NOW	6	/* ロード中 */
#define	EXEC_FORMAT	7	/* フォーマット実行 */

int CARD_CHK_STS = CARDSTS_BUSY;	/* メモリーカードチェック状態 */
int CINFO = CARDSTS_BUSY;		/* メモリーカードステータス */
int EXEC_CARD_FLAG = EXEC_NONE;		/* メモリーカード処理フラグ */

const char CARD_FTITLE[] = "ＫＯＷＬＯＯＮ";	/* 文書名 MAX 全角32 */
const char CARD_FNAME[] = "BISLPS-01234KOWLOON"; /* ファイル名 MAX 20 文字 */

char	CARD_BUF[BLOCK_SIZE];		/* １ブロック分のデータバッファ */

/* 非同期 SAVE/LOAD 時のファイルディスクリプタ */
extern long	FILE_DSCRPTR;



static void init_prim(DB *db);	/* preset unchanged primitive members */
static int  pad_read(int n);	/* parse controller */
static int  cbvsync(void);	/* callback for VSync */
static int  init_point(POS *pos);/* initialize position table */
static void exec_card(void);		/* メモリーカード処理実行 */
static void check_card_end(void);	/* メモリーカード終了検知 */
static void print_status(void);		/* メモリーカードのステータス表示 */
static void SetCardHeader(void);	/* メモリーカードヘッダのセット */

main()
{
	POS	pos[MAXOBJ];
	DB	db[2];		/* double buffer */
	DB	*cdb;		/* current double buffer */
	char	s[128];		/* strings to print */
	int	nobj = 1;	/* object number */
	u_long	*ot;		/* current OT */
	SPRT_16	*sp;		/* work */
	POS	*pp;		/* work */
	int	i, cnt, x, y;	/* work */

	ResetCallback();

	PadInit(0);		/* reset PAD */
	InitMemCard(USE_PAD);	/* メモリーカード初期化 */

	ResetGraph(0);		/* reset graphic subsystem (0:cold,1:warm) */
	SetGraphDebug(0);	/* set debug mode (0:off, 1:monitor, 2:dump) */
	VSyncCallback(cbvsync);	/* set callback */
		
	/* initialize environment for double buffer */
	SetDefDrawEnv(&db[0].draw, 0,   0, 320, 240);
	SetDefDrawEnv(&db[1].draw, 0, 240, 320, 240);
	SetDefDispEnv(&db[0].disp, 0, 240, 320, 240);
	SetDefDispEnv(&db[1].disp, 0,   0, 320, 240);

	/* init font environment */
#ifdef KANJI	/* KANJI */	
	KanjiFntOpen(160, 16, 256, 200, 704, 0, 768, 256, 0, 512);
#endif	
	FntLoad(960, 256);		/* load basic font pattern */
	SetDumpFnt(FntOpen(16, 16, 256, 200, 0, 512));

	init_prim(&db[0]);		/* initialize primitive buffers #0 */
	init_prim(&db[1]);		/* initialize primitive buffers #1 */
	init_point(pos);		/* set initial geometries */

	/* display */
	SetDispMask(1);		/* enable to display (0:inhibit, 1:enable) */

	while ((nobj = pad_read(nobj)) > 0) {
		pollhost();

		cdb  = (cdb==db)? db+1: db;	/* swap double buffer ID */

		/* dump DB environment */
		/*DumpDrawEnv(&cdb->draw);*/
		/*DumpDispEnv(&cdb->disp);*/
		/*DumpTPage(cdb->draw.tpage);*/
		
 		/* clear ordering table */
		ClearOTag(cdb->ot, OTSIZE);	
		
		/* update sprites */
		ot = cdb->ot;
		sp = cdb->sprt;
		pp = pos;
		
		for (i = 0; i < nobj; i++, sp++, pp++) {
			/* detect reflection */
			if ((x = (pp->x += pp->dx) % WALL_X*2) >= WALL_X)
				x = WALL_X*2 - x;
			if ((y = (pp->y += pp->dy) % WALL_Y*2) >= WALL_Y)
				y = WALL_Y*2 - y;
			
			setXY0(sp, x, y);	/* update vertex */
			AddPrim(ot, sp);	/* apend to OT */
		}
		DrawSync(0);		/* wait for end of drawing */
		/* cnt = VSync(1);	/* check for count */
		/* cnt = VSync(2);	/* wait for V-BLNK (1/30) */
		cnt = VSync(0);		/* wait for V-BLNK (1/60) */

		PutDispEnv(&cdb->disp); /* update display environment */
		PutDrawEnv(&cdb->draw); /* update drawing environment */
		DrawOTag(cdb->ot);

#ifdef KANJI
		KanjiFntPrint("玉の数＝%d\n", nobj);
		KanjiFntPrint("時間=%d\n", cnt);
		KanjiFntFlush(-1);
#endif
		FntPrint("sprite = %d\n", nobj);
		FntPrint("total time = %d\n", cnt);

		if((EXEC_CARD_FLAG == EXEC_NONE)||
			(EXEC_CARD_FLAG == EXEC_READY0)||
			(EXEC_CARD_FLAG == EXEC_READY1)) {
			/* メモリーカードの状態チェック */
			CARD_CHK_STS = CheckCardStatus(CONECT_NO, SLOT_NO);
			if(CARD_CHK_STS!=CARDSTS_BUSY) CINFO = CARD_CHK_STS;
		}

		/* メモリーカード処理実行 */
		exec_card();

		/* メモリーカード終了検知 */
		check_card_end();

		/* メモリーカードのステータス表示 */
		print_status();

		FntFlush(-1);
	}
	StopMemCard();			/* メモリカード終了 */
	PadStop();
	return(0);
}

/*
 * Initialize drawing Primitives
 */
#include "balltex.h"

static void init_prim(DB *db)
{
	u_short	clut[32];		/* CLUT entry */
	SPRT_16	*sp;			/* work */
	int	i;			/* work */
	
	/* inititalize double buffer */
	db->draw.isbg = 1;
	setRGB0(&db->draw, 60, 120, 120);
	
	/* load texture pattern and CLUT */
	db->draw.tpage = LoadTPage(ball16x16, 0, 0, 640, 0, 16, 16);
	/*DumpTPage(db->draw.tpage);*/
	
	for (i = 0; i < 32; i++) {
		clut[i] = LoadClut(ballcolor[i], 0, 480+i);
		/*DumpClut(clut[i]);*/
	}
	
	/* init sprite */
	for (sp = db->sprt, i = 0; i < MAXOBJ; i++, sp++) {
		SetSprt16(sp);			/* set SPRT_16 primitve ID */
		SetSemiTrans(sp, 0);		/* semi-amibient is OFF */
		SetShadeTex(sp, 1);		/* shading&texture is OFF */
		setUV0(sp, 0, 0);		/* texture point is (0,0) */
		sp->clut = clut[i%32];		/* set CLUT */
	}
}	

/*
 * Initialize sprite position and verocity
 */
static init_point(POS *pos)
{
	int	i;
	for (i = 0; i < MAXOBJ; i++) {
		pos->x  = rand();
		pos->y  = rand();
		pos->dx = (rand() % 4) + 1;
		pos->dy = (rand() % 4) + 1;
		pos++;
	}
}

/*
 * Read controll-pad
 */
static int pad_read(int n)
{
	padd = PadRead(1);

	/* データのセーブまたはメモリーカードの初期化 */
	if (((padd & PADRright)>0)&&((oldpad & PADRright)==0)) {
		if(EXEC_CARD_FLAG==EXEC_NONE)
			EXEC_CARD_FLAG = EXEC_READY0;
	}

	/* データのロード */
	if (((padd & PADRleft)>0)&&((oldpad & PADRleft)==0)) {
		if(EXEC_CARD_FLAG==EXEC_NONE)
			EXEC_CARD_FLAG = EXEC_READY1;
	}

	if(padd & PADLup) 	n += 4;		/* left '+' key up */

	if(padd & PADLdown)	n -= 4;		/* left '+' key down */
	
	if (padd & PADn) 			/* pause */
		while (PadRead(1)&PADn);

	if(padd & PADk) 	return(-1);
	
	oldpad = padd;

	limitRange(n, 1, MAXOBJ-1);		/* see libgpu.h */
	return(n);
}

/* メモリーカード処理実行 */
static void exec_card(void)
{
	int	file_num, avail_block, exist_flag;
	int	file_type;
	int	i, ret;

	/* キーが入力されてから処理が実行できるようになるまで待つ */
	if(EXEC_CARD_FLAG==EXEC_READY0) {	/* SAVE or FORMAT */
		switch(CARD_CHK_STS) {
		case CARDSTS_OK:
		case CARDSTS_NEW:
			EXEC_CARD_FLAG = EXEC_SAVE;
			break;
		case CARDSTS_UNFMT:
			EXEC_CARD_FLAG = EXEC_FORMAT;
			break;
		}
		return;
	}
	else if(EXEC_CARD_FLAG==EXEC_READY1) {	/* LOAD */
		switch(CARD_CHK_STS) {
		case CARDSTS_OK:
		case CARDSTS_NEW:
			EXEC_CARD_FLAG = EXEC_LOAD;
			break;
		}
		return;
	}
	/* メモリーカードの各処理へ */
	switch(EXEC_CARD_FLAG){
	case EXEC_SAVE:
		FntPrint("\nnow saving!\n");
		/* 保存されているファイル数のチェック */
		file_num = GetCardEntry(CONECT_NO, SLOT_NO);
		/* カードの空き容量のチェック */
		avail_block = GetCardSpace(file_num);
		/* 同名ファイルの存在チェック */
		exist_flag = CheckFileExist(file_num, CARD_FNAME);
		if(exist_flag) file_type = EXIST_FILE;
		else {
			if(!avail_block) {
				/* メモリーカードフル */
				FntPrint("\ncard full!\n");
				EXEC_CARD_FLAG = EXEC_NONE; /* エラー終了 */
				break;
			}
			else file_type = NEW_FILE;
		}
		/* ヘッダ情報をセット */
		SetCardHeader();
		/* 書き込み */
		if(WriteCardFile(CONECT_NO, SLOT_NO,
			CARD_FNAME, CARD_BUF, CARD_BLOCK_NUM, file_type)){
			close(FILE_DSCRPTR);
			FntPrint("\nwrite error!\n");
			EXEC_CARD_FLAG = EXEC_NONE;	/* エラー終了 */
			break;
		}
		EXEC_CARD_FLAG = EXEC_SAVE_NOW;	/* 終了検知へ */
		break;
	case EXEC_LOAD:
		FntPrint("\nnow loading!\n");
		/* 読み込み */
		if(ReadCardFile(CONECT_NO, SLOT_NO, 
			CARD_FNAME, CARD_BUF, CARD_BLOCK_NUM)){
			close(FILE_DSCRPTR);
			FntPrint("\nread error!\n");
			EXEC_CARD_FLAG = EXEC_NONE;	/* エラー終了 */
			break;
		}
		EXEC_CARD_FLAG = EXEC_LOAD_NOW;	/* 終了検知へ */
		break;
	case EXEC_FORMAT:
		FntPrint("\nnow formating!\n");
		for(i = 0; i < 3; i++) {
			/* ブロックしてフォーマット */
			ret = FormatCard(CONECT_NO, SLOT_NO);
			if(ret != CARDSTS_ERR) break;
		}
		switch(ret){
		case CARDSTS_OK:
			printf("Format:End\n");
			break;
		case CARDSTS_NONE:
			printf("Format:No Card\n");
			break;
		case CARDSTS_ERR:
		default:
			printf("Format:Error\n");
			break;
		}
		EXEC_CARD_FLAG = EXEC_NONE;
		break;
	default:
		break;
	}
}

/* メモリーカード終了検知 */
static void check_card_end(void)
{
	int ret;

	switch(EXEC_CARD_FLAG){
	case EXEC_SAVE_NOW:
		/* SwCARD イベントで終了を検知 */
		if(ret = _card_event_NW()) {
			close(FILE_DSCRPTR);
			if(ret==CARD_IOE) {	/* 書き込み成功 */
				FntPrint("\nsuccess!\n");
				EXEC_CARD_FLAG = EXEC_NONE;	/* 終了 */
			}
			else {			/* 書き込みエラー */
				FntPrint("\nwrite error!\n");
				EXEC_CARD_FLAG = EXEC_NONE;	/* 終了 */
			}
		}
		else {				/* 書き込み中 */
			FntPrint("\nnow saving!\n");
		}
		break;
	case EXEC_LOAD_NOW:
		/* SwCARD イベントで終了を検知 */
		if(ret = _card_event_NW()) {
			close(FILE_DSCRPTR);
			if(ret==CARD_IOE) {	/* 読み込み成功 */
				FntPrint("\nsuccess!\n");
				EXEC_CARD_FLAG = EXEC_NONE;	/* 終了 */
			}
			else {			/* 読み込みエラー */
				FntPrint("\nread error!\n");
				EXEC_CARD_FLAG = EXEC_NONE;	/* 終了 */
			}
		}
		else {				/* 書き込み中 */
			FntPrint("\nnow loading!\n");
		}
		break;
	default:
		break;
	}
}

/* メモリーカードのステータス表示 */
static void print_status(void)
{
	if((EXEC_CARD_FLAG == EXEC_NONE)||
		(EXEC_CARD_FLAG == EXEC_READY0)||
		(EXEC_CARD_FLAG == EXEC_READY1)) {
		FntPrint("\ncard status = ");
		switch(CARD_CHK_STS) {
		case CARDSTS_OK:	/* IOE */
			FntPrint("ioe");
			break;
		case CARDSTS_NEW:	/* 新規カード */
			FntPrint("new");
			break;
		case CARDSTS_NONE:	/* カードが挿入されていない */
			FntPrint("none");
			break;
		case CARDSTS_UNFMT:	/* フォーマットされていない */
			FntPrint("unformat");
			break;
		case CARDSTS_ERR:	/* 原因不明エラー */
			FntPrint("error");
			break;
		}
		switch(CINFO) {
		case CARDSTS_OK:
		case CARDSTS_NEW:
			FntPrint("\nsave:maru load:shikaku\n");
			break;
		case CARDSTS_UNFMT:
			FntPrint("\nformat:maru\n");
			break;
		}
	}
}

/* ヘッダデータのセット */
static void SetCardHeader(void)
{
	CARDHEAD head;
	int	i;
	TIM_IMAGE tim;

	head.Magic[0] = 'S';
	head.Magic[1] = 'C';
	head.Type = CARD_ICON_TYPE;
	head.BlockEntry = CARD_BLOCK_NUM;
	for(i=0; i<64; i++) head.Title[i] = 0;
	strcpy(head.Title, CARD_FTITLE);
	for(i=0; i<28; i++) head.reserve[i] = 0;

	memcpy(head.Clut, CARD_ICON_CLUT, 32);
	memcpy(head.Icon[0], CARD_ICON_0, 128);
	if(head.Type>=0x12) memcpy(head.Icon[1], CARD_ICON_1, 128);
	if(head.Type>=0x13) memcpy(head.Icon[2], CARD_ICON_2, 128);

	memcpy(CARD_BUF, &head, sizeof(head));
}

/*
 * callback
 */
static int cbvsync(void)
{
	/* print absolute VSync count */
	FntPrint("V-BLNK(%d)\n", VSync(-1));	
}
