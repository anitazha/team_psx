### Tests normal operation of SLTU
	.text
main:
	# Create test vectors
	addi $3, $zero, -0x0002
	addi $4, $zero, -0x0001
	addi $5, $zero, 0x0000
	addi $6, $zero, 0x0001
	addi $7, $zero, 0x0002

	# Positive less than positive
	sltu $8, $6, $7

	# Positive less than positive
	sltu $9, $7, $7

	# Positive less than positive
	sltu $10, $7, $6

	# Positive less than zero
	sltu $11, $6, $5

	# Positive less than negative
	sltu $12, $6, $4

	# Negative less than negative
	sltu $13, $3, $4

	# Negative less than negative
	sltu $14, $4, $4

	# Negative less than negative
	sltu $15, $4, $3

	# Negative less than zero
	sltu $16, $4, $5

	# Negative less than positive
	sltu $17, $4, $6

	# Don't preserve old contents of register
	lui $6, 0x1234
	addi $6, $6, 0x5678
	slti $6, $5, 0x0001

	# Done
	addi $v0, $zero, 0x000a
	syscall
