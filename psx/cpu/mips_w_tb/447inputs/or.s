.text
addiu $8, $zero, 0xff00
addiu $9, $zero, 0x00ff
addiu $11, $zero, 0xff000000
addiu $12, $zero, 0x00ff0000
addiu $14, $zero, 0x00001234
addiu $15, $zero, 0x12340000
addiu $17, $zero, 0x12341234
addiu $18, $zero, 0x12341234
or $10, $8, $9
or $13, $11, $12
or $16, $14, $15
or $19, $17, $18
addiu $2, $0, 10
syscall 
