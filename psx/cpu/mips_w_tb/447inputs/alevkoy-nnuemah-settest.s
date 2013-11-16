    .text
__start:
    addiu   $3, $zero, 10
    addiu   $4, $zero, -4
    slt     $5, $4, $3      # 1
    slt     $6, $3, $4      # 0
    sltu    $7, $4, $3      # 0
    sltu    $8, $3, $4      # 1

    addiu   $v0, $zero, 0xa
    syscall

