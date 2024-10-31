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

; For research purpose only. Please don't copy word for word. Avoid academic dishonesty. 

global hsum

extern printf

segment .data
    debug db "debug = %lf",10,0
    one_point_o dq 1.0              ; Define an array of qword, with the first cell storing 1.0
segment .bss
    align 64
    storedata resb 832

segment .text
hsum:
    ;15 pushes
    push    rbp                         ; Backup rbp
    mov     rbp,rsp                     ; The base pointer now points to top of stack
    push    rdi                         ; Backup rdi
    push    rsi                         ; Backup rsi
    push    rdx                         ; Backup rdx
    push    rcx                         ; Backup rcx
    push    r8                          ; Backup r8
    push    r9                          ; Backup r9
    push    r10                         ; Backup r10
    push    r11                         ; Backup r11
    push    r12                         ; Backup r12
    push    r13                         ; Backup r13
    push    r14                         ; Backup r14
    push    r15                         ; Backup r15
    push    rbx                         ; Backup rbx
    pushf                               ; Backup rflags

    ; Backup all the floating-point numbers (xmm0 - xmm15)
    mov     rax, 7
    mov     rdx, 0
    xsave   [storedata]

    mov     r15, rdi    ; Array
    mov     r14, rsi    ; Count
    mov     r13, 0      ; Counter

    ; An alternative way of getting 1.0
    ; mov     rax, 0x3FF0000000000000   ; Convert 1.0 into IEEE format and move it into a GPRs (rax, rbx, etc.)
    ; push    rax                       ; Push that register onto the stack. rsp (stack pointer) will now point to that memory space
    ; movsd   xmm15, [rsp]              ; Dereference rsp using [], then move the value into a safe floating point register (xmm10-xmm15)
    ; pop     rax                       ; Pop the stack into any GPRs to clear the memory space created

begin:
    ; Divide 1/n. n is an element from the array
    movsd   xmm14, qword [one_point_o]  ; Dereference one_point_o and move it into xmm14
    divsd   xmm14, [r15 + 8 * r13]      ; Dereference the array element and divide 1 with it, the result is put into xmm14

    ; An alternative way if you move 1.0 into xmm15 above
    ; movsd   xmm14, xmm15
    ; divsd   xmm14, [r15 + 8 * r13]      

    ; Add the result to the sum. Use xmm13 as an accumulator
    addsd   xmm13, xmm14

    ; Increase the counter. If counter > count, exit. If not, loop again
    inc     r13
    cmp     r13, r14
    je      exit
    jmp     begin

exit:
    ; Avoid the overriding the result when restoring the floating-point numbers
    push    qword 0                     ; Create a space on the stack. rsp will now point to that space
    movsd   [rsp], xmm13                ; Move the sum into that space pointed by rsp

    ; Restore all the floating-point numbers (xmm0 - xmm15)
    mov     rax, 7
    mov     rdx, 0
    xrstor  [storedata]

    ; Retrieve the result from the stack
    movsd   xmm13, [rsp]                ; Dereference rsp, then move the value into xmm13
    pop     rax                         ; Pop (clear) the space created or you get seg fault

    ; Set the return value using xmm0 since our value is a floating-point number
    ; Main will look into xmm0 or rax depending on the return value
    movsd   xmm0, xmm13

    ;15 pop
    popf                                ; Restore rflags
    pop     rbx                         ; Restore rbx
    pop     r15                         ; Restore r15
    pop     r14                         ; Restore r14
    pop     r13                         ; Restore r13
    pop     r12                         ; Restore r12
    pop     r11                         ; Restore r11
    pop     r10                         ; Restore r10
    pop     r9                          ; Restore r9
    pop     r8                          ; Restore r8
    pop     rcx                         ; Restore rcx
    pop     rdx                         ; Restore rdx
    pop     rsi                         ; Restore rsi
    pop     rdi                         ; Restore rdi
    pop     rbp                         ; Restore rbp

    ret
