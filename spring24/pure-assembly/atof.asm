global atof

section .data
    ; Empty

section .bss
    align 64
    storedata resb 832

section .text
atof:
    ; Back up
    push    rbp
    mov     rbp, rsp
    push    r11
    push    r12
    push    r13
    push    r14
    push    r15
    pushf

    mov     rax, 7
    mov     rdx, 0
    xsave   [storedata]    

    ; Parameters
    mov     r15, rdi            ; An array of char with null termination expected

    ; Find where the radix point is
    ; TODO: Add checks for non-float using isfloat
    xor     r14, r14            ; Index for the radix point
find_radix_loop:
    cmp     byte[r15 + r14], '.'
    je      found_radix_point

    inc     r14
    jmp     find_radix_loop

found_radix_point:
    ; Set up registers for integer part parsing
    xor     r13, r13            ; Integer total
    mov     r12, 1              ; Integer multiplier 1, 10, 100, 1000,...
    mov     r11, r14            ; Make a copy of the radix point
    dec     r11                 

parse_integer:
    mov     rax, [r15 + r14]
    sub     rax, '0'            ; Subtract 48 from the ASCII to get integer value
    imul    rax, r12            ; Multiply the integer value with 1, 10, 100, 1000,...
    add     r13, rax            ; Add the multiplied value to the total
    imul    r12, 10             ; Increase the multiplier exponentially by 10

    dec     r14                 ; Move the index from the radix point toward the front of the string
    cmp     r14, 0              ; Keep looping until all integer part are parsed
    jge     parse_integer

    ; Set up values for decimal part parsing
    mov     rax, 10             
    cvtsi2sd xmm11, rax         ; Load 10.0 into xmm11   
    xorpd   xmm13, xmm13        ; Decimal total
    movsd   xmm12,xmm11         ; Decimal divisor 10, 100, 1000,...

parse_decimal:
    mov     rax, [r15 + r14]
    sub     rax, '0'            ; Subtract 48 from the ASCII to get integer value
    cvtsi2sd xmm0, rax          ; Load the integer value into an xmm register for division
    divsd   xmm0, xmm12         ; Divide the integer value by 10, 100, 1000,...
    addsd   xmm13, xmm0         ; Add the decimal value to the total
    mulsd   xmm12, xmm11        ; Increase the decimal divisor exponentially by 10

    inc     r14                 ; Keep looping until null termination is found.
    cmp     byte[r15 + r14], 0
    jne     parse_decimal

    ; Add the parsed integer and decimal part together
    cvtsi2sd xmm0, r13
    addsd   xmm0, xmm13

    ; Return
    push    qword 0
    movsd   [rsp], xmm0

    mov     rax, 7
    mov     rdx, 0
    xrstor  [storedata]

    movsd   xmm0, [rsp]
    pop     rax

    ; Restore
    popf          
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     r11
    pop     rbp

    ret