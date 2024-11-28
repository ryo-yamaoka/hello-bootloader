; initialize
ORG 0x7c00
MOV AX, 0
MOV CS, AX
MOV DS, AX
MOV ES, AX
MOV SS, AX
MOV SI, msg

; set VGA mode
MOV AX, 0x0012
INT 0x10

print:
    MOV AL, [SI]
    CMP AL, 0
    JE fin
    MOV AH, 0x0e
    MOV BX, 0x000a ; set color code green
    INT 0x10
    ADD SI, 1
    JMP print

fin:
    HLT
    JMP fin

msg:
    DB 0x0a, 0x0a
    DB "hello, world"
    DB 0x0a
    DB 0
    TIMES 510 - ($ - $$) DB 0
    DW 0xaa55
