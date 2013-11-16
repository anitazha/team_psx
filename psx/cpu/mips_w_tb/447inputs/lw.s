.text
addiu $10, $zero, 0x10000000
addiu $11, $zero, 0x10000001 
addiu $12, $zero, 0x12345687 

	# Store word aligned
        sw $12, 0($10)

        # Store word also aligned
        sw $12, 3($11)

        # Load word aligned
        lw $13, 0($10)

        # Load word also aligned
        lw $14, 3($11)

	addiu $2, $0, 10
	syscall
