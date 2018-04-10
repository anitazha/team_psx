### Test normal operation of SYSCALL
	.text
main:
	# Done
	addi $v0, $zero, 0x000a
	syscall
