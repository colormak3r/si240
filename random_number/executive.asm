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
generate:
    ; Generate a random number
    rdrand  r15

    ; Move the random number into xmm15 by pushing it onto the stack
    push    r15             ; rsp will point to r15
    movsd   xmm15, [rsp]    ; Dereference the value in rsp and move it into xmm15
    pop     rbx             ; pop to balance the stack (every push must have a pop)

    ; Print out the random number in IEEE and scientific format
    mov     rax, 1
    mov     rdi, msg_random
    mov     rsi, r15
    movsd   xmm0, xmm15
    call    printf

    ; Compare the random number with a normal number
    ucomisd xmm15, xmm14    ; Explaination: https://docs.google.com/document/d/1Xz_kpCSM-M7IfR7pOiEsMEpCTvgvU9VDLp1D5TSFcvg/edit?usp=sharing 
    jp  error               ; Jump if parity

    ; If the comparision is not parity, continue to normalize the random number
    jmp normalize

error:
    ; Print out the error message if the random number is Nan
    mov     rax, 0
    mov     rdi, msg_error
    call    printf

    ; Rerun the loop until we get a valid random number
    jmp     generate

normalize:   
    ; Normalize the random number
    mov     r10, 0x000FFFFFFFFFFFFF
    and     r15, r10
    mov     r11, 0x3FF0000000000000
    or      r15, r11

    ; Move the normalized number into xmm15 by pushing it onto the stack
    push    r15             ; rsp will point to r15
    movsd   xmm15, [rsp]
    pop     rbx

    ; Print out the normalized number in IEEE and scientific format
    mov     rax, 1
    mov     rdi, msg_normalized
    mov     rsi, r15
    movsd   xmm0, xmm15
    call    printf

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
