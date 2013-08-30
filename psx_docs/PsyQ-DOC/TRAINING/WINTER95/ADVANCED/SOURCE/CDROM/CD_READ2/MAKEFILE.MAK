CC		= ccpsx
CC_OPTION	= -g -G0 -O3 -Xo$80010000 -comments-c++

all:	test20.cpe test21.cpe test22.cpe
	
test20.cpe:	test2.c filename.h filepos.h
	$(CC) $(CC_OPTION) -DTEST20 test2.c -otest20.cpe,test20.sym

test21.cpe:	test2.c filename.h filepos.h
	$(CC) $(CC_OPTION) -DTEST21 test2.c -otest21.cpe,test21.sym

test22.cpe:	test2.c filename.h filepos.h
	$(CC) $(CC_OPTION) -DTEST22 test2.c -otest22.cpe,test22.sym
