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

global validation

extern printf
extern fgets
extern stdin
extern strlen
extern atof
extern isfloat
extern cos

float_size equ 60
true equ -1
false equ 0

segment .data
    prompt_for_float db "Please enter a float number: ", 0
    print_bad_input db "That ain't no float, try again!", 10, 0 

    format_float db "%lf", 0

    pi dq 3.14159265359
    one_eddy dq 180.0

segment .bss
    align 64
    storedata resb 832
    input_float resb float_size

segment .text
validation:
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

    ; Save all the floating-point numbers
    mov     rax, 7
    mov     rdx, 0
    xsave   [storedata]

get_input:
    ; Prompt user for a float
    mov     rax, 0
    mov     rdi, prompt_for_float   ; Please enter a float number:
    call    printf

    ; Get user name input
    mov     rax, 0
    mov     rdi, input_float
    mov     rsi, float_size
    mov     rdx, [stdin]
    call    fgets

    ; Remove the newline character
    mov     rax, 0
    mov     rdi, input_float
    call    strlen
    mov     [input_float + rax - 1], byte 0

    ;Check if input is a float
    mov     rax, 0
    mov     rdi, input_float
    call    isfloat
    cmp     rax, false
    je      bad_input

    ; Convert the input from string to float
    mov     rax, 0
    mov     rdi, input_float
    call    atof
    movsd   xmm15, xmm0 ; xmm15 contains the angle

    ; Convert the float from degree to radian
    mulsd   xmm15, qword[pi]
    divsd   xmm15, qword[one_eddy]

    ; Find cos of the angle
    mov     rax, 1
    movsd   xmm0, xmm15
    call    cos

    jmp     exit

bad_input:
    ; Tell the user the input is bad 
    mov     rax, 0
    mov     rdi, print_bad_input    ;That ain't no float, try again!
    call    printf

    ; 'Loop' back to the beginning
    jmp     get_input

exit:
    ; 'Save' the result onto the stack
    push    qword 0
    movsd   [rsp], xmm0

    ; Restore all the floating-point numbers
    mov     rax, 7
    mov     rdx, 0
    xrstor  [storedata]

    ; Retrieve the result from the stack
    movsd   xmm0, [rsp]
    pop     rax

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