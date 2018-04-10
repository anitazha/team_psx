.text
addiu $t0, $0, 10
blez $t0, bad
nop
addiu $t0, $0, -10
blez $t0, foo
nop
j bad
nop

foo:
addiu $t0, $0, 0
blez $t0, good
nop
j bad
nop

good:
addiu $v1, $0, 0x5678
addiu $v0, $0, 10
syscall

bad:
addiu $v1, $0, 0x1234
addiu $v0, $0, 10
syscall
