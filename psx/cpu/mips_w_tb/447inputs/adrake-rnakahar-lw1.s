	.text
main:
	# Construct test vectors
	lui $10, 0x1000

	# Done
	addi $v0, $zero, 0x000a
	syscall
