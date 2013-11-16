.text
j foo
nop
addiu $2, $0, 10
syscall

foo:
j bar
nop
addiu $2, $0, 10
syscall

bar:
addiu $2, $0, 10
syscall 
