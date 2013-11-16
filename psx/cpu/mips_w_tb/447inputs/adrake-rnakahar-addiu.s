### Test normal operation of ADDIU
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

	# Don't sign extend immediate
	addiu $7, $zero, 0x7fff

	# Do sign extend immediate
	addiu $8, $zero, -0x8000

	# No sign change, no overflow
	addiu $9, $3, -0x0001

	# No sign change, no overflow
	addiu $10, $4, 0x0001

	# Sign change, no overflow
	addiu $11, $5, -0x0002

	# Sign change, no overflow
	addiu $12, $6, 0x0002

	# Sign change, overflow
	addiu $13, $3, 0x0002

	# Sign change, overflow
	addiu $14, $4, -0x0002

	# Done
	addi $v0, $zero, 0x000a
	syscall
