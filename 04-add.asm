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

    exit:
    mov ah,4ch
    int 21h
main endp
end main