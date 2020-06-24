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
    mov al, 4
    mov bl, 2
    add al, bl        ;eax = eax + ebx
    add al, '0'        ;ajuste
    mov [suma], al
;**** Op Resta **********
    mov al, 4
    mov bl, 2
    sub al, bl        ;eax = eax - ebx
    add al, '0'        ;ajuste0
    mov [resta], al
;******** Op Multiplicacion ***********
    mov al, 4
    mov bl, 2
    mul bl        ;eax = eax * ebx
    add al, '0'        ;ajuste
    mov [multiplicacion], al
;******** Op Divicion **************
    mov al, 5
    mov bl, 2
    div bl      ;eax = eax / ebx
    add al, '0'        ;ajuste
    mov [cociente], al
    add ah, '0'        ;ajuste
    mov [residuo], ah
;******* Imprimir Suma *******************
    imprimir resultadoS, len_resS
    imprimir suma, 1
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, len_nl
    int 80h

;***** Imprimir Resta ********
    imprimir resultadoR, len_resR
    imprimir resta, 1
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, len_nl
    int 80h

;****** Imprimir Multiplicacion ************
    imprimir resultadoM, len_resM
    imprimir multiplicacion, 1    
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, len_nl
    int 80h

;*******Imprimir Divicion *******
    imprimir resultadoD, len_resD
    imprimir cociente, 1
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, len_nl
    int 80h
    imprimir sobrante, len_sobrante
    imprimir residuo, 1
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, len_nl
    int 80h

;******** Salida del programa **************
    mov eax, 1
    int 80H