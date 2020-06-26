.ORIG       x3000
            LEA     R0,MyStr    ;Initialize string pointer 
LOOP    
            LDR     R2,R0,#0    ;load a character 
            BRz     STOP        ;if null, branch to STOP
POLL    
            LDI     R1,DSRAddr
            BRzp    POLL
            STI     R2,DDRAddr
            ADD     R0,R0,#1    ;increase string pointer
            BRnzp   LOOP
STOP    
            HALT
            ;PUTS
MyStr       .STRINGZ    "ECE220"
DSRAddr     .FILL   xFE04
DDRAddr     .FILL   xFE06
.END
