;Josue Andres Macas
;24-08-2020
;6to Ciclo
;Realizar un programa en ensamblador que pida un número de 1 al 9 y determine si es primo o no primo. 

%macro imprimir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

%macro leer 2
	mov eax, 3
	mov ebx, 0
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
    msj1 db "Ingrese un numero del 1 al 9", 10
    lenmsj1 equ $-msj1

	msj2 db "El numero ingresado es primo",10
    lenmsj2 equ $-msj2

    msj3 db "El numero ingresado no es primo",10
    lenmsj3 equ $-msj3

section .bss
	numero resb 2

section .text
    global _start
_start:

    ;****  imprime msj1 *******
    imprimir msj1, lenmsj1
    ;****** leer numero ingresado *****
    leer numero, 2

    ;**** conversion a digito
    mov al,[numero]
	sub al, '0'

    ;***** comparaciones para saber si el numero es primo
    par:        
	    cmp al,2
	    jz numPrimo
	    jc numPrimo
	    jmp comp1
		
    comp1:
		and al, 1
		jz numNoPrimo
		jmp impar

    impar:
		cmp al,3
		jz numPrimo
		jmp comp2
	
    comp2:
		cmp al,9
		jz numNoPrimo
		jmp numPrimo
	
    ;***** impresion de mensaje primo ***** 
    numPrimo:
		imprimir msj2, lenmsj2
		jmp salir
	
    ;***** impresion de mensaje no primo *****
    numNoPrimo:
		imprimir msj3, lenmsj3
		jmp salir
   
    salir:
        mov eax, 1
        int 80h