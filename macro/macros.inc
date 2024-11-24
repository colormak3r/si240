extern printf

%macro add_num 2
    mov rax, %1
    add rax, %2
%endmacro

%macro print_msg 2
    mov     rax, 0
    mov     rdi, %1
    mov     rsi, %2
    call    printf
%endmacro

%macro min_num 2
    mov     rax, %1
    cmp     rax, %2
    jg      %%greater
    jmp     %%smaller
%%smaller:
    mov     rax, %1
    jmp     %%done
%%greater:
    mov     rax, %2
    jmp     %%done

%%done:
%endmacro 

%macro output_array 3
    xor     r15,r15     ; loop counter
    mov     r14, %1     ; array pointer
    mov     r13, %2     ; array size
%%loop:
    mov     rax, 0
    mov     rdi, %3
    mov     rsi, [r14 + 8 * r15]
    call    printf

    inc     r15
    cmp     r15, r13
    je      %%done
    jmp     %%loop
%%done:
%endmacro

%macro backup_general_registers 0
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
%endmacro

%macro restore_general_registers 0
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
%endmacro