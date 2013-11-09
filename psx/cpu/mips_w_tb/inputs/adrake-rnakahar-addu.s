### Test normal operation of ADDU
	.text
main:
	# Create test vectors
	lui $3, 0x7fff
	addi $3, 0x7fff
	addi $3, 0x7fff
	addi $3, 0x0001
	lui $4, 0x8000
	addi $5, 0x0001
	addi $6, -0x0001
	addi $7, 0x0002
	addi $8, -0x0002

	# No sign change, no overflow
	addu $9, $3, $6

	# No sign change, no overflow
	addu $10, $4, $5

	# Sign change, no overflow
	addu $11, $5, $8

	# Sign change, no overflow
	addu $12, $6, $7

	# Sign change, overflow
	addu $13, $3, $7

	# Sign change, overflow
	addu $14, $4, $8

	# Done
	addi $v0, $zero, 0x000a
	syscall
