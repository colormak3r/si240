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
%include "macros.inc"   ; Include the macros file. No need to compile and link the macro file

segment .data
    msg_output db "Your debug number is %d", 10, 0
    format db "%d ",0
    nice_array dq 1,2,3,4,5,6,7
segment .bss

segment .text
executive:
    ; Create activation record
    push    rbp
    mov     rbp, rsp

    ; Back up GPRs
    backup_general_registers

    ; Using macro to find minimum number between 12 and 57
    min_num 12, 57
    mov     r15, rax

    ; Print out the smaller number
    ; Notice that we don't have extern printf here but the printing still works
    ; because extern printf was put into the macro.inc file
    print_msg msg_output, r15

    ; Print the array nice array using macro
    output_array nice_array, 7, format

    ;Restore the original values to the GPRs
    restore_general_registers

    ; Clean up activation record
    pop     rbp
    ret
