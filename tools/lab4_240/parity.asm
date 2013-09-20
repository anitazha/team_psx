	.ORG 	$1000

	LDI	R0,BEGIN
	LDI	R1,END
	LDI	R5,CLEAR
	LDI	R6,SET

loop1	LDR	R2,R0
	LDI	R3,$0
	LDI	R4,$F
	
loop11	XOR	R3,R2
	LSHR	R2	
	BRZ	hzbit	
	DECR	R4		
	BRZ	hzbit		
	BRA	loop11		

hzbit	LDR	R2,R0		
setbit	LSHR	R3		
	BRC	clrbit		
	OR	R2,R6		
	BRA	store		
clrbit	AND	R2,R5		
store	STR	R0,R2		
	INCR	R0		
	CMR	R0,R1		
	BRN	loop1		

	LDI	R0,BEGIN	
	LDI	R3,$0		
	LDI	R4,END		

loop2	DECR	R4		
	LDR	R1,R4		
	XOR	R3,R1		
	CMR	R0,R4		
	BRZ	done		
	BRA	loop2		
				
done	NOT	R3		
	STA	END,R3		
	STOP

SET     .EQU    $8000		
CLEAR   .EQU    $7FFF		

        .ORG    $4000           
BEGIN   .DW     $FFFE
        .DW     $1999
        .DW     $DC55
        .DW     $5DDD
	.DW     $8000
        .DW     $9810
        .DW     $6
        .DW     $7
        .DW     $8
        .DW     $9
        .DW     $A
        .DW     $B
        .DW     $C
        .DW     $D
        .DW     $E
END 	.DW     $F
