### Test normal operation of SLL
	.text
main:
	# Create test vector
	lui $10, 0x1234
	addi $10, $10, 0x5678

	# Zero shift
	sll $11, $10, 0

	# Shift away
	sll $12, $10, 16
	sll $13, $12, 16

	# Random shift
	sll $14, $10, 7

	# Done
	addi $v0, $zero, 0x000a
	syscall	
