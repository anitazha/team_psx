.text
addiu $8, $zero, 0xffffffff
addiu $9, $zero, 0x00ff
addiu $11, $zero, 0xff00

bgtz $zero, nottaken
nop
bgtz $8, nottaken
nop
bgtz $9, taken1
nop
addiu $2, $0, 10
syscall

nottaken:
addiu $2, $0, 10
syscall

taken1:
addiu $2, $0, 10
syscall
