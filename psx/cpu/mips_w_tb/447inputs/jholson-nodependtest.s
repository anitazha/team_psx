		.text
__start:
        lui  $3, 0x1000 # Base address
		addi $8, $0, 0x69
		addi $9, $0, 0x69 # Test sign extend_imm
		nop
		nop
        addi $4, $3, 4 # Base address + 4
        nop
		nop
		nop
        # Test various ALU functions
		add $10, $8, $9
        andi $11, $8, 0xf # Test zero extend_imm
        sll $12, $8, 8    # Test shamt and alu_op1_src
        # Test memory
        sw  $8, 4($3)
        lw  $15, ($4)
	addiu $2, $0, 0xa
        syscall
