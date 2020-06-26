        .ORIG   x3000

; count number of bits to be flipped to convert A to B
; R0: number A
; R1: nunber B
; R5: result 
; R4: XOR(A,B)
; R6: counter (16)
        LD      R0, VAL1
        LD      R1, VAL2
        AND     R5, R5, #0

        ; perform XOR(A,B) = AB' + A'B
        ; R4 stores XOR result
        NOT     R2, R0
        AND     R2, R2, R1
        NOT     R3, R1
        AND     R3, R3, R0
        ADD     R4, R2, R3
        LD      R6, COUNT

LOOP
        ADD     R4, R4, #0  ; check MSB is 1
        BRzp    ZERO        ; if MSB is 0, goto ZERO
        ADD     R5, R5, #1  ; else, increment R5
ZERO
        ADD     R4, R4, R4  ; leftshift R4
        ADD     R6, R6, #-1 ; decrement counter
        BRp     LOOP

        LD      R6, ASC_ZERO
        ADD     R0, R5, R6
        OUT

        HALT

VAL1    .FILL   x1102
VAL2    .FILL   x1003
;VAL1    .FILL   xF063
;VAL2    .FILL   xA160
COUNT   .FILL   #16
ASC_ZERO    .FILL   x0030
        .END
