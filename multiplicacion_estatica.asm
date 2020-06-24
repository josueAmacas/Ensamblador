;Multiplicacion de dos numeros estaticos
;Josue Macas
section .data
    resultado DB "El resultado es:", 10
    len_res EQU $-resultado
    newline DB " ", 10
    len_nl EQU $-newline

section .bss
    multiplicacion resb 1
    ;res resb 2

section .text
    global _start
_start:

    mov al, 3
    mov bh, 2
    mul bh        ;eax = eax * ebx
    add al, '0'        ;ajuste

    ;ax // 12
    ;add al,, '0'
    ;add ah, '0'
    ;mov [resultado+0], ah
    ;mov [resultado+1], al

    mov [multiplicacion], al

    mov eax, 4
    mov ebx, 1 
    mov ecx, resultado
    mov edx, len_res
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, multiplicacion
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