        # Basic test for pipeline that is non stalling and non forwarding safe
	.text
main:
	addiu $v0,$zero, 0xa
        addi $4, $zero, 10001
        addi $5, $zero, 20002
        addi $6, $zero, 30003
        addi $7, $zero, 40004

	ori $23, $zero, 0x00ff

	add $8, $4, $4
	add $9, $4, $5
	add $10, $4, $6
	add $11, $4, $7


	sub $12, $8, $4
	sub $13, $9, $4
	sub $14, $10, $4
	sub $15, $11, $4


	sll $16, $4, 1
	sll $17, $5, 1
	sll $18, $6, 1
	sll $19, $7, 1

	ori $20, $zero, 0xdead
	ori $21, $zero, 0xbeef
	ori $22, $zero, 0x0251


        syscall
