.text
addiu $8, $zero, 0xff00
addiu $9, $zero, 0x00ff
addiu $11, $zero, 0xff00

beq $8, $9, nottaken
beq $zero, $zero, taken1
addiu $2, $0, 10
syscall

nottaken:
addiu $2, $0, 10
syscall

taken1:
beq $8, $11, taken2
addiu $2, $0, 10
syscall

taken2: 
addiu $2, $0, 10
syscall

