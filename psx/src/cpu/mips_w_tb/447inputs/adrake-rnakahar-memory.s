### Test pipeline behavior under heavy memory access
	.text
main:
	# Initialize indices
	lui $10, 0x1000
	lui $11, 0x1000
	addi $11, $11, 0x0004
	lui $12, 0x1337
	ori $12, $12, 0xD00D

	# Build up pointer table x2
	sw $11, 0($10)
	addi $10, $10, 4
	addi $11, $11, 4
	sw $11, 0($10)
	addi $10, $10, 4
	addi $11, $11, 4

	# Save light at the end of the tunnel
	sw $12, 0($10)

	# Reinitialize index
	lui $10, 0x1000

	# Dereference x1
	lw $10, 0($10)
	lw $10, 0($10)

	# Read light at the end of the tunnel
	lw $13, 0($10)

	# Done
	addi $v0, $zero, 0x000a
	syscall
