### Test normal operation of SLLV
	.text
main:
	# Create test vector
	lui $3, 0x1234
	addi $3, $3, 0x5678

	# Create shift amounts
	addi $4, $zero, 0x0000
	addi $5, $zero, 0x0027
	addi $6, $zero, 0x0010
	addi $7, $zero, 0x0020

	# Zero shift (direct)
	sllv $8, $3, $zero

	# Zero shift (via non-$zero)
	sllv $9, $3, $4

	# Zero shift (via 32 shift)
	sllv $10, $3, $7

	# Shift away
	sllv $11, $3, $6
	sllv $12, $11, $6

	# Random shift via > 32
	sllv $13, $3, $5

	# Done
	addi $v0, $zero, 0x000a
	syscall
