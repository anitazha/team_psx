CC		= ccpsx
CC_OPTION	= -g -G0 -O3 -Xo$80010000 -comments-c++

cdda:
	$(CC) $(CC_OPTION) cdda.c -l libcd.lib -ocdda.cpe,cdda.sym
