.text
addiu $10, $zero, 0x10000000
addiu $11, $zero, 0x10000001
addiu $12, $zero, 0x1234ffff

        # Store word aligned
        sw $12, 0($10)

        # Load word aligned
        lh $13, 0($10)

        # Load word also aligned
        lh $14, 2($10)

        # Load word also aligned
        lh $15, 1($11)

        # Load word also aligned
        lh $16, -1($11)

	addiu $2, $0, 10
	syscall
