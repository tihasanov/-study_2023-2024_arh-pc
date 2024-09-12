%include 'in_out.asm'
SECTION .data
filename db 'name.txt', 0h ; Имя файла
msg db 'Как вас зовут? ', 0h ; Сообщение
myname db 'Меня зовут ', 0h
SECTION .bss
contents resb 255 ; переменная для вводимой строки
SECTION .text
global _start
_start:
; --- Печать сообщения `msg`
mov eax,msg
call sprint
; ---- Запись введеной с клавиатуры строки в `contents`
mov ecx, contents
mov edx, 255
call sread

mov ecx, 0777o
mov ebx, filename
mov eax, 8
int 80h

mov edx, 255 ; количество байтов для записи
mov ecx, myname ; адрес строки для записи в файл
mov ebx, eax ; дескриптор файла
mov eax, 4 ; номер системного вызова `sys_write`
int 80h ; вызов ядра

mov eax, 5

mov edx, 2 ; значение смещения -- конец файла
mov ecx, 0 ; смещение на 0 байт
mov ebx, eax ; дескриптор файла
mov eax, 19 ; номер системного вызова `sys_lseek`
int 80h ; вызов ядра
mov edx, 9 ; Запись в конец файла
mov ecx, contents ; строки из переменной `msg`
mov eax, 4
int 80h

; --- Запись дескриптора файла в `esi`
; --- Расчет длины введенной строки
; --- Закрываем файл (`sys_close`)
mov ebx, esi
mov eax, 6
int 80h
call quit