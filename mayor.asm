; -----------------------------------------------------------
;  punto 8 multiplicacion.asm
;  permite ingresar dos numeros por teclado y los multiplica
;  LUIS ALFREDO DE LA OSSA DIAZ T00058743
; -----------------------------------------------------------

global _main
extern _printf
extern _scanf

section .data                                    ;comienzo del segmento
    mayor : dd 0                                 ;se guarda mayor
    num1 : dd 5                                  ;se guarda num1
    num2 : dd 1                                  ;se guarda num2
    mensaje1 : dd "NUMERO MAYOR: ", 0            ;se guarda mensaje1
    input : dd "%d",10,0

section .text                                    ;comienzo del segmento
    _main:                                       ;etiqueta method principal
        push eax                                 ;se guarda el registro en la pila
        push ebx                                 ;se guarda el registro en la pila
        push mensaje1                            ;se guarda el registro en la pila
        call _printf                             ;imvoca para imprimir en pantalla
        add esp, 4                               ;direccion de retorno de la pila

        mov eax, [num1]                          ;se guarda el valor de num1 en eax
        mov ebx, [num2]                          ;se guarda el valor de num1 en ebx
        mov [mayor], ebx                         ;se guarda el valor de ebx en la direccion mayor
        jmp next                                 ;redireccion a etiqueta next

if_mayor:
    mov [mayor], eax

next: 
    cmp eax,ebx                                  ;compara
    jge is_mayor                                 ;si es mayor o igual se dirige a la etiqueta is_mayor

is_menor:
    cmp ebx, [mayor]                             ;compara
    jge asig_mayor2                              ;si es mayor o igual se dirige a la etiqueta is_mayor2
    jmp print

is_mayor:
    cmp eax, [mayor]                             ;compara
    jge asig_mayor1                              ;si es mayor o igual se dirige a la etiqueta is_mayor1
    jmp print

asig_mayor1:
    mov [mayor], eax
    jmp print

asig_mayor2:
    mov [mayor], ebx

print:
    push dword [mayor]
    push input
    call _printf
    add esp, 0

    pop ebx
    pop eax

    ret