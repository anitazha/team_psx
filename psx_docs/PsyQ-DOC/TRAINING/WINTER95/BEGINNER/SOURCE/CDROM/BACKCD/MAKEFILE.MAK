balls:
	ccpsx -O3 -Xo$80010000 main.c -oballs.cpe,balls.sym

ballscd:
	ccpsx -O3 -DBACKCD -Xo$80010000 main.c backcd.c -oballscd.cpe,ballscd.sym
