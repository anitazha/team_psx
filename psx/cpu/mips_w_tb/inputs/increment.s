        # Increment a variable
	.text
main:
	addiu $v0, $zero, 0xa
	addiu $3, $zero, 1
	addi   $3, $3, 2
	addi   $3, $3, 4
        addi   $3, $3, 8
	addi   $3, $3, 16
	addi   $3, $3, 32
	addi   $3, $3, 64
	addi   $3, $3, -1200
	addi   $3, $3, 128
	addi   $3, $3, 256
	addi   $3, $3, 512
	addi   $3, $3, 1024
	addi   $3, $3, 2048
	addi   $3, $3, 4096
	addi   $3, $3, 8192
	addi   $3, $3, 16384
	syscall

	