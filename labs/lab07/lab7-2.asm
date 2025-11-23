%include 'in_out.asm'
section        .data
   msg1 db '',0h
   msg2 db "",0h
   A dd '20'
   C dd '50'
section .bss
   max resb 10
   B   resb 10
section       .text
   global _start
_start:
   mov  eax,msg1
   call sprint
   mov ecx,B
   mov  edx
   call sread
   mov eax,B
   call atoi
   mov  [B],eax
   mov  ecx,[A]
   mov  [max],ecx
check_B:
   mov  eax,max
   call atoi
   mov  [max],eax
   mov  ecx,[max]
   cmp  ecx,[B]
   jg   fin
   mov  ecx,[B]
   mov  [max],ecx
fin:
   mov  eax, msg2
   call sprint
   mov  eax,[max]
   call iprintLF
   call quit
