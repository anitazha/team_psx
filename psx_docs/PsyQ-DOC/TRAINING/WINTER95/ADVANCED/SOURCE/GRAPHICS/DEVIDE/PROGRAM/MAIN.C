/*
 * low_level: GsDOBJ4 object viewing rotine with low_level access 
 *
 * Copyright (C) 1995 by Sony Computer Entertainment All rights Reserved 
 */

#include <sys/types.h>
#include <libetc.h>
#include <libgte.h>	
#include <libgpu.h>	
#include <libgs.h>
#include <inline.h>
#include <gtemac.h>
#include <asm.h>

#define PACKETMAX 2048	
#define OBJECTMAX 1	
#define PACKETMAX2 (PACKETMAX*20)

#define MODEL_ADDR	0x80100000	
#define TEX_ADDR	0x80120000	
#define TEX_ADDR1	0x80140000	

#define OT_LENGTH  7		

GsOT    Wot[2]; 
GsOT_TAG zsorttable[2][1 << OT_LENGTH];

GsDOBJ2 object[OBJECTMAX];	
u_long  Objnum;		

GsCOORDINATE2 DWorld;

SVECTOR PWorld;	

GsRVIEW2 view;	
GsF_LIGHT pslt[3];	
u_long  padd;			

PACKET  out_packet[2][PACKETMAX2];

int	ismip;	

/************* MAIN START ******************************************/
main()
{
	int     i;
	GsDOBJ2 *op;
	int     outbuf_idx;
	MATRIX  tmpls, tmplw;
	u_long	vcount;
	u_long *p;
	long	psize, tsize, amount, reduct;
	long	sxy0,sxy1,sxy2,sxy3;
	POLY_FT4	*pft;

	ResetCallback();
	init_all();

	while (1) {
		if (obj_interactive() == 0) return 0;	

		GsSetRefView2(&view);	
		outbuf_idx = GsGetActiveBuff();	
		GsSetWorkBase((PACKET *) out_packet[outbuf_idx]);
		GsClearOt(0, 0, &Wot[outbuf_idx]);

		for (i = 0, op = object; i < Objnum; i++) {
			GsGetLws(op->coord2, &tmplw, &tmpls);

			GsSetLightMatrix(&tmplw);
			GsSetLsMatrix(&tmpls);

			SortTMDobject(op, &Wot[outbuf_idx], 14 - OT_LENGTH);
			op++;
		}

		VSync(0);	
		padd = PadRead(1);	
		GsSwapDispBuff();

		GsSortClear(0x0, 0x0, 0x0, &Wot[outbuf_idx]);

		amount = 0;
		reduct = 0;
		for(p = (u_long *)Wot[outbuf_idx].tag;
			!isendprim(p); p = nextPrim(p)){
			if((getlen(p) != 0) && (getcode(p) == 0x2c)){
				amount++;
				psize = abs(NormalClip(
					*(u_long *)&(((POLY_FT4 *)p)->x0),
					*(u_long *)&(((POLY_FT4 *)p)->x1),
					*(u_long *)&(((POLY_FT4 *)p)->x2)))/2;
				psize += abs(NormalClip(
					*(u_long *)&(((POLY_FT4 *)p)->x1),
					*(u_long *)&(((POLY_FT4 *)p)->x2),
					*(u_long *)&(((POLY_FT4 *)p)->x3)))/2;

				pft = (POLY_FT4 *)p;
				sxy0 = (pft->v0)<<16 | pft->u0;
				sxy1 = (pft->v1)<<16 | pft->u1;
				sxy2 = (pft->v2)<<16 | pft->u2;
				sxy3 = (pft->v3)<<16 | pft->u3;
				tsize = abs(NormalClip(sxy0,sxy1,sxy2))/2;
				tsize += abs(NormalClip(sxy1,sxy2,sxy3))/2;
				if(psize < tsize) reduct++;
			}
		}

		GsClearVcount();
		GsDrawOt(&Wot[outbuf_idx]);
		DrawSync(0);
		vcount = GsGetVcount();
		if(ismip)
			KanjiFntPrint("(mip-map)  %d\n(%d/%d)",
					vcount, reduct, amount);
		else
			KanjiFntPrint("(original) %d\n(%d/%d)",
					vcount, reduct, amount);
		KanjiFntFlush(-1);
	}
}

obj_interactive()
{
	SVECTOR v1;
	MATRIX  tmp1;

	static u_long oldpad = -1;

	if ((padd & PADRleft) > 0)
		PWorld.vz -= 5 * ONE / 360;
	if ((padd & PADRright) > 0)
		PWorld.vz += 5 * ONE / 360;

	if((padd & PADstart)>0){
		if(oldpad != padd) ismip = (ismip?0:1);
	}
	oldpad = padd;

	if ((padd & PADk) > 0) {
		PadStop();
		StopCallback();
		return 0;
	}

	/* オブジェクトのパラメータからマトリックスを計算し座標系にセット */
	set_coordinate(&PWorld, &DWorld);
	return 1;
}

init_all()
{
	u_long *dop;
	GsDOBJ2 *objp;	
	int     i;

	ResetGraph(0);	
	PadInit(0);	

	GsInitVcount();
	padd = 0;
	ismip = 0;

	GsInitGraph(320, 240, GsNONINTER | GsOFSGPU, 1, 0);
	GsDefDispBuff(0, 0, 0, 240);	
	GsInit3D();	

	Wot[0].length = OT_LENGTH;
	Wot[0].org = zsorttable[0];	

	Wot[1].length = OT_LENGTH;
	Wot[1].org = zsorttable[1];

	/*  座標定義 */
	GsInitCoordinate2(WORLD, &DWorld);
	PWorld.vx = 70*ONE/360; PWorld.vy = PWorld.vz = 0;
	DWorld.coord.t[2] = -400;

	/*  モデリングデータ読み込み */
	dop = (u_long *) MODEL_ADDR;
	dop++;
	GsMapModelingData(dop);
	dop++;
	Objnum = *dop;
	dop++; 
	for (i = 0; i < Objnum; i++)
		GsLinkObject4((u_long) dop, &object[i], i);
	for (i = 0, objp = object; i < Objnum; i++, objp++) {
		objp->coord2 = &DWorld;
		objp->attribute = 0;
	}

	/*  視点設定 */
	GsSetProjection(250);
	view.vpx = 0; view.vpy = 000; view.vpz = 400;
	view.vrx = 0; view.vry = 0; view.vrz = 0;
	view.rz = 0;
	view.super = WORLD;
	GsSetRefView2(&view);

	/*  平行光源設定 */
	pslt[0].vx = 0; pslt[0].vy = 0; pslt[0].vz = -100;
	pslt[0].r = 0xf0; pslt[0].g = 0xf0; pslt[0].b = 0xf0;
	GsSetFlatLight(0, &pslt[0]);

	pslt[1].vx = 0; pslt[1].vy = 100; pslt[1].vz = -100;
	pslt[1].r = 0xf0; pslt[1].g = 0xf0; pslt[1].b = 0xf0;
	GsSetFlatLight(1, &pslt[1]);

	pslt[2].vx = 0; pslt[2].vy = 100; pslt[2].vz = 0;
	pslt[2].r = 0x60; pslt[2].g = 0x60; pslt[2].b = 0x60;
	GsSetFlatLight(2, &pslt[2]);

	GsSetAmbient(0, 0, 0);
	GsSetLightMode(0);

	/* テクスチャデータの読み込み */
	texture_init(TEX_ADDR);
	texture_init(TEX_ADDR1);

	/* デバッグプリントの準備 */
	KanjiFntOpen(-120,-100,256,200,896,0,768,256,0,512);
}

set_coordinate(pos, coor)
	SVECTOR *pos;		/* ローテションベクタ */
	GsCOORDINATE2 *coor;	/* 座標系 */
{
	MATRIX  tmp1;

	/* 平行移動をセットする */
	tmp1.t[0] = coor->coord.t[0];
	tmp1.t[1] = coor->coord.t[1];
	tmp1.t[2] = coor->coord.t[2];

	/* マトリックスにローテーションベクタを作用させる */
	RotMatrix(pos, &tmp1);

	/* 求めたマトリックスを座標系にセットする */
	coor->coord = tmp1;

	/* マトリックスキャッシュをフラッシュする */
	coor->flg = 0;
}

texture_init(addr)
	u_long  addr;
{
	RECT    rect1;
	GsIMAGE tim1;

	GsGetTimInfo((u_long *) (addr + 4), &tim1);

	rect1.x = tim1.px;	rect1.y = tim1.py;
	rect1.w = tim1.pw; rect1.h = tim1.ph;

	LoadImage(&rect1, tim1.pixel);

	if ((tim1.pmode >> 3) & 0x01) {
		rect1.x = tim1.cx; rect1.y = tim1.cy;
		rect1.w = tim1.cw; rect1.h = tim1.ch;	

		LoadImage(&rect1, tim1.clut);
	}
}

typedef struct {
	u_long *org;	/* GsOT.org */
	long otz;		/* gte otz */
	long opz;		/* gte opz */
	long flg;		/* gte flag */
	u_long *tag;	/* pointer for addPrim */
	int shift;		/* GsOT.shift */
} WORK_VAL;

/* POLY_FT4 handler */
PACKET *TMDfastTF4L(op, vp, np, pk, n, shift, ot, scratch)
	TMD_P_TF4 *op;
	VERT   *vp, *np;
	PACKET *pk;
	int     n, shift;
	GsOT   *ot;
	u_long *scratch;
{
	register WORK_VAL *ifo;
	register POLY_FT4 *si;
	register int i, j;

	/* parameters write to scratch pad (initilaize) */
	ifo = (WORK_VAL *) scratch;
	ifo->org = (u_long *) ot->org;
	ifo->shift = shift;
	si = (POLY_FT4 *) pk;
	setPolyFT4(si);
	setRGB0(si,0x80,0x80,0x80);
	gte_ldrgb(&si->r0);

	for (i = 0; i < n; i++, op++) {
		gte_ldv3(&vp[op->v0], &vp[op->v1], &vp[op->v2]);
		gte_rtpt(); /* RotTransPers3 */
		*(u_long *)&si->u0 = *(u_long *)&op->tu0;
		*(u_long *)&si->u1 = *(u_long *)&op->tu1;
		gte_stflg(&ifo->flg);
		if (ifo->flg & 0x80000000)
				continue;
		gte_nclip(); /* NormapClip */
		*(u_long *)&si->u2 = *(u_long *)&op->tu2;
		*(u_long *)&si->u3 = *(u_long *)&op->tu3;
		gte_stopz(&ifo->opz);
		if (ifo->opz <= 0) /* backface clip */
			continue;

		gte_stsxy3_ft4((u_long *) si);
		gte_ldv0(&vp[op->v3]);
		gte_rtps(); /* RotTransPers */
		gte_stflg(&ifo->flg);
		if(ifo->flg & 0x80000000)
			continue;
		gte_stsxy((u_long *)&si->x3);

		if(ismip){ /* mip-mapping */
			if(ifo->opz < 64){ /* 1/16-  */
				*(u_short *)&si->u0 =
					((*(short *)&si->u0)&0xf8f8) >> 3;
				*(u_short *)&si->u1 =
					((*(short *)&si->u1)&0xf8f8) >> 3;
				*(u_short *)&si->u2 =
					((*(short *)&si->u2)&0xf8f8) >> 3;
				*(u_short *)&si->u3 =
					((*(short *)&si->u3)&0xf8f8) >> 3;
			}else
			if(ifo->opz < 256){ /* 1/4-1/16 */
				*(u_short *)&si->u0 =
					((*(short *)&si->u0)&0xfcfc) >> 2;
				*(u_short *)&si->u1 =
					((*(short *)&si->u1)&0xfcfc) >> 2;
				*(u_short *)&si->u2 =
					((*(short *)&si->u2)&0xfcfc) >> 2;
				*(u_short *)&si->u3 =
					((*(short *)&si->u3)&0xfcfc) >> 2;
			}else
			if(ifo->opz < 1024){ /* 1-1/4 */
				*(u_short *)&si->u0 =
					((*(short *)&si->u0)&0xfefe) >> 1;
				*(u_short *)&si->u1 =
					((*(short *)&si->u1)&0xfefe) >> 1;
				*(u_short *)&si->u2 =
					((*(short *)&si->u2)&0xfefe) >> 1;
				*(u_short *)&si->u3 =
					((*(short *)&si->u3)&0xfefe) >> 1;
			}
		}

		gte_avsz4();
		gte_stotz(&ifo->otz);

		gte_ldv0(&np[op->n0]);
		gte_nccs(); /* NormalColorCol */

		ifo->tag = (u_long *) (ifo->org + (ifo->otz >> ifo->shift));
		*(u_long *) si = (*ifo->tag & 0x00ffffff) | 0x09000000;
		*ifo->tag = (u_long) si & 0x00ffffff;
		gte_strgb((u_long *)&si->r0);

		si++;
	}
	return (PACKET *) si;
}

SortTMDobject(objp, otp, shift)
	GsDOBJ2 *objp;
	GsOT   *otp;
	int     shift;
{
	u_long *vertop, *nortop, *primtop, primn;
	int     code;		/* polygon type */
	int		light_mode;

	/* get various informations from TMD foramt */
	vertop = ((struct TMD_STRUCT *) (objp->tmd))->vertop;
	nortop = ((struct TMD_STRUCT *) (objp->tmd))->nortop;
	primtop = ((struct TMD_STRUCT *) (objp->tmd))->primtop;
	primn = ((struct TMD_STRUCT *) (objp->tmd))->primn;

	/* primn > 0 then loop (making packets) */
	while (primn) {
		code = ((*primtop) >> 24 & 0xfd);	/* pure polygon type */
		switch (code) {
			case GPU_COM_TF4:
				GsOUT_PACKET_P = (PACKET *) TMDfastTF4L
					((TMD_P_TG4 *)primtop,(VERT *)vertop,
					(VERT *)nortop,GsOUT_PACKET_P,
					*((u_short *) primtop),shift,otp,
					getScratchAddr(0));
				primn -= *((u_short *) primtop);
				primtop += sizeof(TMD_P_TF4)/4 * *((u_short *)primtop);
				break;
			default:
				printf("This program supports only flat textured quad polygon.\n");
				printf("<%x,%x>\n", code, GPU_COM_TF4);
				break;
		}
	}
}
