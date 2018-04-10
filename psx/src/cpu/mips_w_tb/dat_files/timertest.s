    .text
main:
    lui $3, 0x1f80

    addiu  $5, $zero, 120
    addiu  $6, $zero, 0xbabe
    addiu  $7, $zero, 0xbeef
    addiu  $8, $zero, 100

    sh $5, 4356($3)
    sh $8, 4360($3)

    lh $7, 4352($3)
    lh $8, 4352($3)
    lh $9, 4352($3)
    lh $10, 4352($3)
    lh $11, 4352($3)
    lh $12, 4352($3)

    syscall
