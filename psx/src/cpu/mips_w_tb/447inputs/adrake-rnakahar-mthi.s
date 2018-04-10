### Test normal operation of MTHI
	.text
main:
	# Construct test vector
	lui $10, 0x1234
	addi $10, $10, 0x5678

	# Move into HI
	mthi $10

	# Done
	addi $v0, $zero, 0x000a
	syscall
