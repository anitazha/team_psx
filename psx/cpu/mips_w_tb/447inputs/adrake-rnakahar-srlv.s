### Test normal operation of SRLV
	.text
main:
	# Create test vectors
	lui $10, 0x1234
	addi $10, $10, 0x5678
	lui $11, 0x8000

	# Create shift amounts
	addi $12, $zero, 0x0000
	addi $13, $zero, 0x0027
	addi $14, $zero, 0x0010
	addi $15, $zero, 0x0020

	# Zero shift (direct)
	srlv $16, $10, $zero

	# Zero shift (via non-$zero)
	srlv $17, $10, $12

	# Zero shift (via 32 shift)
	srlv $9, $10, $15

	# Shift away
	srlv $8, $10, $14
	srlv $7, $8, $14

	# Random shift via > 32
	srlv $6, $10, $13

	# Don't sign extend
	srlv $5, $11, $13

	# Done
	addi $v0, $zero, 0x000a
	syscall
