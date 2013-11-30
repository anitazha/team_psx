### Test forwarding-induced load delay slot characteristics
	.text
main:
	# Create test vectors
	lui $10, 0x1000
	lui $11, 0x1337
	ori $11, $11, 0xD00D

	# Store
	sw $11, 0($10)

	# Load and delay
	lw $12, 0($10)
	nop

	# Copy
	add $13, $zero, $12
	add $14, $zero, $12

	# Load and don't delay
	lw $15, 0($10)

	# Copy
	add $16, $zero, $15
	add $17, $zero, $15

	# Done
	addi $v0, $zero, 0x000a
	syscall
