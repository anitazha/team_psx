/*				
 *		Sample program for inline function
 *
 *		Copyright (C) 1995 by Sony Computer Entertainment
 *			All rights Reserved
 */
#include <sys/types.h>
#include <kernel.h>
#include <libetc.h>
#include <libgte.h>
#include <libgpu.h>
#include <inline.h>
#include <gtemac.h>

#define SCR_Z	(512)			/* screen depth (h) */
#define	OTSIZE		(1024)		/* ordering table size */
#define OTLENGTH	10
#define CUBESIZ	196			/* cube size */
#define ONE3	2364			/* ONE/sqrt(3) */
#define CODE_G3	(0x30)			/* G3 GPU code */

#define copySVECTOR(sv0,sv1)	(*(long*)&(sv0)->vx = *(long*)&(sv1)->vx), \
				(*(long*)&(sv0)->vz = *(long*)&(sv1)->vz)


typedef struct {		
	CVECTOR c;		/*  Color 	*/
	DVECTOR sxy;		/*  2D Vertex 	*/
} OUTVC;

typedef struct {		
	long otz,flag;		/* output */
	long near_clip,far_clip,clip_off;	/* input */
} ETCOF;

typedef struct {		
	DRAWENV		draw;			/* drawing environment */
	DISPENV		disp;			/* display environment */
	u_long		ot[OTSIZE];		/* ordering table */
	POLY_G3		s[6][2];			/* cube surface */
} DB;

static MATRIX	LLM = {
	-ONE3,-ONE3,-ONE3,
	-ONE3,ONE3,-ONE3,
	-ONE3,-ONE3,ONE3
};

static MATRIX	LCM = {
	ONE,0,0,
	0,ONE,0,
	0,0,ONE
};

static VECTOR	BK = {
	0x40,0x40,0x40
};

static VECTOR	FC = {
	60,120,120
};

ETCOF	etc;
/*
 *	
 *	Simple Cube Handler
 */	
static SVECTOR P0 = {-CUBESIZ/2,-CUBESIZ/2,-CUBESIZ/2,0};
static SVECTOR P1 = { CUBESIZ/2,-CUBESIZ/2,-CUBESIZ/2,0};
static SVECTOR P2 = { CUBESIZ/2, CUBESIZ/2,-CUBESIZ/2,0};
static SVECTOR P3 = {-CUBESIZ/2, CUBESIZ/2,-CUBESIZ/2,0};

static SVECTOR P4 = {-CUBESIZ/2,-CUBESIZ/2, CUBESIZ/2,0};
static SVECTOR P5 = { CUBESIZ/2,-CUBESIZ/2, CUBESIZ/2,0};
static SVECTOR P6 = { CUBESIZ/2, CUBESIZ/2, CUBESIZ/2,0};
static SVECTOR P7 = {-CUBESIZ/2, CUBESIZ/2, CUBESIZ/2,0};

static SVECTOR	*v[12*3] = {
	&P0,&P1,&P2,
	&P0,&P2,&P3,

	&P1,&P5,&P6,
	&P1,&P6,&P2,

	&P5,&P4,&P7,
	&P5,&P7,&P6,

	&P4,&P0,&P3,
	&P4,&P3,&P7,

	&P4,&P5,&P1,
	&P4,&P1,&P0,

	&P6,&P7,&P3,
	&P6,&P3,&P2
};

static	SVECTOR N0 = { -ONE3, -ONE3, -ONE3};
static	SVECTOR N1 = {  ONE3, -ONE3, -ONE3};
static	SVECTOR N2 = {  ONE3,  ONE3, -ONE3};
static	SVECTOR N3 = { -ONE3,  ONE3, -ONE3};

static	SVECTOR N4 = { -ONE3, -ONE3,  ONE3};
static	SVECTOR N5 = {  ONE3, -ONE3,  ONE3};
static	SVECTOR N6 = {  ONE3,  ONE3,  ONE3};
static	SVECTOR N7 = { -ONE3,  ONE3,  ONE3};

static SVECTOR	*n[12*3] = {
	&N0,&N1,&N2,
	&N0,&N2,&N3,

	&N1,&N5,&N6,
	&N1,&N6,&N2,

	&N5,&N4,&N7,
	&N5,&N7,&N6,

	&N4,&N0,&N3,
	&N4,&N3,&N7,

	&N4,&N5,&N1,
	&N4,&N1,&N0,

	&N6,&N7,&N3,
	&N6,&N3,&N2
};
	

main()
{
	DB		db[2];		/* packet double buffer */
	DB		*cdb;		/* current db */
	MATRIX		rottrans;	/* rot-trans matrix */
	int		i;		/* work */
	int		dmy, flg;	/* dummy */
	CVECTOR		col[12];	/* cube color */
	u_long		cnt;

	etc.near_clip=500;
	etc.far_clip=5000;
	etc.clip_off=0;
	
	PadInit(0);             /* initialize PAD */
	ResetGraph(0);		/* reset graphic subsystem (0:cold,1:warm) */
	SetGraphDebug(0);	/* set debug mode (0:off, 1:monitor, 2:dump) */
	
	InitGeom();			/* initialize geometry subsystem */
	SetGeomOffset(320, 240);	/* set geometry origin as (160, 120) */
	SetGeomScreen(SCR_Z);		/* distance to viewing-screen */

	SetLightMatrix(&LLM);
	SetColorMatrix(&LCM);
	SetBackColor(BK.vx,BK.vy,BK.vz);
	SetFarColor(FC.vx,FC.vy,FC.vz);
	SetFogNear(1*SCR_Z,SCR_Z);
	
	/* initialize environment for double buffer (interlace)
	 *	buffer ID	VRAM address 
	 *-------------------------------------------------------
	 *	buffer #0	(0,  0)-(640,480)
	 *	buffer #1	(0,  0)-(640,480)
	 */
	SetDefDrawEnv(&db[0].draw, 0, 0, 640, 480);	
	SetDefDrawEnv(&db[1].draw, 0, 0, 640, 480);	
	SetDefDispEnv(&db[0].disp, 0, 0, 640, 480);	
	SetDefDispEnv(&db[1].disp, 0, 0, 640, 480);
	
	FntLoad(960,256);
	SetDumpFnt(FntOpen(64,64,256,200,0,512));
	SetRCnt(RCntCNT2,0xffff,RCntMdNOINTR|RCntMdFR);
	StartRCnt(RCntCNT2);

	/* set surface colors */
	for (i = 0; i < 12; i+=2) {
		col[i].r = col[i+1].r = 0xff/*rand()*/;	/* R */
		col[i].g = col[i+1].g = 0xff/*rand()*/;	/* G */
		col[i].b = col[i+1].b = 0xff/*rand()*/;	/* B */
		col[i].cd = col[i+1].cd = CODE_G3;	/* cd */
	}
	
	init_prim(&db[0]);	/* set primitive parameters on buffer #0 */
	init_prim(&db[1]);	/* set primitive parameters on buffer #1 */
	
	SetDispMask(1);		/* enable to display (0:inhibit, 1:enable) */
	
	while (pad_read(&rottrans) == 0) {
		cdb = (cdb==db)? db+1: db;	/* swap double buffer ID */
		ClearOTagR(cdb->ot, OTSIZE);	/* clear ordering table */

		/* add cube */
		ResetRCnt(RCntCNT2);

		add_cube(cdb->ot, cdb->s, v, n, col);

		cnt= GetRCnt(RCntCNT2);
		FntPrint("cnt=%d\n",cnt);
		
		/* swap buffer */
		DrawSync(0);	/* wait for end of drawing */
		VSync(0);	/* wait for the next V-BLNK */
	
		PutDrawEnv(&cdb->draw); /* update drawing environment */
		PutDispEnv(&cdb->disp); /* update display environment */

		DrawOTag(cdb->ot+OTSIZE-1);	/* draw */
		FntFlush(-1);
	}
        PadStop();
        exit();
}

static pad_read(rottrans)
MATRIX	*rottrans;		/* rot-trans matrix, light matrix */
{
	static SVECTOR	ang  = { 0, 0, 0};	/* rotate angle */
	static VECTOR	vec  = {0, 0, 2*SCR_Z};	/* rottranslate vector */
	MATRIX	llm;				/* Local Light Matrix */

	int	ret = 0;	
	u_long	padd = PadRead(1);
	
	/* rotate light source and cube */
	if (padd & PADRup)	ang.vz += 32;
	if (padd & PADRdown)	ang.vz -= 32;
	if (padd & PADRleft) 	ang.vy += 32;
	if (padd & PADRright)	ang.vy -= 32;

	/* change distance */
	if (padd & PADl)	vec.vz += 32;
	if (padd & PADn) 	vec.vz -= 32;
	if (padd & PADk) 	ret = -1;

	/* make matrix */
	RotMatrix(&ang, rottrans);	/* make rot-trans matrix */
	TransMatrix(rottrans, &vec);	

	/*set Local Light Matrix*/
	MulMatrix0(&LLM,rottrans,&llm);	/*destroy Rot Matrix*/
	SetLightMatrix(&llm);

	/* set Rotation Transfer Matrix */
	SetRotMatrix(rottrans);
	SetTransMatrix(rottrans);

	return(ret);
}		

/*
 *	initialize primitive parameters
 */
static init_prim(db)
DB	*db;
{
	int	i;
	
	db->draw.isbg = 1;
	setRGB0(&db->draw, 60, 120, 120);	/* (r,g,b) = (60,120,120) */

	for (i = 0; i < 6; i++) {
		SetPolyG3(&db->s[i][0]);
		SetPolyG3(&db->s[i][1]);
	}
}


add_cube(ot, s, vp, np, col)
u_long	*ot;
POLY_G3	*s;
SVECTOR	**vp;
SVECTOR **np;
CVECTOR *col;
{
	int	i;

	struct wk {
		u_long	*ot;
		POLY_G3	*s;
		long	otz, flg, clip;
		CVECTOR *c;		
	} *wk;

	wk = (struct wk *)getScratchAddr(0);
	wk->c = col; 
	wk->ot = ot; 
	for (i=0; i<12; i++,s++,vp+=3,np+=3) {

		wk->clip = RotAverageNclipColorCol3(
			vp[0], vp[1], vp[2],
			np[0], np[1], np[2],
			&(wk->c[i]),
			(long *)&s->x0,(long *)&s->x1,(long *)&s->x2,
			(CVECTOR *)&s->r0,(CVECTOR *)&s->r1,(CVECTOR *)&s->r2,
			&wk->otz,&wk->flg);

		if (wk->clip <=0)  continue; 

		if((wk->flg & 0x80000000)==0){ 	
			wk->otz >>= (14-OTLENGTH);
			addPrim( wk->ot + OTSIZE - wk->otz, s);
		}

	}
}
