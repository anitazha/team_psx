.text
addiu $8,  $zero, 0xcccccccc
addiu $9,  $zero, 1
addiu $11, $zero, 10
addiu $13, $zero, 0xcccccccc
addiu $14, $zero, 32
addiu $16, $zero, 0xcccccccc
addiu $17, $zero, 40
sllv $10, $8, $9
sllv $12, $8, $11
sllv $15, $13, $14
sllv $18, $16, $17
addiu $2, $0, 10
syscall
