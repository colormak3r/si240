global atof

section .data
    neg_mask dq 0x8000000000000000

section .bss
    align 64
    storedata resb 832

section .text
atof:
    ; Back up
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
    xor     r10, r10            ; Flag 0 = positive, 1 = negative

parse_integer:
    mov     al, byte[r15 + r11]
    cmp     al, '+'
    je      finish_parse_integer
    cmp     al, '-'
    je      parse_integer_negative

    ; Convert the ASCII character to in integer and add it to the total
    sub     al, '0'             ; Subtract 48 from the ASCII to get integer value
    imul    rax, r12            ; Multiply the integer value with 1, 10, 100, 1000,...
    add     r13, rax            ; Add the multiplied value to the total
    imul    r12, 10             ; Increase the multiplier exponentially by 10

    dec     r11                 ; Move the index from the radix point toward the front of the string
    cmp     r11, 0              ; Keep looping until all integer part are parsed
    jge     parse_integer    
    jmp     finish_parse_integer

parse_integer_negative:
    mov     r10, 1              ; Set r10 to 1 to flag the number as negative

finish_parse_integer:
    ; Set up values for decimal part parsing  
    mov     rax, 10             ; Load 10 into rax
    cvtsi2sd xmm11, rax         ; Load 10.0 into xmm11   
    xorpd   xmm13, xmm13        ; Decimal total
    movsd   xmm12,xmm11         ; Decimal divisor 10, 100, 1000,...
    inc     r14

parse_decimal:
    mov     al, byte [r15 + r14]
    sub     al, '0'             ; Subtract 48 from the ASCII to get integer value

    ; Convert the ASCII character to decimal value
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

    ; Check the negative flag 0 = positive, 1 = negative
    cmp     r10, 0
    je      return

    ; Negate the number of the flag is equal to 1
    movsd xmm1, [neg_mask]      ; Load the negation mask into xmm1
    xorpd xmm0, xmm1 

return:
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