CC		= ccpsx
CC_OPTION	= -g -G0 -O3 -Xo$80010000 -comments-c++

all:	test40.cpe test41.cpe
	
test40.cpe:	test4.c filename.h filepos.h
	$(CC) $(CC_OPTION) -DTEST40 test4.c -otest40.cpe,test40.sym

test41.cpe:	test4.c filename.h filepos.h
	$(CC) $(CC_OPTION) -DTEST41 test4.c -otest41.cpe,test41.sym
