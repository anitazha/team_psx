# Perform some arithmetic without creating a read-after-write hazard
    .text
main:
    addiu   $3, $zero, 1
    addiu   $4, $zero, 2
    addiu   $5, $zero, 3
    addiu   $6, $zero, 4
    addiu   $7, $zero, 5
    addiu   $8, $zero, 6

    addiu   $v0, $zero, 0xa
    syscall

