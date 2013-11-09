	#
	# Test multiply and memory forwarding
	#
main:
        lui    $3, 0x1000
        addiu  $5, $zero, 20
	addiu  $6, $zero, 3
	mult   $5, $6
	mflo   $7
	addiu  $8, $zero, 9
	add    $9, $7, $8
        
        sw     $5, 0($3)
        sw     $6, 4($3)
        sw     $7, 8($3)
        sw     $8, 12($3)
	sw     $9, 16($3)

        lw     $10, 0($3)
        mthi   $10
        lw     $11, 4($3)
        mult   $8, $11
        lw     $12, 8($3)
	mflo   $13
	add    $13, $12, $13
        lw     $14, 12($3)
	mfhi   $15
	add    $16, $15, $14
	
        addiu $v0, $zero, 0xa
        syscall
