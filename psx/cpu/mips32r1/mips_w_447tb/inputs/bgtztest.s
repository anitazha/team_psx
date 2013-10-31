.text
addiu $8, $0, 0xffffffff
addiu $9, $0, 0x00ff
addiu $11, $0, 0xff00
addiu $t0, $0, 10
bgtz $t0, foo
j bad
foo:
addiu $t0, $0, 0
bgtz $t0, bad
addiu $t0, $0, -10
bgtz $t0, bad
j good

good:
addiu $v1, $0, 0x5678
addiu $v0, $0, 10
syscall

bad:
addiu $v1, $0, 0x1234
addiu $v0, $0, 10
syscall
