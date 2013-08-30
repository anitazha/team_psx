/*
 *		sample program "CD-DA repeat play using CdControlF"
 *		File : cdda.c
 *
 *		Copyright (C)
 *		Sony Computer Entertainment Inc. 1996
 *		All Rights Reserved
 *
 *		Version	Date		Author	Notes
 *		-----------------------------------------------------------------------
 *		0.01	Mar,14,1996	femy 	WhiteDay's Version
 *		0.02	May,08,1996	femy	Check Shell-Opened Error
 *		0.03	May,16,1996 femy	Use CdlGetTN
 */

#include <sys/types.h>
#include <libetc.h>
#include <libgte.h>
#include <libgpu.h>
#include <libcd.h>
#include <libsnd.h>

#define OTSIZE				(1)		// size of ordering table

typedef struct {
	DRAWENV		draw;		// drawing environment
	DISPENV		disp;		// display environment
	u_long		ot[OTSIZE];	// ordering table
	TILE_16		prim;		// moving object
} DB;

void	moving_object(void);
void	print_hsync(int hsync);
void	play_manage(void);

DB		db[2], *cdb;
CdlLOC  loc, loc_end;
int		play_stat = 0;
int		errcnt = 0;
int		lloc, mloc;
u_char	param[4], result[8];
int		min, sec, sector;

main()
{
	RECT	clear;
	DRAWENV	dr_e;
	DISPENV	dis_e;
	int		hsync;

	ResetCallback();
	/* initialize CD subsystem */
	CdInit();
	CdSetDebug(0);
	/* initialize graphics */
	ResetGraph(0);

	/* initialize sound system (for CD audio) */
	SsInit();
	/* set CD audio mixing and volume */
	SsSetSerialAttr(SS_SERIAL_A, SS_MIX, SS_SON);
	SsSetSerialVol(SS_SERIAL_A, 0x7f, 0x7f);

	/* clear flame buffer */
	setRECT(&clear, 0, 0, 320, 240);
	ClearImage(&clear, 0, 0, 0);

	/* initialize debug display */
	FntLoad(960, 256);
	SetDumpFnt(FntOpen(64, 64, 196, 128, 0, 512));

	// initialize display double buffer
	SetDefDrawEnv(&db[0].draw, 0,   0, 320, 240);
	SetDefDrawEnv(&db[1].draw, 0, 240, 320, 240);
	SetDefDispEnv(&db[0].disp, 0, 240, 320, 240);
	SetDefDispEnv(&db[1].disp, 0,   0, 320, 240);
	db[0].draw.isbg = 1;
	setRGB0(&db[0].draw, 0, 0, 0);
	db[1].draw.isbg = 1;
	setRGB0(&db[1].draw, 0, 0, 0);

	setTile16(&db[0].prim);
	setRGB0(&db[0].prim, 255, 255, 0);
	setTile16(&db[1].prim);
	setRGB0(&db[1].prim, 255, 255, 0);

	/* set CD subsystem mode */
	param[0] = CdlModeRept|CdlModeDA;	/* report ON & CD-DA ON */
	while (CdControl(CdlSetmode, param, 0) == 0)
		;

	/* convert repeat position to logical sector */
	loc_end.minute = 0x05; loc_end.second = 0x00; loc_end.sector=0x00;
	mloc = CdPosToInt((CdlLOC *)&loc_end);

	SetDispMask(1);		/* enable display */

	/* main loop */
	while(1) {
		cdb  = (cdb==db)? db+1: db;		// swap double buffer ID
		ClearOTag(cdb->ot, OTSIZE);	

		moving_object();

		FntPrint("CDDA TEST     \n----------------\n");
		FntPrint("POS: %02x.%02x.%02x\n", min, sec, sector);

		play_manage();

		hsync = VSync(0);
		PutDispEnv(&cdb->disp); // update display environment
		PutDrawEnv(&cdb->draw); // update drawing environment
		DrawOTag(cdb->ot);

		print_hsync(hsync);
		FntPrint("\nERROR: %d\n", errcnt);

		/* flush strings */
		FntFlush(-1);
	}
}

void moving_object(void)
{
	static int	x = 0;
	static int	vx = 2;
	int		sx;

	if ((sx = (x += vx) % 320*2) >= 320) {
		sx = 320*2 - sx;
	}
	setXY0(&cdb->prim, sx, 218);
	AddPrim(cdb->ot, &cdb->prim);
}

void print_hsync(int hsync)
{
	static int	peak_hsync = 0;
	static int	peak_count;
	static int	peak_play_stat = 0;

	if (hsync > peak_hsync) {
		peak_hsync = hsync;
		peak_count = 60;
		peak_play_stat = play_stat;
	}
	else if (peak_count > 0) {
		if (--peak_count == 0) {
			peak_hsync = hsync;
		}
	}
	FntPrint("\nH-SYNC: %d\n", hsync);
	FntPrint("  PEAK: %d (%d)\n", peak_hsync, peak_play_stat);
}

#define CdlGetTN	0x13

void play_manage(void)
{
	int		ret;

	FntPrint("STAT #: %02d\n", play_stat);
	FntPrint("CD STAT: %02X\n", CdStatus());
	if (play_stat == 11 || play_stat == 12) {
			FntPrint("SHELL-OPENED!!\n");
	}
	else {
			FntPrint("SHELL-CLOSED.\n");
	}
	switch (play_stat) {
		case	0 :
			param[0] = CdlModeRept|CdlModeDA;
			CdControlF(CdlSetmode, param);
			play_stat++;
			break;
		case	1 :
			if ((ret = CdSync(1, result)) == CdlComplete) {
				/* set start sector to CD subsystem */
				loc.minute = 0x03; loc.second = 0x00; loc.sector = 0x00;
				CdControlF(CdlSetloc, (u_char *)&loc);
				play_stat++;
			}
			else if (ret == CdlDiskError) {
				play_stat = 10;
			}
			break;
		case	2 :
			if ((ret = CdSync(1, result)) == CdlComplete) {
				/* seek and start play CD-DA */
				CdControlF(CdlPlay, 0);
				play_stat++;
			}
			else if (ret == CdlDiskError) {
				play_stat = 10;
			}
			break;
		case	3 :
			if ((ret = CdSync(1, result)) == CdlComplete) {
				play_stat++;
			}
			else if (ret == CdlDiskError) {
				play_stat = 10;
			}
			break;
		case	4 :
			CdControlF(CdlNop, 0);
			play_stat++;
			/* check if any reports exist or not */
			if ((ret = CdReady(1, result)) == CdlDataReady) {
				/* report exists */
				if ((result[4] & 0x80) == 0) {
					/* bit7 1:total time, 0:current time */
					min    = result[3];
					sec    = result[4];
					sector = result[5];
					/* convert current time to logical sector */
					lloc = CdPosToInt((CdlLOC *)&result[3]);
					/* repeat? */
					if (lloc >= mloc) {
						play_stat = 0;
					}
				}
			}
			else if (ret == CdlDiskError) {
				play_stat = 10;
			}
			break;
		case	5 :
			if ((ret = CdSync(1, result)) == CdlComplete) {
				play_stat--;
			}
			else if (ret == CdlDiskError) {
				play_stat = 10;
			}
			break;
		case	10 :
			errcnt++;
			if (!(result[0] & CdlStatShellOpen)) {
				play_stat = 13;
			}
			else {
				play_stat++;
			}
			break;
		case	11 :
			CdControlF(CdlNop, 0);
			play_stat++;
			break;
		case	12 :
			if ((ret = CdSync(1, result)) == CdlComplete) {
				if (!(result[0] & CdlStatShellOpen)) {
					play_stat++;
				} else {
					play_stat--;
				}
			}
			else if (ret == CdlDiskError) {
				play_stat--;
			}
			break;
		case	13 :
			CdControlF(CdlGetTN, 0);
			play_stat++;
			break;
		case	14 :
			if ((ret = CdSync(1, result)) == CdlComplete) {
				play_stat = 0;
			}
			else if (ret == CdlDiskError) {
				play_stat = 10;
			}
			break;
		default :
			break;
	}
}
