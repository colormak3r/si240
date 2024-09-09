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

extern printf
extern scanf

global hello_world   
segment .data   
    string_format db "%s",0
segment .bss 
    name resb 40
segment .text

hello_world:   
    push rbp
    mov rbp, rsp

    ; Backup GPRs
    ; 15 pushes

    ; Scan the user input
    mov rdi, string_format
    mov rsi, name
    call scanf

    ; Return the user input as a string
    mov rax, name

    ; Restore GPRs
    ; 15 pops

    pop rbp

    ret