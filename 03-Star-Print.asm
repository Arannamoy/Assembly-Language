.model small  ; small memory model 
.stack 100h   ; 256 bytes for stack

.data
    msg0  db 'Input: $'   ; message to display 

.code
main proc

    mov ax, @data           ; load address of data segment into ax
    mov ds, ax              ; load ax into ds
    

    mov ah, 9               ; print string
    lea dx, msg0            ; msg0 load into dx
    int 21h                 ; dos interrupt

    mov ah, 1               ; read single character
    int 21h                 ; dos interrupt

    sub al, 30h             ; convert into ascii code
    mov cl, al              ; load al to cl
    
    mov dl, 10              ; line Feed 
    mov ah, 2               ; print character
    int 21h                 ; dos interrupt
    mov dl, 13              ; carriage return 
    int 21h

outer:                      

    mov ch, 0               ; clear ch register
    mov ch, cl              ; copy row count to ch 

print:                      

    mov dl, '*'             ; load * in dl
    mov ah, 2               ; print character
    int 21h                 ; print '*'

    dec ch                  ; decrease star counter
    jnz print               ; if not zero, repeat printing stars

    mov dl, 10              ; line Feed
    mov ah, 2               ; print single character
    int 21h                 ; dos interrupt
    mov dl, 13              ; carriage Return
    int 21h

    dec cl                  ; decrease row counter
    jnz outer               ; if not zero , go back to outer loop
    exit:                   ; label for terminate
     mov ah, 4ch             ; terminate program
     int 21h                 ; dos interrupt

main endp ;end main procedure
end main ; end main execution