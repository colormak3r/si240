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

global series
extern printf
extern taylor

segment .data
    msg_output db "Taylor estimation = %lf", 10, 0
    msg_tics db "Elapsed tics = %lu", 10, 0
    num dq 17.55

segment .bss

segment .text
series:
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

    ; Get the starting time
    call    gettime
    mov     r15, rax

    ; Perform taylor series e^17.55 with 100 terms
    movsd   xmm0, [num]
    mov     rdi, 100
    call    taylor          ; Result will be stored in xmm0
    movsd   xmm15, xmm0     ; Move the result into a safer place

    ; Get the ending time
    call    gettime
    mov     r14, rax

    ; Display the result of the taylor series
    mov     rax, 1 
    mov     rdi, msg_output
    movsd   xmm0, xmm15
    call    printf

    ; Get the duration in tics
    sub     r14, r15 

    ; Display the tics
    mov     rax, 0
    mov     rdi, msg_tics
    mov     rsi, r14
    call    printf
   
    ; Return the tics to taylor.c
    mov     rax, r14

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

; Function get time
gettime:
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

    xor         rax, rax
    xor         rdx, rdx
    cpuid
    rdtsc
    shl         rdx, 32
    or          rax, rdx

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
