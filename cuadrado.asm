;Josue Macas
;Programa que imprime un cuadrado

%macro imprimir 2	; inicia una instruccion repetitiva denominada"imprimir" que se puede llamar en cualquier parte
	mov eax,4		; indica el tipo de operacion en la cual sera de escritura y tendra una operacion de salida
	mov ebx,1		; mostrara el estandar de la aplicacion en este caso es por teclado
	mov ecx,%1 		; almacena el primer operando para imprimir
	mov edx,%2		; almacena la longitud a imprimir en este caso el segundo operando
	int 80H			; interrupcion de software libre linux y da significado a las anteriores lineas
%endmacro

section .data
    asterisco db '*'
    newline DB " ", 10
    len_nl EQU $-newline


section .text
    global _start
_start:

    mov rbx, 9  ;filas
    mov rcx, 9  ;columnas

principal:
    push rbx
    cmp rbx, 0
    jz salir
    jmp imprimirAsterisco

imprimirAsterisco:
    dec rcx      
    push rcx
    imprimir asterisco, 1 ;el valor de ecx se remplaza con msj = '*'
    pop rcx
    cmp rcx, 0
    jnz imprimirAsterisco
    imprimir newline, len_nl
    pop rbx
    dec rbx
    mov ecx, 9
    jmp principal



salir:
    mov eax, 1
    int 80h