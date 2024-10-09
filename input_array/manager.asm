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

global manager

extern input_array
extern printf

array_size equ 12

segment .data
    prompt_input db "For the array enter a sequence of 64-bit floats separated by white space.", 10,"After the last input press enter followed by Control+D:", 10, 0
    output_count db "Array count is %lu", 10, 0

segment .bss
    align 64
    storedata resb 832
    nice_array resq array_size

segment .text
manager:
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

    ; Prompt the input instruction
    mov     rax,0
    mov     rdi, prompt_input
    call    printf

    ; Call input_array which has this equivalent C syntax: 
    ; Signature: ulong input_array(*double array[], ulong max_size)
    ; Parameters:
    ;       array[]: A pointer to an array of double values.
    ;       max_size: The maximum size of the array.
    ; Returns: The count of valid inputs stored in the array.
    ; Purpose: This function stores double-precision floating-point inputs in the
    ; provided array and returns the total number of successfully stored entries.
    mov     rdi, nice_array
    mov     rsi, array_size
    call    input_array
    mov     r15, rax

    ; Output the array count
    mov     rax, 0
    mov     rdi, output_count
    mov     rsi, r15
    call    printf

    ; Restore all the floating-point numbers
    mov     rax, 7
    mov     rdx, 0
    xrstor  [storedata]

    mov     rax, r15

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