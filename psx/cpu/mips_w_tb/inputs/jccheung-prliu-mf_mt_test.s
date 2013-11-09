        # Basic multiply
	.text
main:   
        addiu   $3, $zero, 0x0ff0	#3 should be 0x0ff0
	ori	$4, $zero, 16		#4 should be 16
	mult	$3, $4

	mtlo	$3

	mflo	$5			#5 should be 0xff00
	ori	$6, $zero, 0x0ff0	#6 should be 0xff00
	slt	$7, $6, $5		#7 should be 0
	slt	$8, $5, $6		#8 should be 0
	addiu   $v0, $zero, 0xa
        syscall
	        
        
                        
