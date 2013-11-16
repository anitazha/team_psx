### Test normal operation of SUBU
	.text
main:
	# Create test vectors
	lui $10, 0x7fff
	addi $10, 0x7fff
	addi $10, 0x7fff
	addi $10, 0x0001
	lui $11, 0x8000
	addi $12, 0x0001
	addi $13, -0x0001
	addi $14, 0x0002
	addi $15, -0x0002

	# No sign change, no overflow
	subu $16, $14, $12

	# No sign change, no overflow
	subu $17, $15, $13

	# No sign change, no overflow
	subu $9, $14, $15

	# No sign change, no overflow
	subu $8, $15, $14

	# Sign change, no overflow
	subu $7, $12, $14

	# Sign change, no overflow
	subu $6, $13, $15

	# Sign change, overflow
	subu $5, $10, $13

	# Sign change, overflow
	subu $4, $11, $12

	# Done
	addi $v0, $zero, 0x000a
	syscall
