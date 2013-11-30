		.text
__start:
		addiu $8, $zero, 10
		addiu $9, $zero, 15
		addi $10, $zero, 10
		addi $11, $zero, 12
# True
		slti $12, $10, 14
# False
		slti $13, $10, 5
# False
		slti $14, $10, -5
# True
		sltiu $15, $10, -5
# 1010 & 1101 = 1000 = 8
		andi $16, $10, 13
# 1010 | 1101 = 1111 = 15
		ori $17, $10, 13
# 1010 ^ 1101 = 0111 = 7
		xori $18, $10, 13
	addiu $2, $0, 0xa
		syscall
