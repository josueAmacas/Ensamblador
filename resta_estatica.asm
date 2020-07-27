;Resta de dos numeros estaticos
;Josue Macas
section .data
    resultado DB "El resultado es:", 10
    len_res EQU $-resultado
    newline DB " ", 10
    len_nl EQU $-newline

section .bss
    resta resb 1

section .text
    global _start
_start:

    mov eax, 9
    mov ebx, 3
    sub eax, ebx        ;eax = eax - ebx
    add eax, '0'        ;ajuste

    mov [resta], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, len_res
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, resta
    mov edx, 1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, len_nl
    int 80h

    ;salida del programa
    mov eax, 1
    int 80H