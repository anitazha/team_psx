# Test pipeline stalling or forwarding
	.text
main:
	# Zero bubble gap
	addiu $3, $zero, 0x1337
	addu $4, $zero, $3
	addu $5, $zero, $4

	# One bubble gap	
	addiu $6, $zero, 0x1338
	nop
	addu $7, $zero, $6
	nop
	addu $8, $zero, $7

	# Two bubble gap
	addiu $9, $zero, 0x1339
	nop
	nop
	addu $10, $zero, $9
	nop
	nop
	addu $11, $zero, $10

	# Three bubble gap
	addiu $12, $zero, 0x133a
	nop
	nop
	nop
	addu $13, $zero, $12
	nop
	nop
	nop
	addu $14, $zero, $13

	# Four bubble gap
	addiu $15, $zero, 0x133b
	nop
	nop
	nop
	nop
	addu $16, $zero, $15
	nop
	nop
	nop
	nop
	addu $17, $zero, $16

	# Flush pipeline
	addi $v0, $zero, 0x000a
	syscall
