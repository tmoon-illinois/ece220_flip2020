        .ORIG       x3000
        LD      R0, VAL0
        LD      R1, VAL1

        JSR     XOR


XOR:
        NOT     R2, R0
        NOT     R3, R1


