### Test normal operation of MFLO
	.text
main:
	# Construct test vector
	lui $10, 0x1234
	addi $10, $10, 0x5678

	# Move into LO
	mtlo $10

	# Move from LO
	mflo $11


    # timing issue
    nop
    nop
    nop
	# Done
	addi $v0, $zero, 0x000a
	syscall
