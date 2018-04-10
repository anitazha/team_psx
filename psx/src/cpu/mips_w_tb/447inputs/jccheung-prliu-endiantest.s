        # Basic LW/SW test
	.text
main:
        #;;  Set a base address
        lui    $3, 0x1000

       addi $4, $zero, 0x5678
	lui $5, 0x1234
	addu $6, $4, $5

        #;; Place a test pattern in memory
        sw     $6, 0($3)

	lb	$7, 0($3)
	lb	$8, 1($3)
	lb	$9, 2($3)
	lb	$10, 3($3)

	addiu $16, $zero, 0x0fff
	addiu $17, $zero, 0x0fff
	addiu $18, $zero, 0x0fff
        
        
        #;;  Quit out 
        addiu $v0, $zero, 0xa
        syscall
        
