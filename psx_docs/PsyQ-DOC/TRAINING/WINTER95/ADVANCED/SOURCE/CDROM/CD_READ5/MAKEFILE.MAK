CC		= ccpsx
CC_OPTION	= -g -G0 -O3 -Xo$80010000 -comments-c++

all:	test50.cpe test51.cpe
	
test50.cpe:	test50.c filename.h filepos.h
	$(CC) $(CC_OPTION) test50.c -otest50.cpe,test50.sym

test51.cpe:	test51.c filename.h filepos.h
	$(CC) $(CC_OPTION) test51.c -otest51.cpe,test51.sym
