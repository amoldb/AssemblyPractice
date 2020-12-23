.section .rodata
        msg1:
        .string "First string"

        msg2:
        .string "Second string"

        msg3:
        .string "Third string"
.section .data
        n1:
        .int    100

.section .text
.global main

main:
        pushl $msg1
        call puts
        addl $4, %esp

        pushl $msg2
        call puts
        addl $4, %esp

        pushl $msg3
        call puts
        addl $4, %esp

        push $0
        call exit
