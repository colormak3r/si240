global _start
extern strlen
extern fputs
extern fgets
extern atof

max_length equ 256

section .data
    prompt_number   db "Please enter a float number: ", 0

section .bss
    nice_number resb max_length

section .text
_start:
    mov     rdi, prompt_number
    call    fputs

    mov     rdi, nice_number
    mov     rsi, 10
    call    fgets

    mov     rdi, nice_number
    call    atof

    mov        rax, 60
    mov        rdi, 0
    syscall