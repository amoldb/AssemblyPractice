.section .rodata
        inputstr:
        .string "Enter number: "
        scanfstr:
        .string "%d"
        printstr:
        .string "Har Har Mahadev"

.section .bss
        .comm number, 4,4
        .comm loop_var, 4,4

.section .text
.global main

main:
        # Prologue
        pushl %ebp
        movl %esp, %ebp

        #Accept number from user
        pushl $inputstr
        call printf
        addl $4, %esp

        # scanf
        pushl $number
        pushl $scanfstr
        call scanf
        addl $8, %esp

        movl $0, loop_var
        jmp for_loop_condition
for_loop_body:
        pushl $printstr
        call puts
        addl $4, %esp

        addl $1, loop_var
for_loop_condition:
        movl loop_var, %eax
        movl number, %edx
        cmpl %edx, %eax
        jl for_loop_body
end:
        pushl $0
        call exit
