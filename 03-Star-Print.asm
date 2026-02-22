.model small
.stack 100h

.data
msg   db 'Input: $'       ; Input label
msg1  db 'Output: $'      ; Output label

.code
main proc
    mov ax, @data
    mov ds, ax           ; Initialize data segment

    ; ----------------------------
    ; Print Input label
    mov ah, 9
    lea dx, msg
    int 21h

    ; Read single character input
    mov ah, 1
    int 21h
    sub al, 30h          ; Convert ASCII to number
    mov cl, al           ; CL = total rows

    ; Newline after input
    mov dl, 10           ; Line Feed
    mov ah, 2
    int 21h
    mov dl, 13           ; Carriage Return
    int 21h

    ; ----------------------------
    ; Print Output label
    mov ah, 9
    lea dx, msg1
    int 21h

    ; Newline after Output:
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h

    ; ----------------------------
    ; Outer loop for rows
outer_loop:
    mov ch, cl           ; CH = stars in current row

    ; Inner loop to print stars
print_star:
    mov dl, '*'          ; Character to print
    mov ah, 2
    int 21h
    dec ch
    jnz print_star       ; Repeat until row complete

    ; Newline after each row
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h

    dec cl               ; Decrease row counter
    jnz outer_loop       ; Repeat outer loop until CL=0

    ; ----------------------------
    ; Terminate program
    mov ah, 4Ch
    int 21h

main endp
end main