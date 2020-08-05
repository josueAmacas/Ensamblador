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
    asterisco db '*'
    
    newline DB " ", 10
    len_nl EQU $-newline

section .txt
    global _start

_start:
    mov ecx, 8
    mov ebx, 1

l1:
    push rcx
    push rbx
    ;*********** nueva lineas *******
    ;imprimir newline, len_nl
    mov ecx, ebx
    ;pop rcx
    ;push rcx

l2:
    push rcx
    ;*********** nueva lineas *******
    imprimir asterisco, 2
    pop rcx
    loop l2 ; salto a l2, dec cx,
    imprimir newline, len_nl
    ;******** finaliza el loop de las columnas
    pop rbx
    pop rcx
    inc ebx
    loop l1
    ;****** Finaliza el loop de las filas

    mov eax, 1
    int 80H

