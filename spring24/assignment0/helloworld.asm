;****************************************************************************************************************************
;Program name: "Begin Assembly".  This program serves as a model for new programmers of X86 programming language.  This     *
;shows the standard layout of a function written in X86 assembly.  The program is a live example of how to complie,         *
;assembly, link, and execute a program containing source code written in X86.  Copyright (C) 2024  Floyd Holliday.          *
;                                                                                                                           *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be useful,   *
;but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See   *
;the GNU General Public License for more details A copy of the GNU General Public License v3 is available here:             *
;<https://www.gnu.org/licenses/>.                                                                                           *
;****************************************************************************************************************************




;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;Author information
;  Author name: Floyd Holliday
;  Author email: holliday@fullerton.edu
;
;Program information
;  Program name: Begin Assembly
;  Programming languages: One module in C, one in X86, and one in bash.
;  Date program began: 2024-Jan-5
;  Date of last update: 2024-Apr-22
;  Files in this program: beginhere.c, helloworld.asm, r.sh.  At a future date rg.sh may be added.
;  Testing: Alpha testing completed.  All functions are correct.
;  Status: Ready for release to customers
;
;Purpose
;  This program is a starting point for those learning to program in x86 assembly. 
;
;This file:
;  File name: helloword.asm
;  Language: X86-64
;  Max page width: 124 columns
;  Assemble (standard): nasm -l hello.lis -o hello.o helloworld.asm
;  Assemble (debug): nasm -g dwarf -l hello.lis -o hello.o helloworld.asm
;  Optimal print specification: Landscape, 7 points, monospace, 8½x11 paper
;  Prototype of this function: unsigned long helloword();
; 
;
;
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**

;Declaration section.  The section has no name other than "Declaration section".  Declare here everything that does
;not have its own place of declaration

extern printf

extern fgets

extern stdin

extern strlen

global helloworld

name_string_size equ 48

segment .data
;This section (or segment) is for declaring initialized arrays

welcome db "The function 'hello world' written in x86 assembly has begun", 10, 0
prompt_for_name db "Please enter your first name, last name, and other names if available: ",0
friendly_message db "Welcome to assembly programming %s.  May you enjoy it as much as Kathleen Booth did.",10,0

segment .bss
;This section (or segment) is for declaring empty arrays

align 64
backup_storage_area resb 832

user_name resb name_string_size

segment .text

helloworld:

;Back up the GPRs (General Purpose Registers)
push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf

;Backup the registers other than the GPRs
mov rax,7
mov rdx,0
xsave [backup_storage_area]

;Output a welcome for the user
mov rax, 0
mov rdi, welcome
call printf

;Output instruction for the user
mov rax, 0
mov rdi, prompt_for_name
call printf

;Input user names
mov rax, 0
mov rdi, user_name
mov rsi, name_string_size
mov rdx, [stdin]
call fgets

;Remove newline
mov rax, 0
mov rdi, user_name
call strlen
mov [user_name+rax-1], byte 0

;Say something nice to the user of this program.
mov rax,0
mov rdi,friendly_message
mov rsi, user_name
call printf

;Count the characters in the user's name
xor rax,rax
mov rdi, user_name
call strlen
mov r15,rax
;r15 holds the number of characters

;Restore the values to non-GPRs
mov rax,7
mov rdx,0
xrstor [backup_storage_area]

;Send back the number of characters
mov rax,r15

;Restore the GPRs
popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp   ;Restore rbp to the base of the activation record of the caller program
ret
;End of the function helloworld ====================================================================

