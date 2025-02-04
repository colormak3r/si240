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
extern ingredients

segment .data
    ingredient_1 db "Tomato", 0
    ingredient_2 db "Cheese", 0
    ingredient_3 db "Pepperoni", 0
    price dq 10.0
    tax dq 0.08

segment .bss

segment .text
makepizza:
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

    ; Explaination: https://docs.google.com/presentation/d/1kl83m6gl5R_2KgwlaWPX8w6WPiz2-OGE9seDevfScIw/edit?usp=sharing
    ; Implement ingredients funciton call here
    ;mov     ?, ?
    ;mov     ?, 5
    ;mov     ?, ingredient_1
    ;mov     ?, 7
    ;mov     ?, ingredient_2
    ;mov     ?, 3
    ;mov     ?, ingredient_3
    ;movsd   ?, price
    ;movsd   ?, tax
    call ingredients

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