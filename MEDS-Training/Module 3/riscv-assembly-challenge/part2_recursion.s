.data

n:
    .word 20

memo:
    .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1
    .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1
    .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1
    .word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1

result_msg:
    .string "Fibonacci = "

newline:
    .string "\n"


.text
.globl main

main:

    # Load n
    lw a0, n

    # Call fib(n)
    call fib

    # Save result
    mv t0, a0

    # Print message
    li a0, 4
    la a1, result_msg
    ecall

    # Print result
    li a0, 1
    mv a1, t0
    ecall

    # Newline
    li a0, 4
    la a1, newline
    ecall

    # Exit
    li a0, 10
    ecall


fib:

    # Prologue
    addi sp, sp, -24
    sw ra, 20(sp)
    sw s0, 16(sp)
    sw s1, 12(sp)
    sw s2, 8(sp)

    mv s0, a0                  # n

    # Base case: if(n <= 1)
    li t0, 1
    ble s0, t0, base_case

    # Check memo[n]
    la t1, memo
    slli t2, s0, 2
    add t1, t1, t2
    lw t3, 0(t1)

    li t4, -1
    bne t3, t4, memo_found

    # fib(n-1)
    addi a0, s0, -1
    call fib
    mv s1, a0

    # fib(n-2)
    addi a0, s0, -2
    call fib
    mv s2, a0

    # result = fib(n-1)+fib(n-2)
    add a0, s1, s2

    # Store into memo[n]
    la t1, memo
    slli t2, s0, 2
    add t1, t1, t2
    sw a0, 0(t1)

    j fib_return

memo_found:
    mv a0, t3
    j fib_return

base_case:
    mv a0, s0

fib_return:

    lw s2, 8(sp)
    lw s1, 12(sp)
    lw s0, 16(sp)
    lw ra, 20(sp)
    addi sp, sp, 24
    ret