.model small  ; for small memory model 
.stack 100h   ; for memory size 256 bytes 

.data
msg  db 'Number of rows: $'  ; for display message 

.code ; start code segment
main proc ; start main process

    mov ax, @data   ; load data segment into ax
    mov ds, ax      ; move ax into ds 
    

    mov ah, 9       ; print 
    lea dx, msg     ; load address of msg into dx
    int 21h         ; interrupt for display message

    mov ah, 1       ; read single character
    int 21h         ; Wait for user input 

    sub al, 30h     ; subtract 30h from al due to conversion of ASCII 
    mov cl, al      ; store rows in cl

    
    mov dl, 10      ; line feed 
    mov ah, 2       ; print character
    int 21h         ; dos interrupt call
    mov dl, 13      ; Carriage Return 
    int 21h         ; dos interrupt call

outer:                      
    mov ch, 0       ; clear ch register
    mov ch, cl      ; copy row count to ch 

print:                      
    mov dl, '*'     ; load '*' character into dl
    mov ah, 2       ; print character
    int 21h         ; interrupt call for printing *

    dec ch          ; decrease star counter
    jnz print       ; jump not zero repeat printing stars otherwise next line

    mov dl, 10      ; for line feed
    mov ah, 2       ; print character
    int 21h         ; interrupt call
    mov dl, 13      ; carriage return
    int 21h         ; interrupt call 

    dec cl          ; decrease row counter
    jnz outer       ; go back to outer loop

    mov ah, 4ch     ; terminate program
    int 21h         ; interrupt call

main endp
end main