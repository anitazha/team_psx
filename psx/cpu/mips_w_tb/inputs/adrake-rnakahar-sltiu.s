### Tests normal operation of SLTIU
	.text
main:
	# Zero less than positive
	sltiu $3, $zero, 0x7fff

	# Zero less than zero
	sltiu $4, $zero, 0x0000

	# Zero less than negative
	sltiu $5, $zero, -0x8000

	# Create test vectors
	addi $6, $zero, 0x0002
	addi $7, $zero, -0x0002

	# Positive less than negative
	sltiu $8, $6, -0x0001

	# Positive less than positive
	sltiu $9, $6, 0x0001

	# Positive less than positive
	sltiu $10, $6, 0x0002

	# Positive less than positive
	sltiu $11, $6, 0x0003

	# Negative less than negative
	sltiu $12, $7, -0x0003

	# Negative less than negative
	sltiu $13, $7, -0x0002

	# Negative less than negative
	sltiu $14, $7, -0x0001

	# Negative less than positive
	sltiu $15, $7, 0x0001

        # Don't preserve old contents of register
	lui $16, 0x1234
	addi $16, $16, 0x5678
	sltiu $16, $zero, 0x0001

	# Done
	addi $v0, $zero, 0x000a
	syscall
