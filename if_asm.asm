.section .rodata
        msg1:
        .string "Start of program.."

        msg2:
        .string "n1 > n2 condition is true.."

        msg3:
        .string "End of prgram.."

.section .data
        n1:
        .int    100
        n2:
        .int    50

.section .text
.global main

main:
        #Prologue

        pushl %ebp
        movl %esp, %ebp

        # puts msg1

        pushl $msg1
        call puts
        addl $4, %esp

        # Compate the if condition, result will be stored in eflags register or
        # rflags(for 64-bit)

        movl n1, %eax
        movl n2, %edx
        # compare eax and edx, cmp instruction will compare signed and unsigned
        # comparisons
        cmp %edx, %eax

        # if eax is greater then edx then jump

        jle print_and_exit
        push $msg2
        call puts
        addl $4, %esp

        print_and_exit:
        pushl $msg3
        call puts
        addl $4, %esp

        push $0
        call exit
