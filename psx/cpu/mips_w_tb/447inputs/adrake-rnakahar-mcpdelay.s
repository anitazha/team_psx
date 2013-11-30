### Test delay caused by MFLO
	.text
main:
	# Create test vectors
	ori $10, 0x1337
	ori $11, 0xD00D

	# Multiply
	mult $10, $11
	mflo $12

	# Copy result
	or $13, $zero, $12

	# Done
	addi $v0, $zero, 0x000a
	syscall
