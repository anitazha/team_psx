.text

addiu $2, $0, 10
    jal loop
    addiu $3, $0, 40

loop:
    addiu $3, $0, 40
    jal before
    syscall
before:
    jr $ra
