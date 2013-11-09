### Test the normal operation of ANDI
	.text
main:
	# Construct test vectors
	lui $10, 0x3939
	addi $10, 0x3939
	
	# Do not sign extend immediate
	andi $11, $10, 0x7fff

	# Do not sign extend immediate
	andi $12, $10, 0xffff

	# Do the operation
	andi $13, $10, 0x6565

	# Done
	addi $v0, $zero, 0x000a
	syscall
