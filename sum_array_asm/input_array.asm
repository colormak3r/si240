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

global input_array
    extern fgets
    extern atoi
    extern stdin
    extern isinteger
    extern printf
    true equ -1
    false equ 0
segment .data
    msg_error db "An error was detected. Re-enter the number", 10, 0
segment .bss
segment .text
input_array:
    ;15 pushes
    push    rbp                     ; Backup rbp
    mov     rbp,rsp                 ; The base pointer now points to top of stack
    push    rdi                     ; Backup rdi
    push    rsi                     ; Backup rsi
    push    rdx                     ; Backup rdx
    push    rcx                     ; Backup rcx
    push    r8                      ; Backup r8
    push    r9                      ; Backup r9
    push    r10                     ; Backup r10
    push    r11                     ; Backup r11
    push    r12                     ; Backup r12
    push    r13                     ; Backup r13
    push    r14                     ; Backup r14
    push    r15                     ; Backup r15
    push    rbx                     ; Backup rbx
    pushf                           ; Backup rflags

    mov     r15, rdi                ; Store the array pointer into r15
    mov     r14, rsi                ; Store the max array length into r14
    mov     r13, 0                  ; Set r13 as the counter
    sub     rsp, 1024               ; Reserve 1024 bytes on the stack for the user input
begin:
    ; Get the user input
    mov     rdi, rsp                ; Store the input into the reserved space
    mov     rsi, 1023               ; Input a max of 1023 character, excluding the null terminator at the end
    mov     rdx, [stdin]            ; Use the standard input stream provided by C library
    call    fgets                   ; fgets return 0 into rax if the user input CTRL + D

    ; Detect if the user input CTRL + D
    cmp     rax, 0 
    je      exit                    ; Jump to exit if equal

    ; Validate if the input is in the form of an integer
    mov     rdi, rsp                ; Pass the pointer to the memory space where the input is stored
    call    isinteger               ; isinteger return -1 if it is not an integer, and return 0 if it is, as defined inside isinteger

    ; If the input is not an integer, jump to the error code block 
    cmp     rax, false              ; false is defined as 0 at the top
    je      handle_error

    ; Convert the legit input from a string into an integer and put it into the array
    mov     rdi, rsp                ; Pass the pointer to the memory space where the input is stored
    call    atoi                    ; The result integer will be stored in rax
    mov     [r15 + r13 * 4], rax    ; Move the integer into the array cell. r15 is the base address, r13 * 4 is how much address will be displaced, 4 is 4 bytes = 1 integer

    ; Increase the loop counter. If the counter >= max array length, return. 
    ; If not, loop back to the beginning for more user input
    inc     r13 
    cmp     r13, r14
    jge     exit
    jmp     begin    
handle_error:
    ; Let the user know they incorrectly input the number
    mov     rax, 0                  ; Indicate no float registers will be used
    mov     rdi, msg_error  
    call    printf

    ; Jump back to the beginning block
    jmp     begin
exit:
    add     rsp, 1024               ; Clean up the stack space so the program doesn't crash
    mov     rax, r13                ; Set the counter(r13) as the return value before returning

    ;15 pop
    popf                            ; Restore rflags
    pop     rbx                     ; Restore rbx
    pop     r15                     ; Restore r15
    pop     r14                     ; Restore r14
    pop     r13                     ; Restore r13
    pop     r12                     ; Restore r12
    pop     r11                     ; Restore r11
    pop     r10                     ; Restore r10
    pop     r9                      ; Restore r9
    pop     r8                      ; Restore r8
    pop     rcx                     ; Restore rcx
    pop     rdx                     ; Restore rdx
    pop     rsi                     ; Restore rsi
    pop     rdi                     ; Restore rdi
    pop     rbp                     ; Restore rbp

    ret