boot:
    

init:
    # gpu registers in r3 and r4
    lui $3, 0x1F80
    ori $3, $3, 0x1810
    lui $4, 0x1F80
    ori $4, $4, 0x1814

    # init
    addiu $5, $zero, 0x6000000D # color
    addiu $7, $zero, 0x00140004 # paddle width, height
    addiu $6, $zero, 0x00050005 # paddle0 x,y
    addiu $10, $zero, 0x00a000a0 # paddle1 x,y
    addiu $8, $zero, 0x00800008 # ball x, y
    addiu $9, $zero, 0x00040004 # ball width, height
    addiu $30, $zero, 0 # ball direction, 0 is right

draw:
    # draw paddle0
    sw $5, 0($3)
    sw $6, 0($3)
    sw $7, 0($3)

    # draw paddle1
    sw $5, 0($3)
    sw $10, 0($3)
    sw $7, 0($3)

    # draw ball
    sw $5, 0($3)
    sw $8, 0($3)
    sw $9, 0($3)

game:
    lui $11, 0x1f80
    ori $11, $11, 0x1000
    lw $12, 0($11)
    # if up ^ down player 0
    xori $13, $12, 0xC0
    beq $13, $zero, move_paddle0
    # if up ^ down player 1
    xori $13, $12, 0x0C
    beq $13, $zero, move_paddle1
    j move_ball

move_ball:
    andi $13, $8, 0xFFFF0000 # ball x
    andi $14, $6, 0xFFFF0000 # paddle0 x
    andi $15, $10, 0xFFFF0000 # paddle1 x
    beq $13, $14, move_ball_right
    beq $13, $15, move_ball_left
    beq $30, $zero, move_ball_right
    j move_ball_left

move_ball_left:
    subu $8, 0x30000
    j draw

move_ball_right:
    addu $8, 0x30000
    j draw

move_paddle0:
    andi $13, $12, 0x80
    bne $13, $zero, move_paddle0_up
    andi $13, $12, 0x40
    bne $13, $zero, move_paddle0_down
    
move_paddle0_up:
    subu $6, 0x3
    j draw

move_paddle0_down:
    addu $6, 0x3
    j draw

move_paddle1:
    andi $13, $12, 0x08
    bne $13, $zero, move_paddle1_up
    andi $13, $12, 0x04
    bne $13, $zero, move_paddle1_down
    
move_paddle1_up:
    subu $10, 0x3
    j draw

move_paddle1_down:
    addu $10, 0x3
    j draw
