.text
    lui $a0, 0x1000

    addiu $5, $zero, 0xCAFE
    addiu $6, $zero, 0xBABE
    addiu $7, $zero, 0xBEEF
    addiu $9, $zero, 0xDEAD

    sw $5, 0($a0)
    sw $6, 4($a0)
    sw $7, 8($a0)

    lwc2 $8, 0($a0)
    lwc2 $9, 4($a0)
    lwc2 $10, 8($a0)

    sw $11, 0($a0)
    sw $12, 4($a0)
    sw $13, 8($a0)

    swc2 $9, 12($a0)
    add $11, $9, $9
    lw $12, 12($a0)

    syscall
