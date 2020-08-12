;Josue Macas
;05-08-2020

section .data
    msj1 DB " * " 
    len_msj1 EQU $-msj1

    msj2 DB " = "
    len_msj2 EQU $-msj2

    newline DB " ", 10
    len_nl EQU $-newline

section .bss
    numero1 resb 2
    numero2 resb 2
    resultado resb 2

section .txt
    global _start

_start:

    mov bx, 9
    mov cx, 9    

l1:
    push rbx
    cmp rbx, 0
    jz salir
    jmp ciclo

            
ciclo:

    add bx, '0'
    mov [numero1], bx   

    dec rcx      
    push rcx
    

    mov ax, [numero1]
    sub ax, '0'
    mul cx
    add ax, '0'
    mov [resultado], ax

    add cx, '0'
    mov [numero2], cx
    
    call imprimir_numero1
    call imprimir_signopor
    call imprimir_numero2
    call imprimir_signoigual
    call imprimir_reultado
    call imprimir_enter
    
    pop rcx
    cmp rcx, 0
    jnz ciclo
    call imprimir_enter

    sub bx, '0'
    mov [numero1], bx  
    
    pop rbx
    dec rbx
    mov ecx, 10
    jmp l1



imprimir_numero1:
    mov eax,4		
	mov ebx,1		
	mov ecx, numero1		
	mov edx, 2		
	int 80H	
    ret

imprimir_numero2:
    mov eax,4		
	mov ebx,1		
	mov ecx, numero2		
	mov edx, 2		
	int 80H	
    ret

imprimir_reultado:
    mov eax,4		
	mov ebx,1		
	mov ecx, resultado		
	mov edx, 2		
	int 80H	
    ret

imprimir_signopor:
    mov eax,4		
	mov ebx,1		
	mov ecx, msj1		
	mov edx, len_msj1		
	int 80H	
    ret

imprimir_signoigual:
    mov eax,4		
	mov ebx,1		
	mov ecx, msj2		
	mov edx, len_msj2		
	int 80H	
    ret
    
imprimir_enter:
    mov eax,4		
	mov ebx,1		
	mov ecx, newline		
	mov edx, len_nl
	int 80H	
    ret


salir:
    mov eax, 1
    int 80h 

