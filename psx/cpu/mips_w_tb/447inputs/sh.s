.text
addiu $10, $zero, 0x10000000
addiu $11, $zero, 0x10000005
addiu $12, $zero, 0x1234
addiu $13, $zero, 0x5678
addiu $14, $zero, 0x4321
addiu $15, $zero, 0x0123
	# Store word aligned
        sh $12, 0($10)

        # Store word also aligned
        sh $13, 2($10)

        # Store word also aligned
        sh $14, -1($11)

        # Store halfword also aligned
        sh $15, 1($11)

        # Verify memory ordering
        lw $16, 0($10)
        lw $17, -1($11)

	addiu $2, $0, 10
	syscall
