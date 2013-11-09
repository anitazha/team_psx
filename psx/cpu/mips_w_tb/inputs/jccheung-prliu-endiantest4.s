        # Basic LW/SW test
	.text
main:
        #;;  Set a base address
        lui    $3, 0x1000

       addi $4, $zero, 0x5678
	lui $5, 0x1234
	addu $6, $4, $5

	ori $10, $zero, 0xff

        #;; Place a test pattern in memory
        sw     $6, 0($3)
	sh	$10, 0($3)

	lw	$7, 0($3)

	addiu $16, $zero, 0x0fff
	addiu $17, $zero, 0x0fff
	addiu $18, $zero, 0x0fff
        
        
        #;;  Quit out 
        addiu $v0, $zero, 0xa
        syscall
        
