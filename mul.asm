; -----------------------------------------------------------
;  punto 6 multiplicacion.asm
;  permite ingresar dos numeros por teclado y los multiplica
;  LUIS ALFREDO DE LA OSSA DIAZ T00058743
; -----------------------------------------------------------

global _main      ;funcion principal
extern _printf    ;importa a _printf
extern _scanf     ;importa a _scanf

section .data
primermensaje : db "Ingrese los dos numeros para multiplicar: ",10,0  ;mensaje para ingresar numeros
entrada : db '%i',0
segundomensaje : db 'num1 * num2 = %i',10,0     ;mensaje para mostrar resultado

section .text
_main: 
    push primermensaje         ;imvoca al primermensaje
    call _printf               ;imprime el primermensaje

    push num1                  ;invoca al num1
    push entrada               ;invoca el formato de entrada para tomar el valor ingresado por teclado
    call _scanf

    push num2                  ;invoca al num2
    push entrada               ;invoca el formato de entrada para tomar el valor ingresado por teclado
    call _scanf

    mov edx, 0                 ;se crea el espacio en memoria para edx
    mov eax, 0                 ;se crea el espacio en memoria para eax
    mov dword eax, [num1]      ;se guarda num1 en memoria de edx
    mov dword ebx, [num2]      ;se guarda num2 en memoria de eax

    mul ebx                    ;se multiplica los numeros ingresados por teclado
    push eax                   ;esta linea recupera el mensaje en la pila
    push segundomensaje        ;esta linea guarda el mensaje en la pila
    call _printf               ;imprime el resultado de la pila
    add esp, 8                 ;se usa para limpiar la pila
    ret                        ;se finaliza el proceso
section .bss
num1 : resb 4
num2 : resb 4