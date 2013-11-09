		.text
__start:
        # Basic rs dependencies from various distances
		addi $8, $0, 0x69
		addi $8, $8, 0x69
		addi $8, $8, 0x69
		addi $9, $8, 0x69
		addi $9, $8, 0x69
        addi $10, $8, 4
        nop
        nop
        nop
        addi $11, $0, 0x69
        nop
        addi $12, $11, 0x69
        nop
        nop
        nop
        addi $13, $0, 0x69
        nop
        nop
        addi $14, $13, 0x69
        addi $2, $0, 0xa
        syscall
