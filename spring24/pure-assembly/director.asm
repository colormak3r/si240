global _start

section .data
    msg_welcome     db "Welcome to Marvelous Marvin’s Area Machine.", 10, 0
    msg_purpose     db "We compute all your areas.", 10, 0

    newline         db 10

section .bss
section .text
_start:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, msg_welcome
    mov     rdx, 46
    syscall

    mov     rax, 1
    mov     rdi, 1
    mov     rsi, msg_purpose
    mov     rdx, 27
    syscall

    mov        rax, 60
    mov        rdi, 0
    syscall
