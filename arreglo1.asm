;Josue Andres Macas
;Programa de Cadena

%macro imprimir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
section .data
	
	arreglo db 3,2,0,7,5
    len_arreglo equ $-arreglo
    
	espacio db 10
	len_esp equ $-espacio
	
section .bss
	numero resb 1

section .text
	global _start
	
_start:

    mov esi, arreglo        ;esi = fijar el tamanio del arreglo, posicionar el arreglo en memoria
    mov edi, 0              ;edi = contener el indice del arreglo

imprimir1:
    mov al, [esi]
    add al, '0'
    mov [numero], al

    add esi, 1
    add edi, 1

    imprimir numero, 1
    imprimir espacio,len_esp
    

    cmp edi, len_arreglo    ;cmp 3, 4 => activa carry
                            ;cmp 4, 3 => desactiva carry y zero
                            ;cmp 3, 3 => desactiva carry y zero se activa
    jb imprimir1             ;se ejecuta cuando la badera de carry esta activada



salir:
	mov eax, 1
	mov ebx, 0
	int 80h


