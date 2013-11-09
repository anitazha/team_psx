### Test normal operation of SRA
	.text
main:
	# Create test vectors
	lui $10, 0x8765
	addi $10, $10, 0x4321

	# Zero shift
	sra $11, $10, 0

	# Shift away, sign extend
	sra $12, $10, 16
	sra $13, $12, 16

	# Random shift, sign extend
	sra $14, $10, 7

	# Done
	addi $v0, $zero, 0x000a
	syscall	
