.model small
.stack 100h
.data
msg0 db 'Variables: num1=$'
msg1 db ', num2=$'
msg2 db 'Output: Sum=$'


.code
main proc
    mov ax,@data
    mov ds,ax

    mov ah,9
    lea dx,msg0
    int 21h

    mov ah,1
    int 21h
    sub al,30h
    mov bl,al

    mov ah,9
    lea dx,msg1
    int 21h

    mov ah,1
    int 21h
    sub al,30h
    mov bh,al


    mov al,bl
    add al,bh

    add al,30h

    mov dl,al
    mov ah,2
    int 21h
    ;mov dl,10
    ;mov ah,2
    ;int 21h

    ;mov ah,9
    ;lea dx,msg2
    ;int 21h

    ;mov dl,al
    ;mov ah,2
    ;int 21h
    ;mov dl,13
    ;int 21h

    mov ah,4Ch
    int 21h
main endp
end main




