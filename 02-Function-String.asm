.model small
.stack 100h
.data
msg db 'Enter a value$'
msg1 db ?

.code
main proc
    mov ah,1
    mov al,ah
    int 21h
    mov al,3
    int 21h
    exit
    mov ah,4ch
    int 21h
    main endp

end main
