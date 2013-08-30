// ----------------------------------------------------------------------------
// 
// 							2D ｸﾞﾗﾌｨｸｽｻﾝﾌﾟﾙ: BG.C
// 
// 				Copyright (C) 1995 Sony Computer Entertainment Inc.
// 							   All Rights Reserved
// ----------------------------------------------------------------------------

// ============================================================================
// BG ルーチン
// ============================================================================
#include <sys/types.h>
#include <libetc.h>
#include <libgte.h>
#include <libgpu.h>
#include "orghead.h"

#define BG_CELL_X		16					// セルの大きさ
#define BG_CELL_Y		16
#define BG_TEX_W		15
#define BG_TEX_H		15

static VECTOR BgVecS;
static SVECTOR BgRotS[4], BgSvec[BG_Y+1][BG_X+1];

u_short *GrdData, GrdWx, GrdWy;

// 初期化
// ----------------------------------------------------------------------------
void bg_init(struct DB *db){
	u_short i, j;
	
	for(j = 0; j < BG_Y; j ++)
		for(i = 0; i < BG_X; i ++){
			SetPolyFT4(&db->BgFT4[j][i]); SetShadeTex(&db->BgFT4[j][i], 1);
			db->BgFT4[j][i].tpage = Tpage; db->BgFT4[j][i].clut  = Clut;
			addPrim(&db->ot_noclr[OT_NOCLR_BG], &db->BgFT4[j][i]);
		}
//	BG 用オーダリングテーブル終端をメインオーダリングテーブルへ接続
	((P_TAG *)&db->BgFT4[0][0].tag)->addr = db->ot[OT_BG];
}

void bg_init_common(void){
	setVector(&BgVecS, 0, 0, SCR_Z);		// BG の平行移動ベクトルは 0
}

// 移動
// ----------------------------------------------------------------------------
void bg_move(struct DB *db){
	MATRIX m;
	SVECTOR svec;
	u_long flg, dmy;
	short k, l;
	u_short i, j, s, t, u;
	
	rotzmatrix(-BaseAngR.vz); SetRotMatrix(&ZMatrix);
											// 自キャラが向いている方向と逆の
											// 回転マトリクスを設定
	TransMatrix(&m, &BgVecS); SetTransMatrix(&m);
											// 平行移動ベクトル設定
//	メッシュ構造の定義
//	まずは各点の座標変換された座標を求める
	k = BaseVecL.vx%BG_CELL_X; l = BaseVecL.vy%BG_CELL_Y;
	svec.vz = 0;
	for(j = 0; j <= BG_Y; j ++){
		svec.vy = (j-BG_Y/2)*BG_CELL_Y-l;
		for(i = 0; i <= BG_X; i ++){
			svec.vx = (i-BG_X/2)*BG_CELL_X-k;
			RotTransPers(&svec, (long *)&BgSvec[j][i], &dmy, &flg);
		}
	}
//	次にポリゴンの 4 点を求めた座標に割り当てる
	k = (BaseVecL.vx%(GrdWx*BG_CELL_X))/BG_CELL_X;
	l = (BaseVecL.vy%(GrdWy*BG_CELL_Y))/BG_CELL_Y;
	
	for(j = 0; t = (u_short)(l+j-BG_Y/2), j < BG_Y; j ++){
		for(i = 0; s = (u_short)(k+i-BG_X/2), i < BG_X; i ++){
//	このとき同時にテクスチャデータも割り付ける
			if(s >= GrdWx || t >= GrdWy)
				setUVWH(&db->BgFT4[j][i], 0, 16*5, BG_TEX_W, BG_TEX_H);
			else{
				u = *(GrdData+t*GrdWx+s);
				setUVWH(&db->BgFT4[j][i],
					(u%16)*BG_CELL_X, (u/16)*BG_CELL_Y, BG_TEX_W, BG_TEX_H);
			}
//	共有点の割り当て
			db->BgFT4[j][i].x0 = BgSvec[j  ][i  ].vx;
			db->BgFT4[j][i].y0 = BgSvec[j  ][i  ].vy;
			db->BgFT4[j][i].x1 = BgSvec[j  ][i+1].vx;
			db->BgFT4[j][i].y1 = BgSvec[j  ][i+1].vy;
			db->BgFT4[j][i].x2 = BgSvec[j+1][i  ].vx;
			db->BgFT4[j][i].y2 = BgSvec[j+1][i  ].vy;
			db->BgFT4[j][i].x3 = BgSvec[j+1][i+1].vx;
			db->BgFT4[j][i].y3 = BgSvec[j+1][i+1].vy;
		}
	}
}

// BG 関数
// ----------------------------------------------------------------------------
// 仮想画面上のある点のセル値を求める
u_short get_bgchr(long x, long y){
	u_short o, p;
	
	o = (x%(GrdWx*BG_CELL_X))/BG_CELL_X; p = (y%(GrdWy*BG_CELL_Y))/BG_CELL_Y;
	if(o >= GrdWx || p >= GrdWy) return 3;
	return (u_short)*(GrdData+p*GrdWx+o);
}
// 仮想画面上のある点が壁かどうか判定
u_short getwall(long x, long y){
	if(get_bgchr(x, y) < 32)	return 1;
	else						return 0;
}
