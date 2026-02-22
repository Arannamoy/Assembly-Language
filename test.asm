; --------------------------------------------------------------
; Q2 – Take two one‑digit numbers from the user, add them,
;      and display:  Result = <sum>
; --------------------------------------------------------------
.MODEL  SMALL               ; 64 KB‑এর মধ্যে কোড + ডেটা
.STACK  100h                ; 256‑বাইট স্ট্যাক (প্রয়োজনমতো)

.DATA
    promptA DB 'Enter first digit (0‑9): $'
    promptB DB 'Enter second digit (0‑9): $'
    resultMsg DB 0Dh,0Ah,'Result = $'   ; CR+LF, তারপর “Result = ”
    nl      DB 0Dh,0Ah,'$'              ; শেষের নিউ‑লাইন (ঐচ্ছিক)

.CODE
MAIN PROC
    ; ---------- DS‑রেজিস্টার ইনিশিয়ালাইজ ----------
    MOV     AX, @DATA
    MOV     DS, AX

    ; ---------- প্রথম অঙ্ক পড়া ----------
    MOV     AH, 9               ; DOS‑ফাংশন 9 – $‑সীমাবদ্ধ স্ট্রিং প্রিন্ট
    LEA     DX, promptA
    INT     21h

    MOV     AH, 1               ; DOS‑ফাংশন 1 – একটি কী‑স্ট্রোক (ASCII) পড়া
    INT     21h                  ; AL ← ব্যবহারকারীর ইনপুট (ASCII)
    SUB     AL, '0'              ; ASCII → সংখ্যা (0‑9)
    MOV     BL, AL               ; BL ← প্রথম সংখ্যা রাখি

    ; ---------- দ্বিতীয় অঙ্ক পড়া ----------
    MOV     AH, 9
    LEA     DX, promptB
    INT     21h

    MOV     AH, 1
    INT     21h                  ; AL ← দ্বিতীয় ইনপুট (ASCII)
    SUB     AL, '0'              ; ASCII → সংখ্যা
    MOV     BH, AL               ; BH ← দ্বিতীয় সংখ্যা

    ; ---------- যোগফল হিসাব ----------
    ADD     BL, BH               ; BL ← BL + BH  (0‑18 পর্যন্ত)

    ; ---------- ফলাফল মুদ্রণ ----------
    ; “Result = ” টেক্সট
    MOV     AH, 9
    LEA     DX, resultMsg
    INT     21h

    ; যোগফল (BL) → ASCII‑তে রূপান্তর এবং প্রিন্ট
    MOV     AL, BL
    CMP     AL, 9
    JBE     ONE_DIGIT            ; যদি ≤9 হয়, সরাসরি ১‑ডিজিট ASCII

    ; ১০‑১৯ (দুই‑ডিজিট) হলে “1” এবং “0‑9” দুটো অক্ষর প্রিন্ট করতে হবে
    ;   10 → "10", 11 → "11", … , 18 → "18"
    ; প্রথম অঙ্ক সবসময় ‘1’
    MOV     DL, '1'
    MOV     AH, 2               ; DOS‑ফাংশন 2 – এক ক্যারেক্টার আউটপুট
    INT     21h

    ; বাকি অঙ্ক (0‑9) বের করা
    SUB     AL, 10              ; 10‑19 → 0‑9
ONE_DIGIT:
    ADD     AL, '0'             ; সংখ্যা → ASCII
    MOV     DL, AL
    MOV     AH, 2
    INT     21h

    ; (ঐচ্ছিক) শেষের নিউ‑লাইন
    MOV     AH, 9
    LEA     DX, nl
    INT     21h

    ; ---------- প্রোগ্রাম সমাপ্তি ----------
    MOV     AH, 4Ch              ; DOS‑ফাংশন 4C – প্রোগ্রাম টার্মিনেট
    INT     21h
MAIN ENDP
END  MAIN