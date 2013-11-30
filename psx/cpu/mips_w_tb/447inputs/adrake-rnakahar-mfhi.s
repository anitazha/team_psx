### Test normal operation of MFHI
	.text
main:
	# Construct test vector
	lui $10, 0x1234
	addi $10, $10, 0x5678

	# Move into HI
	mthi $10

	# Move from HI
	mfhi $11

	# Done
	addi $v0, $zero, 0x000a
	syscall
