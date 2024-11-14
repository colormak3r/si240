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

global practice
extern printf

segment .data
    nice_array dq 123123, 321321, 567567, 765765 , 123123 , 123545
    ; nice_array dq 3.0, 23.1, 21.2, 75.67, 245.67, 123.37
    msg_array_output db "", 10, 0     ; Implement your output message here
    msg_secret_output db "Your secret number is %d", 10, 0
    msg_lucky_output db "Your lucky number is %.2lf", 10, 0
    pi dq 3.14
segment .bss

segment .text
practice:
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

    xor     r15, r15            ; Set r15 as the index counter
    mov     r14, 42             ; Set the secret number
    movsd   xmm14, qword[pi]    ; Set the lucky number

    ; Print out the secret number
    mov     rax, 0
    mov     rdi, msg_secret_output
    mov     rsi, r14
    call    printf

    ; Print out the lucky number
    mov     rax, 1
    mov     rdi, msg_lucky_output
    movsd   xmm0, xmm14
    call    printf

loop:
    ; Implement printing of nice_array here

   
    ; Increase the counter. If it is 6, exit the loop. If it is not, loop back
    inc     r15
    cmp     r15, 6
    je      exit
    jmp     loop

exit:
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
