.model small
.stack 100h
.data
msg db 'Enter a value$'
msg1 db ?

.code
main proc
    mov ax,@data
    mov ds,ax
    model ah,9
    lea dx,m
    int 21h


    mov ah,1
    int 21h
    mov bl,al


    mov ah,2
    mov dl,bl
    int 21h
    
    exit
    
    main endp

end main
