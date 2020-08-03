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
    jz salir
    jmp imprimirAsterisco

imprimirAsterisco:        
    push rcx
    imprimir asterisco, 1 ;el valor de ecx se remplaza con msj = '*'
    pop rcx
    
    loop imprimirAsterisco
    
    imprimir newline, len_nl
    pop rcx
    mov ecx, ecx
    loop principal

salir:
    mov eax, 1
    int 80h 