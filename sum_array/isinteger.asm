
global isinteger
extern strlen
extern printf

segment .data

segment .bss

segment .text
isinteger:
    ;15 pushes
    push    rbp                     ;Backup rbp
    mov     rbp,rsp                 ;The base pointer now points to top of stack
    push    rdi                     ;Backup rdi
    push    rsi                     ;Backup rsi
    push    rdx                     ;Backup rdx
    push    rcx                     ;Backup rcx
    push    r8                      ;Backup r8
    push    r9                      ;Backup r9
    push    r10                     ;Backup r10
    push    r11                     ;Backup r11
    push    r12                     ;Backup r12
    push    r13                     ;Backup r13
    push    r14                     ;Backup r14
    push    r15                     ;Backup r15
    push    rbx                     ;Backup rbx
    pushf                           ;Backup rflags

    mov     r15, rdi                ; rdi contains the start of the array
    mov     r14, 1                  ; r14 is the index starting at 1

    ; Get the string length
    mov     rdi, r15
    call    strlen
    mov     r13, rax                
    dec     r13                     ; r13 store the string length minus the null termination character

    ; Check if the first element is '+' or '-' and continute validation if so
    cmp     byte[r15], '+'
    je      continue_validation
    cmp     byte[r15], '-'
    je      continue_validation

    ; Check if the first element is a digit, continue to the loop if it is
    mov     rdi, [r15]
    call    is_digit
    cmp     rax, 0
    je      not_an_integer

continue_validation:
    ; If index >= length, stop checking
    cmp     r14, r13
    jge     is_an_integer  

    ; Check if array[index] is a digit, translate to { is_digit(array[index]) } code in C
    mov     rdi, [r15 + r14 * 1]    ; Calculate the address of a char(byte) array. r15 is the base address, r14 * 1 is the offset. 1 is redundant, but showing it is offset by 1 byte time the index count
    call    is_digit

    ; If array[index] is not a digit, return false
    cmp     rax, 0                  ; Assembly has no bolean; 0 = false, -1 = true as user defined in is_digit() below
    je      not_an_integer

    ; If array[index] is a digit, continue the loop
    inc     r14
    jmp     continue_validation

not_an_integer:
    ; Set the return to false
    mov     rax, -1                 ; I define -1 = false
    jmp     exit
is_an_integer:
    ; Set the return to true
    mov     rax, 0                  ; I define 0 = true    
    jmp     exit                

exit:
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

;========= Begin function is_digit ==================================================================================

;****************************************************************************************************************************
;Program name: "is_digit".  This a library function contained in a single file.  The function receives a char parameter.  It*
;returns true if that parameter is the ascii value of a decimal digit and returns false in all other cases.                  *
;Copyright (C) 2022 Floyd Holliday.                                                                                         *
;                                                                                                                           *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public   *
;License version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be   *
;useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.*
;See the GNU Lesser General Public License for more details. A copy of the GNU General Public License v3 is available here: *
;<https:;www.gnu.org/licenses/>.                                                                                            *
;****************************************************************************************************************************
;
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;Author information
;  Author name: Floyd Holliday
;  Author email: holliday@fullerton.edu
;  Author phone (wired phone in CS building): (657)278-7021
;
;Status
;  This software is not an application program, but rather it is a single function licensed for use by other applications.
;  This function can be embedded within both FOSS programs and in proprietary programs as permitted by the LGPL.

;Function information
;  Function name: is_digit
;  Name selection.  This function is named is_digit to avoid confusion with an existing library function named isdigit.
;  Programming language: X86 assembly in Intel syntax.
;  Date development began:  2022-Feb-28
;  Date version 1.0 finished: 2022-Feb 28
;  Files of this function: currently is_digit is an auxillary function of isfloat, and as such does not occupy its own file.
;  System requirements: an X86 platform with nasm installed or other compatible assembler.
;  Known issues: none
;  Assembler used for testing: Nasm version 2.14.02
;  Prototype: bool is_digit(char);
;
;Purpose
;  This function wil accept a single char as input parameter and determine if that parameter represents a decimal digit. 
;
;Translation information if this function occupied its own file.  Currently the function is_digit resides in the same 
;same file as isfloat and therefore, will be assembled when isfloat is assembled.
;  Assemble: nasm -f elf64 -l is_digit.lis -o is_digit.o is_digit.asm
;
;Software design document:
;  An Execution flow chart accompanies this function.  That document will provide a better understanding of the 
;  algorithm used in the isfloat function than a direct reading of the source code of the function.

;========= Begin source code ====================================================================================
;Declaration area
true equ -1
false equ 0
ascii_value_of_zero equ 0x30
ascii_value_of_nine equ 0x39

segment .data
   ;This segment is empty

segment .bss
   ;This segment is empty

segment .text
is_digit:
    ;Block that backs up almost all GPRs
    ;Back up the general purpose registers for the sole purpose of protecting the data of the caller.
    push rbp                                          ;Backup rbp
    mov  rbp,rsp                                      ;The base pointer now points to top of stack
    push rdi                                          ;Backup rdi
    push rsi                                          ;Backup rsi
    push rdx                                          ;Backup rdx
    push rcx                                          ;Backup rcx
    push r8                                           ;Backup r8
    push r9                                           ;Backup r9
    push r10                                          ;Backup r10
    push r11                                          ;Backup r11
    push r12                                          ;Backup r12
    push r13                                          ;Backup r13
    push r14                                          ;Backup r14
    push r15                                          ;Backup r15
    push rbx                                          ;Backup rbx
    pushf                                             ;Backup rflags

    ;Make a copy of the passed in array of ascii values.
    ;Note that only the low one-byte of rdi is important for this function is_digit.
    ;Nevertheless, we copy the entire 8-byte register.
    mov r13,0
    mov r13b,dil     ;Copy the low byte of rdi to the low byte of r13.  The other bytes of rdi are all zeros.

    ;Block to test if value in r13 >= ascii(0)
    cmp r13,ascii_value_of_zero
    jl is_digit.return_false

    ;Block to test if value in r13 <= ascii(9)
    cmp r13,ascii_value_of_nine
    jg is_digit.return_false

    ;Return true
    xor rax,rax  ;Set rax to zero
    mov rax,true
    jmp is_digit.restore_gpr_registers

    is_digit.return_false:
    xor rax,rax  ;Set rax to zero
    mov rax,false

    is_digit.restore_gpr_registers:
    ;Restore all general purpose registers to their original values
    popf                                    ;Restore rflags
    pop rbx                                 ;Restore rbx
    pop r15                                 ;Restore r15
    pop r14                                 ;Restore r14
    pop r13                                 ;Restore r13
    pop r12                                 ;Restore r12
    pop r11                                 ;Restore r11
    pop r10                                 ;Restore r10
    pop r9                                  ;Restore r9
    pop r8                                  ;Restore r8
    pop rcx                                 ;Restore rcx
    pop rdx                                 ;Restore rdx
    pop rsi                                 ;Restore rsi
    pop rdi                                 ;Restore rdi
    pop rbp                                 ;Restore rbp

    ret                                     ;Pop the integer stack and jump to the address represented by the popped value.