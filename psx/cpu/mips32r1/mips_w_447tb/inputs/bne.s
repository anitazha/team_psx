.text
addiu  $8, $0, 0xff00
addiu  $9, $0, 0x00ff
addiu  $11,$0,  0xff00
bne $8, $11, nottaken
bne $zero, $zero, nottaken
bne $9, $11, taken
addiu $2, $0, 10
syscall

nottaken:
addiu $2, $0, 10
syscall

taken:
addiu $2, $0, 10
syscall
