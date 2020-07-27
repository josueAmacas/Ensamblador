;Eduardo Alexander Leon Castillo
section .data
        mensajePar db 'El numero es par', 10
        len_mensajePar equ $-mensajePar
        mensajeImpar db 'El numero es impar', 10
        len_mensajeImpar equ $-mensajeImpar
section .text
   global _start            
	
_start:                     
    mov   ax, 6  ;      110            
    and   ax, 1  ;        1            
    jz    nroPar ;        0         


    mov   eax, 4             
    mov   ebx, 1             
    mov   ecx, mensajeImpar       
    mov   edx, len_mensajeImpar          
    int   80H                  
   
    mov eax, 1
    int 80H

nroPar:   
  
    mov   eax, 4             
    mov   ebx, 1             
    mov   ecx, mensajePar     
    mov   edx, len_mensajePar          
    int   80H
               

    mov eax, 1
    int 80H
