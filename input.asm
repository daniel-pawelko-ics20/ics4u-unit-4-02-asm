;-------------------;
; 2 Digit Input
; By: Daniel
; 2022-11-23
;-------------------;

;-------------------; SYSTEM CALLS
SYS_WRITE   equ 1   ; write to _
SYS_READ    equ 0   ; read from _
SYS_EXIT    equ 60  ; end program
;-------------------;

;-------------------;
STDIN       equ 0   ; standard input
STDOUT      equ 1   ; standard output
;-------------------;


section .bss
    inpLen equ     3        ; 3 byte for user input, 3 bytes because need to
                            ;   make room for line feed at the end of input(\n)
    inp     resb    inpLen  ; buffer for user input

section .data
    message: db "Please input a 2 digit number: "
    messageLen: equ $-message
    out: db 10, "You entered: "
    outLen: equ $-out
    done: db 10, "Done.", 10
    doneLen: equ $-done
    

        section .text
        global _start

_start:
        ; OUTPUT FOR ASKING FOR INPUT
        mov rax, SYS_WRITE    
        mov rdi, STDOUT       
        mov rsi, message     
        mov rdx, messageLen 
        syscall           

        ; INPUT
        mov rax, SYS_READ 
        mov rdi, STDIN  
        mov rsi, inp     
        mov rdx, inpLen
        syscall

        ; OUTPUT
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, out
        mov rdx, outLen
        syscall

        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, inp
        mov rdx, inpLen
        syscall

        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, done
        mov rdx, doneLen
        syscall

        ; SYS_EXIT SUCCESS
        mov rbx, 0        
        mov rax, SYS_EXIT 
        syscall


