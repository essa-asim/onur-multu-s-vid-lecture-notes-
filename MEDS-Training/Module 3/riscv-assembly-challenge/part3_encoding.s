.data

instructions:
    .word 0x00A28233    # R-type : add x4,x5,x10
    .word 0x00500113    # I-type : addi x2,x0,5
    .word 0x00742423    # S-type : sw x7,8(x8)
    .word 0x00208863    # B-type : beq x1,x2,+16
    .word 0x123452B7    # U-type : lui x5,0x12345
    .word 0x010000EF    # J-type : jal x1,+16

count:
    .word 6

opcode_msg:
    .string "Opcode: "

rd_msg:
    .string " RD: "

rs1_msg:
    .string " RS1: "

funct3_msg:
    .string " Funct3: "

newline:
    .string "\n"


.text
.globl main

main:

    # Pointer to instruction array
    la s0, instructions

    # Number of instructions
    lw s1, count

    # Loop counter
    li s2, 0

loop:

    bge s2, s1, exit

    # Load one instruction
    lw a0, 0(s0)

    # Decode and print fields
    call decode

    # Move to next instruction
    addi s0, s0, 4
    addi s2, s2, 1

    j loop


exit:

    li a0, 10
    ecall


decode:

    addi sp, sp, -4
    sw ra, 0(sp)

    mv t0, a0              # instruction

    # opcode = bits[6:0]

    andi t1, t0, 0x7F

    li a0, 4
    la a1, opcode_msg
    ecall

    li a0, 1
    mv a1, t1
    ecall


    # rd = bits[11:7]

    srli t2, t0, 7
    andi t2, t2, 0x1F

    li a0, 4
    la a1, rd_msg
    ecall

    li a0, 1
    mv a1, t2
    ecall


    # funct3 = bits[14:12]

    srli t3, t0, 12
    andi t3, t3, 0x7

    li a0, 4
    la a1, funct3_msg
    ecall

    li a0, 1
    mv a1, t3
    ecall


    # rs1 = bits[19:15]

    srli t4, t0, 15
    andi t4, t4, 0x1F

    li a0, 4
    la a1, rs1_msg
    ecall

    li a0, 1
    mv a1, t4
    ecall


    # newline

    li a0, 4
    la a1, newline
    ecall


    lw ra, 0(sp)
    addi sp, sp, 4

    ret