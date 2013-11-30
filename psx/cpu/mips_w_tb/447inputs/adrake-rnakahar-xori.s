### Test the normal operation of XORI
	.text
main:
	# Construct test vectors
	lui $10, 0x3939
	addi $10, 0x3939
	
	# Do not sign extend immediate
	xori $11, $zero, 0x7fff

	# Do not sign extend immediate
	xori $12, $zero, 0xffff

	# Do the operation
	xori $13, $10, 0x6565

	# Done
	addi $v0, $zero, 0x000a
	syscall
