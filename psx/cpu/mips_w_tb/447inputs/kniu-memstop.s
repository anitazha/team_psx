        # Basic multiplication co-processor tests
	.text
main:
        lui   $3, 0x1000
        addi  $3, $3, 1
        addi  $4, $0, 1
        addi  $5, $0, 2
        addi  $6, $0, 3
        subu  $7, $0, $4
        subu  $8, $0, $5
        subu  $9, $0, $6
        sb    $7, 0($3)
        sh    $8, 1($3)
        sw    $9, 3($3)
        lb    $10, 0($3)
        lh    $11, 1($3)
        lw    $12, 3($3)
        add   $3, $0, 0
        add   $4, $0, 0
        add   $5, $0, 0
        add   $6, $0, 0
        add   $7, $0, 0
        add   $8, $0, 0
        add   $9, $0, 0
				addiu $2, $0, 0xa
        syscall
