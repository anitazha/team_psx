.text
jal foo
nop
addiu $2, $0, 10
syscall

foo:
jal bar
nop
addiu $2, $0, 10
syscall

bar:
addiu $2, $0, 10
syscall

