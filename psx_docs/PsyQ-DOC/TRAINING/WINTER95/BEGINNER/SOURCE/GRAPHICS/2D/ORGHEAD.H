// ----------------------------------------------------------------------------
// 
// 							2D ｸﾞﾗﾌｨｸｽｻﾝﾌﾟﾙ: ORGHEAD.H
// 
// 				Copyright (C) 1995 Sony Computer Entertainment Inc.
// 							   All Rights Reserved
// ----------------------------------------------------------------------------

// DEFINEs
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// メイン OT
#define OT_DEPTH   4		// 深さ
#define OT_SCREEN  3		// 文字表示
#define OT_FOE     2		// 敵
#define OT_BASE    1		// 自キャラ
#define OT_BG      0		// BG

// 固定 OT
#define OT_NOCLR_DEPTH  3	// 深さ
#define OT_NOCLR_SCREEN 2	// 文字表示
#define OT_NOCLR_BASE   1	// 自キャラ
#define OT_NOCLR_BG     0	// BG

#define SCRN_W 320			// 画面上で１ドットの比が 1:1 になってくれるので
#define SCRN_H 240			// 回転には必須のモード

#define GEOM_X SCRN_W/2		// 回転中心
#define GEOM_Y 160

#define BG_X 30				// BG メッシュポリゴン個数
#define BG_Y 30

#define SCORE_KETA 3		// 文字（敵の数）桁数

#define SCR_Z   1024		// プロジェクション距離（暫定）

#define FOE_PARAMS   2		// 敵パラメータ数
#define FOE_MAX      100	// 敵最大数
#define FOE_POLY_MAX 100	// 敵用ポリゴン最大数


// EXTERNAL VARIABLEs
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
extern MATRIX ZMatrix;									// Ｚ軸回転用マトリクス

extern u_short Tpage, Clut;								// TPAGE、CLUT 共通

														// 自キャラパラメータ
extern SVECTOR BaseRotR[4], BaseAngR;					// 回転中心オフセット、角度
extern VECTOR  BaseVecR;								// 平行移動ベクトル
extern u_long  BasePosUD;								// 回転中心からの距離
extern VECTOR  BaseVecL;								// 仮想フィールド位置
extern u_long  BaseFBSpd, BaseRLSpd;					// 前進／回転スピード

extern u_short *GrdData, GrdWx, GrdWy;					// BG パラメータ
extern u_short FoeFlg[FOE_POLY_MAX];					// 敵ポリゴン割り当てフラグ
extern SVECTOR RotS[4];									// 		  〃
extern u_short EneNum;									// 敵数


// STRUCTs
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// プリミティブ（ダブルバッファ）
extern struct DB{
    DRAWENV  draw;												// 描画環境設定
    DISPENV  disp;												// 表示環境設定
    
    u_long   ot[OT_DEPTH], ot_noclr[OT_NOCLR_DEPTH];			// OT
    
    SPRT	 BaseSPRT, CaraLSPRT, CaraRSPRT;					// 自キャラ
    SPRT	 ScoreSPRT[SCORE_KETA];								// 文字表示
    POLY_FT4 FoeFT4[FOE_POLY_MAX];								// 敵キャラ
    POLY_FT4 BgFT4[BG_Y][BG_X];									// BG
} Db[2];

// 敵構造体
extern struct FOE {
    u_short Type, Dist, Len, Spd;	  // 敵種類、直進距離、進んだ距離、スピード
    u_short FT4, *Flg;		// 構成ポリゴン番号、構成ポリゴンフラグへのポインタ
    short   Dir, Param_s[FOE_PARAMS];					// 方向、汎用パラメータ
    SVECTOR AngR;										// 角度
    VECTOR VecR;   										// 平行移動ベクトル
    VECTOR VecL;										// 仮想画面位置
    SVECTOR AngS;										// 画面表示用角度
    VECTOR  VecS;										// 画面表示用平行移動ベクトル
} Foe[FOE_MAX];


// PROTO-TYPEs
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
typedef VECTOR     V,  *VP;
typedef SVECTOR    SV, *SVP;

extern void foe_init(struct DB *);
extern void foe_init_common(void);
extern void foe_born(void);
extern void foe_kill(void);
extern void foe_move(struct DB *);

extern void    bg_init(struct DB *);
extern void    bg_init_common(void);
extern void    bg_move(struct DB *);
extern u_short getwall(long, long);
extern u_short get_bgchr(long, long);

extern void base_init_common(void);
extern void base_init(struct DB *);
extern void base_move(struct DB *);
extern void base_rl(short);
extern void base_updown(long);
extern void get_basevecl(u_int, u_int, long *, long *);
extern int  padopr(void);

extern void scrn_init(struct DB *);
extern void scrn_move(struct DB *);

extern void getvar(long, SV, SV, SV, SV, SVP, VP, VP, VP, VP, VP);
extern void getvecoff(long, long, SVP, VP, VP);
extern void getvecs(long, VP, VP);
extern void getvas(long, SVP, SVP, VP, VP, SV, SV, SV, SV, POLY_FT4 *);
extern void setuvwh(POLY_FT4 *, short, short, short, short);
extern void inizmatrix(void);
extern void rotzmatrix(short);

extern short walljudge(long, SV, SV, SV, SV, SVP, VP);
extern short walljudge_2(long, SVP, VP, VP);
extern void  dirjudgeud(long, long, long, VP, long *, long *);
extern short dirjudgerl(long, short);

extern void init_texture(void);
extern void mapload(void);

extern void initsysdebug(void);
extern void pcfileread(u_char *, u_char *);
