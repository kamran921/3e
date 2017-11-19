.MODEL SMALL
.STACK 200h
.DATA
v1 DB "karrak$"
v2 DB 10,"not a palindrome$"
v3 DB 10,"In Palindrome$"
.CODE

MAIN PROC
MOV AX, @data
MOV DS, AX
MOV CX, 0
MOV AH, 9
LEA DX, v1
INT 21h
LEA SI, v1
LEA DI, v1

l1:
INC DI
INC CL
MOV BL, [DI]
CMP BL, '$'
JNE l1
DEC DI

SHR CL, 1

l2:
MOV AL, [SI]
MOV BL, [DI]
CMP AL, BL
JNE l3
INC SI
DEC DI
LOOP l2
JMP l4

l3:
MOV AH, 9
LEA DX, v2
INT 21h
JMP endd

l4:
MOV ah, 9
LEA DX, v3
INT 21h

endd:
MOV AH,4CH  ;terminate program
INT 21H

MAIN ENDP
END MAIN
