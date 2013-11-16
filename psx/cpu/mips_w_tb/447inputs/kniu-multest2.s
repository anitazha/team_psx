        # More multiplication co-processor tests
	.text
main:   
        addi  $4, $zero, 3
        addi  $5, $4, 1
        mult  $4, $5
        mfhi  $6
        mflo  $7
        add   $6, $7, $7
				addiu $2, $0, 0xa
        syscall
