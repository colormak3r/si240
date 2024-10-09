global strlen
max_length equ 1024

section .data
section .bss
section .text
strlen:
    push    rbp
    mov     rbp, rsp
    push    rbx
    push    rcx
    push    rdx
    push    rsi
    push    rdi
    push    r8 
    push    r9 
    push    r10
    push    r11
    push    r12
    push    r13
    push    r14
    push    r15
    pushf

    ; Parameters
    mov     r15, rdi

    xor     r14, r14

count:
    cmp     byte[r15 + r14], 0
    je      exit

    inc     r14
    cmp     r14, max_length
    je      exit

    jmp     count

exit:
    mov     rax, r14

    popf          
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     r11
    pop     r10
    pop     r9 
    pop     r8 
    pop     rdi
    pop     rsi
    pop     rdx
    pop     rcx
    pop     rbx
    pop     rbp

    ret