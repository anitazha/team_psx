### Test pipeline behavior with nearby stalls
	.text
main:
	# Create test vector
	lui $10, 0x1000
	ori $11, $zero, 0x1337
	ori $12, $zero, 0xD00D	

	# Initiate multiply
	mult $11, $12

	# Trigger execute stall
	mflo $13

	# Store to memory
	sw $13, 0($10)

	# Trigger delay stall
	lw $14, 0($10)
	or $15, $zero, $14

	# Trigger a bunch of delay stalls
	lw $16, 0($10)
	or $17, $zero, $16
	lw $16, 0($10)
	or $17, $zero, $16
	lw $16, 0($10)
	or $17, $zero, $16
	lw $16, 0($10)
	or $17, $zero, $16
	lw $16, 0($10)
	or $17, $zero, $16

	# Done
	addi $v0, $zero, 0x000a
	syscall
