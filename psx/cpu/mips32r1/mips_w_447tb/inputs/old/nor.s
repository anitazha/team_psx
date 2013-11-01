.text
addiu  $8, $zero, 0xff00
addiu  $9, $zero, 0x00ff
addiu  $11, $zero, 0xff00
addiu  $12, $zero, 0xff00
addiu  $14, $zero, 0xff000000
addiu  $15, $zero, 0x00ff0000
addiu  $17, $zero, 0xffff0000 
addiu  $18, $zero, 0xffff0000
addiu  $20, $zero, 0x12340000
addiu  $21, $zero, 0x00001234
addiu  $23, $zero, 0x12341234
addiu  $24, $zero, 0x12341234
nor $10, $8, $9
nor $13, $11, $12
nor $16, $14, $15
nor $19, $17, $18
nor $22, $20, $21
nor $25, $23, $24
addiu $2, $0, 10
syscall 
