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

    add al,30

    mov dl,10
    mov ah,2
    int 21h

    mov ah,9
    lea dx,msg2
    int 21h

    mov dl,al
    mov ah,2
    int 21h
    mov dl,13
    int 21h

    exit:
    mov ah,4Ch
    int 21h
main endp
end main





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

    ; Print num1 message
    mov ah,9
    lea dx,msg0
    int 21h

    ; Input num1
    mov ah,1
    int 21h
    sub al,30h
    mov bl,al

    ; Print num2 message
    mov ah,9
    lea dx,msg1
    int 21h

    ; Input num2
    mov ah,1
    int 21h
    sub al,30h
    mov bh,al

    ; Addition
    mov al,bl
    add al,bh
    add al,30h       ; convert to ASCII

    ; Print newline before output
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    int 21h

    ; Print Output message
    mov ah,9
    lea dx,msg2
    int 21h

    ; Print sum (single character) properly
    mov dl,al
    mov ah,2
    int 21h

    ; Final newline
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    int 21h

    ; Terminate program
    mov ah,4Ch
    int 21h

main endp
end main