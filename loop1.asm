;Josue Macas
;Programa de ejemplo de loop

%macro imprimir 2	
	mov eax,4		
	mov ebx,1		
	mov ecx,%1 		
	mov edx,%2		
	int 80H			
%endmacro

section .data
    saludo db 10,'Hola:  '
    len_saludo equ $-saludo

    newline DB " ", 10
    len_nl EQU $-newline

section .bss
    numero resb 2

section .txt
    global _start

_start:
    mov ecx, 9

for:
    push rcx
    add ecx, '0'
    mov [numero], ecx

    imprimir saludo,len_saludo

    imprimir numero, 2

    pop rcx
    loop for 

    imprimir newline, len_nl

salir:
    mov eax, 1
    int 80h 