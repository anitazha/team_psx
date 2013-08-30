/*
 * File:cman4.c
 * memory card manager Ver. 4.0    950714A
 * with 'balls'
*/

#include <r3000.h>
#include <asm.h>
#include <kernel.h>
#include <sys/file.h>
#include <sys/types.h>
#include <libgte.h>
#include <libgpu.h>
#include <libetc.h>

#define XMAX 320-16
#define YMAX 240-16
#define XMIN 0
#define YMIN 0

char *version = "Ver. 4.0  950714A";

#define MyEvSpREADY 0x1000
#define MyEvSpNEW   0x2000
#define MyEvSpUNF   0x4000
long cs_switch;

/*
 * Kanji Printf
 */
#define KANJI

/*
 * Primitive Buffer
 */
#define OTSIZE		16			/* size of ordering table */
#define MAXOBJ		1			/* max sprite number */
typedef struct {		
	DRAWENV		draw;			/* drawing environment */
	DISPENV		disp;			/* display environment */
	u_long		ot[OTSIZE];		/* ordering table */
	SPRT_16		sprt[MAXOBJ];		/* 16x16 fixed-size sprite */
} DB;

DB	db[2];		/* double buffer */
DB	*cdb;		/* current double buffer */

/*
 * Limitations
 */
#define	FRAME_X		320		/* frame size (320x240) */
#define	FRAME_Y		240
#define WALL_X		(FRAME_X-16)	/* reflection point */
#define WALL_Y		(FRAME_Y-16)

static void init_prim(DB *db);	/* preset unchanged primitive members */
static int  pad_read(int *x, int *y);	/* parse controller */
static int  cbvsync(void);	/* callback for VSync */

main()
{
	char	s[128];		/* strings to print */
	int	nobj = 1;	/* object number */
	u_long	*ot;		/* current OT */
	SPRT_16	*sp;		/* work */
	int	i, cnt, dx, x, y;	/* work */
	long ex00,ex01,ex10,ex11,ex02,ex12;

	dx = 2;

#ifdef READY
	ex00 = OpenEvent(DescUEV|0x0001, MyEvSpREADY|0x00, EvMdNOINTR, NULL); 
	ex10 = OpenEvent(DescUEV|0x0001, MyEvSpREADY|0x10, EvMdNOINTR, NULL); 
	EnableEvent(ex00);
	EnableEvent(ex01);
#endif /* READY */
	ex01 = OpenEvent(DescUEV|0x0001, MyEvSpNEW|0x00, EvMdNOINTR, NULL); 
	ex11 = OpenEvent(DescUEV|0x0001, MyEvSpNEW|0x10, EvMdNOINTR, NULL); 
	EnableEvent(ex01);
	EnableEvent(ex11);
#ifdef UNF
	ex02 = OpenEvent(DescUEV|0x0001, MyEvSpUNF|0x00, EvMdNOINTR, NULL);
	ex12 = OpenEvent(DescUEV|0x0001, MyEvSpUNF|0x10, EvMdNOINTR, NULL);
	EnableEvent(ex02);
	EnableEvent(ex12);
#endif /* UNF */
	
	CsInit();
	cs_switch = 1;

	ResetGraph(0);		/* reset graphic subsystem (0:cold,1:warm) */
	SetGraphDebug(0);	/* set debug mode (0:off, 1:monitor, 2:dump) */
	VSyncCallback(cbvsync);	/* set callback */
		
	/* initialize environment for double buffer */
	SetDefDrawEnv(&db[0].draw, 0,   0, 320, 240);
	SetDefDrawEnv(&db[1].draw, 0, 240, 320, 240);
	SetDefDispEnv(&db[0].disp, 0, 240, 320, 240);
	SetDefDispEnv(&db[1].disp, 0,   0, 320, 240);

	/* init font environment */
#ifdef KANJI	/* KANJI */	
	KanjiFntOpen(160, 16, 256, 200, 704, 0, 768, 256, 0, 512);
#endif	
	FntLoad(960, 256);		/* load basic font pattern */
	SetDumpFnt(FntOpen(16, 16, 256, 200, 0, 512));

	init_prim(&db[0]);		/* initialize primitive buffers #0 */
	init_prim(&db[1]);		/* initialize primitive buffers #1 */

	x = (XMAX-XMIN)/2;
	y = (YMAX-YMIN)/2;

	/* display */
	SetDispMask(1);		/* enable to display (0:inhibit, 1:enable) */

	while (pad_read(&x,&y)!=-1) {
		cdb  = (cdb==db)? db+1: db;	/* swap double buffer ID */

 		/* clear ordering table */
		ClearOTag(cdb->ot, OTSIZE);	

		if((x+=dx)>XMAX) {
			x=XMAX; dx *= -1;
		}
		else if(x<XMIN) {
			x=XMIN; dx *= -1;
		}

		/* update sprites */
		setXY0(cdb->sprt, x, y);	/* update vertex */
		AddPrim(cdb->ot, cdb->sprt);	/* apend to OT */

		DrawSync(0);		/* wait for end of drawing */
		cnt = VSync(0);		/* wait for V-BLNK (1/60) */

		PutDispEnv(&cdb->disp); /* update display environment */
		PutDrawEnv(&cdb->draw); /* update drawing environment */
		DrawOTag(cdb->ot);

		FntPrint("\n    MEMORY CARD MANAGER \n");
		FntPrint(  "    %s\n\n",version);
		if(cs_switch==1)
			FntPrint("    WATCHING NEW CARD \n\n");
		else
			FntPrint("\n\n");
		FntPrint("pos y = %d", y);
		FntPrint("    x = %d\n", x);

#ifdef READY
		if(TestEvent(ex00)==1) {
			FntPrint("READY    chan=0x00\n");
		}
		else {
			FntPrint("\n");
		}
		if(TestEvent(ex10)==1) {
			FntPrint("READY    chan=0x10\n");
		}
		else {
			FntPrint("\n");
		}
#endif /* READY */
		if(TestEvent(ex01)==1) {
			FntPrint("NEW      chan=0x00\n");
			detect_new(0x00);
			TestEvent(ex01);
		}
		else {
			FntPrint("\n");
		}
		if(TestEvent(ex11)==1) {
			FntPrint("NEW      chan=0x10\n");
			detect_new(0x10);
			TestEvent(ex11);
		}
		else {
			FntPrint("\n");
		}
#ifdef UNF
		if(TestEvent(ex02)==1) {
			FntPrint("UNFORMAT chan=0x00\n");
		}
		else {
			FntPrint("\n");
		}
		if(TestEvent(ex12)==1) {
			FntPrint("UNFORMAT chan=0x10\n");
		}
		else {
			FntPrint("\n");
		}
#endif /* UNF */
		FntFlush(-1);
	}
	PadStop();
	return(0);
}

/*
 * Initialize drawing Primitives
 */
#include "balltex.h"		/* from graphics sample program */

static void init_prim(DB *db)
{
	u_short	clut[32];		/* CLUT entry */
	SPRT_16	*sp;			/* work */
	int	i;			/* work */
	
	/* inititalize double buffer */
	db->draw.isbg = 1;
	setRGB0(&db->draw, 60, 120, 120);
	
	/* load texture pattern and CLUT */
	db->draw.tpage = LoadTPage(ball16x16, 0, 0, 640, 0, 16, 16);
	/*DumpTPage(db->draw.tpage);*/
	
	for (i = 0; i < 32; i++) {
		clut[i] = LoadClut(ballcolor[i], 0, 480+i);
		/*DumpClut(clut[i]);*/
	}
	
	/* init sprite */
	sp = db->sprt;
	SetSprt16(sp);			/* set SPRT_16 primitve ID */
	SetSemiTrans(sp, 0);		/* semi-amibient is OFF */
	SetShadeTex(sp, 1);		/* shading&texture is OFF */
	setUV0(sp, 0, 0);		/* texture point is (0,0) */
	sp->clut = clut[i%32];		/* set CLUT */
}	

/*
 * Read controll-pad
 */
static int pad_read(int *x, int *y)
{
	u_long	padd = _get_cont(0)&0xffff;

	if(padd==0xffff) 
		FntPrint("    NO KEY\n");
	else
		FntPrint("    PUSHED\n");
	
	if((padd & PADLdown)==0)	{ if((*y)<YMAX) (*y)++; }
	if((padd & PADLup)==0)	{ if((*y)>YMIN) (*y)--; }
	if((padd & PADLright)==0)	{ if((*x)<XMAX) (*x)++; }
	if((padd & PADLleft)==0)	{ if((*x)>XMIN) (*x)--; }
	
	if((padd & PADk)==0) 	return(-1);
	if((padd & PADh)==0) {	
		if(cs_switch==1)
			CsStop();
		else
			CsHotStart();
		cs_switch = 1 - cs_switch;
	}
	return(0);
}		

/*
 * callback
 */
static int cbvsync(void)
{
	/* print absolute VSync count */
	/*	FntPrint("V-BLNK(%d)\n", VSync(-1));	*/
}


_pre_draw()
{
	DrawSync(0);
	VSync(0);
	FntFlush(-1);
}


_draw()
{
	cdb = (cdb==db)?db+1:db;
	PutDrawEnv(&cdb->draw);
	PutDispEnv(&cdb->disp);
}


dir_file(drv,d)
char *drv;
struct DIRENTRY *d;
{
    long i;
    char key[128];

	extern struct DIRENTRY *firstfile(), *nextfile();

	strcpy(key,drv);
	strcat(key,"*");

    i = 0;
	if(firstfile(key, d)==d) {
                do {
                        i++;
			d++;
                } while(nextfile(d)==d);
        }
	return i;
}


GetPad()
{
	static old = 0xffff;
	long w;

	w = _get_cont(0);
	if(w!=old)
		return (old=w);
	return 0xffff;
}


detect_new(chan)
long chan;
{
	struct DIRENTRY d[15];
	char dir_name[6];
	long ret, i;

	strcpy(dir_name,"bu00:");
	if(chan==0x10) 
		dir_name[2] = '1';
	FntPrint("LISTING drive:%s",dir_name);
 	ret = dir_file(dir_name,&d[0]);

	if(ret==0)
		FntPrint("\n  NO FILE\n");
	else {
		FntPrint("\n  %d FILE(S)\n\n",ret);
		for(i=0;i<ret;i++) {
			FntPrint("  %2d:%s\n",i+1,d[i].name);
		}
	}
	FntPrint("\nPUSH ANY KEY");
	_pre_draw();
	_draw();
	while(GetPad()==0xffff);
	while(GetPad()!=0xffff);
	CsHotStart();	/* restart the server */
}


