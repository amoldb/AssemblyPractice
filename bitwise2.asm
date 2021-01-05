.section .rodata
        bitwise_not:
        .string "Bitwise NOT: %x\n"
        bitwise_or:
        .string "Bitwise OR: %x\n"
        bitwise_and:
        .string "Bitwise AND: %x\n"
        bitwise_xor:
        .string "Bitwise XOR: %x\n"

.section .data
    n1:
        .int 0x0f0f0f0f
    n2:
        .int 0xf0f0f0f0

.section .bss
        .comm result, 4, 4

.section .text
.global main

main:
    # Prologue
    pushl %ebp
    movl %esp, %ebp

    # Bitwise NOT
    movl n1, %eax
    negl %eax # 2's complement
    subl $1, %eax #1's complement
    movl %eax, result

    # Print result
    pushl result
    pushl $bitwise_not
    call printf
    addl $8, %esp

    # Bitwise OR
    movl n1, %eax
    movl n2, %edx
    orl %edx, %eax
    movl %eax, result

    # Print result
    pushl result
    pushl $bitwise_or
    call printf
    addl $8, %esp

    # Biwise AND
    movl n1, %eax
    movl n2, %edx
    andl %edx, %eax
    movl %eax, result

    # Print
    pushl result
    pushl $bitwise_and
    call printf
    addl $8, %esp

    # Bitwise XOR
    movl n1, %eax
    movl n2, %edx
    xorl %edx, %eax
    movl %eax, result

    # Print result
    pushl result
    pushl $bitwise_xor
    call printf
    addl $8, %esp

    # Epilogue
    pushl $0
    call exit
