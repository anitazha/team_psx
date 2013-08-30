main0:
	ccpsx -O3 -c main0.c main0.obj
	dmpsx main0.obj
	ccpsx -O3 -Xo$80010000 main0.obj -omain0.cpe,main0.symm

main3:
	ccpsx -O3 -c main3.c main3.obj
	dmpsx main3.obj
	ccpsx -O3 -Xo$80010000 main3.obj -omain3.cpe,main3.sym

main6:
	ccpsx -O3 -c main6.c main6.obj
	dmpsx main6.obj
	ccpsx -O3 -Xo$80010000 main6.obj -omain6.cpe,main6.sym

mainrc:
	ccpsx -O3 -c mainrdiv.c mainrdiv.obj
	dmpsx mainrdiv.obj
	ccpsx -O3 -Xo$80010000 mainrdiv.obj -omainrdiv.cpe,mainrdiv.sym
