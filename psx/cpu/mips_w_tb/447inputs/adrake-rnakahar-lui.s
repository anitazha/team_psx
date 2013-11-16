### Test normal operation of LUI
	.text
main:
	# Trivial case
	lui $10, 0x1234

	# Don't preserve lower bits
	addi $11, 0x1234
	lui $11, 0x4321

	# Done
	addi $v0, 0x000a
	syscall
