        .ORIG       x3000
        LEA     R0, MyStr
        JSR     L2U
        HALT
;; L2U: convert lowercase to uppercase
;input: R0 (starting addr of string)
;output: none
L2U:
        ST      R1, SAVER1_L2U
        ST      R2, SAVER2_L2U
        ST      R3, SAVER3_L2U
        ST      R4, SAVER4_L2U
        ST      R5, SAVER5_L2U

        LD      R2, NEG_a       
        LD      R3, DIFF_z
        LD      R4, DIFF_L2U
        
LOOP
        LDR     R1, R0, #0      ;load a char to R1
        BRz     NULL            ;check null-char
        ADD     R5, R2, R1      ;check char is greater than 'a'
        BRn     NEXTCHAR        ;if not do nothing
        ADD     R5, R5, R3      ;else check char is less than 'z'
        BRp     NEXTCHAR        ;if not do nothing
        ; lower case here
        ADD     R1, R1, R4      ;convert lower to upper
        STR     R1, R0, #0      ;store it

NEXTCHAR
        ADD     R0, R0, #1      ;increase pointer
        BRnzp   LOOP
NULL
        LD      R1, SAVER1_L2U
        LD      R2, SAVER2_L2U
        LD      R3, SAVER3_L2U
        LD      R4, SAVER4_L2U
        LD      R5, SAVER5_L2U
        RET


MyStr   .STRINGZ    "Ece220"
NEG_a   .FILL   #-97            ;additive inverse of ASCII 'a'
DIFF_z  .FILL   #-25            ;difference between ASCII 'a' and 'z'
DIFF_L2U    .FILL   #-32        ;difference between uppercase and lowercase
SAVER1_L2U  .BLKW   #1
SAVER2_L2U  .BLKW   #1
SAVER3_L2U  .BLKW   #1
SAVER4_L2U  .BLKW   #1
SAVER5_L2U  .BLKW   #1
        .END
