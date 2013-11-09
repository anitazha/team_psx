    # Variable shift tests
	.text
main:   
    ori     $3, $zero, 65535
    ori     $10, $zero, 16
    ori     $11, $zero, 6
    ori     $12, $zero, 10
    ori     $13, $zero, 8

    sll     $4, $3, $10
    sll     $5, $3, $11
    sra     $6, $4, $12
    sra     $7, $5, $10
    srl     $8, $4, $13
    srl     $9, $5, $10

    addiu   $2, $zero, 0xa
    syscall
