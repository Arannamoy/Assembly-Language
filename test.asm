; Q1: Star Pattern (Reverse Triangle)
.MODEL SMALL
.STACK 100H
.DATA
    PROMPT DB 'Enter number of rows: $'
    NEWLINE DB 0DH, 0AH, '$'
    ROWS DW ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display Prompt [cite: 11]
    MOV AH, 09H
    LEA DX, PROMPT
    INT 21H

    ; Take Input (Single digit) [cite: 13]
    MOV AH, 01H
    INT 21H
    SUB AL, 48      ; Convert ASCII to Integer
    MOV AH, 0
    MOV ROWS, AX

    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H

    ; Outer Loop (Rows) [cite: 9]
    MOV CX, ROWS
OUTER_LOOP:
    PUSH CX         ; Save outer loop counter
    
    ; Inner Loop (Stars) [cite: 11]
INNER_LOOP:
    MOV AH, 02H
    MOV DL, '*'     ; Print star [cite: 15]
    INT 21H
    LOOP INNER_LOOP

    ; Print Newline after each row
    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H

    POP CX          ; Restore outer loop counter
    LOOP OUTER_LOOP

    ; Exit
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN