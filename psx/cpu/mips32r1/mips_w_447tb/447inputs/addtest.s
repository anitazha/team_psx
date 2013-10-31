        # Basic addition tests
	.text
main:   
        addi $4, $zero, 512
        add  $5, $4, $zero
        add  $6, $5, $5
        add  $7, $6, $6
        addiu $v0, $zero, 0xa
        syscall
