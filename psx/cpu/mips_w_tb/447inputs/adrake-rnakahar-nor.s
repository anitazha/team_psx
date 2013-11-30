### Test the normal operation of NOR
	.text
main:
	# Construct test vectors
	lui $10, 0x3939
	addi $10, 0x3939
	lui $11, 0x6565
	addi $11, 0x6565
	
	# Do the operation
	nor $12, $10, $11

	# Done
	addi $v0, $zero, 0x000a
	syscall
