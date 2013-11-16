### Tests normal operation of SLT
	.text
main:
	# Create test vectors
	addi $3, $zero, -0x0002
	addi $4, $zero, -0x0001
	addi $5, $zero, 0x0000
	addi $6, $zero, 0x0001
	addi $7, $zero, 0x0002

	# Positive less than positive
	slt $8, $6, $7

	# Positive less than positive
	slt $9, $7, $7

	# Positive less than positive
	slt $10, $7, $6

	# Positive less than zero
	slt $11, $6, $5

	# Positive less than negative
	slt $12, $6, $4

	# Negative less than negative
	slt $13, $3, $4

	# Negative less than negative
	slt $14, $4, $4

	# Negative less than negative
	slt $15, $4, $3

	# Negative less than zero
	slt $16, $4, $5

	# Negative less than positive
	slt $17, $4, $6

        # Don't preserve old contents of register
	lui $6, 0x1234
	addi $6, $24, 0x5678
	slt $6, $4, $5

	# Done
	addi $v0, $zero, 0x000a
	syscall
