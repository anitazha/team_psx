### Test pipeline behavior when forwarding many values
	.text
main:
	# Do some random math with lots of dependencies
	ori $3, 0x1111
	ori $4, 0x2222
	ori $5, 0x4444
	ori $6, 0x8888
	or $7, $3, $4
	or $7, $7, $5
	or $8, $5, $6
	or $9, $6, $7
	addu $10, $7, $8
	addu $11, $8, $9
	addu $12, $9, $10
	xor $13, $10, $11
	xor $14, $11, $12
	xor $15, $12, $13
	subu $16, $13, $14
	subu $17, $14, $15

	# Done
	addi $v0, $zero, 0x000a
	syscall

