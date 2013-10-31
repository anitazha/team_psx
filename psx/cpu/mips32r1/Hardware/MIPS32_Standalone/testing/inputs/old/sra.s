.text
        addiu $10, $zero, 0x12345678
        addiu $11, $zero, 0x80000000

        sra $11, $10, 0

        # Shift away
        sra $13, $10, 16
        sra $14, $12, 16

        # Random shift
        sra $15, $10, 7

        # Don't sign extend shift
        sra $16, $11, 16

addiu $2, $0, 10
syscall

