.section .rodata

        inputmsg1:
        .string "Enter first number: "

        inputmsg2:
        .string "Enter second number: "

        outputstring1:
        .string "First number is greater than second"

        outputstring2:
        .string "First number is less than second"

        scanfmsg:
        .string "%d"

        firstNum:
        .string "First: %d\n"

        secondNum:
        .string "Second: %d"

.section .bss
        .comm first, 4,4
        .comm second, 4,4

.section .text
.global main

main:
        # Prologue
        pushl %ebp
        movl %esp, %ebp

        # Accept first number
        pushl $inputmsg1
        call printf
        addl $4, %esp

        pushl $first
        pushl $scanfmsg
        call scanf
        addl $8, %esp

        # Accept second number
        pushl $inputmsg2
        call printf
        addl $4, %esp

        pushl $second
        pushl $scanfmsg
        call scanf
        addl $8, %esp

        # first > second
        # 20 > 10
        movl first, %eax
        movl second, %edx
        cmpl %edx, %eax
        jng else_block

        pushl $outputstring1
        call puts
        addl $4, %esp
        jmp end

else_block:
        pushl $outputstring2
        call puts
        addl $4, %esp
end:
        push $0
        call exit
