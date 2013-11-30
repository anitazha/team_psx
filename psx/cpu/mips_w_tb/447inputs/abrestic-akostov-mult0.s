	#
	# Do a bunch of multiplies which should cause stalls, and forward
	# when possible.
	#
	.text
main:
	addiu   $3, $zero, 256
	addiu 	$4, $zero, 256
	mult	$3, $4
	mflo	$5
	mult	$5, $5
	mfhi	$6
	addiu	$6, $6, 1
	mult	$6, $6
	mflo	$7
	addiu	$7, $7, 2
	addiu	$v0, $zero, 0xa
	syscall
	
	