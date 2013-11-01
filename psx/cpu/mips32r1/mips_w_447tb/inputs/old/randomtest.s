.text
 lui $a0, 0x1000
 addiu $t0, $zero, 0x42
 sw $t0, 0($a0)
 lb $t1, 0($a0) 
 add $t2, $zero, $t1
 syscall 
