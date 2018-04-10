  #Basic test of each I-type instruction

.text
main:
  addi  $t0, $zero, 10
  addi  $t1, $t0, -20
  addiu $t2, $t1, 1
  slti  $t3, $t1, 0
  sltiu $t4, $t1, 0
  andi  $t5, $t1, 6
  ori   $t6, $t1, 15
  xori  $t7, $t1, 15
  lui   $s0, 0xc0de
  addiu $v0, $zero, 10
  syscall
