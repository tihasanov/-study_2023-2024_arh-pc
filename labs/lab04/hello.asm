; hello.asm
section .data
    msg db 'Hello world!', 0

section .text
    global _start

_start:
    mov rax, 1          ; системный вызов для вывода сообщения
    mov rdi, 1          ; дескриптор файла 1 (stdout)
    mov rsi, msg        ; адрес сообщения
    mov rdx, 9          ; длина сообщения
    syscall             ; выполнить системный вызов

    mov rax, 60         ; системный вызов для выхода
    xor rdi, rdi        ; код возврата 0
    syscall             ; выполнить системный вызов
