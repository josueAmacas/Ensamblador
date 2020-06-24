;Division de dos numeros estaticos
;Josue Macas
section .data
    resultado DB "El resultado es:", 10
    len_res EQU $-resultado

    sobrante DB "El residuo es:", 10
    len_sobrante EQU $-sobrante

    newline DB " ", 10
    len_nl EQU $-newline

section .bss
    residuo resb 2
    cociente resb 2

section .text
    global _start
_start:
    ;al es el cociente
    ;ah es el residuo
    mov al, 5
    mov bh, 3
    div bh      ;eax = eax / ebx
    add al, '0'        ;ajuste
    mov [cociente], al
    add ah, '0'        ;ajuste
    mov [residuo], ah

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, len_res
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, cociente
    mov edx, 1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, len_nl
    int 80h

     mov eax, 4
    mov ebx, 1
    mov ecx, sobrante
    mov edx, len_sobrante
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, residuo
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