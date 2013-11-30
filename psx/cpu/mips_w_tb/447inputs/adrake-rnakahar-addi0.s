### Test normal operation of ADDI
	.text
main:
	# Construct positive test vector
	addi $10, $zero, 0x0001

	# Construct negative test vector
	addi $11, $zero, -0x0001

	# No sign change, no overflow
	addi $12, $10, 0x0002

	# No sign change, no overflow
	addi $13, $11, -0x0002

	# Sign change, no overflow
	addi $14, $10, -0x0002

	# Sign change, no overflow
	addi $15, $11, 0x0002

	# Done
	addi $v0, $zero, 0x000a
	syscall
