%include 'in_out.asm'
section .data
   msg_x db 'Введите x: ',0h
   msg_a db 'Введите a: ',0h
   msg_result db 'F(x) = ',0h

section .bss
   x resb 10
   a resb 10
   result resb 10
section .text
   global _start

_start:
   ; Ввод x
   mov eax, msg_x
   call sprint
   mov ecx, x
   mov edx, 10
   call sread
   mov eax, x
   call atoi
   mov [x], eax

   ; Ввод a
   mov eax, msg_a
   call sprint
   mov ecx, a
   mov edx, 10
   call sread
   mov eax, a
   call atoi
   mov [a], eax

   ; Проверка условия: если a ≠ 1, то f(x) = a²
   cmp eax, 1
   jne a_squared

   ; Если a = 1: f(x) = 10 + x
   mov eax, 10
   add eax, [x]
   mov [result], eax
   jmp print_result

a_squared:
   ; Если a ≠ 1: f(x) = a²
   mov eax, [a]
   mul eax           ; eax = a * a
   mov [result], eax

print_result:
   ; Вывод результата
   mov eax, msg_result
   call sprint
   mov eax, [result]
   call iprintLF

   call quit
