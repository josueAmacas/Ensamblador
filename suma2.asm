;Suma de dos numeros se ingresan por teclado
section .data
    n1 DB "Ingrese primer numero", 10
    len_n1 EQU $-n1

    n2 DB "Ingrese segundo numero",10
    len_n2 EQU $-n2

    resultado DB "El resultado es:", 10
    len_res EQU $-resultado

    newline DB " ", 10
    len_nl EQU $-newline

section .bss
    numero1 resb 1
    numero2 resb 1
    suma resb 1

section .text
    global _start
_start:
    ;****imprime mensaje 1******
    mov eax, 4
    mov ebx, 1
    mov ecx, n1
    mov edx, len_n1
    int 80h
    
     ;****lectura mensaje 1******
    mov eax, 3          ;define el tipo de operacion
    mov ebx, 2          ;estandar de entrada
    mov ecx, numero1     ;lo que se captura en teclado
    mov edx, 2           ;numero de caracteres
    int 80H             ;interrupcion de gnu linux

    ;****imprime mensaje 2******
    mov eax, 4
    mov ebx, 1
    mov ecx, n2
    mov edx, len_n2
    int 80h
    
     ;****lectura mensaje******
    mov eax, 3          ;define el tipo de operacion
    mov ebx, 2          ;estandar de entrada
    mov ecx, numero2     ;lo que se captura en teclado
    mov edx, 2           ;numero de caracteres
    int 80H             ;interrupcion de gnu linux

    ;*******Se transforma los valores a enteros
    mov ax, [numero1]
    mov bx, [numero2]
    sub ax, '0'         ;valor convertido en digito
    sub bx, '0'         ;valor convertido en digito
    add ax, bx          ;se hace la operacion de suma
    add ax, '0'           
    mov [suma], ax      ;valores convertidos a cadena

    ;****imprime mensaje presentacion ******
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, len_res
    int 80h

    ;******* imprime la suma ******
    mov eax, 4
    mov ebx, 1
    mov ecx, suma
    mov edx, 2
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, len_nl
    int 80h

    ;salida del programa
    mov eax, 1
    int 80h