### Test normal operation of SRAV
	.text
main:
	# Create test vectors
	lui $10, 0x8765
	addi $10, $10, 0x4321

	# Create shift amounts
	addi $11, $zero, 0x0000
	addi $12, $zero, 0x0027
	addi $13, $zero, 0x0010
	addi $14, $zero, 0x0020

	# Zero shift (direct)
	srav $15, $10, $zero

	# Zero shift (via non-$zero)
	srav $16, $10, $11

	# Zero shift (via 32 shift)
	srav $17, $10, $14

	# Shift away, sign extend
	srav $9, $10, $13
	srav $8, $9, $13

	# Random shift via > 32, sign extend
	srav $7, $10, $12

	# Done
	addi $v0, $zero, 0x000a
	syscall
