/*
 *		sample program "CD-XA repeat play using CdControlF"
 *		File : cdxa.c
 *
 *		Copyright (C)
 *		Sony Computer Entertainment Inc. 1995
 *		All Rights Reserved
 *
 *		Version	Date		Author	Notes
 *		-----------------------------------------------------------------------
 *		0.00	Sep,06,1995	femy 	
 */

#include <sys/types.h>
#include <libetc.h>
#include <libgte.h>
#include <libgpu.h>
#include <libcd.h>
#include <libsnd.h>

void	print_hsync(int hsync);
void	play_manage(void);

CdlLOC	loc, loc_end;
int		play_stat = 0;
int		errcnt = 0;
int		lloc, mloc;
u_char	param[4], result[8];
int		min, sec, sector;
CdlFILTER	*filter;
u_char	chan;
int		pad_data, pad_save_data;

main()
{
	RECT	clear;
	DRAWENV	dr_e;
	DISPENV	dis_e;
	int		hsync;

	ResetCallback();
	/* initialize CD subsystem */
	CdInit();
	/* initialize control pad */
	PadInit(0);
	/* initialize graphics */
	ResetGraph(0);

	/* initialize sound system (for CD audio) */
	SsInit();
	/* set CD audio mixing and volume */
	SsSetSerialAttr(SS_SERIAL_A, SS_MIX, SS_SON);
	SsSetSerialVol(SS_SERIAL_A, 0x7f, 0x7f);

	/* clear frame buffer */
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

	/* set CD-XA channel */
	filter = (CdlFILTER *)param;
	filter->file = 1;
	filter->chan = chan = 0;
	while (CdControl(CdlSetfilter, param, 0) == 0)
		;

	/* set CD subsystem mode */
	param[0] = CdlModeSpeed|CdlModeRT|CdlModeSF;
	/* x2 speed , CD-XA ON & filter ON */
	while (CdControl(CdlSetmode, param, 0) == 0)
		;

	/* convert repeat position to logical sector */
	loc_end.minute = 0x01; loc_end.second = 0x30; loc_end.sector=0x00;
	mloc = CdPosToInt(&loc_end);

	SetDispMask(1);		/* enable display */

	/* main loop */
	while(1) {
		FntPrint("CDXA TEST\n---------\n\n");
		FntPrint("POS: %02x.%02x.%02x\n", min, sec, sector);
		FntPrint("CHANNEL: %d\n", chan);

		play_manage();

		hsync = VSync(0);
		pad_data = PadRead(1);

		print_hsync(hsync);
		FntPrint("\nERROR: %d\n", errcnt);

		/* clear flame buffer */
		setRECT(&clear, 0, 0, 320, 240);
		ClearImage(&clear,0,0,0);
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
			loc.minute = 0x01; loc.second = 0x00; loc.sector = 0x00;
			CdControlF(CdlSetloc, (u_char *)&loc);
			play_stat++;
			break;
		case	1 :
			if ((ret = CdSync(1, result)) == CdlComplete) {
				/* seek and start play CD-XA */
				CdControlF(CdlReadS, 0);
				play_stat++;
			}
			else if (ret == CdlDiskError) {
				play_stat = 0;
				errcnt++;
			}
			break;
		case	2 :
			if ((ret = CdSync(1, result)) == CdlComplete) {
				/* for getting status */
				CdControlF(CdlNop, 0);
				play_stat++;
			}
			else if (ret == CdlDiskError) {
				play_stat = 0;
				errcnt++;
			}
			break;
		case	3 :
			if ((ret = CdSync(1, result)) == CdlComplete) {
				/* CD-XA play already started? */
				if (result[0] & CdlStatRead) {
					play_stat++;
				}
				else {
					play_stat--;
				}
			}
			else if (ret == CdlDiskError) {
				play_stat = 0;
				errcnt++;
			}
			break;
		case	4 :
			/* get physical sector */
			CdControlF(CdlGetlocL, 0);
			play_stat++;
			break;
		case	5 :
			if ((ret = CdSync(1, result)) == CdlComplete) {
				min    = result[0];
				sec    = result[1];
				sector = result[2];
				/* convert current time to logical sector */
				lloc = CdPosToInt((CdlLOC *)&result[0]);
				/* repeat? */
				if (lloc >= mloc) {
					play_stat = 0;
				}
				else {
					play_stat++;
				}
			}
			else if (ret == CdlDiskError) {
				play_stat = 0;
				errcnt++;
			}
			break;
		case	6 :
			if(pad_data == pad_save_data) {
				pad_data = 0;
			}
			else {
				pad_save_data = pad_data;
			}
			/* change CD-XA channel? */
			if (pad_data & PADh) {
				/* set CD-XA channel */
				filter = (CdlFILTER *)param;
				filter->file = 1;
				filter->chan = chan = (chan+1) % 4;
				CdControlF(CdlSetfilter, param);
				play_stat++;
			}
			else {
				play_stat = 4;
			}
			break;
		case	7 :
			if ((ret = CdSync(1, result)) == CdlComplete) {
				play_stat = 4;
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