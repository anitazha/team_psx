/*
 *		sample program "CD-DA repeat play using CdControlF"
 *		File : cdda.c
 *
 *		Copyright (C)
 *		Sony Computer Entertainment Inc. 1995
 *		All Rights Reserved
 *
 *		Version	Date		Author	Notes
 *		-----------------------------------------------------------------------
 *		0.00	Sep,05,1995	femy 	
 */

#include <sys/types.h>
#include <libetc.h>
#include <libgte.h>
#include <libgpu.h>
#include <libcd.h>
#include <libsnd.h>

void	print_hsync(int hsync);
void	play_manage(void);

CdlLOC  loc, loc_end;
int		play_stat = 0;
int		errcnt = 0;
int		lloc, mloc;
u_char	param[4], result[8];
int		min, sec,sector;

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
	SetDumpFnt(FntOpen(64, 64, 128, 128, 0, 512));

	/* initialize display double buffer */
	SetDefDrawEnv(&dr_e,  0,  0, 320, 240);
	SetDefDispEnv(&dis_e, 0,  0, 320, 240);

	PutDispEnv(&dis_e);		/* update display environment */
	PutDrawEnv(&dr_e);		/* update drawing environment */

	/* set CD subsystem mode */
	param[0] = CdlModeRept|CdlModeDA;	/* report ON & CD-DA ON */
	while (CdControl(CdlSetmode, param, 0) == 0)
		;

	/* convert repeat position to logical sector */
	loc_end.minute = 0x08; loc_end.second = 0x15; loc_end.sector=0x00;
	mloc = CdPosToInt((CdlLOC *)&loc_end);

	SetDispMask(1);		/* enable display */

	/* main loop */
	while(1) {
		FntPrint("CDDA TEST\n---------\n\n");
		FntPrint("POS: %02x.%02x.%02x\n", min, sec, sector);

		play_manage();

		hsync = VSync(0);

		print_hsync(hsync);
		FntPrint("\nERROR: %d\n", errcnt);

		/* clear flame buffer */
		setRECT(&clear, 0, 0, 320, 240);
		ClearImage(&clear, 0, 0, 0);
		/* flush strings */
		FntFlush(-1);
	}
}

void print_hsync(int hsync)
{
	static int	peak_hsync = 0;
	static int	peak_count;

	if (hsync > peak_hsync) {
		peak_hsync = hsync;
		peak_count = 60;
	}
	else if (peak_count > 0) {
		if (--peak_count == 0) {
			peak_hsync = hsync;
		}
	}
	FntPrint("\nH-SYNC: %d\n", hsync);
	FntPrint("  PEAK: %d\n", peak_hsync);
}

void play_manage(void)
{
	int		ret;

	switch (play_stat) {
		case	0 :
			/* set start sector to CD subsystem */
			loc.minute = 0x08; loc.second = 0x00; loc.sector = 0x00;
			CdControlF(CdlSetloc, (u_char *)&loc);
			play_stat++;
			break;
		case	1 :
			if ((ret = CdSync(1, result)) == CdlComplete) {
				/* seek and start play CD-DA */
				CdControlF(CdlPlay, 0);
				play_stat++;
			}
			else if (ret == CdlDiskError) {
				play_stat = 0;
				errcnt++;
			}
			break;
		case	2 :
			if ((ret = CdSync(1, result)) == CdlComplete) {
				play_stat++;
			}
			else if (ret == CdlDiskError) {
				play_stat = 0;
				errcnt++;
			}
			break;
		case	3 :
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
				play_stat = 0;
				errcnt++;
			}
			break;
		case	4 :
			if ((ret = CdSync(1, result)) == CdlComplete) {
				play_stat = 3;
			}
			else if (ret == CdlDiskError) {
				play_stat = 0;
				errcnt++;
			}
			break;
		default :
			break;
	}
}
