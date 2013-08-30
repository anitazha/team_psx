/*
 *		sample program "back cd"
 *		File : backcd.h
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

#define	MAX_FILE_NUM		(0)

#define	BACK_CD_IDLE		(0)
#define	BACK_CD_BUSY		(1)
#define	BACK_CD_COMPLETE	(2)

extern int	set_back_cd_read(int filenum, char *filename, void *addr);
extern int	start_back_cd_read(int filenum);
extern int	check_back_cd_read(void);
extern int	stat_back_cd_read(void);
extern char	*stat2str_back_cd_read(int stat);
extern void	back_cd_read(void);
