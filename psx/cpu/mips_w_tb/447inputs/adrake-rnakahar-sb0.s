### Test normal operation of SB
	.text
main:
	# Construct test vectors
	lui $10, 0x1000
	addi $11, $zero, 0x00AA
	addi $12, $zero, 0x00BB
	addi $13, $zero, 0x00CC
	addi $14, $zero, 0x00DD
	
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

	# Done
	addi $v0, $zero, 0x000a
	syscall
