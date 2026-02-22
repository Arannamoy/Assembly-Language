.model small                ; Use small memory model 
.stack 100h                 ; Allocate 256 bytes for stack

.data
    msg  db 'Enter number of rows: $'   ; Message to display 

.code
main proc

    mov ax, @data           ; Load address of data segment into ax
    mov ds, ax              ; Initialize ds with data segment address
    

    mov ah, 9               ; print string
    lea dx, msg             ; Load address of msg into dx
    int 21h                 ; Calling interrupt to display msg

    mov ah, 1               ; Read single character
    int 21h                 ; Wait for user input 

    sub al, 30h             ; Convert ASCII to number
    mov cl, al              ; Store number of rows in cl

    
    mov dl, 10              ; Line Feed 
    mov ah, 2               ; Print character
    int 21h
    mov dl, 13              ; Carriage Return 
    int 21h

outer:                      

    mov ch, 0               ; Clear ch register
    mov ch, cl              ; Copy row count to ch 

print:                      

    mov dl, '*'             ; Load '*' character into dl
    mov ah, 2               ; Print character
    int 21h                 ; Print '*'

    dec ch                  ; Decrease star counter
    jnz print               ; If ch != 0, repeat printing stars

    mov dl, 10              ; Line Feed
    mov ah, 2
    int 21h
    mov dl, 13              ; Carriage Return
    int 21h

    dec cl                  ; Decrease row counter
    jnz outer               ; If cl != 0, go back to outer loop

    mov ah, 4ch             ; Terminate program
    int 21h                 

main endp
end main