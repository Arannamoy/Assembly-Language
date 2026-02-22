.model small              ; small memory model
.stack 100h               ; 256 bytes for stack

.data                    
msg1 db 3                ; msg1 with store 3
msg2 db 5                ; msg2 with store 5
msg3 db 10,13,'Result: $' ; msg3 to show result
    
.code                     

main proc                 
    
    mov ax, @data         ; load address of data segment into ax
    mov ds, ax            ; load ax into ds
    
    mov ah, 9             ; print string
    lea dx, msg3          ; msg3 load into dx
    int 21h               ; dos interrupt
    
    mov al, a             ; Move value of a into al 
    mov bl, b             ; Move value of a into bl
     
    sub al, bl            ; subtruction bl from al. msg1 - msg2
    
    add al, 30h           ; convert into ascii code
    
    mov dl, al            ; load al into dl
    mov ah, 2             ; print character
    int 21h               ; dos interrupt
    exit:
        mov ah, 4ch           ; terminate program
        int 21h               
    
main endp ;end main procedure           
end main  ; end main execution            