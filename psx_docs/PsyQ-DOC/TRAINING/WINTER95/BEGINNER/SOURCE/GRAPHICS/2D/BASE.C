// ----------------------------------------------------------------------------
// 
// 							2D ｸﾞﾗﾌｨｸｽｻﾝﾌﾟﾙ: BASE.C
// 
// 				Copyright (C) 1995 Sony Computer Entertainment Inc.
// 							   All Rights Reserved
// ----------------------------------------------------------------------------

// ============================================================================
// 自キャラ移動ルーチン、文字表示ルーチン
// ============================================================================
#include <sys/types.h>
#include <libetc.h>
#include <libgte.h>
#include <libgpu.h>
#include "orghead.h"

#define BASE_TEX_X		96	// 自キャラ本体テクスチャ位置
#define BASE_TEX_Y		0
#define BASE_TEX_W		30
#define BASE_TEX_H		36

#define CARA_TEX_X		96	// キャタピラテクスチャ位置
#define CARA_TEX_Y		40
#define CARA_TEX_W		8
#define CARA_TEX_H		24

#define NUM_TEX_X		0	// 文字テクスチャ位置
#define NUM_TEX_Y		96
#define NUM_TEX_W		16
#define NUM_TEX_H		24

#define SETUVWH(X, U, V, W, H) { setUV0(X, U, V); setWH(X, W, H); }

u_short	Tpage, Clut;

SVECTOR	BaseRotR[4], BaseAngR;
VECTOR	BaseVecL, BaseVecR;
u_long  BasePosUD, BaseFBSpd, BaseRLSpd;

u_short EneNum;

static u_short CaraLAnim = 0, CaraRAnim = 0;	// キャタピラアニメ用

// ポリゴン初期化
// ----------------------------------------------------------------------------
void base_init(struct DB *db){
//	本体ポリゴン初期化
	SetSprt(&db->BaseSPRT); SetShadeTex(&db->BaseSPRT, 1);
	setXY0(&db->BaseSPRT, 160-15, 160-22);
	SETUVWH(&db->BaseSPRT, BASE_TEX_X, BASE_TEX_Y, BASE_TEX_W, BASE_TEX_H);
	addPrim(&db->ot_noclr[OT_NOCLR_BASE], &db->BaseSPRT);
//	左キャタピラポリゴン初期化
	SetSprt(&db->CaraLSPRT); SetShadeTex(&db->CaraLSPRT, 1);
	setXY0(&db->CaraLSPRT, 160-18, 160-12);
	SETUVWH(&db->CaraLSPRT, CARA_TEX_X, CARA_TEX_Y, CARA_TEX_W, CARA_TEX_H);
	addPrim(&db->ot_noclr[OT_NOCLR_BASE], &db->CaraLSPRT);
//	右キャタピラポリゴン初期化
	SetSprt(&db->CaraRSPRT); SetShadeTex(&db->CaraRSPRT, 1);
	setXY0(&db->CaraRSPRT, 160+12, 160-12);
	SETUVWH(&db->CaraRSPRT, CARA_TEX_X, CARA_TEX_Y, CARA_TEX_W, CARA_TEX_H);
	addPrim(&db->ot_noclr[OT_NOCLR_BASE], &db->CaraRSPRT);
//	CLUT 設定
	db->BaseSPRT.clut  = db->CaraLSPRT.clut  = db->CaraRSPRT.clut  = Clut;
//	自キャラ用オーダリングテーブル終端をメインオーダリングテーブルへ接続
	((P_TAG *)&db->BaseSPRT.tag)->addr = db->ot[OT_BASE];
}

void base_init_common(void){
 	BaseRotR[0].vx = -10; BaseRotR[0].vy = -9;	// 4 点に衝突判定をしているため、
 	BaseRotR[1].vx =  10; BaseRotR[1].vy = -9;	// 仮想フィールド上に
 	BaseRotR[2].vx = -10; BaseRotR[2].vy =  9;	// 回転中心からのオフセットが必要
 	BaseRotR[3].vx =  10; BaseRotR[3].vy =  9;
	setVector(&BaseAngR, 0, 0, 0); setVector(&BaseVecL, 0, 0, 0);
}

// 出現
// ----------------------------------------------------------------------------
void base_born(void){
	BasePosUD = 0;
	
	setVector(&BaseVecR, 200, 200, 0);			// 初期位置 (200, 200)
	setVector(&BaseVecL, 200, 200, 0);
	setVector(&BaseAngR, 0, 0, ONE*3/8);		// 初期方向
	
	BaseFBSpd = 2; BaseRLSpd = 16;				// 前進後退/回転スピード
}

// 移動
// ----------------------------------------------------------------------------
void base_move(struct DB *db){
//	キャタピラアニメのため、テクスチャ位置を変える
	SETUVWH(&db->CaraLSPRT,
		CARA_TEX_X+((CaraLAnim%8)/2)*8, CARA_TEX_Y, CARA_TEX_W, CARA_TEX_H);
	SETUVWH(&db->CaraRSPRT,
		CARA_TEX_X+((CaraRAnim%8)/2)*8, CARA_TEX_Y, CARA_TEX_W, CARA_TEX_H);
}

// （オフセットを考慮した）仮想フィールド位置を求める
void get_basevecl(u_int offx, u_int offy, long *x, long *y){
	SVECTOR svec;
	VECTOR vec;

	rotzmatrix(BaseAngR.vz);					// 回転マトリクス生成

	setVector(&svec, offx, BasePosUD+offy, 0);	// 前後移動パラメータと
	ApplyMatrix(&ZMatrix, &svec, &vec);			// 掛け算
	*x = BaseVecR.vx+vec.vx; *y = BaseVecR.vy+vec.vy;
												// 平行移動ベクトルと加算
}

// 回転時のパラメータの設定
static void basevecr2l(void){
	BaseVecR.vx = BaseVecL.vx; BaseVecR.vy = BaseVecL.vy;
												// 平行移動ベクトルの変更
	BasePosUD = 0;								// 前後移動用パラメータ初期化
 	BaseRotR[0].vy = -9; BaseRotR[1].vy = -9;
 	BaseRotR[2].vy =  9; BaseRotR[3].vy =  9;
}

// 前後移動
void base_updown(long spd){
	long i, x, y;
//	壁衝突判定
	if(i = walljudge(spd, BaseRotR[0], BaseRotR[1], BaseRotR[2], BaseRotR[3],
					 &BaseAngR, &BaseVecR)){
//	ぶつかった
		basevecr2l();							// ここを基点にする
		dirjudgeud(spd, i, BaseAngR.vz, &BaseVecL, &x, &y);
												// ぶつかり方によって位置を変化
		BaseVecL.vx = (BaseVecR.vx += x); BaseVecL.vy = (BaseVecR.vy += y);
	}
	else{
//	ぶつかってない
		BasePosUD -= spd;						// パラメータ更新
	 	BaseRotR[0].vy -= spd; BaseRotR[1].vy -= spd;
	 	BaseRotR[2].vy -= spd; BaseRotR[3].vy -= spd;
		get_basevecl(0, 0, &BaseVecL.vx, &BaseVecL.vy);
												// 仮想位置の更新
	}
	CaraLAnim += (spd < 0)? 2:-2; CaraRAnim += (spd < 0)? 2:-2;
												// アニメパラメータ更新
}

//	左右移動
void base_rl(short dir){
	basevecr2l();								// ここを基点にする
	BaseAngR.vz += dir;							// 方向更新
	if(BaseAngR.vz < 0)				BaseAngR.vz += 4096;	// 調整
	else if(BaseAngR.vz >= 4096)	BaseAngR.vz -= 4096;
	CaraLAnim += (dir < 0)? 1:-1; CaraRAnim += (dir > 0)? 1:-1;
												// アニメパラメータ更新
}

// コントロールパッドデータ読み込み
// ----------------------------------------------------------------------------
int padopr(void){
	u_long padd;

	padd = PadRead(1);											// 読み込み

	if(padd & PADLleft)		base_rl(-BaseRLSpd);				// 左回転
	if(padd & PADLright)	base_rl( BaseRLSpd);				// 右回転
	if(padd & PADLup)		base_updown( BaseFBSpd);			// 前進
	if(padd & PADLdown)		base_updown(-BaseFBSpd);			// 後退
	if(padd & PADo)			foe_born();							// 敵増加
	if(padd & PADn)			foe_kill();							// 敵減少
	if(padd & PADk)			return -1;							// exit

	return 0;
}


// ============================================================================
// 文字表示ルーチン
// ============================================================================
void scrn_init(struct DB *db){
	u_short i;
	
	for(i = 0; i < SCORE_KETA; i++){
		SetSprt(&db->ScoreSPRT[i]); SetShadeTex(&db->ScoreSPRT[i], 1);
		SetSemiTrans(&db->ScoreSPRT[i], 1);
		db->ScoreSPRT[i].clut  = Clut;
		SETUVWH(&db->ScoreSPRT[i], NUM_TEX_X, NUM_TEX_Y, NUM_TEX_W, NUM_TEX_H);
		setXY0(&db->ScoreSPRT[i], 250+i*NUM_TEX_W, 20);
		addPrim(&db->ot_noclr[OT_NOCLR_SCREEN], &db->ScoreSPRT[i]);
	}
//	文字表示用オーダリングテーブル終端をメインオーダリングテーブルへ接続
	((P_TAG *)&db->ScoreSPRT[0].tag)->addr = db->ot[OT_SCREEN];
}

void scrn_move(struct DB *db){
	short i, l;
//	敵の数表示
	for(l = EneNum, i = SCORE_KETA-1; i >= 0; i --, l /= 10)
		SETUVWH(&db->ScoreSPRT[i],
			NUM_TEX_X+NUM_TEX_W*(l%10), NUM_TEX_Y, NUM_TEX_W, NUM_TEX_H);
}
