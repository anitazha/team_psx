# Perform some arithmetic that creates read-after-write hazards
    .text
main:
    addiu   $3, $zero, 1
    addiu   $4, $3, 2
    add     $5, $4, $3
    add     $3, $4, $5
    add     $6, $4, $3
    add     $6, $6, $6
    add     $7, $6, $3

    addiu   $v0, $zero, 0xa
    syscall

