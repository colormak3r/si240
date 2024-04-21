global fgets
extern strlen
extern fputs

section .data
    debug db 10, 0
section .bss
section .text
fgets:
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
    mov     r14, rsi

    mov     rax, 0
    mov     rdi, 0
    mov     rsi, r15
    mov     rdx, r14
    syscall

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