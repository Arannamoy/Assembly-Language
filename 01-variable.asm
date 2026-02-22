.model small ; for small memory model
.stack 100h ; memory stack size
.data  ; for data
msg db 3;Initialize value
msg1 db ?;for unkonown value

.code
main proc
    mov ax,@data
    mov ds,ax
    mov ah,2
    add msg,48
    mov dl,msg
    int 21h

    mov ah,1
    int 21h
    mov msg1,al

    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h

    mov ah,2
    mov dl,msg1
    int 21h

    exit:
    mov ah,4ch
    int 21h
    main endp

end  main
