/*
 *	Active sub-divide simplest sample
 *
 *	"tuto0.c" ******** for texture gouror polygon
 *
 *      ADVANCED DEVELOPMENT SEMINAR VERSION
 *			Nov,  10, 1995
 *
 *		Copyright (C) 1995  Sony Computer Entertainment
 *		All rights Reserved
 */

#include <sys/types.h>

#include <libetc.h>		/* for Control Pad :
				   PADを使うためにインクルードする必要あり */
#include <libgte.h>		/* LIBGS uses libgte :
				   LIGSを使うためにインクルードする必要あり*/
#include <libgpu.h>		/* LIBGS uses libgpu :
				   LIGSを使うためにインクルードする必要あり */
#include <libgs.h>		/* for LIBGS :
				   グラフィックライブラリ を使うための
				   構造体などが定義されている */

#define PACKETMAX 10000		/* Max GPU packets */

#define OBJECTMAX 100		/* Max Objects :
				   ３Dのモデルは論理的なオブジェクトに
                                   分けられるこの最大数 を定義する */

#define PACKETMAX2 (PACKETMAX*24) /* size of PACKETMAX (byte)
                                     paket size may be 24 byte(6 word) */

#define TEX_ADDR   0x80100000	/* Top Address of texture data1 (TIM FORMAT)
                                /* テクスチャデータ（TIMフォーマット）
				   がおかれるアドレス */

#define OT_LENGTH  8		/* bit length of OT :
				   オーダリングテーブルの解像度 */


GsOT            Wot[2];		/* Handler of OT
                                   Uses 2 Hander for Dowble buffer
				   : オーダリングテーブルハンドラ
				   ダブルバッファのため２つ必要 */

GsOT_TAG	zsorttable[2][1<<OT_LENGTH]; /* Area of OT
                                             /* オーダリングテーブル実体 */

GsDOBJ2		object[OBJECTMAX]; /* Array of Object Handler
                                   /* オブジェクトハンドラ
				      オブジェクトの数だけ必要 */

u_long          Objnum;		/* valibable of number of Objects
                                /* モデリングデータのオブジェクトの数を
				   保持する */


GsCOORDINATE2   DWorld;  /* Coordinate for GsDOBJ2
                         /* オブジェクトごとの座標系 */

SVECTOR         PWorld; /* work short vector for making Coordinate parmeter
                        /* 座標系を作るためのローテーションベクター */

GsRVIEW2  view;			/* View Point Handler
                                /* 視点を設定するための構造体 */
GsF_LIGHT pslt[3];		/* Flat Lighting Handler
                                /* 平行光源を設定するための構造体 */
u_long padd,pad_prev,PadTrig;	/* Controler data :
				   コントローラのデータを保持する */

#define square(a)               ((a)*(a))

PACKET		out_packet[2][PACKETMAX2];  /* GPU PACKETS AREA */
extern int NEARZ;

static u_char dummy_scratch[1024];

char menu[4][128] = {
  "分割状況 ON/OFF",
  "分割選択 1 4 16 64 256 1024 4096",
  "スクラッチパッド 選択 ON/OFF",
  "すき間 ON/OFF"
  };

#define MAX_MENU 4
#define DIVIDE_SELECT 0
#define DIVNUMBER_SELECT 1
#define SCRATCH_SELECT 2
#define SUKIMA_SELECT 3

int MenuMode   = 0;
int DivideMode = 0;
int DivideNumber = 0;
int ScratchMode = 0;
int SukimaMode = 0;

/************* MAIN START ******************************************/
main()
{
  int     i;
  GsDOBJ2 *op;			/* pointer of Object Handler
                                /* オブジェクトハンドラへのポインタ */
  int     outbuf_idx;		/* double buffer index */
  MATRIX  tmpls;
  int vcount,load,num;		/* for DEBUG */
  
  ResetCallback();
  GsInitVcount();
  
  init_all();

  KanjiFntOpen(-320+16, -120+32, 640, 200, 704, 256, 768, 256, 0, 512);
  FntLoad(960, 256);
  
  while(1)
    {
      obj_interactive();	/* interactive parameter get :
				   パッドデータから動きのパラメータを入れる */
      GsSetRefView2(&view);	/* Calculate World-Screen Matrix :
				   ワールドスクリーンマトリックス計算 */
      outbuf_idx=GsGetActiveBuff();/* Get double buffer index
	                           /* ダブルバッファのどちらかを得る */

      /* Set top address of Packet Area for output of GPU PACKETS */
      GsSetWorkBase((PACKET*)out_packet[outbuf_idx]);
      
      GsClearOt(0,0,&Wot[outbuf_idx]); /* Clear OT for using buffer
	                               /* オーダリングテーブルをクリアする */
	
	/* Calculate Local-World Matrix :
	   ワールド／ローカルマトリックスを計算する */
	GsGetLw(&DWorld,&tmpls);

      /* Set LWMATRIX to GTE Lighting Registers
	 /* ライトマトリックスをGTEにセットする */
	GsSetLightMatrix(&tmpls);
      
      /* Calculate Local-Screen Matrix :
	 スクリーン／ローカルマトリックスを計算する */
      GsGetLs(&DWorld,&tmpls);
      
      /* Set LSAMTRIX to GTE Registers :
	 スクリーン／ローカルマトリックスをGTEにセットする */
      GsSetLsMatrix(&tmpls);
      
      /* Perspective Translate Object and Set OT :
	 オブジェクトを透視変換しオーダリングテーブルに登録する */
      vcount = VSync(1);
      
      if(ScratchMode==0)
	num = sort_tg_plane(out_packet[outbuf_idx],14-OT_LENGTH,
		      &Wot[outbuf_idx],getScratchAddr(0));
      else
	num = sort_tg_plane(out_packet[outbuf_idx],14-OT_LENGTH,
		      &Wot[outbuf_idx],dummy_scratch);
      
      load = VSync(1)-vcount;
      fuka_meter(&Wot[outbuf_idx],outbuf_idx,load);
      KanjiFntPrint("%s\n分割数 = %4d/%4d  CACHE = %s すき間 = %s\n",
		    menu[MenuMode],num,square(1<<DivideNumber),
		    (ScratchMode==0?"ON":"OFF"),
		    (SukimaMode==1?"ON":"OFF"));
/*      DrawSync(0);*/
      VSync(0);			/* Wait VSYNC : Vブランクを待つ */
      ResetGraph(1);
      padd=PadRead(1);		/* Readint Control Pad data :
				   パッドのデータを読み込む */
      
      PadTrig = (padd != pad_prev?1:0);
      pad_prev = padd;
      
      GsSwapDispBuff();		/* Swap double buffer
				   : ダブルバッファを切替える */
      
      /* Set SCREEN CLESR PACKET to top of OT
	 : 画面のクリアをオーダリングテーブルの最初に登録する */
      GsSortClear(0x0,0xa0,0x80,&Wot[outbuf_idx]);
      /* Drawing OT
      /* オーダリングテーブルに登録されているパケットの描画を開始する */
      GsDrawOt(&Wot[outbuf_idx]);
      KanjiFntFlush(-1);
    }
}


obj_interactive()
{
  SVECTOR v1;
  MATRIX  tmp1;

  
  /* Rotate X
  /* オブジェクトをX軸回転させる */
  if((padd & PADRup)>0) PWorld.vx+=1*ONE/360;

  /* Rotate X
  /* オブジェクトをX軸回転させる */
  if((padd & PADRdown)>0) PWorld.vx-=1*ONE/360;
  
  /* Rotate Z
  /* オブジェクトをZ軸回転させる */
  if((padd & PADRright)>0) PWorld.vz+=1*ONE/360;
  
  /* Rotate Z
  /* オブジェクトをZ軸回転させる */
  if((padd & PADRleft)>0) PWorld.vz-=1*ONE/360;
  
  /* Translate Z
  /* オブジェクトをZ軸にそって動かす */
  if((padd & PADm)>0) DWorld.coord.t[2]-=100;
  
  /* Translate Z
  /* オブジェクトをZ軸にそって動かす */
  if((padd & PADl)>0) DWorld.coord.t[2]+=100;

  /* Translate X :
     オブジェクトをX軸にそって動かす */
  if((padd & PADLleft)>0) DWorld.coord.t[0] +=10;

  /* Translate X :
     オブジェクトをX軸にそって動かす */
  if((padd & PADLright)>0) DWorld.coord.t[0] -=10;

  /* Translate Y :
     オブジェクトをY軸にそって動かす */
  if((padd & PADLdown)>0) DWorld.coord.t[1]+=10;

  /* Translate Y :
     オブジェクトをY軸にそって動かす */
  if((padd & PADLup)>0) DWorld.coord.t[1]-=10;

  /* Calculate Matrix from Object Parameter and Set Coordinate :
     オブジェクトのパラメータからマトリックスを計算し座標系にセット */
  set_coordinate(&PWorld,&DWorld);

  /* select menu */
  if((padd & PADk)>0 && PadTrig)
    {
      MenuMode++;
      MenuMode%=MAX_MENU;
    }
  if(MenuMode == DIVIDE_SELECT)
    {
      if((padd & PADo)>0) DivideMode = 0;
      if((padd & PADn)>0) DivideMode = 1;
    }
  if(MenuMode == DIVNUMBER_SELECT)
    {
      if(DivideNumber>0 && (padd & PADo)>0 && PadTrig) DivideNumber--;
      if(DivideNumber<6 && (padd & PADn)>0 && PadTrig) DivideNumber++;
    }
  if(MenuMode == SCRATCH_SELECT)
    {
      if((padd & PADo)>0 && PadTrig) ScratchMode = 0;
      if((padd & PADn)>0 && PadTrig) ScratchMode = 1;
    }
  if(MenuMode == SUKIMA_SELECT)
    {
      if((padd & PADo)>0 && PadTrig) SukimaMode = 0;
      if((padd & PADn)>0 && PadTrig) SukimaMode = 1;
    }
}


/* Initialize routine
/* 初期化ルーチン群 */
init_all()
{
  ResetGraph(0);		/* Reset GPU : GPUリセット */
  PadInit(0);			/* Reset Controller : コントローラ初期化 */
  padd=0;			/* : コントローラ値初期化 */

#if 0
  GsInitGraph(640,480,GsINTER|GsOFSGPU,1,0);
  /* rezolution set , interrace mode
  /* 解像度設定（インターレースモード） */

  GsDefDispBuff(0,0,0,0);	/* Double buffer setting
                                /* ダブルバッファ指定 */
#endif

  GsInitGraph(640,240,GsNONINTER|GsOFSGPU,0,0);
  /* rezolution set , non interrace mode
                                /* 解像度設定（ノンインターレースモード） */
  GsDefDispBuff(0,0,0,240);	/* Double buffer setting
                                /* ダブルバッファ指定 */


  GsInit3D();			/* Init 3D system /* ３Dシステム初期化 */
  
  Wot[0].length=OT_LENGTH;	/* Set bit length of OT handler
                                /* オーダリングテーブルハンドラに解像度設定 */

  Wot[0].org=zsorttable[0];	/* Set Top address of OT Area to OT handler
                                /* オーダリングテーブルハンドラに
				   オーダリングテーブルの実体設定 */
    
  /* same setting for anoter OT handler
  /*ダブルバッファのためもう一方にも同じ設定 */
  Wot[1].length=OT_LENGTH;
  Wot[1].org=zsorttable[1];
  
  coord_init();			/* Init coordinate : 座標定義 */
  view_init();			/* Setting view point : 視点設定 */
  light_init();			/* Setting Flat Light : 平行光源設定 */
  texture_init(TEX_ADDR);
}


view_init()			/* Setting view point /* 視点設定 */
{
  /*---- Set projection,view ----*/
  GsSetProjection(1000);	/* Set projection : プロジェクション設定 */
  NEARZ = 1000/2;		/* PROJECTION/2 */
    
  /* Setting view point location /* 視点パラメータ設定 */
  view.vpx = 0; view.vpy = 0; view.vpz = 2000;
  
  /* Setting focus point location /* 注視点パラメータ設定 */
  view.vrx = 0; view.vry = 0; view.vrz = 0;
  
  /* Setting bank of SCREEN /* 視点の捻りパラメータ設定 */
  view.rz=0;

  /* Setting parent of viewing coordinate /* 視点座標パラメータ設定 */
  view.super = WORLD;
  
  /* Calculate World-Screen Matrix from viewing paramter
  /* 視点パラメータを群から視点を設定する
     ワールドスクリーンマトリックスを計算する */
  GsSetRefView2(&view);
}


light_init()			/* init Flat light : 平行光源設定 */
{
  /* Setting Light ID 0 /* ライトID０ 設定 */
  /* Setting direction vector of Light0
  /* 平行光源方向パラメータ設定 */
  pslt[0].vx = 20; pslt[0].vy= -100; pslt[0].vz= -100;
  
  /* Setting color of Light0
  /* 平行光源色パラメータ設定 */
  pslt[0].r=0xd0; pslt[0].g=0xd0; pslt[0].b=0xd0;
  
  /* Set Light0 from parameters
  /* 光源パラメータから光源設定 */
  GsSetFlatLight(0,&pslt[0]);

  
  /* Setting Light ID 1 /* ライトID１ 設定 */
  pslt[1].vx = 20; pslt[1].vy= -50; pslt[1].vz= 100;
  pslt[1].r=0x80; pslt[1].g=0x80; pslt[1].b=0x80;
  GsSetFlatLight(1,&pslt[1]);
  
  /* Setting Light ID 2 /* ライトID２ 設定 */
  pslt[2].vx = -20; pslt[2].vy= 20; pslt[2].vz= -100;
  pslt[2].r=0x60; pslt[2].g=0x60; pslt[2].b=0x60;
  GsSetFlatLight(2,&pslt[2]);

  /* Setting Light ID 3 /* ライトID２ 設定 */
  pslt[2].vx = 0; pslt[2].vy= 100; pslt[2].vz= 0;
  pslt[2].r=0xa0; pslt[2].g=0xa0; pslt[2].b=0xa0;
  GsSetFlatLight(2,&pslt[2]);
  
  /* Setting Ambient : アンビエント設定 */
  GsSetAmbient(0,0,0);

  /* Setting default light mode /* 光源計算のデフォルトの方式設定 */
  GsSetLightMode(0);
}

coord_init()			/* Setting coordinate /* 座標系設定 */
{
  VECTOR v;
  
  /* Setting hierarchy of Coordinate /* 座標の定義 */
  GsInitCoordinate2(WORLD,&DWorld);
  
  /* Init work vector
  /* マトリックス計算ワークのローテーションベクター初期化 */
  PWorld.vx=PWorld.vy=PWorld.vz=0;
  
  /* the org point of DWold is set to Z = -40000
  /* オブジェクトの原点をワールドのZ = -4000に設定 */
  DWorld.coord.t[2] = -4000;
}


/* Set coordinte parameter from work vector
/* ローテションベクタからマトリックスを作成し座標系にセットする */
set_coordinate(pos,coor)
SVECTOR *pos;			/* work vector /* ローテションベクタ */
GsCOORDINATE2 *coor;		/* Coordinate /* 座標系 */
{
  MATRIX tmp1;
  VECTOR v1;
  
  /* Set translation /* 平行移動をセットする */
  tmp1.t[0] = coor->coord.t[0];
  tmp1.t[1] = coor->coord.t[1];
  tmp1.t[2] = coor->coord.t[2];
  
  /* : マトリックスワークにセットされているローテーションを
     ワークのベクターにセット */
  
  /* Rotate Matrix
  /* マトリックスにローテーションベクタを作用させる */
  RotMatrix(pos,&tmp1);
  
  /* Set Matrix to Coordinate
  /* 求めたマトリックスを座標系にセットする */
  coor->coord = tmp1;

  /* Clear flag becase of changing parameter
  /* マトリックスキャッシュをフラッシュする */
  coor->flg = 0;
}

u_short		clut, tpage;

/* Load texture to VRAM :
   テクスチャデータをVRAMにロードする */
texture_init(u_long *addr)
{
  GsIMAGE tim1;
  
  /* Get texture information of TIM FORMAT
     : TIMデータのヘッダからテクスチャのデータタイプの情報を得る */
  GsGetTimInfo(addr+1,&tim1);
  
  /* Load texture to VRAM : VRAMにテクスチャをロードする */
  tpage = LoadTPage(tim1.pixel,1,0,tim1.px,tim1.py,tim1.pw*2,tim1.ph);
  
  /* Exist Color Lookup Table : カラールックアップテーブルが存在する */  
  if((tim1.pmode>>3)&0x01)
    {
      clut = LoadClut(tim1.clut,tim1.cx,tim1.cy);
    }
}

POLY_F4 fuka_packet[2];

fuka_meter(ot,idx,load)
GsOT *ot;
int idx,load;
{
  setPolyF4(&fuka_packet[idx]);
  setRGB0(&fuka_packet[idx],0xc0,0x00,0x00);
  setXYWH(&fuka_packet[idx],-320+32,120-30,load*8,8);
  addPrim(ot->org,&fuka_packet[idx]);
}

