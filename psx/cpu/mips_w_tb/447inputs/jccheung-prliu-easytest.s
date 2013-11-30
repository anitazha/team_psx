        # Basic test for pipeline that is non stalling and non forwarding safe
	.text
main:
	addiu $v0,$zero, 0xa
	lui $3, 0x1000
        addi $4, $zero, 0x9001
        addi $5, $zero, 0x9002
        addi $6, $zero, 0x9003
        addi $7, $zero, 0x9004

	ori $23, $zero, 0x00ff

	addi $8, $4, 0x9000
	sub $9, $zero, $5
	and $10, $4, $5
	or $11, $4, $5

	sw $23, 0($3)

	xor $12, $8, $5
	nor $13, $9, $5
	sub $14, $10, $4
	sub $15, $11, $4

	lw $24, 0($3)


        syscall
