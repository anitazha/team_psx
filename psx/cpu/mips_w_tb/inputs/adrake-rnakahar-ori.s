### Test the normal operation of ORI
	.text
main:
	# Construct test vectors
	lui $10, 0x3939
	addi $10, 0x3939
	
	# Do not sign extend immediate
	ori $11, $zero, 0x7fff

	# Do not sign extend immediate
	ori $12, $zero, 0xffff

	# Do the operation
	ori $13, $10, 0x6565

	# Done
	addi $v0, $zero, 0x000a
	syscall
