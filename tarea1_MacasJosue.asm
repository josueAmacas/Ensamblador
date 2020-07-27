;Tarea nro 1
;Josue Andres Macas
;6to "A" Sistemas

;Comentar el significado de cada línea


;Funcion que sirve para mostrar los datos 
%macro imprimir 2		;Se define el nombre de la funcion macro y el 2 significa que va atener dos parametros
	mov eax,4			;se define el 4 para el tipo de subrutina, operacion => escritura sys_write
	mov ebx,1			;se define el 1 para el tipo de estandar, por teclado
	mov ecx,%1 			;en el registro ecx se almacena la referencia a imprimir del primer parametro
	mov edx,%2			;en el registro edx se almacena la referencia a imprimir del segundo parametro
	int 80H				;interrupcion de software para el SO. Linux
%endmacro				;fin de la funcion macro


;Funcion que sirve para obtener los datos ingresados
%macro leer 2				;Se define el nombre de la funcion macro y el 2 significa que va atener dos parametros
    mov eax,3				;se define el 3 para el tipo de subrutina, operacion => lectura sys_read
    mov ebx,0				;se pone el valor 0 en el registro ebx, si el retorno es 0 (200 en la web) ok, sin errores
    mov ecx,%1 				;en el registro ecx se almacena la referencia del primer parametro
    mov edx,%2				;en el registro ecx se almacena la referencia del segundo parametro
    int 80H 				;interrupcion de software para el SO. Linux
%endmacro					;fin de la funcion macro

; ecx,modo de acceso
; edx, permisos


;Seccion donde se declara variables o constantes de datos estaticos no inicializados
section .bss				;inicio de la seccion bss
	auxiliar resb 30		;declaracion de la variable "auxilar" y reserva 30 bytes
	auxiliarb resb 30		;declaracion de la variable "auxilarb" y reserva 30 bytes
	auxiliarc resb 30		;declaracion de la variable "auxilarc" y reserva 30 bytes


;Seccion de datos
section .data				;inicia la seccion de datos
	msg db 0x1b ,"       "	;constante de 6 espacios para contener al dato msg
	lenmsg equ $-msg		;constante longitud que calcula el numero de caracteres

	salto db " ",10 		;constante que define un espacio y el 10 define un salto de linea o enter en codigo ASCII
	lensalto equ $-salto	;constante longitud que calcula el nunero de caracteres


;Seccion de codigo
section .text				;inicio de la seccion de codigo
    global _start    		;hace vicible una etiqueta para el compilador

_start:						;inicio del programa
	
	mov ecx,9				;se realiza un movimiento directo al registro "ecx", se mueve 9 decimal al registro "ecx"

	mov al,0				;se mueve 0 decimal al registro "al"
	mov [auxiliar],al		;se mueve el valor del registro "al" a la variable auxiliar

cicloI:						;etiqueta
	push ecx				;Se almacena en pila el valor registrado en "ecx" 
	mov ecx,9				;se realiza un movimiento directo al registro "ecx", se mueve 9 decimal al registro "ecx"

	mov al,0				;se mueve 0 decimal al registro "al"
	mov [auxiliarb],al		;se mueve el valor del registro "al" a la variable auxiliarb

	cicloJ:					;etiqueta
		push ecx			;se pone el valor 9 en el registro ecx


		call imprimir0al9	;se llama a la etiqueta imprimir0al9 y al finalizar retorna la ultima poscicion
		

	;	imprimir msg2,lenmsg2

	fincicloJ:				;etiqueta
		mov al,[auxiliarb]	;se mueve el valor de la variable auxiliarb al registro "al"  
		inc al				;se incrementa el registro al
		mov [auxiliarb],al	;se mueve el valor del registro "al" a la variable "auxiliarb"

		pop ecx				;recupera el ultimo valor de la pila
		loop cicloJ			;se decrementa el registro ecx, mientras este no sea 0 seguira en un cicloJ 
		
	;imprimir salto,lensalto

fincicloI:					;etiqueta
	mov al,[auxiliar]		;se mueve el valor de la variable auxiliar al registro "al"  
	inc al					;se incrementa el registro al
	mov [auxiliar],al		;se mueve el valor del registro "al" a la variable "auxiliar"

	pop ecx					;recupera el ultimo valor de la pila
	loop cicloI				;se decrementa el registro ecx, mientras este no sea 0 seguira en un cicloI
	

salir:
	mov eax, 1				;salida del programa, sys_exit 
	int 80H					;interrupcion de software para el SO. Linux



imprimir0al9:				;se llama a la funcion macro imprimir
	
	mov ebx,"["				;se realiza un movimiento directo al registro "ebx", se mueve "[" char al registro "ebx"
	mov [msg+1], ebx		;se mueve el valor de ebx a la posicion 1 de la memoria de la variable msg		

	mov bl,[auxiliar]		;se mueve el valor de la variable "auxiliar" al registro "bl"
	add bl,'0'				;suma en codigo Ascci para convertir en cadena
	mov [msg+2], bl			;se mueve el valor de bl a la posicion 2 de la memoria de la variable msg


	mov ebx,";"				;se realiza un movimiento directo al registro "ebx", se mueve ";" char al registro "ebx"
	mov [msg+3], ebx		;se mueve el valor de ebx a la posicion 3 de la memoria de la variable msg

	
	mov bl,[auxiliarb]		;se mueve el valor de la variable "auxiliarb" al registro "bl"
	add bl,'0'				;suma en codigo Ascci para convertir en cadena
	mov [msg+4],bl			;se mueve el valor de bl a la posicion 4 de la memoria de la variable msg

	mov ebx,"fJ"			;se realiza un movimiento directo al registro "ebx", se mueve "fj" char al registro "ebx"
	mov [msg+5], ebx		;se mueve el valor de bl a la posicion 5 de la memoria de la variable msg

	imprimir msg,lenmsg		;se llama a la funcion macro imprimir y se le asigna los valores de los parametros "msg" y "lenmsg"

	ret						;retorna la informacion
