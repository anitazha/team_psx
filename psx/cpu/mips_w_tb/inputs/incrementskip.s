        # Increment two variables, interleaved
        .text
main:
        addiu $v0, $zero, 0xa
        addiu $3, $zero, 1
        addiu $4, $zero, 7
        addi   $3, $3, 2
        addi   $4, $4  99
        addi   $3, $3, 4
        addi   $4, $4  99
        addi   $3, $3, 8
        addi   $4, $4  99
        addi   $3, $3, 16
        addi   $4, $4  99
        addi   $3, $3, 32
        addi   $4, $4  99
        addi   $3, $3, 64
        addi   $4, $4  99
        addi   $4, $4  99
        addi   $3, $3, 128
        addi   $4, $4  99
        addi   $3, $3, 256
        addi   $4, $4  99
        addi   $3, $3, 512
        addi   $4, $4  99
        addi   $3, $3, 1024
        addi   $4, $4  99
        addi   $3, $3, 2048
        addi   $4, $4  99
        addi   $3, $3, 4096
        addi   $4, $4  99
        addi   $3, $3, 8192
        addi   $4, $4  99
        addi   $3, $3, 16384
        syscall
                        

