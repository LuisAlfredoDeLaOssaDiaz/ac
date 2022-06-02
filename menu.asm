; ------------------------------------------------------------------
; helloworld.asm
;
; This is a Win32 console program that writes "Hello World"
; on a single line and then exits.
;
; To assemble to .obj: nasm -f win32 helloworld.asm
; To compile to .exe:  gcc helloworld.obj -o helloworld.exe
; ------------------------------------------------------------------

        global    _main                ; declare main() method
        extern    _printf              ; link to external library

        segment  .data
        message1: db   '****************************************************',13,10
				  db   '*                menu principal                    *',13,10
                  db   '****************************************************',13,10  
				  db   '*                                                  *',13,10   
				  db   '*                1. imprime                        *',13,10  
				  db   '*                2. lee un dato                    *',13,10 
				  db   '*                3. fin del programa               *',13,10 
				  db   '*                                                  *',13,10 
				  db   '*                                                  *',13,10 
				  db   '*                                                  *',13,10  
				  db   '*                                                  *',13,10 
				  db   '*                                                  *',13,10 
				  db   '*                digite una opcion                 *',13,10 
				  db   '****************************************************',13,10  
				  
        ; code is put in the .text section
        section .text
_main:  							; the entry point! void main()
		call imprime1		  
 
imprime1:
        push    message1           ; salvamos el mensaje en la pila
        call    _printf           ; se imprime el mensaje de la pila
        add     esp, 8            ; limpiamos la pila
        ret                    
 
 
        ret                       ; return