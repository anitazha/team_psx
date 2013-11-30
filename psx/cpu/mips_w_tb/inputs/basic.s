.text
    addiu $5, $zero, 10
    addiu $6, $zero, 11
    mtc2  $5, $5
    ctc2  $6, $6
    mfc2  $7, $5
    cfc2  $8, $6
    syscall
