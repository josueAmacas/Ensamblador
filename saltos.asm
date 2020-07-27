; 
%macro imprimir 2	; inicia una instruccion repetitiva denominada"imprimir" que se puede llamar en cualquier parte
	mov eax,4		; indica el tipo de operacion en la cual sera de escritura y tendra una operacion de salida
	mov ebx,1		; mostrara el estandar de la aplicacion en este caso es por teclado
	mov ecx,%1 		; almacena el primer operando para imprimir
	mov edx,%2		; almacena la longitud a imprimir en este caso el segundo operando
	int 80H			; interrupcion de software libre linux y da significado a las anteriores lineas
%endmacro			; finaliza la instruccion repetitiva "imprimir"
igual:
    imprimir msg1,len_msg1
    mov eax,1
    int 80h

diferentes:
    imprimir msg9,len_msg9
    mov eax,1
    int 80h

mayor1:
    imprimir msg2,len_msg2
    mov eax,1
    int 80h

mayor2:
    imprimir msg3,len_msg3
    mov eax,1
    int 80h
no_mayor_o_igual:
    imprimir msg5,len_msg5
    mov eax,1
    int 80h

cero:
    imprimir msg4,len_msg4
    mov eax,1
    int 80h

no_cero:
    imprimir msg6,len_msg6
    mov eax,1
    int 80h

par:
    imprimir msg7,len_msg7
    mov eax,1
    int 80h

impar:
    imprimir msg8,len_msg8
    mov eax,1
    int 80h

ecx_cero:
    imprimir msg10,len_msg10
    mov eax,1
    int 80h

section .data
    a db 8
    b db 8

    msg1 db "Numeros Iguales",10
    len_msg1 equ $-msg1

    msg2 db "Numero 1 mayor",10
    len_msg2 equ $-msg2

    msg3 db "numero 2 mayor",10
    len_msg3 equ $-msg3

    msg4 db "el numero es igual a cero",10
    len_msg4 equ $-msg4

    msg5 db "el numero1 no es mayor o igual a numero2",10
    len_msg5 equ $-msg5

    msg6 db "el numero no es igual a cero",10
    len_msg6 equ $-msg6

    msg7 db "el numero es par",10
    len_msg7 equ $-msg7

    msg8 db "el numero no es par",10
    len_msg8 equ $-msg8

    msg9 db "Numeros Diferentes",10
    len_msg9 equ $-msg9

    msg10 db "el reg ecx es igual a Cero",10
    len_msg10 equ $-msg10
    
section .bss
   
    

section .text
    global _start
_start:
;**********imprimir*****
   
   ;**************
    
   ;**************
    mov ecx,0

    mov eax,0
    cmp eax, 0
    
    ;jz cero
    ;jnz no_cero
    ;jp par
    ;jnp impar

    ;je igual
    ;jne  diferentes
    jecxz ecx_cero


    
    

    mov eax,1
    int 80h

