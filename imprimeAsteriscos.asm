;Josue Macas
;Programa que imprime 9 asteriscos(*)

section .data
    asterisco db '*'

section .text
    global _start
_start:
    mov ecx, 9

imprimir:
    dec ecx
    push rcx
    mov eax, 4
    mov ebx, 1
    mov ecx, asterisco
    mov edx, 1
    int 80h
    pop rcx
    cmp ecx, 0
    jnz imprimir
    
    ;jmp imprimir

    mov eax, 1
    int 80h