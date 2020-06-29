        .ORIG       x3000
        LD      R0, ADDR_A
        LD      R1, ADDR_B
        JSR     REVERSE 
        HALT

;;REVERSE: reverse the contents of a sequence of memory
;input: R0 (starting address), R1 (ending address)
;output: none
REVERSE:
        ST      R0, SAVER0_REV
        ST      R1, SAVER1_REV
        ST      R2, SAVER2_REV
        ST      R3, SAVER3_REV
        ST      R7, SAVER7_REV
LOOP
        JSR     SWAP
        ADD     R0, R0, #1
        ADD     R1, R1, #-1
        NOT     R2, R0
        ADD     R2, R2, #1
        ADD     R3, R2, R1
        BRp     LOOP
        LD      R0, SAVER0_REV
        LD      R1, SAVER1_REV
        LD      R2, SAVER2_REV
        LD      R3, SAVER3_REV
        LD      R7, SAVER7_REV
        RET

;; SWAP: swap the contents of memory pointed by R0 and R1
;input: R0, R1
;output: none
SWAP:
        ST      R2, SAVER2_SWAP
        ST      R3, SAVER3_SWAP
        LDR     R2, R0, #0      ;R2<-mem[R0]
        LDR     R3, R1, #0      ;R3<-mem[R1]
        STR     R3, R0, #0      ;R3->mem[R0]
        STR     R2, R1, #0      ;R2->mem[R1]
        LD      R2, SAVER2_SWAP
        LD      R3, SAVER3_SWAP
        RET

ADDR_A          .FILL   x4000
ADDR_B          .FILL   x4009
SAVER0_REV     .BLKW   #1
SAVER1_REV     .BLKW   #1
SAVER2_REV     .BLKW   #1
SAVER3_REV     .BLKW   #1
SAVER7_REV     .BLKW   #1
SAVER2_SWAP     .BLKW   #1
SAVER3_SWAP     .BLKW   #1
        .END
