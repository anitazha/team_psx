/*
 *		sample program ""
 *		File : test1.c
 *
 *		Copyright (C)
 *		Sony Computer Entertainment Inc. 1996
 *		All Rights Reserved
 *
 *		Version	Date		Author	Notes
 *		-----------------------------------------------------------------------
 *		0.00	May,07,1996	femy 	
 */

#include <sys/types.h>
#include <libetc.h>
#include <libgte.h>
#include <libgpu.h>
#include <libcd.h>

#include "filename.h"
#include "filepos.h"

#define	MAX_FILE_NUM		(30)
#define	CD_READ_IDLE		(0)
#define	CD_READ_BUSY		(1)
#define	CD_READ_COMPLETE	(2)

#define OTSIZE				(1)		// size of ordering table

typedef struct {
	DRAWENV		draw;		// drawing environment
	DISPENV		disp;		// display environment
	u_long		ot[OTSIZE];	// ordering table
	POLY_F4		prim;		// moving object
} DB;

void	moving_object(void);
void	print_hsync(int hsync);
int		set_read_file(int filenum, char *filename, void *addr);
int		start_read_file(int filenum);
int		check_read_file(void);
int		stat_read_file(void);
void	read_manage(void);

int		read_stat = 0;
int		read_file_num;
int		read_remain_sector;
void	*read_des_addr;
CdlFILE	fp[MAX_FILE_NUM+1];
void	*des_addr[MAX_FILE_NUM+1];

DB		db[2], *cdb;
int		errcnt = 0;
u_char	param[4];
int		start_v, read_v = 0;
int		file_num;

#ifdef	TEST10
#define	READ_FILES			(20)
#define	READ_SECTORS		(25)	// 1/3 sec
int		file_order[READ_FILES] = {
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
};
#else
#define	READ_FILES			(1)
#define	READ_SECTORS		(25*20)
int		file_order[READ_FILES] = {
	0
};
#endif	// TEST10

main()
{
	int		i;
	int		hsync;
	int		ret;
	int		tmp_v;

	ResetCallback();
	// initialize CD subsystem
	CdInit();
	CdSetDebug(0);
	// initialize graphics
	ResetGraph(0);

	// initialize debug display
	FntLoad(960, 256);
	SetDumpFnt(FntOpen(64, 64, 128, 128, 0, 512));

	// initialize display double buffer
	SetDefDrawEnv(&db[0].draw, 0,   0, 320, 240);
	SetDefDrawEnv(&db[1].draw, 0, 240, 320, 240);
	SetDefDispEnv(&db[0].disp, 0, 240, 320, 240);
	SetDefDispEnv(&db[1].disp, 0,   0, 320, 240);
	db[0].draw.isbg = 1;
	setRGB0(&db[0].draw, 0, 0, 0);
	db[1].draw.isbg = 1;
	setRGB0(&db[1].draw, 0, 0, 0);

	setPolyF4(&db[0].prim);
	setRGB0(&db[0].prim, 255, 255, 0);
	setPolyF4(&db[1].prim);
	setRGB0(&db[1].prim, 255, 255, 0);

	for (i = 0; i < READ_FILES; i++) {
		set_read_file(i, filename[file_order[i]], (void *)0x80100000);
	}
	file_num = 0;

	// set CD subsystem mode
	param[0] = CdlModeSpeed;		// x2 speed
	while (CdControl(CdlSetmode, param, 0) == 0)
		;

	SetDispMask(1);		// enable display

	// main loop
	while(1) {
		cdb  = (cdb==db)? db+1: db;		// swap double buffer ID
		ClearOTag(cdb->ot, OTSIZE);	

		moving_object();

		FntPrint("CD READ TEST 1\n----------------\n");
		FntPrint("FILE: %d\n", file_num);
		FntPrint("POS: %02x:%02x:%02x\n", fp[file_num].pos.minute,
				fp[file_num].pos.second,
				fp[file_num].pos.sector);
		FntPrint("SECTORS: %d\n", read_remain_sector);
		FntPrint("READ V: %d\n", read_v);

		if ((ret = check_read_file()) == CD_READ_COMPLETE) {
			if (++file_num > READ_FILES-1) {
				file_num = 0;
				tmp_v = VSync(-1);
				read_v = tmp_v - start_v;
				start_v = tmp_v;
			}
			read_remain_sector = READ_SECTORS;	// for display
			start_read_file(file_num);
		}
		else if (ret != CD_READ_BUSY) {
				start_read_file(0);
				start_v = VSync(-1);
		}

		read_manage();

		hsync = VSync(0);
		PutDispEnv(&cdb->disp); // update display environment
		PutDrawEnv(&cdb->draw); // update drawing environment
		DrawOTag(cdb->ot);

		print_hsync(hsync);
		FntPrint("\nERROR: %d\n", errcnt);

		// flush debug strings
		FntFlush(-1);
	}
}

void moving_object(void)
{
	static int	sx = 0;
	int		sx1;

	sx1 = ((READ_SECTORS-read_remain_sector) + READ_SECTORS*file_num) * 320
			/ (READ_FILES * READ_SECTORS);
	setXYWH(&cdb->prim, sx, 218, sx1, 16);
	AddPrim(cdb->ot, &cdb->prim);
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

int set_read_file(int filenum, char *filename, void *addr)
{
	if (filenum > MAX_FILE_NUM) {
		return (-1);	/* file number is too big */
	}
	fp[filenum].pos = filepos[file_order[filenum]];
	des_addr[filenum] = addr;

	return (0);
}

int start_read_file(int filenum)
{
	if (filenum > MAX_FILE_NUM) {
		return (-1);	/* file number is too big */
	}
	if (read_stat) {
		return (-2);	/* now reading the other data */
	}
	read_stat++;
	read_file_num = filenum;
	read_des_addr = des_addr[filenum];

	return (0);
}

int check_read_file(void)
{
	switch (read_stat) {
		case	0 :		/* not reading any data */
			return (CD_READ_IDLE);
			break;
		case	5 :		/* done */
			read_stat = 0;
			return (CD_READ_COMPLETE);
			break;
		default :
			return (CD_READ_BUSY);
			break;
	}
}

int stat_read_file(void)
{
	return (read_stat);
}

void read_manage(void)
{
	int		ret;

	switch (read_stat) {
		case	0 :		/* not reading any data */
			break;
		case	1 :		/* command: set location */
			CdControlF(CdlSetloc, (u_char *)&fp[read_file_num].pos);
			read_stat++;
			break;
		case	2 :		/* waiting: setting location */
			if ((ret = CdSync(1, 0)) == CdlComplete) {
				read_stat++;
			}
			else if (ret == CdlDiskError) {
				read_stat = 1;
				errcnt++;
			}
			break;
		case	3 :		/* command: read data */
			if (CdRead(READ_SECTORS, read_des_addr, CdlModeSpeed) == 0) {
				errcnt++;
			}
			else {
				read_stat++;
			}
			break;
		case	4 :		/* waiting: reading data */
			read_remain_sector = CdReadSync(1, 0);
			if (read_remain_sector == 0) {
				read_stat++;
			}
			else if (read_remain_sector == -1) {
				read_stat = 1;
				errcnt++;
			}
			break;
		case	5 :		/* done */
			break;
		default :
			break;
	}
}
