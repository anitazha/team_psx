CC		= ccpsx
CC_OPTION	= -g -G0 -O3 -Xo$80010000 -comments-c++

all:	test10.cpe test11.cpe
	
test10.cpe:	test1.c filename.h filepos.h
	$(CC) $(CC_OPTION) -DTEST10 test1.c -otest10.cpe,test10.sym

test11.cpe:	test1.c filename.h filepos.h
	$(CC) $(CC_OPTION) -DTEST11 test1.c -otest11.cpe,test11.sym
