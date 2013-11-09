### Test normal operation of SW
	.text
main:
	# Construct test vectors
	lui $10, 0x1000
	lui $11, 0x1000
	addi $11, 0x0001
	lui $12, 0x1234
	addi $12, $12, 0x5678

	# Store word aligned
	sw $12, 0($10)

	# Store word also aligned
	sw $12, 3($11)
	
	# Done
	addi $v0, $zero, 0x000a
	syscall
