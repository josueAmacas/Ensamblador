;Josue Andres Macas
;Programa para escribir archivos

%macro imprimir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
	
    msj1 db "Ingrese datos en el archivo", 10
    lenmsj1 equ $-msj1

	archivo db "/home/josuemacas/Sexto/Ensamblador/Practicasarchivo.txt"
    
	
section .bss
	texto resb 30
    idarchivo resd 1


section .text
	global _start
	
    leer:
        mov eax, 3
        mov ebx, 0
        mov ecx, texto
        mov edx, 10
        int 80h
        ret

_start:

    mov eax, 8              ;servicio para crear archivos, trabajar conarchivos
    mov ebx, archivo        ;direccion del archivo
    mov ecx, 1              ;modo de acceso => O-RDONLY 0: el archivo se abre solo para leer
                                        ;O-WRONLY 1: el archivo se abre para escritura
                                                ;O-RDWR 2: el archivo se abre para lectura y escritura
                                                ;O-CREATE 256: Crea el archivo en caso de que no exista
                                                ;O-APPEND 2000H: el archivo se abre solo para escritura al final
    mov edx, 777h    
    int 80h

    test eax, eax

    jz salir            ;se ejecuta cuando existen errores en el archivo

    mov dword [idarchivo], eax
    
    imprimir msj1, lenmsj1

   

    call leer

    ;***** escritura en el archivo ***********************
    mov eax, 4
	mov ebx, [idarchivo]
	mov ecx, texto
	mov edx, 20
	int 80h


salir:
    mov eax, 1
    int 80h