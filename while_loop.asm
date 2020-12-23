.section .rodata
        accept_num:
        .string "Enter a number: "
        scanfstr:
        .string "%d"
        printstr:
        .string "Jai Shriram"

.section .bss
        .comm number,4,4
        .comm loop_var,4,4

.section .text
.global main

main:
        # Prologue
        pushl %ebp
        movl %esp, %ebp

        pushl $accept_num
        call printf
        addl $4, %esp

        pushl $number
        pushl $scanfstr
        call scanf
        addl $8, %esp

        # while loop
        movl $0, loop_var
        jmp while_condition
while_body:
        pushl $printstr
        call puts
        addl $4, %esp

        addl $1, loop_var

while_condition:
        movl loop_var, %eax
        movl number, %edx
        cmpl %edx, %eax
        jl while_body

end:
        pushl $0
        call exit
