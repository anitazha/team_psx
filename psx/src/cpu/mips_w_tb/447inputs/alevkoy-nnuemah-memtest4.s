    # Basic LW/SW test
	.text
main:
    # Set a base address
    lui     $3, 0x1000

    addiu   $5, $zero, 255
    addiu   $6, $zero, 510
    addiu   $7, $zero, 1020
    addiu   $8, $zero, 31020

    # Place a test pattern in memory
    sw      $5, 0($3)
    sw      $6, 4($3)
    sw      $7, 8($3)
    sw      $8, 12($3)

    lw      $9,  0($3)
    lw      $10, 4($3)
    lw      $11, 8($3)
    lw      $12, 12($3)

    addiu   $3, $3, 4
    sw      $5, 0($3)
    sw      $6, 4($3)
    sw      $7, 8($3)
    sw      $8, 12($3)

    lw      $13,  -4($3)
    lw      $14,  0($3)
    lw      $15,  4($3)
    lw      $16,  8($3)

    # Quit out 
    addiu   $v0, $zero, 0xa
    syscall

