;Josue Macas
;05-08-2020

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
    numero rest 2
    presentarN1 rest 2
    presentarN2 rest 2
    respuesta rest 2
    aux rest 2
    x rest 2

section .txt
    global _start

_start:

    mov al, 1
	mov [aux], al
	mov ecx, 0
	
principal:
	cmp ecx,9
	jz bucle
	inc ecx
	push rcx
	mov [numero], ecx
	jmp imp
	
imp:
	mov al, [numero]
	mov [presentarN1], al
	mov cl, [aux]
	mul cl
	
	mov [numero], al
	mov ah, [presentarN1]
	add ax, '00'
	add cx, '0'
	mov [presentarN1], ah
	mov [presentarN2], cl

	imprimir presentarN1, 1
	imprimir msj1, len_msj1
	imprimir presentarN2, 1
	imprimir msj2, len_msj2

	mov eax, 48
	add [numero], eax 
	imprimir numero, 2
	imprimir newline, len_nl
	pop rcx
	jmp principal

bucle: 
	imprimir newline, len_nl
	mov ebx, [aux]
	inc ebx
	mov [aux], ebx
	mov ecx, 0
	cmp ebx, 10
	jb principal        ;jnAE 

salir:
    mov eax, 1
    int 80H

