; Q2: Add Two Numbers
.MODEL SMALL
.DATA
    NUM1 DB 3       ; First variable [cite: 24]
    NUM2 DB 5       ; Second variable [cite: 24]
    MSG DB 'Sum=$'  ; Output message [cite: 25]
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Addition [cite: 22]
    MOV AL, NUM1
    ADD AL, NUM2    ; AL = 3 + 5 = 8
    ADD AL, 48      ; Convert result back to ASCII

    ; Display Message
    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    ; Display Result
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN