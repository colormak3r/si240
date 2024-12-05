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

extern output_array
extern printf

array_size equ 10

segment .data
     msg_original db 10, "The original array is: ", 10, 0
     nice_array dq -23, 61, 34, -11, 2, -48, 95, 0, 7, -7
     msg_sorted db 10,"The sorted array is: ", 10, 0
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

     ; Print "The original array is: 
     mov rax, 0
     mov rdi, msg_original
     call printf

     ; Print the current array content
     mov rax, 0
     mov rdi, nice_array
     mov rsi, array_size
     call output_array

     ; Sort nice_array using bubble sort here

     ; call bubblesort

     ; Print "The sorted array is: "
     mov rax, 0
     mov rdi, msg_sorted
     call printf

     ; Print the sorted array content
     mov rax, 0
     mov rdi, nice_array
     mov rsi, array_size
     call output_array

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
