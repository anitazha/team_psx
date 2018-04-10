		.text
__start:
        # lw and sw dependencies. lw will stall.
        lui $4, 0x1000
        addi $8, $0, 0x69
        sw   $8, 0($4)
        addi $9, $0, 0x69
        addi $10, $0, 0xbad
        lw $10, 0($4)
        add $11, $9, $10
	addiu $2, $0, 0xa
        syscall
