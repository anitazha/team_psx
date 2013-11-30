	.text
main:
	# Construct test vectors
	lui $10, 0x1000

	sw $11, 0($10)

	# Done
	addi $v0, $zero, 0x000a
	syscall
