/*
 *		sample program "back cd"
 *		File : backcd.c
 *
 *		Copyright (C)
 *		Sony Computer Entertainment Inc. 1995
 *		studiofemy 1995
 *		All Rights Reserved
 *
 *		Version	Date		Author	Notes
 *		-----------------------------------------------------------------------
 *		0.50	Dec,04,1995	femy 	
 */

#include <sys/types.h>
#include <libcd.h>

#include "backcd.h"

int		read_stat = 0;
int		errcnt = 0;
int		read_file_num;
int		read_sector_size;
void	*read_des_addr;
CdlFILE	fp[MAX_FILE_NUM+1];
void	*des_addr[MAX_FILE_NUM+1];

int set_back_cd_read(int filenum, char *filename, void *addr)
{
	if (filenum > MAX_FILE_NUM) {
		return (-1);	/* file number is too big */
	}
	if (read_stat) {
		return (-2);	/* now reading data */
	}
	if (CdSearchFile(&fp[filenum], filename) == 0) {
		return (-3);	/* not found */
	}
	des_addr[filenum] = addr;

	return (0);
}

int start_back_cd_read(int filenum)
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

int check_back_cd_read(void)
{
	switch (read_stat) {
		case	0 :		/* not reading any data */
			return (BACK_CD_IDLE);
			break;
		case	5 :		/* done */
			read_stat = 0;
			return (BACK_CD_COMPLETE);
			break;
		default :
			return (BACK_CD_BUSY);
			break;
	}
}

int stat_back_cd_read(void)
{
	return (read_stat);
}

char *stat2str_back_cd_read(int stat)
{
	static char	*statstr[] = {
		"not reading any data.\n",
		"command: set location.\n",
		"waiting: moving the head.\n",
		"command: read data.\n",
		"waiting: reading data.\n",
		"done.\n"
	};

	return (statstr[stat]);
}

void back_cd_read(void)
{
	int		ret;

	switch (read_stat) {
		case	0 :		/* not reading any data */
			break;
		case	1 :		/* command: set location */
			CdControlF(CdlSetloc, (u_char *)&fp[read_file_num].pos);
			read_stat++;
			break;
		case	2 :		/* waiting: moving the head */
			if ((ret = CdSync(1, 0)) == CdlComplete) {
				read_stat++;
			}
			else if (ret == CdlDiskError) {
				read_stat = 1;
				errcnt++;
			}
			break;
		case	3 :		/* command: read data */
			read_sector_size = (fp[read_file_num].size+2047)/2048;
			if (CdRead(read_sector_size, read_des_addr, CdlModeSpeed) == 0) {
				errcnt++;
			}
			else {
				read_stat++;
			}
			break;
		case	4 :		/* waiting: reading data */
			if ((ret = CdReadSync(1, 0)) == 0) {
				read_stat++;
			}
			else if (ret == -1) {
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