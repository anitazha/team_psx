### Test normal operation of LBU
	.text
main:
	# Construct test vectors
	lui $10, 0x1000
	lui $11, 0x8765
	addi $11, $11, 0x4321

	# Store word aligned
	sw $11, 0($10)

	# Load byte
	lbu $12, 0($10)

	# Load byte
	lbu $13, 1($10)

	# Load byte
	lbu $14, 2($10)

	# Load byte
	lbu $15, 3($10)

	# Done
	addi $v0, $zero, 0x000a
	syscall
