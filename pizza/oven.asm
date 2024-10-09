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

global makepizza
global checkpassword
extern ingredients

segment .data
    ing1 db "Peperonies",0
    ing2 db "Pepper",0
    ing3 db "Bacon",0

segment.bss

segment .text
makepizza:
    push    rbp
    mov     rbp, rsp

    ;Pass paramenters
    mov     rdi, 8
    mov     rsi, ing1
    mov     rdx, 16
    mov     rcx, ing2
    mov     r8, 200
    mov     r9, ing3
    call    ingredients

    pop     rbp   
    ret

checkpassword:
    push    rbp
    mov     rbp, rsp

    ; The password will stored be in rdi
    ; For safety, move it into r10 - r15 in actual assignment

    ; If the password == 7, jump to correct
    cmp     rdi, 7
    je      correct

    ; Else, jump to incorrect
    jmp     incorrect

correct:
    mov     rax, 1
    jmp     exit

incorrect:
    mov     rax, -999
    jmp     exit        ; You don't need this statement since the program will fall through exit function

exit:
    pop     rbp   
    ret
