; Author: Khoa Nguyen

extern printf
extern scanf

global hello_world   
segment .data   
    string_format db "%s",0
segment .bss 
    name resb 40
segment .text

hello_world:   
    push rbp
    mov rbp, rsp

    ; Backup GPRs
    ; 15 pushes

    ; Scan the user input
    mov rdi, string_format
    mov rsi, name
    call scanf

    ; Return the user input as a string
    mov rax, name

    ; Restore GPRs
    ; 15 pops

    pop rbp

    ret