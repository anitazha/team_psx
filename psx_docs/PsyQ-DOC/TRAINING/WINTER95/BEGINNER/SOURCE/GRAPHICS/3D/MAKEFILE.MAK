
all:
	ccpsx -O3 -Xo$80010000 -omain.cpe,main.sym main.c

load:
	pqbload heli.tmd     80100000
	pqbload heliside.tim 80120000
