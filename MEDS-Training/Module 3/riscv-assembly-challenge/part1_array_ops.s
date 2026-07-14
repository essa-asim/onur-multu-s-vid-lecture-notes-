.data

array:
    .word 15, -8, 42, 0, -13, 7, 99, -5, 18, -21, 30, 4

size:
    .word 12

sum_msg:
    .string "Sum: "

min_msg:
    .string "\nMinimum: "

max_msg:
    .string "\nMaximum: "

neg_msg:
    .string "\nNegative Count: "
.text
.globl main

main:

    # Call sum_array

    la a0, array          # a0 = address of array
    lw a1, size           # a1 = number of elements
    call sum_array

    mv t0, a0             # Save returned sum

    # Print "Sum: "
    li a0, 4
    la a1, sum_msg
    ecall

    # Print sum
    li a0, 1
    mv a1, t0
    ecall


    # Call find_min

    la a0, array
    lw a1, size
    call find_min

    mv t0, a0             # Save returned minimum

    # Print "Minimum: "
    li a0, 4
    la a1, min_msg
    ecall

    # Print minimum
    li a0, 1
    mv a1, t0
    ecall

    # Call find_max

    la a0, array
    lw a1, size
    call find_max

    mv t0, a0

    # Print "Maximum: "
    li a0, 4
    la a1, max_msg
    ecall

    # Print maximum
    li a0, 1
    mv a1, t0
    ecall
    
    # Call count_negative

    la a0, array
    lw a1, size
    call count_negative

    mv t0, a0

    # Print "Negative Count: "
    li a0, 4
    la a1, neg_msg
    ecall

    # Print count
    li a0, 1
    mv a1, t0
    ecall

    # Exit Program

    li a0, 10
    ecall
    
sum_array:

    addi sp, sp, -16
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw ra, 12(sp)

    mv s0, a0          # array pointer
    mv s1, a1          # size

    li s2, 0           # sum
    li t0, 0           # i

loop:
    bge t0, s1, done

    slli t1, t0, 2     # offset = i * 4
    add t2, s0, t1     # &arr[i]
    lw t3, 0(t2)       # arr[i]

    add s2, s2, t3     # sum += arr[i]

    addi t0, t0, 1
    j loop

done:
    mv a0, s2

    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw ra, 12(sp)
    addi sp, sp, 16

    ret
    
find_min:

    addi sp, sp, -16
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw ra, 12(sp)

    mv s0, a0
    mv s1, a1

    lw s2, 0(s0)      # min = arr[0]
    li t0, 1          # i = 1

loop_min:
    bge t0, s1, done_min

    slli t1, t0, 2
    add t2, s0, t1
    lw t3, 0(t2)

    bge t3, s2, skip
    mv s2, t3

skip:
    addi t0, t0, 1
    j loop_min

done_min:
    mv a0, s2

    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw ra, 12(sp)
    addi sp, sp, 16

    ret
    
find_max:

    addi sp, sp, -16
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw ra, 12(sp)

    mv s0, a0
    mv s1, a1

    lw s2, 0(s0)      # max = arr[0]
    li t0, 1          # i = 1

loop_max:
    bge t0, s1, done_max

    slli t1, t0, 2
    add t2, s0, t1
    lw t3, 0(t2)

    bge s2, t3, skip_max
    mv s2, t3

skip_max:
    addi t0, t0, 1
    j loop_max

done_max:
    mv a0, s2

    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw ra, 12(sp)

    addi sp, sp, 16

    ret
    
count_negative:

    addi sp, sp, -16
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw ra, 12(sp)

    mv s0, a0
    mv s1, a1

    li s2, 0          # count = 0
    li t0, 0          # i = 0

loop_neg:
    bge t0, s1, done_neg

    slli t1, t0, 2
    add t2, s0, t1
    lw t3, 0(t2)

    blt t3, zero, negative

next:
    addi t0, t0, 1
    j loop_neg

negative:
    addi s2, s2, 1
    j next

done_neg:
    mv a0, s2

    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw ra, 12(sp)

    addi sp, sp, 16

    ret