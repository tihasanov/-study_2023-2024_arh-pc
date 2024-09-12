%include 'in_out.asm'
section .data
msg1 DB "Введите X: ",0h
msg2 DB "Введите A: ",0h
msg3 DB "Ответ=",0h
section .bss
x: RESB 80
a: RESB 80
ans: RESB 80
section .text
global _start
_start:
mov eax, msg1
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax, x
call atoi
mov [x], eax

mov eax, msg2
call sprint
mov ecx, a
mov edx, 80
call sread
mov eax, a
call atoi
mov [a], eax

mov eax, [a]
cmp eax, 3
jl calc_3a

mov eax, [x]
add eax, 1
jmp ansv

calc_3a:
mov ebx, 3
mul ebx

ansv:
mov [ans], eax
mov eax, msg3
call sprint
mov eax, [ans]
call iprintLF
call quit