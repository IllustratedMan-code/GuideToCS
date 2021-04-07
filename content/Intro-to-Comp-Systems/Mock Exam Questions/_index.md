+++
title = "Mock Exam Questions"
author = ["David Lewis"]
draft = false
+++

Question 1 and 2 seem to reference this article:
[8086-8088](/ox-hugo/8086.pdf)


## Q1 {#q1}

If a physical branch target address is 5A230 when CS = 5200, what will it be if the CS = 7800 ?

-   We need to find the offset, where offset + CS(shifted 4 bits) = physical branch target address. CS(C segment register)
-   Offset = Physical branch target address - CS
-   Offset = 5A230 - 52000 = 8230 (hex)

The offset is then used to find the physical branch target adress.

-   78000 + 8230 = 80230 = physical branch target address


## Q2 {#q2}

Given that the EA of a data is 2359 and DS = 490B, what is the PA of data?

-   `EA (effective Address), DS (D segment register), PA(Physical Address)`.

Physical address is given by EA + DS(shifted 4 bits).

-   DS = 490B0 (hex)
-   EA = 2359 (hex)
-   PA = 490B0 + 2359 = 4B409


## <span class="org-todo todo TODO">TODO</span> Q3 {#q3}

Assuming, W, X, Y and Z as memory addresses. Write a program using any machine sequence that will carry out the following: Z ← W + (Z-X).


## <span class="org-todo todo TODO">TODO</span> Q4 {#q4}

Assume that the code below is run on a machine with a 2 GHz clock that requires the following number of cycles for each instruction: add, addi, sll, sra take 4cc each,  lw takes 5cc,   bne, beq  take 3cc each. How many seconds will it take to execute this code. The values of registers are $4=0x20, $5= 0x20, $6= 0x30, $7= 0x10.

```mips
    .globl  main
    .text

main:
    sra $6, $6, 2   #
    sll $7, $7, 2
    add $8, $0, $0
L2: add $12, $4, $8
    lw  $12, 0($12)
    add $9, $0, $0
L1: add $11, $5, $9
    lw  $11, 0($11)
    addi $9, $9, 4
    bne $9, $7, L1
    addi $8, $8, 4
    beq $8, $6, L2
```
