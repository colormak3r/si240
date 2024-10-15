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

MAX_ARRAY_COUNT equ 15
global manager
    extern printf
    extern input_array
    extern output_array
    extern sum_array
    extern sort_array
    extern fgets
    extern strlen
    extern stdin
segment .data
    msg_name            db 10, "Please enter your name: ", 0
    msg_instruction     db 10, "This program will sum your array of integers", 10, "Enter a sequence of long integers separated by white space.", 10, "After the last input press enter followed by Control+D:", 10, 0
    msg_array_output    db 10, "These number were received and placed into the array:", 10, 0
    msg_array_sum       db 10, "The sum of the %d numbers in this array is %d", 10, 0
    msg_array_sort      db 10, "This is the sorted array:", 10, 0
    msg_return          db 10, "This program will return execution to the main function.", 10, 0

segment .bss
    username resb 100               ; Reserves 100 bytes for username
    nice_array resq MAX_ARRAY_COUNT
    
segment .text
manager:
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

    ; Ask for the user's name
    mov     rax, 0                  ; Indicate no float registers will be used
    mov     rdi, msg_name           ; Pass the string "Please enter your name:"
    call    printf

    ; Get the user's input
    mov     rdi, username
    mov     rsi, 99                 ; Store max 99 characters since fgets adds a null terminator, taking up 1 byte
    mov     rdx, [stdin]            ; Standard input stream
    call    fgets 

    ; Remove newline character from the user's input when the player hit Enter
    mov     rdi, username           ; The new line character is stored in the second to last element of the string array
    call    strlen
    mov     [username + rax - 1], byte 0

    ; Print the instruction
    mov     rax, 0                  ; Indicate no float registers will be used
    mov     rdi, msg_instruction    ; Pass the string "This program will sum your array of integers..."
    call    printf

    ; Get the user inputs and store in nice_array
    ; This code block has the equavilent syntax in C++: int count = input_array(nice_array, MAX_ARRAY_COUNT);
    mov     rdi, nice_array         ; First parameter is always rdi
    mov     rsi, MAX_ARRAY_COUNT    ; Second parameter is always rsi
    call    input_array
    mov     r15, rax                ; The return value (count) is stored in rax. Move it to a safe register (r10 - r15). r8, r9 is volatile

    ; Print the nice output prompt "These number were received and placed into the array:"
    mov     rax, 0                  ; Indicate no float registers will be used
    mov     rdi, msg_array_output
    call    printf

    ; Loop through the array and output its elements
    mov     rdi, nice_array
    mov     rsi, r15                ; Use the count of the array here instead of the max length
    call    output_array            ; Output_array has no return value

    ; Calculate the sum of the array
    mov     rdi, nice_array
    mov     rsi, r15                
    call    sum_array
    mov     r14, rax                ; The return value (sum) is stored in rax. Move it to a safe register that is not r15

    ; Print the nice sum that was calculated in r14
    mov     rax, 0                  ; Indicate no float registers will be used
    mov     rdi, msg_array_sum 
    mov     rsi, r15     
    mov     rdx, r14
    call    printf

    ; Let the user know the program will now sort the array
    mov     rax, 0                  ; Indicate no float registers will be used
    mov     rdi, msg_array_sort     ; "This is the sorted array:"
    call    printf
    
    ; Sort the array
    mov     rdi, nice_array
    mov     rsi, r15                
    call    sort_array              ; Sort has no return value, the array is sorted in place

    ; Loop through the array and output its elements again after sorting
    mov     rdi, nice_array
    mov     rsi, r15                ; Use the count of the array here instead of the max length
    call    output_array            ; Output_array has no return value

    ; Let the user know the program has done its job and ready to return
    mov     rax, 0                  ; Indicate no float registers will be used
    mov     rdi, msg_return         ; "This program will return execution to the main function."
    call    printf

    ; Set the user name as the return value before returning
    mov     rax, username

    ;15 pop
    popf                            ;Restore rflags
    pop     rbx                     ;Restore rbx
    pop     r15                     ;Restore r15
    pop     r14                     ;Restore r14
    pop     r13                     ;Restore r13
    pop     r12                     ;Restore r12
    pop     r11                     ;Restore r11
    pop     r10                     ;Restore r10
    pop     r9                      ;Restore r9
    pop     r8                      ;Restore r8
    pop     rcx                     ;Restore rcx
    pop     rdx                     ;Restore rdx
    pop     rsi                     ;Restore rsi
    pop     rdi                     ;Restore rdi
    pop     rbp                     ;Restore rbp

    ret