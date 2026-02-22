.model small          ; use small memory model
.stack 100h           ; allocate 256 bytes stack

.data
inputMsg   db 'Input: $'                ; message for input
outputMsg  db 13,10,'Output:',13,10,'$' ; output header with newline

.code
main proc

    mov ax, @data      ; initialize data segment
    mov ds, ax


    mov ah, 9
    lea dx, inputMsg
    int 21h

   
    mov ah, 1          ; function 1 = read character
    int 21h            ; wait for key press
    sub al, 30h        ; convert ASCII to numeric
    mov si, ax         ; store value in SI (low byte used)

 
    mov ah, 9
    lea dx, outputMsg
    int 21h

   
next_row:

    mov cx, si         ; CX = current star count

print_star:

    mov dl, '*'        ; load star symbol
    mov ah, 2          ; function 2 = print single char
    int 21h

    loop print_star    ; repeat until CX = 0


    mov dl, 13         ; carriage return
    mov ah, 2
    int 21h

    mov dl, 10         ; line feed
    int 21h

    dec si             ; decrease row count
    jnz next_row       ; repeat if not zero

    mov ah, 4Ch
    int 21h

main endp
end main