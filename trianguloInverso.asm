;Josue Macas
;Programa que imprime un cuadrado

%macro imprimir 2	
	mov eax,4		
	mov ebx,1		
	mov ecx,%1 		
	mov edx,%2		
	int 80H			
%endmacro


section .data
    asterisco db '*'
    newline DB " ", 10
    len_nl EQU $-newline

section .text
    global _start
_start:

    mov ebx, 9  ;filas
    mov ecx, 9  ;columnas

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
    mov ecx, ebx
    jmp principal


salir:
    mov eax, 1
    int 80h