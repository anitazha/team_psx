        # Basic multiply
	.text
main:   
        addiu   $3, $zero, 0x0ff0	#3 should be 0x0ff0
	ori	$4, $zero, 16		#4 should be 16
	lui 	$10, 0x0fff		#10 should be 0x0fff_0000
	addi	$11, 31

	mult	$3, $4
	mult	$11, $10		#should be 0x0000_0001, 0xefe1_0000


	mfhi	$5			
	mflo	$6	

	addiu   $v0, $zero, 0xa
        syscall
	        
        
                        
