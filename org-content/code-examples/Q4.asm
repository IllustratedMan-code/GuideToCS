    .globl  main
    .text

main:
    sra $6, $6, 2   # changes original value of 0x30 / 2^2  = 0xC
    sll $7, $7, 2 # original value = 0x10, 0x10 * 2^2 = 0x40
    add $8, $0, $0 # sets register 8 to 0
L2: add $12, $4, $8 #marks L2, $12 <- 0x20 + $8, $8 is iterator
    lw  $12, 0($12) # $12 = memory at address of ($12) on stack
    add $9, $0, $0 # $9 = 0;
L1: add $11, $5, $9 #marks L1, $11 = 0x20 + $9, $9 is iterator
    lw  $11, 0($11) #$11 = memory at address of ($11) on stack
    addi $9, $9, 4 #$9 = $9 + 4
    bne $9, $7, L1 # goes to L1 if $9 != $7  0x0 + 0x4 * 0x10 = 0x40 = $9 loop executes 0x10 times
    addi $8, $8, 4 # $8 = $8 + 4
    beq $8, $6, L2 # goes to L2 if $8 == $6 exits before  $8 can equal $6
