.text
addiu $8, $zero, 0xffff
addiu $9, $zero, 0x00ff
addiu $11, $zero, 0xff00

bgezal $8, nottaken
nop
addiu $2, $0, 10
syscall

nottaken:
addiu $2, $0, 10
syscall

taken1:
bgez $zero, taken2
nop
addiu $2, $0, 10
syscall

taken2:
addiu $2, $0, 10
syscall
