.globl main
.text

main:
    sll     $s4, $5, 2          # multiplies i * 4 to conform to address form
    add     $t2, $2, $s4        # gets address of B[i] offsets address of B by i
    lw      $t3, ($t2)          # sets t3 to value at address t3 = B[i]

    sll     $t1, $t3, 2         # sets t1 to t3 * 4 to conform to address form
    add     $t2, $1, $t1        # offsets addres value in $1 by $t1 A[B[i]]
    lw      $s1, ($t2)          # sets t3 to value at address $t2 t3 = A[B[i]]

    addi    $t1, $5, 4          # offsets i by 4  = i+4
    sll     $t1, $5, 2          # multiplies i*4 to conform to address form
    add     $t2, $3, $t1        # offsets C address by i+4
    lw      $s2, ($t2)          # s2 = C[i+4]

    add     $t1, $s1, $s2       # adds A[B[i]] + C[i+4]
    add     $s3, $4, $s4        # offsets address of X by i
    sw      $t1, ($s3)          # stores $t1 to address of ($s3)
