// ----------------------------------------------------------------------------
// 
// 							2D ｸﾞﾗﾌｨｸｽｻﾝﾌﾟﾙ: DEBUG.C
// 
// 				Copyright (C) 1995 Sony Computer Entertainment Inc.
// 							   All Rights Reserved
// ----------------------------------------------------------------------------

// ============================================================================
// デバッグルーチン
// ============================================================================
#include <sys/types.h>
#include <libetc.h>
#include <libgte.h>
#include <libgpu.h>
#include <libsn.h>
#include "orghead.h"

// 初期化
// ----------------------------------------------------------------------------
void initsysdebug(void){
	printf("PCinit:%02d\n",	PCinit());
}

// PC のディレクトリ上のファイルを開く
// ----------------------------------------------------------------------------
void pcfileread(u_char *fn, u_char *adr){
	long fd, len;
	
	if((fd = PCopen(fn, 0 ,0)) == -1){ printf("PCopen failure: -1\n"); exit(1); }
											// オープン
	len = PClseek(fd, 0L, 2); PClseek(fd, 0L, 0);
	if(PCread(fd, adr, len) != len){ printf("PCread failure: %s\n", fn); exit(1); }
											// リード
	PCclose(fd);
											// クローズ
}
