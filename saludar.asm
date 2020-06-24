section .data
	mensaje DB "Mi primera vez con NASM"	;constante mensaje de un byte de memoria
	longitud EQU $-mensaje			;constante longutud que calcula el # caracteres de mensaje 

section .text
	global _start
_start:
	;********** imprimir el mensaje ************
	mov eax, 4		;tipo de subrutina, operacion => escritura, salida
	mov ebx, 1		;tipo de estandar, por teclado
	mov ecx, mensaje	;el registro ecx se almacena la referencia a imprimir "mensaje"
	mov edx, longitud	;el registro ecx se almacena la referencia a imprimir por # caracteres
	int 80H			;interrupcion de software para el SO. Linux
	
	mov eax, 1		;salida del programa, system_exit, sys_exit 
	mov ebx, 0		;si el retorno es 0 (200 en la web) ok
	int 80H
