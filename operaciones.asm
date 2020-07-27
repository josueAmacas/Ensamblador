;Operaciones con dos numeros estaticos
;Josue Macas

%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
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
    suma resb 1
    resta resb 1
    multiplicacion resb 1
    cociente resb 1
    residuo resb 1
    
section .text
    global _start
_start:
;****** Op Suma **************
    sumar:
        mov al, 4
        mov bl, 2
        add al, bl        ;eax = eax + ebx
        add al, '0'        ;ajuste
        mov [suma], al

        imprimir resultadoS, len_resS
        imprimir suma, 1
        imprimir newline, len_nl

        jmp dividir
;**** Op Resta **********
    restar:    
        mov al, 4
        mov bl, 2
        sub al, bl        ;eax = eax - ebx
        add al, '0'        ;ajuste0
        mov [resta], al

        imprimir resultadoR, len_resR
        imprimir resta, 1
        imprimir newline, len_nl

        jmp multiplicar
;******** Op Multiplicacion ***********
    multiplicar:
        mov al, 4
        mov bl, 2
        mul bl        ;eax = eax * ebx
        add al, '0'        ;ajuste
        mov [multiplicacion], al

        imprimir resultadoM, len_resM
        imprimir multiplicacion, 1    
        imprimir newline, len_nl

        jmp salir
;******** Op Divicion **************
    dividir:
        mov al, 5
        mov bl, 2
        div bl      ;eax = eax / ebx
        add al, '0'        ;ajuste
        mov [cociente], al
        add ah, '0'        ;ajuste
        mov [residuo], ah

        imprimir resultadoD, len_resD
        imprimir cociente, 1
        imprimir newline, len_nl
        imprimir sobrante, len_sobrante
        imprimir residuo, 1
        imprimir newline, len_nl

        jmp restar
;******* Imprimir Suma *******************
    

;***** Imprimir Resta ********
    

;****** Imprimir Multiplicacion ************
    

;*******Imprimir Divicion *******
    

;******** Salida del programa **************
    salir:
        mov eax, 1
        int 80H