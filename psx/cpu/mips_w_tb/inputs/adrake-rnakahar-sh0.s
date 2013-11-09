### Test normal operation of SH
	.text
main:
	# Construct test vectors
	lui $10, 0x1000
	lui $11, 0x1000
	addi $11, 0x0005
	addi $12, $zero, 0x1234
	addi $13, $zero, 0x5678
	addi $14, $zero, 0x4321
	addi $15, $zero, 0x0123

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

	# Done
	addi $v0, $zero, 0x000a
	syscall
