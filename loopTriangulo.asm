;Josue Macas
;Programa que imprime un Triangulo invertido con loop

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

section .txt
    global _start

_start:
    mov ecx, 9

principal:
    push rcx

imprimirAsterisco:        
    push rcx
    ;*********** nueva lineas *******
    imprimir asterisco, 2
    pop rcx
    loop imprimirAsterisco ; salto a l2, dec cx,
    imprimir newline, len_nl
    ;******** finaliza el loop de las columnas

    pop rcx
    loop principal

salir:
    mov eax, 1
    int 80h 