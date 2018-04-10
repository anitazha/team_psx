		.text
__start:
        # Multiply stall
        lui $4, 0x1000
        lui $8, 0x7FFF
        ori $8, 0xFFFF
        addi $9, 0x8
        mult $8, $9
        mfhi $10
        mflo $11
        add $12, $10, $10
	addiu $2, $0, 0xa
        syscall
