.text
addiu $t0, $0, 10
addiu $t1, $0, 11
addiu $v0, $0, 10
beq $t0, $t1, bad
nop
addiu $t1, $0, 10
beq $t0, $t1, good
nop
j bad
nop

bad:
addiu $v1, $0, 0x1234
syscall

good:
addiu $v1, $0, 0x5678
syscall

