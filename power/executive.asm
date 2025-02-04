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
extern scanf
extern fgets
extern stdin
extern strlen
extern pow

segment .data
     prompt_name db "Please enter your full name: ", 0
     message_greeting db "Hello, %s!",10 , 0
     prompt_numbers db "Please enter two float numbers: ", 0
     format_numbers db "%lf %lf", 0
segment .bss
     name resb 50
     numX resq 1
     numY resq 1

segment .text
executive:
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

     ; "Please enter your full name: "
     mov     rax, 0
     mov     rdi, prompt_name
     call    printf

     ; Get user name input
     mov     rax, 0
     mov     rdi, name
     mov     rsi, 50
     mov     rdx, [stdin]
     call    fgets

     ; Get rid of the new line character
     mov     rax, 0
     mov     rdi, name
     call    strlen
     mov     [name + rax - 1], byte 0

     ; "Hello, %s!"
     mov     rax, 0
     mov     rdi, message_greeting
     mov     rsi, name
     call    printf

     ; "Please enter two float numbers: "
     mov     rax, 0
     mov     rdi, prompt_numbers
     call    printf

     ; Get user input for two float numbers
     mov     rax, 0
     mov     rdi, format_numbers
     mov     rsi, numX
     mov     rdx, numY
     call    scanf

     ; Calculate the power of the two numbers
     mov     rax, 2
     movsd   xmm0, [numX]
     movsd   xmm1, [numY]
     call    pow

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
