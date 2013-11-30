        # Basic half word/full word
	.text
main:
        #;;  Set a base address
        lui    $3, 0x1000

        addiu  $20, $zero, 0x0400
        addiu  $21, $zero, 0x0401
        addiu  $22, $zero, 0x0401
        mtc0   $20, $13 # enable interrupts
        mtc0   $21, $12
        sh     $22, 4212($3)
        addiu  $5, $zero, 0xcafe
        addiu  $6, $zero, 0xfeca
        addiu  $7, $zero, 0xbeef
        addiu  $8, $zero, 0xefbe
                
        #;; Place a test pattern in memory
        sb     $5, 0($3)
        sb     $6, 1($3)
        sb     $7, 6($3)
        sb     $8, 7($3)

        lbu     $9,  0($3)
        lbu     $10, 1($3)
        lb      $11, 6($3)
        lb      $12, 7($3)

        addiu  $3, $3, 4
        sh     $5, 0($3)
        sh     $6, 2($3)
        sh     $7, 4($3)
        sh     $8, 6($3)

        lhu     $13,  0($3)
        lhu     $14,  2($3)
        lh     $15,  4($3)
        lh     $16,  6($3)
               
        #;; Calculate a "checksum" for easy comparison
        add    $17, $zero, $9
        add    $17, $17, $10
        add    $17, $17, $11
        add    $17, $17, $12
        add    $17, $17, $13
        add    $17, $17, $14
        add    $17, $17, $15
        add    $17, $17, $16
        
        #;;  Quit out 
        addiu $v0, $zero, 0xa
        syscall
        
    .ktext
        lw     $23, 4208($3)
        sw     $0, 4208($3)
        mfc0 $k0, $14 # get EPC in $k0
        rfe           # return from exception
        jr $k0
