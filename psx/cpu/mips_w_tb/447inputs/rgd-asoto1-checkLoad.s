# Test quarantined by request -- violates MULT/MTHI ordering in spec

	.text
main:
	addiu	$v0, $zero, 0xa
	syscall
