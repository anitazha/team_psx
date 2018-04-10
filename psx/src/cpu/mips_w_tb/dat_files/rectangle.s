init:
    # gpu registers in r3 and r4
    lui $3, 0x1F80
    ori $3, $3, 0x1810
    lui $4, 0x1F80
    ori $4, $4, 0x1814

draw:
    addiu $5, $zero, 0xE3000C03
    addiu $6, $zero, 0xE403CD43
    addiu $7, $zero, 0xE5001002
    sw $5, 0($3)
    sw $6, 0($3)
    sw $7, 0($3)

    addiu $5, $zero, 0x05000C03
    addiu $6, $zero, 0x06A00000
    addiu $7, $zero, 0x0703C000
    addiu $8, $zero, 0x08000001
    sw $5, 0($4)
    sw $6, 0($4)
    sw $7, 0($4)
    sw $8, 0($4)

    addiu $5, $zero, 0xE6000000
    sw $5, 0($3)

    addiu $5, $zero, 0x03000000
    sw $5, 0($4)

    addiu $5, $zero, 0x02000A00
    addiu $6, $zero, 0x00020002
    addiu $7, $zero, 0x00F40144
    sw $5, 0($3)
    sw $6, 0($3)
    sw $7, 0($3)

    addiu $5, $zero, 0x6000000D
    addiu $6, $zero, 0x00050005
    addiu $7, $zero, 0x00140014
    sw $5, 0($3)
    sw $6, 0($3)
    sw $7, 0($3)

    addiu $5, $zero, 0x6800FFFF
    addiu $6, $zero, 0x005A005A
    sw $5, 0($3)
    sw $6, 0($3)

loop:
    nop
    j loop
