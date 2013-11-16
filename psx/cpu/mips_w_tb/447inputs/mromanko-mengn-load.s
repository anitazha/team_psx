  #Basic load test without the need for store
.text
main:
  lui   $t0, 0x0040
  lw    $t1, 0($t0)
  lh    $t2, 0($t0)
  lhu   $t3, 0($t0)
  addiu  $v0, $zero, 10
  syscall 
