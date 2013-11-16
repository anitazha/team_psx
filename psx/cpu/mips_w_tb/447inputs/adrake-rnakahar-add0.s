### Test normal operation of ADD
	.text
main:
	# Construct positive test vectors
	addi $10, $zero, 0x0001
	addi $11, $zero, 0x0002

	# Construct negative test vectors
	addi $12, $zero, -0x0001
	addi $13, $zero, -0x0002

	# No sign change, no overflow
	add $14, $10, $11

	# No sign change, no overflow
	add $15, $12, $13

	# Sign change, no overflow
	add $16, $10, $13

	# Sign change, no overflow
	add $17, $12, $11

	# Done
	addi $v0, $zero, 0x000a
	syscall
