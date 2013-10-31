		.text
__start:	add $a0, $zero, 10
                add $a1, $zero, 11
                add $17, $zero, 11
                add $17, $17, 11
                add $17, $17, 11
                add $17, $17, 14
                add $17, $17, 11
                add $17, $17, 20
                add $17, $17, 11
                add $17, $17, 15
                add $17, $17, 11
                addiu $v0, $zero, 0xa
                syscall
