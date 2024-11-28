; initialize
ORG 0x7c00
MOV AX, 0
MOV CS, AX
MOV DS, AX
MOV ES, AX
MOV SS, AX
MOV SI, msg

print:
    MOV AL, [SI]
    CMP AL, 0
    JE fin
    MOV AH, 0x0e ; set print char
    INT 0x10 ; call BIOS video function
    ADD SI, 1
    JMP print

fin:
    HLT
    JMP fin

msg:
    DB 0x0a, 0x0a
    DB "hello, world"
    DB 0x0a
    DB 0 ; end sign
    TIMES 510 - ($ - $$) DB 0
    DW 0xaa55
