  #Test each of coprocessor instructions, other than divide 
.text
main:
  addiu $t0, $zero, 2
  addiu $t1, $zero, 10
  mult  $t0, $t1
  mfhi  $t2
  addiu $t4, $t2, 0
  mflo  $t3
  addiu $t5, $t3, 0
  addiu $v0, $zero, 10
  syscall
