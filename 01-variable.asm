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