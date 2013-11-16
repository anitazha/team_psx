### Test normal operation of SRL
	.text
main:
	# Create test vectors
	lui $10, 0x1234
	addi $10, $10, 0x5678
	lui $11, 0x8000

	# Zero shift
	srl $12, $10, 0

	# Shift away
	srl $13, $10, 16
	srl $14, $12, 16

	# Random shift
	srl $15, $10, 7

	# Don't sign extend shift
	srl $16, $11, 16

	# Done
	addi $v0, $zero, 0x000a
	syscall	
