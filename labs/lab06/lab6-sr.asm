;--------------------------------
; Программа вычисления выражения 18 варианта: f(x)=3(𝑥 + 10) − 20
;--------------------------------
%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
msg: DB 'Введите x: ',0
res: DB 'Результат: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprint ;
mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, `eax=x`
; ---- Вычисление выражения
add eax,10 ; EAX=x+10
mov ebx,3 ;EBX=3
mul ebx ;EAX=(x+10)*3
sub eax,20 ;EAX=(x+10)*3-20
mov edi,eax ; запись результата вычисления в 'edi'
; ---- Вывод результата на экран
mov eax,res ;
call sprint ; сообщения 'Результат: '
mov eax,edi ; вызов подпрограммы печати значения
call iprintLF ; из 'edi' в виде символов

call quit ; вызов подпрограммы завершения
