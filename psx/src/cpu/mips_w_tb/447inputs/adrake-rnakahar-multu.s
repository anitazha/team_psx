### Test normal operation of MULTU
	.text
main:
	# Create test vectors
	lui $10, 0x1234
	addi $10, $10, 0x5678
	lui $11, 0x8765
	addi $11, $11, 0x4321

	# Do multiply and wait
	multu $10, $11
	nop
	nop

	# Extract results
	mflo $12
	mfhi $13

	# Done
	addi $v0, $zero, 0x000a
	syscall
