global _start
segment .data
    msg_input db "Please enter your name: ", 0
    msg_output db "Nice to meet you ", 0
segment .bss
    input resb 50
segment .text
_start:
    ; Prompt the user input
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, msg_input
    mov     rdx, 25             ; The string "Please enter your name: " is 25 characters long
    syscall

    ; Wait for user's input
    mov     rax, 0
    mov     rdi, 0
    mov     rsi, input
    mov     rdx, 50
    syscall

    ; Write the output message
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, msg_output
    mov     rdx, 17             ; The string "Nice to meet you " is 17 characters long
    syscall

    ; Display the output
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, input
    mov     rdx, 50
    syscall

    ; Exit
    mov        rax, 60
    mov        rdi, 0
    syscall