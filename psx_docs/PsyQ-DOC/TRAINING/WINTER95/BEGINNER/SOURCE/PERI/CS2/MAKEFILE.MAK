cman4:
	ccpsx -c -G 0 cs2.c
	ccpsx -O2 -Xo$80010000 cman4.c cs2.obj -ocman4.cpe,cman4.sym
