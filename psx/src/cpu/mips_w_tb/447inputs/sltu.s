.text
addiu $8, $zero, 10
addiu $9, $zero, 20
addiu $10, $zero, -10
addiu $11, $zero, -20


sltu $12, $8, $9
sltu $13, $9, $8
sltu $14, $8, $10
sltu $15, $10, $8
sltu $16, $10, $11
sltu $17, $11, $10
addiu $2, $0, 10
syscall
