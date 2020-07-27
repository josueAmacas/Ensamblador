;Menu de operaciones
;Josue Macas

%macro imprimir 2
mov eax, 4
mov ebx, 1
mov ecx, %1
mov edx, %2
int 80h
%endmacro 

%macro leer 1
mov eax, 3
mov ebx, 0
mov ecx, %1
mov edx, 2
int 80h
%endmacro 

section .data
	msg1		db		10,'-Calculadora-',10,0
	lmsg1		equ		$ - msg1
 
	msg2		db		10,'Numero 1: ',0
	lmsg2		equ		$ - msg2
 
	msg3		db		'Numero 2: ', 0
	lmsg3		equ		$ - msg3

	msgMenu		db		'Menu: ',10, 0
	lmsgMenu	equ		$ - msgMenu

	msg4		db		'1. Sumar: ',10, 0
	lmsg4		equ		$ - msg4

	msg5		db		'2. Restar: ',10, 0
	lmsg5		equ		$ - msg5

	msg6		db		'3. Multiplicar: ',10, 0
	lmsg6		equ		$ - msg6

	msg7		db		'4. Dividir: ',10, 0
	lmsg7		equ		$ - msg7

	msg11		db		'5. Salir: ',10, 0
	lmsg11		equ		$ - msg11

	msg8		db		'Seleccione la opcion: ',10, 0
	lmsg8		equ		$ - msg8

	msg9		db		10,'Resultado: ', 0
	lmsg9		equ		$ - msg9
 
	msg10		db		10,'Opcion Invalida',10,0
	lmsg10		equ		$ - msg10
 
	nlinea		db		10,10,0
	lnlinea		equ		$ - nlinea
 
section .bss
	opcion:		resb 	2
  	num1:		resb	2
	num2:		resb 	2
	resultado:	resb 	2
 
section .text
 	global _start
 
_start:
	;******** Titulo o encabezado **************
	; Imprimimos en pantalla el mensaje 1
	imprimir msg1, lmsg1
 
	;*******Mensaje del primer numero *************
	; Imprimimos en pantalla el mensaje 2
	imprimir msg2, lmsg2
	; Obtenemos el numero 1
	leer num1

	;*******Mensaje del segundo numero *************
	; Imprimimos en pantalla el mensaje 3
	imprimir msg3, lmsg3	 
	; Obtenemos el numero 2
	leer num2

menu: 
	;****** Mensaje del Menu ***********
	imprimir msgMenu, lmsgMenu ;***** msj titulo menu *******
	imprimir msg4,lmsg4 ;****** msj del sumar ************
	imprimir msg5, lmsg5 ;****** msj del restar ************
	imprimir msg6, lmsg6 ;****** msj del multiplicar ************
	imprimir msg7, lmsg7 ;****** msj del dividir ************
	imprimir msg11, lmsg11 ;****** msj del salir ************ 

	;************** Mensaje de opcion **************
	imprimir msg8, lmsg8
	;****** leer opcion *****
	leer opcion

	mov ah, [opcion]
	sub ah, '0'

	;comparar el valor ingresado por el usuario, para saber que operacion se piensa realizar
	;JE = jmp si existe una igualdad, salta cuando 

	cmp ah, 1
	JE sumar

	cmp ah, 2
	JE restar

	cmp ah, 3
	JE multiplicar

	cmp ah, 4
	JE dividir

	cmp ah, 5
	JE salir

	; Si el valor ingresado no cumple con ninguna de las condiciones anteriores entonces mostramos un mensaje de error y finalizamos
	; la ejecucion del programa
	imprimir msg10, lmsg10
	jmp menu
 
sumar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Sumamos el registro AL y BL
	add al, bl
 
	; Convertimos el resultado de la suma de decimal a ascii
	add al, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
 
	; Imprimimos en pantalla el mensaje 9
	imprimir msg9, lmsg9
	
	; Imprimimos en pantalla el resultado
	imprimir resultado, 1
	imprimir nlinea, lnlinea
	jmp menu
 
restar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Restamos el registro AL y BL
	sub al, bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add al, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
 
	; Imprimimos en pantalla el mensaje 9
	imprimir msg9, lmsg9
 
	; Imprimimos en pantalla el resultado
	imprimir resultado, 1
	
	imprimir nlinea, lnlinea
	jmp menu
 
multiplicar:
 
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Multiplicamos. AX = AL X BL
	mul bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax
 
	; Imprimimos en pantalla el mensaje 9
	imprimir msg9, lmsg9
 
	; Imprimimos en pantalla el resultado
	imprimir resultado, 1
	
	imprimir nlinea, lnlinea
	jmp menu

dividir:
 
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Igualamos a cero los registros DX y AH
	mov dx, 0
	mov ah, 0
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Division. AL = AX / BL. AX = AH:AL
	div bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax
 
	; Print on screen the message 9
	imprimir msg9, lmsg9
	
	; Imprimimos en pantalla el resultado
	imprimir resultado, 1

	imprimir nlinea, lnlinea
	jmp menu
 
salir:
	; Imprimimos en pantalla dos nuevas lineas
	imprimir nlinea, lnlinea
	
	; Finalizamos el programa
	mov eax, 1
	mov ebx, 0
	int 80h
