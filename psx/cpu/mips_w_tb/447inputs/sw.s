.text
addiu $10, $zero, 0x10000000
addiu $11, $zero, 0x10000001
addiu $12, $zero, 0x12345687

	sw $12, 0($10)

    # Store word also aligned
    sw $12, 3($11)

	lw $14, 0($10)
	lw $15, 3($11)
	lb $16, 3($11)

	addiu $2, $0, 10
	syscall
