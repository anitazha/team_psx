.text
addiu $8, $0, 0xffffffff
addiu $9, $0, 0x00ff
addiu $11, $0, 0xff00
bltz $9, nottaken
nop
bltz $zero, nottaken
nop
bltz $8, taken
nop
addiu $2, $0, 10
syscall

nottaken:
addiu $2, $0, 10
syscall

taken: 
addiu $2, $0, 10
syscall
