# Some boolean I-type and R-type instructions
    .text
main:
    ori     $3, $zero, 0xaaaa
    sll     $4, $3, 16
    ori     $4, $4, 0xaaaa
    andi    $5, $4, 0xffff
    xori    $6, $4, 0xffff
    addiu   $7, $zero, 0xaa55
    nor     $7, $3, $7

    addiu   $v0, $zero, 0xa
    syscall

