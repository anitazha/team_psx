.text
foo:
jal foo2
nop
j foo
nop

foo2:
addiu $v0, $0, 10
syscall
