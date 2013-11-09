# Perform some arithmetic without creating a read-after-write hazard
    .text
main:
    lui     $3, 0x1000
    nop
    nop
    nop
    addiu   $3, $3, 4
    addiu   $4, $zero, 2
    nop
    nop
    nop
    sw      $4, 0($3)
    addiu   $5, $zero, 17
    addiu   $6, $zero, 93

    addiu   $v0, $zero, 0xa
    syscall

