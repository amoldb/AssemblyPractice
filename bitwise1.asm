.section .rodata
        negate_result:
        .string "Negation of N1: %x\n"
        bitwise_and:
        .string "N1 AND N2: %x\n"
        bitwise_or:
        .string "N1 OR N2: %x\n"
        bitwise_xor:
        .string "N1 XOR N2: %x\n"

.section .data
        n1:
        .int    0x0f0f0f0f
        n2:
        .int    0xf0f0f0f0

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
        negl %eax
        subl $1, %eax
        movl %eax, result

        # Print result
        pushl result
        pushl $negate_result
        call printf
        addl $8, %esp

        # Bitwise AND
        movl n1, %eax
        movl n2, %edx
        andl %edx, %eax
        movl %eax, result

        # Print result
        pushl result
        pushl $bitwise_and
        call printf
        addl $8, %esp

        # Bitwise OR
        movl n1, %eax
        movl n2, %edx
        orl %eax, %edx
        movl %edx, result

        # Print result
        pushl result
        pushl $bitwise_or
        call printf
        addl $8, %esp

        # Bitwise XOR
        movl n1, %eax
        movl n2, %edx
        xorl %eax, %edx
        movl %edx, result

        # Print result
        pushl result
        pushl $bitwise_xor
        call printf
        addl $8, %esp

        # Exit
        pushl $0
        call exit
