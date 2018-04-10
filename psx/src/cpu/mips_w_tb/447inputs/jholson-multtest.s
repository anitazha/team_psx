		.text
__start:
		lui $8, 0x7FFF
		ori $8, 0xFFFF
        addi $9, 0x2
		mult $8, $9
		mfhi $10
		mflo $11
	addiu $2, $0, 0xa
		syscall
