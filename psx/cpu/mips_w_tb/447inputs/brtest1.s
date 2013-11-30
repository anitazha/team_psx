        # Advanced branch test
	.text

        # J, JR, JAL, JALR, BEQ, BNE, BLEZ, BGTZ, BLTZ, BGEZ, BLTZAL, BGEZAL
        # BLTZAL, BGEZAL
main:
        addiu $v0, $zero, 0xa

        # Set up some comparison values in registers
        addiu $3, $zero, 1
        addiu $4, $zero, -1

        # Checksum register
        addiu $5, $zero, 0x1234

        # Test jump
        j l_1
        nop
l_0:
        addu $5, $5, $ra
        beq   $zero, $zero, l_2
        nop
l_1:
        addiu $5, $5, 7
        jal l_0
        nop
        j l_8
        nop
l_2:    
        addiu $5, $5, 9
        bne $3, $4, l_4
        nop
l_3:
        # Taken
        addiu $5, $5, 5
        bgez $zero, l_6
        nop
l_4:
        # Not taken
        addiu $5, $5, 11
        blez  $3, l_3
        nop
l_5:
        # Taken
        addiu $5, $5, 99
        bgtz  $3, l_3
        nop
l_6:
        # here
        addiu $5, $5, 111
        jr $ra
        nop
        # Should go to l_1, then go to l_8
l_7:
        # Should not get here
        addiu $5, $5, 200
        
        syscall
l_8:    
        addiu $5, $5, 215
        jal l_10
        nop
l_9:
        # Should not get here
        addiu $5, $5, 1
        syscall        
l_10:    
        addu $5, $5, $6
        bltzal $4, l_12
        nop
l_11:
        # Should not get here
        addiu $5, $5, 400
        syscall
l_12:    
        addu $5, $5, $6
        bgezal $4, l_11
        nop
        
l_13:    
        nop
        addiu $5, $5, 0xbeb0063d
        syscall
        
        
