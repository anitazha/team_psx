    .text
__start:	addiu   $v0, $zero, 10
    addi    $v0, $v0, -5
    addiu   $t1, $v0, 300
    addi    $t2, $t1, -50
    addi    $t3, $v0, -10
    addiu   $v0, $zero, 10
    syscall
