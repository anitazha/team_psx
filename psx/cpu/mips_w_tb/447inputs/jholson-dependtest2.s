		.text
__start:
        # Basic rs and rt dependencies
		addi $8, $0, 0x69
		addi $9, $0, 0x69
        add $10, $8, $9
        add $11, $8, $9
        add $12, $9, $11
        # Make sure forwarding picks youngest
        addi $13, $0, 0xbad
        addi $13, $0, 0x69
        add $14, $0, $13
        add $15, $13, $0
	addiu $2, $0, 0xa
        syscall
