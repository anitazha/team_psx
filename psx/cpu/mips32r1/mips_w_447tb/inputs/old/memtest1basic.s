        .text
main:
        addiu  $5, $zero, 32999
        addiu  $6, $zero, 0xfeca
        addiu  $7, $zero, 0xbeef
        addiu  $8, $zero, 0xefbe
        addiu $v0, $zero, 0xa
        syscall
        
