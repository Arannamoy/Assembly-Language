.model small              ; Use small memory model
.stack 100h               ; Reserve 256 bytes (100h) for stack

.data                    

    a db 9                ; Declare variable a with store 9
    b db 4                ; Declare variable b with store 4

    msg db 10,13,'Result: $' ; Message to show result
    
.code                     

main proc                 
    
    mov ax, @data         ; Load address of data segment into ax
    mov ds, ax            ; Initialize DS with data segment address
    
    mov ah, 9             ; Print string
    lea dx, msg           ; Load address of msg1 into dx
    int 21h               ; Calling interrupt to display msg 'Result: '
    
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