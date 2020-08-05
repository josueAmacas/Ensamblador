;Josue Macas
;Programa que imprime un cuadrado de asteriscon con loop

%macro imprimir 2	
	mov eax,4		
	mov ebx,1		
	mov ecx,%1 		
	mov edx,%2		
	int 80H			
%endmacro

section .data
    msj1 DB " * " 
    len_msj1 EQU $-msj1

    msj2 DB " = "
    len_msj2 EQU $-msj2

    newline DB " ", 10
    len_nl EQU $-newline

section .bss
    numero1 resb 2
    numero2 resb 2
    resultado resb 2

section .txt
    global _start

_start:

    mov al, 1
    add al, '0'
    mov [numero1], al
    mov cx, 1

ciclo:
    push cx
    mov ax, [numero1]
    sub ax, '0'
    mul cx
    add ax, '0'
    mov [resultado], ax

    add cx, '0'
    mov [numero2], cx
    imprimir numero1, 2
    imprimir msj1, len_msj1
    imprimir numero2, 2
    imprimir msj2, len_msj2
    imprimir resultado, 2
    imprimir newline, len_nl
    pop cx
    inc cx
    cmp cx, 10
    jnz ciclo



salir:
    mov eax, 1
    int 80h 