section .data
    mensaje DB "Ingrese un numero", 10
    len_mensaje EQU $-mensaje
    msg_presentacion DB "El nunmero ingresado es:",10
    len_msg_presentacion EQU $-msg_presentacion

section .bss
    numero resb 5

section .text
    global _start
_start:
    ;****imprime mensaje ******
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, len_mensaje
    int 80H

    ;****lectura mensaje******
    mov eax, 3          ;define el tipo de operacion
    mov ebx, 2          ;estandar de entrada
    mov ecx, numero     ;lo que se captura en teclado
    mov edx, 5           ;numero de caracteres
    int 80H             ;interrupcion de gnu linux

    ;****imprime mensaje presentacion ******
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_presentacion
    mov edx, len_msg_presentacion
    int 80H

    ;******* imprime numero ******
    mov eax, 4
    mov ebx, 1
    mov ecx, numero
    mov edx, 5
    int 80H

    ;salida del programa
    mov eax, 1
    int 80H