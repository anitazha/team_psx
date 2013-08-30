/*
	card.h
*/

#define	CONECT_NO	0	/* コネクタ番号 */
#define	SLOT_NO		0	/* スロット番号 */

#define	NOT_USE_PAD	0	/* パッド未使用 */
#define	USE_PAD		1	/* パッド併用 */

#define CARD_ICON_TYPE	0x13	/* カードアイコン:3 パターン */
#define CARD_BLOCK_NUM	1	/* 1 ブロック分確保 */

#define CARD_IOE	1	/* IOE */
#define CARD_ERROR	2	/* ERROR */
#define CARD_TIMEOUT	3	/* TIMEOUT */
#define CARD_NEWCARD	4	/* NEW CARD */

#define CARD_READ_RETRY		8	/* READ 時のリトライ回数 */
#define CARD_WRITE_RETRY	8	/* WRITE 時のリトライ回数 */
#define BLOCK_SIZE	8192		/* ブロックサイズ */
#define MAX_BLOCK	15		/* MAX ブロック/カード */
#define MAX_FNAME	21		/* ファイル名の最大文字数 */

#define	EXIST_FILE	0	/* 既存ファイル */
#define	NEW_FILE	1	/* 新規ファイル */

/* すでにセットされているカードに対して _card_load を行う必要がある */
#define	CARD_LOAD_NG	0
/* すでにセットされているカードに対して即アクセス可能 */
#define	CARD_LOAD_OK	1

/* カードステータス情報 */
#define	CARDSTS_BUSY	0	/* イベントチェック中 */
#define	CARDSTS_OK	1	/* 正常 */
#define	CARDSTS_NEW	2	/* 新規カード */
#define	CARDSTS_NONE	-1	/* カードが挿入されていない */
#define	CARDSTS_UNFMT	-2	/* フォーマットされていない */
#define	CARDSTS_ERR	-3	/* 原因不明エラー */

/* カードステータスチェック用状態遷移モード */
#define	CARD_INFO_MODE		0
#define	CARD_INFO_WAIT_MODE	1
#define	FORMAT_CHK_MODE		2
#define	FORMAT_WAIT_MODE	3
#define	CARD_CHK_END_MODE	4


/* ファイルヘッダ */
typedef struct {
	char	Magic[2];
	char	Type;
	char	BlockEntry;
	char	Title[64];
	char	reserve[28];
	char	Clut[32];
	char	Icon[3][128];
} CARDHEAD;

