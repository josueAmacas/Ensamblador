section .data
    nombre DB "Josue", 10
    lenn EQU $-nombre
    apellido DB "MAcas", 10
    lena EQU $-apellido
    materia DB "Ensamblador", 10
    lenm EQU $-materia
    genero DB "Masculino",10
    leng EQU $-genero

section .text
    global _start
_start:

    mov eax, 4		;tipo de subrutina, operacion => escritura, salida
	mov ebx, 0		;tipo de estandar, por teclado
	mov ecx, nombre	    ;el registro ecx se almacena la referencia a imprimir "mensaje"
	mov edx, lenn       ;el registro ecx se almacena la referencia a imprimir por # caracteres
    int 80H
    
    mov eax, 4		;tipo de subrutina, operacion => escritura, salida
	mov ebx, 0		;tipo de estandar, por teclado
    mov ecx, apellido	
    mov edx, lena
    int 80H

    mov eax, 4		;tipo de subrutina, operacion => escritura, salida
	mov ebx, 0		;tipo de estandar, por teclado
    mov ecx, materia	
    mov edx, lenm
    int 80H

    mov eax, 4		;tipo de subrutina, operacion => escritura, salida
	mov ebx, 0		;tipo de estandar, por teclado
    mov ecx, genero	
    mov edx, leng
	int 80H
    
    mov eax, 1		;salida del programa, system_exit, sys_exit 
	mov ebx, 0		;si el retorno es 0 (200 en la web) ok
	int 80H