CC		= ccpsx
CC_OPTION	= -g -G0 -O3 -Xo$80010000 -comments-c++

all:	test30.cpe test31.cpe
	
test30.cpe:	test3.c filename.h
	$(CC) $(CC_OPTION) -DTEST30 test3.c -otest30.cpe,test30.sym

test31.cpe:	test3.c filename.h
	$(CC) $(CC_OPTION) -DTEST31 test3.c -otest31.cpe,test31.sym
