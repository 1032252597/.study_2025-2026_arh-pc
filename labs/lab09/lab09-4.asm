%include 'in_out.asm'
SECTION .data
msg db "Результат: ",0
SECTION .bss
prm: RESB 80
SECTION .text
global _start
_start:
   pop ecx
   pop edx
   sub ecx,1
   mov esi,0
next:
   cmp ecx,0h
   jz _end
   pop eax
   call atoi
   call calcul
   add esi, eax
   loop next
_end:
   mov eax,msg
   call sprint
   mov eax,esi
   call iprintLF
   call quit
calcul:
   sub eax,1 
   mov ebx,10
   mul ebx
   ret
