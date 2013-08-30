all:
	ccpsx -O -Xo$80010000 cman.c -ocman.cpe,cman.sym
for_menu:
	ccpsx -O -Xo$80010000 cman.c \psx\lib\none2.obj -ocman.cpe,cman.sym
	cpe2x cman.cpe
	del cman.cpe

