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
    int 80h
    
    ;********asignacion de un numero en variable
    mov ebx, 7
    add ebx, '0'
    mov [numero], ebx

    ;****imprime mensaje presentacion ******
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_presentacion
    mov edx, len_msg_presentacion
    int 80h

    ;******* imprime numero ******
    mov eax, 4
    mov ebx, 1
    mov ecx, numero
    mov edx, 5
    int 80h

    ;salida del programa
    mov eax, 1
    int 80h