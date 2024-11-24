; Program name: "Program Name". A short description of the purpose of the program
; Copyright (C) <2023>  <Your Name>

; This file is part of the software program "Program Name".

; "Program Name" is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

; "Program Name" is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.

; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <https://www.gnu.org/licenses/>. 

; Author information
;   Author name : Code Goblin
;   Author email: instalock_caitlyn@bronze2.botlane
;   Author section: 240-99
;   Author CWID : 000000000

global executive
extern printf

segment .data
    msg_random db       "The random number is:      0x%016lx    %-18.13g", 10, 0
    msg_normalized db   "The normalized number is:  0x%016lx    %-18.13g", 10, 0
    pi dq 3.14
    msg_error db "Number is Nan", 10, 0
    msg_secret_number db "My secret number is %d", 10, 0
    msg_lucky_number db "My lucky number is %lf", 10, 0
    long_array dq 123.123, 456.456, 789.789
    number db "The number is %lf", 10, 0
segment .bss

segment .text
executive:
     ; Back up GPRs
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

    ; Move 3.14 into xmm14
    movsd   xmm14, qword[pi]

    mov     r14, 42     ; My scecret number

    mov     rax, 0      ; We expect 0 float number
    mov     rdi, msg_secret_number
    mov     rsi, r14
    call    printf

    mov     rax, 1
    mov     rdi, msg_lucky_number
    movsd   xmm0, xmm14
    call    printf

    xor     r15, r15 ; r15 is the counter
loop:
    mov     rax, 1
    mov     rdi, number
    movsd   xmm0, [long_array + r15 * 8]
    call    printf

    inc     r15
    cmp     r15, 3
    je      exit

    jmp    loop

exit
    ;Restore the original values to the GPRs
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
