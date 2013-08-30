// ----------------------------------------------------------------------------
// 
// 							2D ｸﾞﾗﾌｨｸｽｻﾝﾌﾟﾙ: FUNC.C
// 
// 				Copyright (C) 1995 Sony Computer Entertainment Inc.
// 							   All Rights Reserved
// ----------------------------------------------------------------------------

// ============================================================================
// サブルーチン
// ============================================================================
#include <sys/types.h>
#include <libetc.h>
#include <libgte.h>
#include <libgpu.h>
#include "orghead.h"

#define TEX_ADR			0x80100000			// テクスチャデータ ロードアドレス
#define TP_X			768					// TPAGE 位置
#define TP_Y			0
#define CLUT_X			0					// CLUT 位置
#define CLUT_Y			480

#define MAP_ADR			0x80300000			// マップデータ ロードアドレス

MATRIX	ZMatrix;
SVECTOR RotS[4];

// VecR, AngR から仮想画面上の矩形位置（4 点）を求める
// ----------------------------------------------------------------------------
void getvar(long spd,
		   SVECTOR ror0, SVECTOR ror1, SVECTOR ror2, SVECTOR ror3,
		   SVECTOR *angr, VECTOR *vecr,
		   VECTOR *v0, VECTOR *v1, VECTOR *v2, VECTOR *v3){
	MATRIX m;
	long flg;
	rotzmatrix(angr->vz); SetRotMatrix(&ZMatrix);			// RTM、TRV の設定
	TransMatrix(&m, vecr); SetTransMatrix(&m);
	
	ror0.vy -= spd; ror1.vy -= spd; ror2.vy -= spd; ror3.vy -= spd;
															// オフセットを考慮
	RotTrans(&ror0, v0, &flg); RotTrans(&ror1, v1, &flg);	// 座標変換
	RotTrans(&ror2, v2, &flg); RotTrans(&ror3, v3, &flg);
}

// offset をつけたベクトルを求める
// ----------------------------------------------------------------------------
void getvecoff(long offx, long offy, SVECTOR *angr, VECTOR *vecr, VECTOR *vecl){
	SVECTOR svec;
	
	setVector(&svec, offx, offy, 0);	// ベクトルの設定
	
	rotzmatrix(angr->vz);				// 内部では AngR だけ傾いている
	
	ApplyMatrix(&ZMatrix, &svec, vecl);	// 演算
	addVector(vecl, vecr);				// 基点ベクトルを足す
}

// 表示用の VecS を求める
// ----------------------------------------------------------------------------
void getvecs(long scr_z, VECTOR *vecr, VECTOR *vecs){
	SVECTOR svec;
	
	rotzmatrix(-BaseAngR.vz);			// Base の傾き分逆回転
	
	svec.vx = vecr->vx-BaseVecL.vx;	svec.vy = vecr->vy-BaseVecL.vy; svec.vz = 0;
										// Base から見た敵の基点ベクトルを求める
	ApplyMatrix(&ZMatrix, &svec, vecs);	// break RTM
	vecs->vz = scr_z;
}

// VecR、AngR から透視変換までやってしまう。VecS、AngS の更新をおこなう
// ----------------------------------------------------------------------------
void getvas(long spd,
			SVECTOR *angr, SVECTOR *angs, VECTOR *vecr, VECTOR *vecs,
			SVECTOR rot0, SVECTOR rot1, SVECTOR rot2, SVECTOR rot3,
			POLY_FT4 *ft4){
	MATRIX m;
	long dmy, flg;
	
	getvecs(vecs->vz, vecr, vecs);				//	VecS を求める
	
	angs->vz = (angr->vz)-(BaseAngR.vz);		//	AngS を求める
												// 画面上の傾きは VecR-BaseVecR
	rotzmatrix(angs->vz); SetRotMatrix(&ZMatrix);
	TransMatrix(&m, vecs); SetTransMatrix(&m);	//	VecS, AngS で定数行列の設定
	
	rot0.vy -= spd; rot1.vy -= spd; rot2.vy -= spd; rot3.vy -= spd;
												// 基点からの距離（オフセット）の更新
	RotTransPers4(&rot0, &rot1, &rot2, &rot3,
		(long *)&ft4->x0, (long *)&ft4->x1,
		(long *)&ft4->x2, (long *)&ft4->x3, &dmy, &flg);	// 透視変換
}

// Ｚ軸回転のみのマトリクス生成（早い…ｶﾓ）
// ----------------------------------------------------------------------------
void initzmatrix(void){
	u_short i, j;
	
	for(i = 0; i < 2; i ++) for(j = 0; j < 2; j ++) ZMatrix.m[i][j] = 0;
	ZMatrix.m[2][2] = 1;
}

void rotzmatrix(short vz){
	short i;
	
	ZMatrix.m[0][0] = ZMatrix.m[1][1] = rcos(vz);
	ZMatrix.m[1][0] =  i = rsin(vz);
	ZMatrix.m[0][1] = -i;
}

// BG 判定
// ----------------------------------------------------------------------------
//	VecR、AngR から仮想上の矩形位置を求め、4点それぞれに壁の判定
short walljudge(long spd,
			  SVECTOR ror0, SVECTOR ror1, SVECTOR ror2, SVECTOR ror3,
			  SVECTOR *angr, VECTOR *vecr){
	VECTOR v[4];
	
	getvar(spd, ror0, ror1, ror2, ror3, angr, vecr, &v[0], &v[1], &v[2], &v[3]);
												// 仮想画面上の 4 点を求める
	return (getwall(v[0].vx, v[0].vy)  +getwall(v[1].vx, v[1].vy)*2+
			getwall(v[2].vx, v[2].vy)*4+getwall(v[3].vx, v[3].vy)*8);
												// 各点の判定状況をビットで示す
}
//	速さ優先の敵用壁判定ルーチン（１点判定）
short walljudge_2(long spd, SVECTOR *angr, VECTOR *vecr, VECTOR *vecl){
	getvecoff(0, -spd, angr, vecr, vecl);		// 仮想画面上の 1 点を求める
	return getwall(vecl->vx, vecl->vy);
}
//	壁にぶつかった場合の移動成分を求める
void getxy(long spd, short ang, long *x, long *y){
	*x = *y = spd/2;							// 速さは１／２
	switch(ang/1024){							// 各象現ごとに場合分け
		case 0: *y *= -1; break;
		case 2: *x *= -1; break;
		case 3: *x *= -1; *y *= -1; break;
	}
}
//	前進、後退時の当り判定の解析とその後の挙動を決定（自機用）
void dirjudgeud(long spd, long p, long ang, VECTOR *vecl, long *x, long *y){
	short i[4], j, k;
	
	i[0] = p&0x01; i[1] = p&0x02; i[2] = p&0x04; i[3] = p&0x08;
											// 各点の壁情報を解析
	getxy(spd, ang, x, y);					// 角度によって増分を決定
	
	ang /= 1024; ang %= 2;
	
	if(spd >0 ){ j = 0; k = 1; }			// 第 0, 2 象現、第 1, 3 象現は同じ扱い
	else   	   { j = 3; k = 2; }
	
	if(i[j]){ if(ang) *x = 0;	else *y = 0; }
	if(i[k]){ if(ang) *y = 0;	else *x = 0; }
	
	if(getwall(vecl->vx+*x, vecl->vy+*y)) *x = *y = 0;
											// 避けようとしたとこがまた壁なら止まる
}

// ============================================================================
// データファイル解析
// ============================================================================
// TIM ロード
// ----------------------------------------------------------------------------
//	CLUT の位置を求めロード、テクスチャの位置をかえす
static long *clutload(long *clutadr, u_short *clut, u_short cx, u_short cy){
	if(*clutadr & (long)0x08){
		*clut = LoadClut(clutadr+4, cx, cy);
		return (long *)((char *)clutadr+4+*(clutadr+1));
	}
	else
		return clutadr+1;
}
//	テクスチャデータのロード
static void pixload(long *pixadr, u_short *pix, u_short px, u_short py){
	*pix = LoadTPage(pixadr+3, 1, 0, px, py, 256, 256);
}
//	TIM フォーマットの解析とロード
void load_texture(long *texadr, u_short *clut, u_short *pix,
				  u_short px, u_short py, u_short cx, u_short cy){
	texadr = clutload(texadr+1, clut, cx ,cy);
	pixload(texadr, pix, px, py);
}
//	テクスチャの読み込み
void init_texture(void){
	load_texture((u_long *)TEX_ADR, &Clut, &Tpage, TP_X, TP_Y, CLUT_X, CLUT_Y);
}

// MAP ロード
// ----------------------------------------------------------------------------
void mapload(void){
	u_char *pt;
	
	pcfileread("seminar.bgd",  (u_char *)MAP_ADR);			// ファイル読み込み
	pt = (u_char *)MAP_ADR;
	GrdWx = (u_short)*(pt+5); GrdWy = (u_short)*(pt+4);		// 解析
	GrdData = (u_short *)(pt+8);
}
