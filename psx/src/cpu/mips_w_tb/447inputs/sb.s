.text
addiu $10, $zero, 0x10000000
addiu $11, $zero, 0x00AA
addiu $12, $zero, 0x00BB
addiu $13, $zero, 0x00CC
addiu $14, $zero, 0x00DD
        # Store byte
        sb $11, 0($10)

        # Store byte
        sb $12, 1($10)

        # Store byte
        sb $13, 2($10)

        # Store byte
        sb $14, 3($10)

        # Verify memory ordering
        lw $15, 0($10)

	addiu $2, $0, 10
	syscall
