    .globl main
    .text

main:
    lw $t1, Z #load z into temporary register 1
    lw $t2, X #load x into temporary register 2
    sub $s1, $t1, $t2 #s1 <- t1-t2
    lw $t1, W #load w into temporary register 1
    add $s1, $t1, $s1 #s1 <- t1
    sw $s1, Z # stores s1 into Z

    li $v0, 1 #prints z
    lw $a0, Z
    syscall

    li $v0, 10 #exits
    syscall

    
.data
Z: .word  12 #arbitrary value
X: .word 10 #arbitrary value
W: .word 5 #arbitrary value
