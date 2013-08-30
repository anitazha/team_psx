// ----------------------------------------------------------------------------
// 
// 							2D ｸﾞﾗﾌｨｸｽｻﾝﾌﾟﾙ: FOE.C
// 
// 				Copyright (C) 1995 Sony Computer Entertainment Inc.
// 							   All Rights Reserved
// ----------------------------------------------------------------------------

// ============================================================================
// 敵ルーチン
// ============================================================================
#include <sys/types.h>
#include <libetc.h>
#include <libgte.h>
#include <libgpu.h>
#include "orghead.h"

#define DIS_TYPE			0				// 空き
#define ENE0_TYPE			1				// 割り当て済

#define ENE0_TEX_X			128				// テクスチャ位置
#define ENE0_TEX_Y			0
#define ENE0_TEX_W			36
#define ENE0_TEX_H			37

static void foe0s(struct FOE *), foe0e(struct FOE *),
			foe0(struct DB *, struct FOE *);
static short foe_getpoly(u_short *, struct FOE *);
static void foe_freepolyset(struct FOE *);

struct FOE Foe[FOE_MAX];
u_short FoeFlg[FOE_POLY_MAX];

// 初期化
// ----------------------------------------------------------------------------
void foe_init(struct DB *db){
	u_short i;
	
	for(i = 0; i < FOE_POLY_MAX; i ++){
		SetPolyFT4(&db->FoeFT4[i]); SetShadeTex(&db->FoeFT4[i], 1);
		db->FoeFT4[i].tpage = Tpage; db->FoeFT4[i].clut  = Clut;
	}
}

void foe_init_common(void){
	u_short i;
	
	for(i = 0; i < FOE_MAX; i ++){
		Foe[i].Type = DIS_TYPE;				// すべての敵パケットを空き状態に
		
		setVector(&Foe[i].AngS, 0, 0, 0);	// 各ベクトルの初期化
		setVector(&Foe[i].VecS, 0, 0, SCR_Z);
		setVector(&Foe[i].AngR, 0, 0, 0);
		setVector(&Foe[i].VecL, 0, 0, 0);
	}
	for(i = 0; i < FOE_POLY_MAX; i ++) FoeFlg[i] = 0;
											// ポリゴン割り当てフラグ初期化
}

// 出現、消却、移動
// ----------------------------------------------------------------------------
void foe_born(void){
	u_short i;
	
	for(i = 0; i < FOE_MAX; i ++)
		if(Foe[i].Type == DIS_TYPE){ EneNum ++; foe0s(&Foe[i]); break; }
}

void foe_kill(void){
	u_short i;
	
	for(i = 0; i < FOE_MAX; i ++)
		if(Foe[i].Type != DIS_TYPE){ EneNum --; foe0e(&Foe[i]); break; }
}

void foe_move(struct DB *db){
	u_short i;
	
	for(i = 0; i < FOE_MAX; i ++)
		if(Foe[i].Type != DIS_TYPE) foe0(db, &Foe[i]);
}

// 出現ルーチン
// ----------------------------------------------------------------------------
void foe0s(struct FOE *foe){
//	パケットに空きがあるかチェック
	if(!foe_getpoly(&FoeFlg[0], foe)){
//	空いてた
		*foe->Flg = foe->Type = ENE0_TYPE;			// 敵パケットを割り当てる
													// 動きパラメータ初期化
		foe->Dist = rand()%100;								// 直進距離
		foe->Spd = foe->Dir = 1;							// スピード、前後方向
		foe->Len = foe->Param_s[0] = foe->Param_s[1] = 0;	// その他
		setVector(&foe->AngR, 0, 0, rand()%4096);			// ベクトル初期化
		setVector(&foe->VecR, 300, 300, 0);
		foe->VecL.vx = foe->VecR.vx; foe->VecL.vy = foe->VecR.vy;
	}
}

void foe0e(struct FOE *foe){
	foe->Type = DIS_TYPE;							// 敵パケット開放
	foe_freepolyset(foe);
}

void foe0(struct DB *db, struct FOE *foe){
	VECTOR vec;
	
	if(foe->Param_s[0] > 0){						// 回転中
		foe->Param_s[0] --;
		foe->AngR.vz += foe->Param_s[1];
		
		if(foe->AngR.vz < 0)			foe->AngR.vz += 4096;
		else if(foe->AngR.vz >= 4096)	foe->AngR.vz -= 4096;
	}else if(foe->Len < foe->Dist){					// 直進中
		foe->Len += foe->Spd;
//	壁判定
		if(walljudge_2(foe->Len*foe->Dir, &foe->AngR, &foe->VecR, &vec)){
//	ぶつかった
			foe->VecR.vx = foe->VecL.vx; foe->VecR.vy = foe->VecL.vy;
			
			foe->Len = 0;
			foe->Dist = rand()%100;					// 直進距離
			
			if(foe->Dir > 0){ foe->Dir = -1; foe->Spd = 1; }
													// 後退、スピード遅い
			else{			  foe->Dir =  1; foe->Spd = 2; }
													// 前進、スピード早い
		}
		else{
			foe->VecL.vx = vec.vx; foe->VecL.vy = vec.vy;
		}
	}
	else{
//	ぶつかってない
		foe->VecR.vx = foe->VecL.vx; foe->VecR.vy = foe->VecL.vy;
		
		foe->Len = 0;
		foe->Dist = rand()%100;						// 直進距離
		foe->Dir = 1;								// 前進
		foe->Spd = 2;								// スピード早い
		foe->Param_s[0] = rand()%30;				// 回転時間
		foe->Param_s[1] = (rand()%2)? -16:16;		// 回転方向＆スピード
	}
	
//	描画
	RotS[0].vx = -18; RotS[0].vy = -22;	RotS[1].vx =  18; RotS[1].vy = -22;
	RotS[2].vx = -18; RotS[2].vy =  15;	RotS[3].vx =  18; RotS[3].vy =  15;
//	画面上の位置を求める
	getvas(foe->Len*foe->Dir, &foe->AngR, &foe->AngS, &foe->VecR, &foe->VecS,
		   RotS[0], RotS[1], RotS[2], RotS[3], &db->FoeFT4[foe->FT4]);
	setUVWH(&db->FoeFT4[foe->FT4],
			ENE0_TEX_X, ENE0_TEX_Y, ENE0_TEX_W, ENE0_TEX_H);
//	OT に登録
	addPrim(&db->ot[OT_FOE], &db->FoeFT4[foe->FT4]);
}

// 敵パケットマネージメントルーチン
// ----------------------------------------------------------------------------
// 取得
static short foe_getpoly(u_short *ps, struct FOE *foe){
	u_short i;
	
	for(i = 0; i < FOE_POLY_MAX; i ++)
		if(*(ps+i) == 0){
			*(ps+i) = 1;					// 予約された
			foe->Flg = &FoeFlg[i];			// ポリゴンフラグポインタの保存
			foe->FT4 = i;					// ポリゴン番号の保存
			return 0;						// あった
		}
	return 1;								// ない
}

// 開放
static void foe_freepolyset(struct FOE *foe){
	*foe->Flg = 0;
}
