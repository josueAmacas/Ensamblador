;Josue Andres Macas
;Programa de arreglo numero mayor

%macro imprimir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

%macro leerEntrada 2
	mov eax, 3
	mov ebx, 0
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
	
    msj1 db "Ingrese 5 numeros", 10
    lenmsj1 equ $-msj1

	msj2 db "Numero mayor es",10
    lenmsj2 equ $-msj2

    arreglo db 0,0,0,0,0
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

    ;********** Mensaje 1 ********
    imprimir msj1,lenmsj1
    ;****** lectura de datos del arreglo

leer:
    leerEntrada numero, 2

    mov al, [numero]
    sub al, '0'

    mov [esi], al       ;indice 0 es numero a

    inc edi
    inc esi         ;indice del arreglo, movemosel valor a un indice del arreglo

    cmp edi, len_arreglo
    jb leer

    mov ecx, 0
    mov bl, 0
    
comparacion:
    mov al, [arreglo + ecx]
    cmp al, bl
    jb contador
    mov bl, al

contador:
    inc ecx
    cmp ecx, len_arreglo
    jb comparacion

imprimirRes:
    add bl, '0'
    mov [numero], bl
    imprimir msj2, lenmsj2
    imprimir numero,1
    imprimir espacio, len_esp

salir:
	mov eax, 1
	mov ebx, 0
	int 80h


