// ----------------------------------------------------------------------------
// 
// 							2D ｸﾞﾗﾌｨｸｽｻﾝﾌﾟﾙ: MAIN.C
// 
// 				Copyright (C) 1995 Sony Computer Entertainment Inc.
// 							   All Rights Reserved
// ----------------------------------------------------------------------------

// ============================================================================
// メインルーチン
// ============================================================================
#include <sys/types.h>
#include <libetc.h>
#include <libgte.h>
#include <libgpu.h>
#include <libsn.h>
#include "orghead.h"

struct DB Db[2];

// 初期化
// ----------------------------------------------------------------------------
static void initsystem(void){
	srand(138);									// 乱数の初期化
	initzmatrix();								// グローバルマトリクスの初期化
	initsysdebug();								// デバッグ用パラメータ初期化
}
//	ダブルバッファごとの初期化
static void init_prim(struct DB *db){
	ClearOTag(db->ot, OT_DEPTH);				// メイン OT 初期化
	ClearOTag(db->ot_noclr, OT_NOCLR_DEPTH);	// サブ OT 初期化
	
	base_init(db);
	foe_init(db);
	bg_init(db);
	scrn_init(db);
}
//	各ルーチンの初期化
static void init_prim_common(void){
	base_init_common();
	foe_init_common();
	bg_init_common();
}

// メイン
// ----------------------------------------------------------------------------
int main(void){
	struct DB *cdb;
	
	PadInit(0);								// コントローラ初期化
	ResetGraph(0);							// GPU 初期化
	SetGraphDebug(0);						// デバッグレベル 0
	
	InitGeom();								// GTE の初期化
	SetGeomOffset(GEOM_X, GEOM_Y); SetGeomScreen(SCR_Z);	// 回転中心の設定
	
	SetDefDrawEnv(&Db[0].draw, 0,   0, 320, 240);		// ダブルバッファ設定
	SetDefDrawEnv(&Db[1].draw, 0, 240, 320, 240);
	SetDefDispEnv(&Db[0].disp, 0, 240, 320, 240);
	SetDefDispEnv(&Db[1].disp, 0,   0, 320, 240);
	
	Db[0].draw.tpage = Db[1].draw.tpage = Tpage;			// デフォルト TPAGE
	Db[0].draw.isbg = Db[1].draw.isbg = 1;	// 描画環境変更時の画面クリア設定
	setRGB0(&Db[0].draw, 0, 0, 0); setRGB0(&Db[1].draw, 0, 0, 0);
	
	initsystem();
	
	init_texture();							// テクスチャデータのロード
	mapload();								// マップデータのロード
	
	init_prim_common();						// 各ルーチン、ポリゴンの初期化
	init_prim(&Db[0]);
	init_prim(&Db[1]);
	
	base_born();							// 自キャラ出現
	
	SetDispMask(1);							// 画面表示開始
	
	while (1) {
		cdb = (cdb == &Db[0])? &Db[1]: &Db[0];	// GPU 非描画バッファを選択
  		
		ClearOTag(cdb->ot, OT_DEPTH);		// メイン OT 初期化
		cdb->ot[OT_SCREEN] = cdb->ot_noclr[OT_NOCLR_SCREEN];
		cdb->ot[OT_BASE]   = cdb->ot_noclr[OT_NOCLR_BASE];
		cdb->ot[OT_BG]     = cdb->ot_noclr[OT_NOCLR_BG];
											// メイン OT にサブ OT 接続
		if(padopr()) break;					// コントロールパッドデータ読み込み
		
		base_move(cdb);						// 移動ルーチン呼び出し
		foe_move(cdb);						// （GPU 非描画バッファの更新）
		bg_move(cdb);
		scrn_move(cdb);
		
		DrawSync(0);						// 描画終了待ち
		VSync(0);							// 垂直復帰待ち
		
		PutDrawEnv(&cdb->draw); PutDispEnv(&cdb->disp);
											// フレームダブルバッファ切り替え
		DrawOTag(cdb->ot);					// OT 描画
	}
}
