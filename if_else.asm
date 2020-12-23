.section .rodata
        msg1:
        .string "a is less than b condition is true"

        msg2:
        .string "a is less than b condition is false"

.section .data
        a:
        .int    30
        b:
        .int    20

.section .text
.global main

main:
        # Prologue
        pushl %ebp
        movl %esp, %ebp

        # compare if number in %eax is less than number in %edx

        movl $a, %eax
        movl $b, %edx
        cmpl %edx, %eax
        jge else

        pushl $msg2
        call puts
        addl $4, %esp
        jmp end

else:
        pushl $msg1
        call puts
        addl $4, %esp

end:
        push $0
        call exit
