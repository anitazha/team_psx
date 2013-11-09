        # Basic multiply coprocessor hack
	.text
main:
  lui   $10, 16384
  addi  $10, $10, 1
  addi  $3, $zero, 4
  mult  $10, $3
  mflo  $4
  mfhi  $5
  lui   $6, 65535
  addi  $7, $zero, 65535
  mtlo  $6
  mthi  $7
  mflo  $8
  mfhi  $9
	addiu $2, $0, 0xa
  syscall
