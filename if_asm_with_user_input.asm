.section .rodata
        inputmsg1:
        .string "Enter first number: "

        inputmsg2:
        .string "Enter second number: "

        scan_identifier:
        .string "%d"

.section .bss
        .comm a, 4,4
        .comm b, 4,4

.section .text
.global main

main:
        # Prologue
        pushl %ebp
        movl %esp, %ebp

        pushl $inputmsg1
        call printf
        addl $4, %esp

        pushl $a
        pushl $scan_identifier
        call scanf
        addl $8, %esp

        pushl $inputmsg2
        call printf
        addl $4, %esp

        pushl $b
        pushl $scan_identifier
        call scanf
        addl $8, %esp

        pushl $0
        call exit
