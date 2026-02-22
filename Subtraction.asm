.model small              ; small memory model
.stack 100h               ; 256 bytes (100h) for stack

.data                    
msg1 db 3                ; msg1 with store 3
msg2 db 5                ; msg2 with store 5
msg3 db 10,13,'Result: $' ; msg3 to show result
    
.code                     

main proc                 
    
    mov ax, @data         ; Load address of data segment into ax
    mov ds, ax            ; Initialize DS with data segment address
    
    mov ah, 9             ; Print string
    lea dx, msg3           ; Load address of msg3 into dx
    int 21h               ; Calling interrupt to display msg3 'Result: '
    
    mov al, a             ; Move value of a into al 
    mov bl, b             ; Move value of a into bl
     
    sub al, bl            ; subtruction bl from al (al = a - b)
    
    add al, 30h           ; Convert numeric result back to ASCII
    
    mov dl, al            ; Move result character into dl
    mov ah, 2             ; Print single character
    int 21h               ; Display result
    
    mov ah, 4ch           ; Terminate program
    int 21h               
    
main endp                 
end main                  