global strlen

section .data
    msg_welcome     db "Welcome to Marvelous Marvin’s Area Machine.", 10, 0
    msg_purpose     db "We compute all your areas.", 10, 0

    newline         db 10

section .bss
section .text
_start: