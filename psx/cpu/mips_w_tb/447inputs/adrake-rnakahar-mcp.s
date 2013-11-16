### Test stalling behavior of multiplier coprocessor
	.text
main:
	# Construct test vector
	lui $3, 0x1234
	addi $3, $3, 0x5678
	lui $4, 0x8765
	addi $4, $4, 0x4321
	lui $5, 0x4567
	addi $5, $5, 0x89ab

	# Do multiply with four nops
	mult $3, $4
	nop
	nop
	nop
	nop
	mflo $9
	mfhi $10

	# Do multiply with two nops
	mult $3, $4
	nop
	nop
	mflo $7
	mfhi $8

	# Do multiply with no nops
	mult $3, $4
	mflo $5
	mfhi $6

	# Do two multiplies with four nops
	mult $3, $4
	nop
	nop
	nop
	nop
	mult $5, $6
	mflo $11
	mfhi $12

	# Do two multiplies with two nops
	mult $3, $4
	nop
	nop
	mult $5, $6
	mflo $13
	mfhi $14

	# Do two multiplies with no nops
	mult $3, $4
	mult $5, $6
	mflo $15
	mfhi $16

	# Done
	addi $v0, $zero, 0x000a
	syscall

