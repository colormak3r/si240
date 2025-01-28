global hello_world

extern printf
extern fgets
extern stdin

segment .data
    prompt_name db "Please enter your name: ", 0
    output_hello db "Hello, World! My name is %s", 0

segment .bss
    name resb 50

segment .text
hello_world:
    ; Save the base pointer
    push    rbp
    mov     rbp, rsp

    ; Save the general purpose registers
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

    ; Prompt user for their name
    mov     rax, 0
    mov     rdi, prompt_name
    call    printf

    ; Get user name input
    mov     rax, 0
    mov     rdi, name
    mov     rsi, 50
    mov     rdx, [stdin]
    call    fgets

    ; Print "Hello, World! My name is %s"
    mov     rax, 0
    mov     rdi, output_hello
    mov     rsi, name
    call    printf

    ; Restore the general purpose registers
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

    ; Restore the base pointer
    pop     rbp

    ; Return
    ret