        # Copy of arithtest with all ALU instructions
	.text
main:   
        addiu   $2, $zero, 1024
        addu    $3, $2, $2
        or      $4, $3, $2
        add     $5, $zero, 1234
        sll     $6, $5, 16
        addiu   $7, $6, 9999
        subu    $8, $7, $2
        xor     $9, $4, $3
        xori    $10, $2, 255
        srl     $11, $6, 5
        sra     $12, $6, 4
        and     $13, $11, $5
        andi    $14, $4, 100
        sub     $15, $zero, $10
        lui     $17, 100
        addiu   $18, $zero, 4
        sllv    $19, $2, $18
        srlv    $20, $15, $18
        srav    $21, $15, $18
        addiu   $v0, $zero, 0xa
        syscall
        
        
                        
