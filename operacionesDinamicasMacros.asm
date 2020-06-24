;Operaciones dinamicas Macros
;Josue Macas

%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax, 3          ;define el tipo de operacion
    mov ebx, 2          ;estandar de entrada
    mov ecx, %1     ;lo que se captura en teclado
    mov edx, %2           ;numero de caracteres
    int 80H             ;interrupcion de gnu linux
%endmacro

section .data
    n1 DB "Ingrese primer numero:", 10
    len_n1 EQU $-n1

    n2 DB "Ingrese segundo numero:", 10
    len_n2 EQU $-n2

    resultadoS DB "La suma es:", 10
    len_resS EQU $-resultadoS

    resultadoR DB "La resta es:", 10
    len_resR EQU $-resultadoR

    resultadoM DB "La multiplicacion es:", 10
    len_resM EQU $-resultadoM

    resultadoD DB "La divicion es:", 10
    len_resD EQU $-resultadoD

    sobrante DB "El sobrante es:", 10
    len_sobrante EQU $-sobrante
    
    newline DB " ", 10
    len_nl EQU $-newline

section .bss
    numero1 resb 1
    numero2 resb 1
    suma resb 1
    resta resb 1
    multiplicacion resb 1
    cociente resb 1
    residuo resb 1
    
section .text
    global _start
_start:

    imprimir n1, len_n1
    leer numero1, 2 

    imprimir n2, len_n2
    leer numero2, 2

;****** Op Suma **************
    mov al, [numero1]
    sub al, '0'
    mov bl, [numero2]
    sub bl, '0'
    add al, bl        ;eax = eax + ebx
    add al, '0'        ;ajuste
    mov [suma], al
;**** Op Resta **********
    mov al, [numero1]
    sub al, '0'
    mov bl, [numero2]
    sub bl, '0'
    sub al, bl        ;eax = eax - ebx
    add al, '0'        ;ajuste0
    mov [resta], al
;******** Op Multiplicacion ***********
    mov al, [numero1]
    sub al, '0'
    mov bl, [numero2]
    sub bl, '0'
    mul bl        ;eax = eax * ebx
    add al, '0'        ;ajuste
    mov [multiplicacion], al
;******** Op Divicion **************
    mov al, [numero1]
    sub al, '0'
    mov bl, [numero2]
    sub bl, '0'
    div bl      ;eax = eax / ebx
    add al, '0'        ;ajuste
    mov [cociente], al
    add ah, '0'        ;ajuste
    mov [residuo], ah
;****** Imprimir Suma *******************
   imprimir resultadoS, len_resS
   imprimir suma, 1
   imprimir newline, len_nl

;***** Imprimir Resta ********
   imprimir resultadoR, len_resR
   imprimir resta, 1
   imprimir newline, len_nl

;****** Imprimir Multiplicacion ************
   imprimir resultadoM, len_resM
   imprimir multiplicacion, 1    
   imprimir newline, len_nl

;*******Imprimir Divicion *******
   imprimir resultadoD, len_resD
   imprimir cociente, 1
   imprimir newline, len_nl

   imprimir sobrante, len_sobrante
   imprimir residuo, 1
   imprimir newline, len_nl

;******** Salida del programa **************
    mov eax, 1
    int 80H