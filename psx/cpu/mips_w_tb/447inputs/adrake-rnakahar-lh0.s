### Test normal operation of LH
	.text
main:
	# Construct test vectors
	lui $10, 0x1000
	lui $11, 0x1000
	addi $11, 0x0001
	lui $12, 0x8765
	addi $12, $12, 0x4321

	# Store word aligned
	sw $12, 0($10)

	# Load word aligned
	lh $13, 0($10)

	# Load word also aligned
	lh $14, 2($10)

	# Load word also aligned
	lh $15, 1($11)

	# Load word also aligned
	lh $16, -1($11)
	
	# Done
	addi $v0, $zero, 0x000a
	syscall
