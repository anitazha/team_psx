### Test normal operation of SUB
	.text
main:
	# Construct positive test vectors
	addi $10, $zero, 0x0001
	addi $11, $zero, 0x0002

	# Construct negative test vectors
	addi $12, $zero, -0x0001
	addi $13, $zero, -0x0002

	# No sign change, no overflow
	sub $14, $11, $10

	# No sign change, no overflow
	sub $15, $10, $13

	# No sign change, no overflow
	sub $16, $13, $12

	# No sign change, no overflow
	sub $9, $12, $11

	# Sign change, no overflow
	sub $8, $10, $11

	# Sign change, no overflow
	sub $7, $12, $13

	# Done
	addi $v0, $zero, 0x000a
	syscall
