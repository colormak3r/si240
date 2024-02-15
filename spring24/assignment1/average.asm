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

global average

extern printf
extern fgets
extern stdin
extern strlen
extern scanf

string_size equ 48

segment .data
  prompt_for_name db "Please enter your first and last names: ", 0
  prompt_for_title db "Please ender your title such as Lieutenant, Chief, Mr, Mrs, Influencer, Chairman, Freshman, Foreman, Project Leader, etc: ", 0

  output_thank_you db "Thank you %s %s.", 10, 0

  prompt_distance_1 db 10, "Enter the number of miles traveled from Fullerton to Santa Ana: ", 0
  prompt_distance_2 db 10, "Enter the number of miles traveled from Santa Ana to Long Beach: ", 0
  prompt_distance_3 db 10, "Enter the number of miles traveled from Long Beach to Fullerton: ", 0

  prompt_speed db "Enter your average speed during that leg of the trip: ", 0

  print_confirm db 10, "The inputted data are being processed",10 , 10, 0

  output_total_distance db "The total distance traveled is %lf miles.", 10, 0
  output_average_speed db "The average speed during this trip is %lf mph.", 10, 0
  output_total_time db "The time of the trip is %lf hours.", 10, 0

  format_float db "%lf", 0

segment .bss
  align 64
  storedata resb 832
  user_name resb string_size
  user_title resb string_size

segment .text
average:
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

  ; Prompt user for their name
  mov     rax, 0
  mov     rdi, prompt_for_name          ; Please enter your first and last names:
  call    printf

  ; Get user name input
  mov     rax, 0
  mov     rdi, user_name
  mov     rsi, string_size
  mov     rdx, [stdin]
  call    fgets

  ; Remove the newline character
  mov     rax, 0
  mov     rdi, user_name
  call    strlen
  mov     [user_name + rax - 1], byte 0

  ; Prompt user for their title
  mov     rax, 0
  mov     rdi, prompt_for_title         ; Please ender your title such as Lieutenant, Chief, Mr, Mrs, Influencer, Chairman, Freshman, Foreman, Project Leader, etc: 
  call    printf

  ; Get user title input
  mov     rax, 0
  mov     rdi, user_title
  mov     rsi, string_size
  mov     rdx, [stdin]
  call    fgets
  
  ; Remove the newline character
  mov     rax, 0
  mov     rdi, user_title
  call    strlen
  mov     [user_title + rax - 1], byte 0

  ; Print the thank you message
  mov     rax, 0
  mov     rdi, output_thank_you         ; Thank you %s %s.           
  mov     rsi, user_title
  mov     rdx, user_name
  call    printf

  ; Prompt for trip distance 1 (Fulerton to Santa Ana)
  mov     rax, 0
  mov     rdi, prompt_distance_1        ; Enter the number of miles traveled from Fullerton to Santa Ana: 
  call    printf

  ; Get user input and store in xmm15  
  push    qword 0
  push    qword 0
  mov     rdi, format_float
  mov     rsi, rsp
  call    scanf
  movsd   xmm15, [rsp]
  pop     rax
  pop     rax

  ; Prompt for trip 1 average speed
  mov     rax, 0
  mov     rdi, prompt_speed             ; Enter your average speed during that leg of the trip: 
  call    printf

  ; Get user input and store in xmm12  
  push    qword 0
  push    qword 0
  mov     rdi, format_float
  mov     rsi, rsp
  call    scanf
  movsd   xmm12, [rsp]
  pop     rax
  pop     rax

  ; Prompt for trip distance 2 (Santa Ana to Long Beach)
  mov     rax, 0
  mov     rdi, prompt_distance_2        ; Enter the number of miles traveled from Santa Ana to Long Beach:
  call    printf

  ; Get user input and store in xmm14  
  push    qword 0
  push    qword 0
  mov     rdi, format_float
  mov     rsi, rsp
  call    scanf
  movsd   xmm14, [rsp]
  pop     rax
  pop     rax

  ; Prompt for trip 2 average speed
  mov     rax, 0
  mov     rdi, prompt_speed             ; Enter your average speed during that leg of the trip: 
  call    printf

  ; Get user input and store in xmm11  
  push    qword 0
  push    qword 0
  mov     rdi, format_float
  mov     rsi, rsp
  call    scanf
  movsd   xmm11, [rsp]
  pop     rax
  pop     rax

  ; Prompt for trip distance 3 (Long Beach to Fullerton)
  mov     rax, 0
  mov     rdi, prompt_distance_3       ; Enter the number of miles traveled from Long Beach to Fullerton: 
  call    printf

  ; Get user input and store in xmm13  
  push    qword 0
  push    qword 0
  mov     rdi, format_float
  mov     rsi, rsp
  call    scanf
  movsd   xmm13, [rsp]
  pop     rax
  pop     rax

  ; Prompt for trip 3 average speed
  mov     rax, 0
  mov     rdi, prompt_speed             ; Enter your average speed during that leg of the trip: 
  call    printf

  ; Get user input and store in xmm10  
  push    qword 0
  push    qword 0
  mov     rdi, format_float
  mov     rsi, rsp
  call    scanf
  movsd   xmm10, [rsp]
  pop     rax
  pop     rax

  ; Print the confirm message
  mov     rax, 0
  mov     rdi, print_confirm           ; The inputted data are being processed
  call    printf

  ; Input summary:
  ;   xmm15: distance 1
  ;   xmm14: distance 2
  ;   xmm13: distance 3
  ;   xmm12: speed 1
  ;   xmm11: speed 2
  ;   xmm10: speed 3

  ; Calculate total distance
  movsd   xmm9, xmm15
  addsd   xmm9, xmm14
  addsd   xmm9, xmm13   ; xmm9 now contains total distance

  ; Calculate total time (distance1 / speed1) + (distance2 / speed2) + (distance3 / speed3)
  divsd   xmm15, xmm12
  divsd   xmm14, xmm11
  divsd   xmm13, xmm10
  addsd   xmm15, xmm14
  addsd   xmm15, xmm13  ; xmm15 now contains total time

  ; Calculate average speed (total distance / total time)
  movsd   xmm13, xmm9   ; Create a copy of total distance in xmm13
  divsd   xmm13, xmm15  ; Divide total distance with total time stored in xmm15

  ; Move the total distance to a safe register
  movsd   xmm14, xmm9

  ; Output summary
  ;   xmm15: total time
  ;   xmm14: total distance
  ;   xmm13: average speed

  ; Output total distance
  mov     rax, 1
  mov     rdi, output_total_distance      ; The total distance traveled is %lf miles.
  movsd   xmm0, xmm14
  call    printf

  ; Output total time
  mov     rax, 1
  mov     rdi, output_total_time          ; The time of the trip is %lf hours.
  movsd   xmm0, xmm15
  call    printf

  ; Output average speed
  mov     rax, 1
  mov     rdi, output_average_speed       ; The average speed during this trip is %lf mph.
  movsd   xmm0, xmm13
  call    printf 

  ; Save the total distance to the stack
  push    qword 0
  movsd   [rsp], xmm13

  ; Restore all the floating-point numbers
  mov     rax, 7
  mov     rdx, 0
  xrstor  [storedata]

  ; Retrieve the total distance from the stack
  movsd   xmm0, [rsp]
  pop     rax

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