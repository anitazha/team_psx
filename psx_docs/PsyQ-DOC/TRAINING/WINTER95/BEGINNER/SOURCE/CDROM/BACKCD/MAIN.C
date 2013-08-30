/*
 * $PSLibId: Runtime Library Versin 3.0$
 */
/*			balls: sample program
 *
 *		Copyright (C) 1993 by Sony Corporation
 *			All rights Reserved
 *
 *	 Version	Date		Design
 *	-----------------------------------------	
 *	1.00		Aug,31,1993	suzu
 *	2.00		Nov,17,1993	suzu	(using 'libgpu)
 *	3.00		Dec.27.1993	suzu	(rewrite)
 *	3.01		Dec.27.1993	suzu	(for newpad)
 *  3.02        Aug.31.1994 noda    (for KANJI)
 *  -.--        Jul.26.1995 femy    (for back cd)
 */

#include <sys/types.h>
#include <libetc.h>
#include <libgte.h>
#include <libgpu.h>

#ifdef BACKCD	/* BACKCD */
#include <libcd.h>
#include "backcd.h"
#endif			/* BACKCD */

/*
 * Kanji Printf
 */
#define KANJI

/*
 * Primitive Buffer
 */
#define OTSIZE		16			/* size of ordering table */
#define MAXOBJ		4000			/* max sprite number */
typedef struct {		
	DRAWENV		draw;			/* drawing environment */
	DISPENV		disp;			/* display environment */
	u_long		ot[OTSIZE];		/* ordering table */
	SPRT_16		sprt[MAXOBJ];		/* 16x16 fixed-size sprite */
} DB;

/*
 * Position Buffer
 */
typedef struct {		
	u_short x, y;			/* current point */
	u_short dx, dy;			/* verocity */
} POS;

/*
 * Limitations
 */
#define	FRAME_X		320		/* frame size (320x240) */
#define	FRAME_Y		240
#define WALL_X		(FRAME_X-16)	/* reflection point */
#define WALL_Y		(FRAME_Y-16)

static void init_prim(DB *db);	/* preset unchanged primitive members */
static int  pad_read(int n);	/* parse controller */
static int  cbvsync(void);	/* callback for VSync */
static int  init_point(POS *pos);/* initialize position table */

main()
{
	POS	pos[MAXOBJ];
	DB	db[2];		/* double buffer */
	DB	*cdb;		/* current double buffer */
	char	s[128];		/* strings to print */
	int	nobj = 1;	/* object number */
	u_long	*ot;		/* current OT */
	SPRT_16	*sp;		/* work */
	POS	*pp;		/* work */
	int	i, cnt, x, y;	/* work */
#ifdef BACKCD	/* BACKCD */
	int	j = 0;
#endif			/* BACKCD */
	
	ResetCallback();
#ifdef BACKCD	/* BACKCD */
	CdInit();
	set_back_cd_read(0, "\\PSX.EXE;1", (void *)0x80100000);
#endif			/* BACKCD */
	PadInit(0);		/* reset PAD */
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
	init_point(pos);		/* set initial geometries */

	/* display */
	SetDispMask(1);		/* enable to display (0:inhibit, 1:enable) */

	while ((nobj = pad_read(nobj)) > 0) {
		cdb  = (cdb==db)? db+1: db;	/* swap double buffer ID */

		/* dump DB environment */
		/*DumpDrawEnv(&cdb->draw);*/
		/*DumpDispEnv(&cdb->disp);*/
		/*DumpTPage(cdb->draw.tpage);*/
		
 		/* clear ordering table */
		ClearOTag(cdb->ot, OTSIZE);	
		
		/* update sprites */
		ot = cdb->ot;
		sp = cdb->sprt;
		pp = pos;
		
		for (i = 0; i < nobj; i++, sp++, pp++) {
			/* detect reflection */
			if ((x = (pp->x += pp->dx) % WALL_X*2) >= WALL_X)
				x = WALL_X*2 - x;
			if ((y = (pp->y += pp->dy) % WALL_Y*2) >= WALL_Y)
				y = WALL_Y*2 - y;
			
			setXY0(sp, x, y);	/* update vertex */
			AddPrim(ot, sp);	/* apend to OT */
		}
		DrawSync(0);		/* wait for end of drawing */
		/* cnt = VSync(1);	/* check for count */
		/* cnt = VSync(2);	/* wait for V-BLNK (1/30) */
		cnt = VSync(0);		/* wait for V-BLNK (1/60) */

		PutDispEnv(&cdb->disp); /* update display environment */
		PutDrawEnv(&cdb->draw); /* update drawing environment */
		DrawOTag(cdb->ot);

		/*DumpOTag(cdb->ot);	/* dump OT (for debug) */
#ifdef KANJI
		KanjiFntPrint("‹Ê‚Ì”%d\n", nobj);
		KanjiFntPrint("ŽžŠÔ=%d\n", cnt);
		KanjiFntFlush(-1);
#endif
		FntPrint("sprite = %d\n", nobj);
		FntPrint("total time = %d\n", cnt);

#ifdef BACKCD	/* BACKCD */
		FntPrint("\n\n%s", stat2str_back_cd_read(stat_back_cd_read()));
		if (++j == 30) {
			j = 0;
			if (check_back_cd_read() != BACK_CD_BUSY) {
					start_back_cd_read(0);
			}
			back_cd_read();
		}
#endif			/* BACKCD */

		FntFlush(-1);
	}
	PadStop();
	return(0);
}

/*
 * Initialize drawing Primitives
 */
#include "balltex.h"

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
	for (sp = db->sprt, i = 0; i < MAXOBJ; i++, sp++) {
		SetSprt16(sp);			/* set SPRT_16 primitve ID */
		SetSemiTrans(sp, 0);		/* semi-amibient is OFF */
		SetShadeTex(sp, 1);		/* shading&texture is OFF */
		setUV0(sp, 0, 0);		/* texture point is (0,0) */
		sp->clut = clut[i%32];		/* set CLUT */
	}
}	

/*
 * Initialize sprite position and verocity
 */
static init_point(POS *pos)
{
	int	i;
	for (i = 0; i < MAXOBJ; i++) {
		pos->x  = rand();
		pos->y  = rand();
		pos->dx = (rand() % 4) + 1;
		pos->dy = (rand() % 4) + 1;
		pos++;
	}
}

/*
 * Read controll-pad
 */
static int pad_read(int n)
{
	u_long	padd = PadRead(1);
	
	if(padd & PADLup)	n += 4;		/* left '+' key up */
	if(padd & PADLdown)	n -= 4;		/* left '+' key down */
	
	if (padd & PADn) 			/* pause */
		while (PadRead(1)&PADn);

	if(padd & PADk) 	return(-1);
	
	limitRange(n, 1, MAXOBJ-1);		/* see libgpu.h */
	return(n);
}		

/*
 * callback
 */
static int cbvsync(void)
{
	/* print absolute VSync count */
	FntPrint("V-BLNK(%d)\n", VSync(-1));	
}
