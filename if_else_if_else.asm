.section .rodata
        msg1:
        .string "a is greater than b"
        msg2:
        .string "c is greater than d"
        msg3:
        .string "e is equal to f"
        msg4:
        .string "All conditions have failed"

        inputa:
        .string "Enter value of a: "
        inputb:
        .string "Enter value of b: "
        inputc:
        .string "Enter value of c: "
        inputd:
        .string "Enter value of d: "
        inpute:
        .string "Enter value of e: "
        inputf:
        .string "Enter value of f: "

        scanfstr:
        .string "%d"

.section .bss
        .comm   a, 4,4
        .comm   b, 4,4
        .comm   c, 4,4
        .comm   d, 4,4
        .comm   e, 4,4
        .comm   f, 4,4

.section .text
.global main

main:
        # Prologue
        pushl %ebp
        movl %esp, %ebp

        pushl $inputa
        call printf
        addl $4, %esp
        pushl $a
        pushl $scanfstr
        call scanf
        addl $8, %esp

        pushl $inputb
        call printf
        addl $4, %esp
        pushl $b
        pushl $scanfstr
        call scanf
        addl $8, %esp

        pushl $inputc
        call printf
        addl $4, %esp
        pushl $c
        pushl $scanfstr
        call scanf
        addl $8, %esp

        pushl $inputd
        call printf
        addl $4, %esp
        pushl $d
        pushl $scanfstr
        call scanf
        addl $8, %esp

        pushl $inpute
        call printf
        addl $4, %esp
        pushl $e
        pushl $scanfstr
        call scanf
        addl $8, %esp

        pushl $inputf
        call printf
        addl $4, %esp
        pushl $f
        pushl $scanfstr
        call scanf
        addl $8, %esp

        # Start of if-else-if-else
        # if ( a > b ){i
        #       printf("A is greater than B");
        # } else if( c < d ){
        #       printf("C is less than D");
        # } else if( e != f ){
        #       printf("E is not equal to F");
        # } else{
        #       printf("All conditions have failed");
        # }

        movl a, %eax
        movl b, %edx
        cmpl %edx, %eax
        jg if_1

        movl c, %eax
        movl d, %edx
        cmpl %edx, %eax
        jl else_if_1

        movl e, %eax
        movl f, %edx
        cmpl %edx, %eax
        jne else_if_2

        jmp else
        # Write assembly for all blocks

if_1:
        pushl $msg1
        call puts
        addl $4, %esp
        jmp end
else_if_1:
        pushl $msg2
        call puts
        addl $4, %esp
        jmp end
else_if_2:
        pushl $msg3
        call puts
        addl $4, %esp
        jmp end
else:
        pushl $msg4
        call puts
        addl $4, %esp

end:
        push $0
        call exit
