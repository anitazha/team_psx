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
#define CUBESIZ	8192			/* cube size */
#define ONE3	2364			/* ONE/sqrt(3) */
#define CODE_G3	(0x30)			/* G3 GPU code */
#define MAXDIV	256			/* divide max */

#define SetSpadStack(addr) {\
        __asm__ volatile ("move $8,%0"     ::"r"(addr):"$8","memory"); \
        __asm__ volatile ("sw $29,0($8)"   ::         :"$8","memory"); \
        __asm__ volatile ("addiu $8,$8,-4" ::         :"$8","memory"); \
        __asm__ volatile ("move $29,$8"    ::         :"$8","memory"); \
    }
    
#define ResetSpadStack() {\
        __asm__ volatile ("addiu $29,$29,4":::"$29","memory"); \
        __asm__ volatile ("lw $29,0($29)"  :::"$29","memory"); \
    }

#define copySVECTOR(sv0,sv1)	(*(long*)&(sv0)->vx = *(long*)&(sv1)->vx), \
				(*(long*)&(sv0)->vz = *(long*)&(sv1)->vz)

void tridivr();
POLY_G3	*tridiv( u_long *ot, POLY_G3 *s, 
		  SVECTOR *v0, SVECTOR *v1, SVECTOR *v2,
		  CVECTOR *c0, CVECTOR *c1, CVECTOR *c2,
		  long n);

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
	POLY_G3		s[6][2*MAXDIV];		/* cube surface */
} DB;

static MATRIX	LLM = {
	-ONE3,-ONE3,-ONE3,
	-ONE3, ONE3,-ONE3,
	-ONE3,-ONE3, ONE3
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

pad_read(rottrans)
MATRIX	*rottrans;		/* rot-trans matrix, light matrix */
{
	static SVECTOR	ang  = { 0, 0, 0};	/* rotate angle */
	static VECTOR	vec  = {0, 0, 48*SCR_Z};	/* rottranslate vector */
	MATRIX	llm;				/* Local Light Matrix */

	int	ret = 0;	
	u_long	padd = PadRead(1);
	
	/* rotate light source and cube */
	if (padd & PADRup)	ang.vz += 64;
	if (padd & PADRdown)	ang.vz -= 64;
	if (padd & PADRleft) 	ang.vy += 64;
	if (padd & PADRright)	ang.vy -= 64;

	/* change distance */
	if (padd & PADl)	vec.vz += 128;
	if (padd & PADn) 	vec.vz -= 128;
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
init_prim(db)
DB	*db;
{
	int	i,j;
	
	db->draw.isbg = 1;
	setRGB0(&db->draw, 60, 120, 120);	/* (r,g,b) = (60,120,120) */

	for (i = 0; i < 6; i++) {
		for (j = 0; j < MAXDIV*2; j++) {
			SetPolyG3(&db->s[i][j]);
		}
	}
}

typedef struct {		
		SVECTOR *v0,*v1,*v2;
		CVECTOR *c0,*c1,*c2;
		SVECTOR v01,v12,v20;
		CVECTOR c01,c12,c20;
} RLEV;

typedef struct {		
	u_long	*ot;
	POLY_G3	*s;
	long n,lev;
	long	p, otz, flg, clip;
	RLEV lv[5];
} RWORK;

add_cube(ot, s, vp, np, c)
u_long	*ot;
POLY_G3	*s;
SVECTOR	**vp;
SVECTOR **np;
CVECTOR *c;
{
	int	i;
	CVECTOR c0,c1,c2;	
	for (i=0; i<12; i++, vp+=3,np+=3,c++) {
		NormalColorCol3( np[0], np[1], np[2], c, &c0,&c1,&c2);
		{
 			RWORK *r;
 			RLEV *l;
			r = (RWORK *)getScratchAddr(0);
			r->ot = ot; r->s = s;   

			r->lev = 0; l = &(r->lv[0]);
			l->v0= vp[0]; l->v1= vp[1]; l->v2= vp[2];
			l->c0= &c0; l->c1= &c1; l->c2= &c2;
			r->n = 3;
			SetSpadStack(0x1f8003fc);
			tridivr();
			ResetSpadStack();
			s = r->s;	
		}
	}
}

void tridivr()
{
register RWORK *r;
register RLEV *l;

	r = (RWORK *)getScratchAddr(0);
	l = &(r->lv[r->lev]);

	if(r->n == r->lev){
		gte_ldv3(l->v0,l->v1,l->v2);
		gte_rtpt();
		gte_stflg(&r->flg);
		gte_nclip();
		gte_stopz(&r->clip);
		if (r->clip <=0)  return; 
		if((r->flg & 0x80000000)==0){ 	
			gte_stsxy3((long *)&r->s->x0,(long *)&r->s->x1,(long *)&r->s->x2); 
			gte_avsz3();
			*(CVECTOR *)&r->s->r0= *l->c0; 
			*(CVECTOR *)&r->s->r1= *l->c1;
			*(CVECTOR *)&r->s->r2= *l->c2;
			gte_stotz(&r->otz);
			r->otz >>= (14-OTLENGTH);
			addPrim( r->ot + OTSIZE - r->otz, r->s);
			(r->s)++;
		}
	}
	else{
		l->v01.vx = (l->v0->vx+l->v1->vx)/2; 
		l->v01.vy = (l->v0->vy+l->v1->vy)/2; 
		l->v01.vz = (l->v0->vz+l->v1->vz)/2;
		l->v12.vx = (l->v1->vx+l->v2->vx)/2; 
		l->v12.vy = (l->v1->vy+l->v2->vy)/2; 
		l->v12.vz = (l->v1->vz+l->v2->vz)/2;
		l->v20.vx = (l->v2->vx+l->v0->vx)/2; 
		l->v20.vy = (l->v2->vy+l->v0->vy)/2; 
		l->v20.vz = (l->v2->vz+l->v0->vz)/2;
		l->c01.r = (l->c0->r+l->c1->r)/2; 
		l->c01.g = (l->c0->g+l->c1->g)/2; 
		l->c01.b = (l->c0->b+l->c1->b)/2; 
		l->c12.r = (l->c1->r+l->c2->r)/2; 
		l->c12.g = (l->c1->g+l->c2->g)/2; 
		l->c12.b = (l->c1->b+l->c2->b)/2; 
		l->c20.r = (l->c2->r+l->c0->r)/2; 
		l->c20.g = (l->c2->g+l->c0->g)/2; 
		l->c20.b = (l->c2->b+l->c0->b)/2; 
		l->c01.cd = l->c0->cd; l->c12.cd = l->c0->cd; l->c20.cd = l->c0->cd;
		r->lev++; 
		(l+1)->v0 = l->v0; (l+1)->v1 = &l->v01; (l+1)->v2 = &l->v20;
		(l+1)->c0 = l->c0; (l+1)->c1 = &l->c01; (l+1)->c2 = &l->c20;
		tridivr();
		(l+1)->v0 = &l->v01; (l+1)->v1 = l->v1; (l+1)->v2 = &l->v12;
		(l+1)->c0 = &l->c01; (l+1)->c1 = l->c1; (l+1)->c2 = &l->c12;
		tridivr();
		(l+1)->v0 = &l->v20; (l+1)->v1 = &l->v12; (l+1)->v2 = l->v2;
		(l+1)->c0 = &l->c20; (l+1)->c1 = &l->c12; (l+1)->c2 = l->c2;
		tridivr();
		(l+1)->v0 = &l->v01; (l+1)->v1 = &l->v12; (l+1)->v2 = &l->v20;
		(l+1)->c0 = &l->c01; (l+1)->c1 = &l->c12; (l+1)->c2 = &l->c20;
		tridivr();
		r->lev--; 
	}			
}

void tridivrx()
{
register RWORK *r;
register RLEV *l;

	r = (RWORK *)getScratchAddr(0);
	l = &(r->lv[r->lev]);

	if(r->n == r->lev){
		gte_RotAverageNclip3(
			l->v0,l->v1,l->v2,
			(long *)&r->s->x0,(long *)&r->s->x1,(long *)&r->s->x2,
			&r->p, &r->otz, &r->flg, &r->clip);

		if (r->clip <=0)  return; 
		if((r->flg & 0x80000000)==0){ 	

			*(CVECTOR *)&r->s->r0= *l->c0; 
			*(CVECTOR *)&r->s->r1= *l->c1; 
			*(CVECTOR *)&r->s->r2= *l->c2;
			gte_stotz(&r->otz);
			r->otz >>= (14-OTLENGTH);
			addPrim( r->ot + OTSIZE - r->otz, r->s);
			(r->s)++;
		}
	}
	else{
		l->v01.vx = (l->v0->vx+l->v1->vx)/2; 
		l->v01.vy = (l->v0->vy+l->v1->vy)/2; 
		l->v01.vz = (l->v0->vz+l->v1->vz)/2;
		l->v12.vx = (l->v1->vx+l->v2->vx)/2; 
		l->v12.vy = (l->v1->vy+l->v2->vy)/2; 
		l->v12.vz = (l->v1->vz+l->v2->vz)/2;
		l->v20.vx = (l->v2->vx+l->v0->vx)/2; 
		l->v20.vy = (l->v2->vy+l->v0->vy)/2; 
		l->v20.vz = (l->v2->vz+l->v0->vz)/2;
		l->c01.r = (l->c0->r+l->c1->r)/2; 
		l->c01.g = (l->c0->g+l->c1->g)/2; 
		l->c01.b = (l->c0->b+l->c1->b)/2; 
		l->c12.r = (l->c1->r+l->c2->r)/2; 
		l->c12.g = (l->c1->g+l->c2->g)/2; 
		l->c12.b = (l->c1->b+l->c2->b)/2; 
		l->c20.r = (l->c2->r+l->c0->r)/2; 
		l->c20.g = (l->c2->g+l->c0->g)/2; 
		l->c20.b = (l->c2->b+l->c0->b)/2; 
		l->c01.cd = l->c0->cd; l->c12.cd = l->c0->cd; l->c20.cd = l->c0->cd;
		r->lev++; 
		(l+1)->v0 = l->v0; (l+1)->v1 = &l->v01; (l+1)->v2 = &l->v20;
		(l+1)->c0 = l->c0; (l+1)->c1 = &l->c01; (l+1)->c2 = &l->c20;
		tridivr();
		(l+1)->v0 = &l->v01; (l+1)->v1 = l->v1; (l+1)->v2 = &l->v12;
		(l+1)->c0 = &l->c01; (l+1)->c1 = l->c1; (l+1)->c2 = &l->c12;
		tridivr();
		(l+1)->v0 = &l->v20; (l+1)->v1 = &l->v12; (l+1)->v2 = l->v2;
		(l+1)->c0 = &l->c20; (l+1)->c1 = &l->c12; (l+1)->c2 = l->c2;
		tridivr();
		(l+1)->v0 = &l->v01; (l+1)->v1 = &l->v12; (l+1)->v2 = &l->v20;
		(l+1)->c0 = &l->c01; (l+1)->c1 = &l->c12; (l+1)->c2 = &l->c20;
		tridivr();
		r->lev--; 
	}			
}

POLY_G3	*tridiv(ot, s, v0, v1, v2, c0, c1, c2, n)
u_long	*ot;
POLY_G3	*s;
SVECTOR	*v0,*v1,*v2;
CVECTOR *c0,*c1,*c2;
long n;
{
	long	p, otz, flg, clip;
	if(n==0){
			
		gte_RotAverageNclip3( v0, v1, v2,
			(long *)&s->x0,(long *)&s->x1,(long *)&s->x2,
			&p, &otz, &flg, &clip);
		if (clip <=0)  return(s); 
		if((flg & 0x80000000)==0){ 	
			*(CVECTOR *)&s->r0= *c0; 
			*(CVECTOR *)&s->r1= *c1; 
			*(CVECTOR *)&s->r2= *c2;
			otz >>= (14-OTLENGTH);
			addPrim( ot + OTSIZE - otz, s);
			s++;
		}
	}
	else{
		SVECTOR v01,v12,v20;
		CVECTOR c01,c12,c20;
		v01.vx = (v0->vx+v1->vx)/2; 
		v01.vy = (v0->vy+v1->vy)/2; 
		v01.vz = (v0->vz+v1->vz)/2;
		v12.vx = (v1->vx+v2->vx)/2; 
		v12.vy = (v1->vy+v2->vy)/2; 
		v12.vz = (v1->vz+v2->vz)/2;
		v20.vx = (v2->vx+v0->vx)/2; 
		v20.vy = (v2->vy+v0->vy)/2; 
		v20.vz = (v2->vz+v0->vz)/2;
		c01.r = (c0->r+c1->r)/2; 
		c01.g = (c0->g+c1->g)/2; 
		c01.b = (c0->b+c1->b)/2; 
		c12.r = (c1->r+c2->r)/2; 
		c12.g = (c1->g+c2->g)/2; 
		c12.b = (c1->b+c2->b)/2; 
		c20.r = (c2->r+c0->r)/2; 
		c20.g = (c2->g+c0->g)/2; 
		c20.b = (c2->b+c0->b)/2; 
		c01.cd = c0->cd; c12.cd = c0->cd; c20.cd = c0->cd;
		s=tridiv(ot, s, v0, &v01, &v20, c0, &c01, &c20, n-1);
		s=tridiv(ot, s, &v01, v1, &v12, &c01, c1, &c12, n-1);
		s=tridiv(ot, s, &v20, &v12, v2, &c20, &c12, c2, n-1);
		s=tridiv(ot, s, &v01, &v12, &v20, &c01, &c12, &c20, n-1); 
	}			
	return(s);
}



add_cubex(ot, s, vp, np, c)
u_long	*ot;
POLY_G3	*s;
SVECTOR	**vp;
SVECTOR **np;
CVECTOR *c;
{
	int	i;
	CVECTOR c0,c1,c2;	
	for (i=0; i<12; i++, vp+=3,np+=3,c++) {
		NormalColorCol3( np[0], np[1], np[2], c, &c0,&c1,&c2);
		s = tridiv(ot, s, vp[0],vp[1],vp[2], &c0,&c1,&c2, 3);
	}
}
