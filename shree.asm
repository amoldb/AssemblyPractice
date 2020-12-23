.section .rodata
        shree:
        .string "Shree"

.section .text
.global main

main:
        # Prologue
        pushl %ebp
        movl %esp, %ebp

        pushl $shree
        call puts
        addl $4, %esp
end:
        pushl $0
        call exit
