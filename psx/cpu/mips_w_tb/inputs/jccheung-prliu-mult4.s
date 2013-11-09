        # Basic multiply
	.text
main:   
        addiu   $3, $zero, 0x0ff0	#3 should be 0x0ff0
	ori	$4, $zero, 16		#4 should be 16
	lui 	$10, 0xffff		#10 should be 0xffff_0000
	addi	$11, 31

	mult	$3, $4
	addu	$3, $3, $3
	multu	$11, $10		#should be 0x0000_001e, 0xffe1_0000

	addu	$3, $3, $3

	mfhi	$5			

	addu	$3, $3, $3

	mflo	$6	

	addiu   $v0, $zero, 0xa
        syscall
	        
        
                        
