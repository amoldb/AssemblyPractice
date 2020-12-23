.section .rodata
        input_msg:
        .string "Enter a number: "
        scanfstr:
        .string "%d"
        printstr:
        .string "Jai Shivrai"

.section .bss
        .comm loop_var, 4, 4
        .comm number, 4, 4

.section .text
.global main

main:
        # Prologue
        pushl %ebp
        movl %esp, %ebp

        pushl $input_msg
        call printf
        addl $4, %esp

        pushl $number
        pushl $scanfstr
        call scanf
        addl $8, %esp

        movl $0, loop_var
do_while_body:
        pushl  $printstr
        call puts
        addl $4, %esp

        addl $1, loop_var

do_while_condition:
        movl loop_var, %eax
        movl number, %edx
        cmpl %edx, %eax
        jl do_while_body

end:
        pushl $0
        call exit
