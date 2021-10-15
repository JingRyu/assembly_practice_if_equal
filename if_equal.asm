TITLE Program Template     (if_equal.asm)

INCLUDE Irvine32.inc

; (insert macro definitions here)

.data

.data   ; Data Segment ALPHA
x			SDWORD  ?
y			SDWORD  ?
z			SDWORD  ?
prompt_k	byte	"k: ", 0
prompt_n	byte	"n: ", 0
prompt_x	byte	"x: ", 0
prompt_y	byte	"y: ", 0
prompt_z	byte	"z: ", 0

yes			BYTE    "Yes",13,10,0
no			BYTE    "No",13,10,0
maybe		BYTE    "Maybe",13,10,0

.code
main PROC
; Get the user's guess
mov		edx, OFFSET prompt_x
call	Writestring
call	ReadInt
mov		x, eax
mov		edx, OFFSET prompt_y
call	Writestring
call	ReadInt
mov		y, eax
mov		edx, OFFSET prompt_z
call	Writestring
call	ReadInt
mov		z, eax

; Evaluate if correct and print appropriate reponse
	mov		edx, x
	CMP		edx, y
	JL		_trueCase
	cmp		edx, z
	JG		_trueCase
	mov		edx, OFFSET maybe
	call	WriteSTring
	JMP		_Finished

_trueCase:
	mov		edx, OFFSET no
	call	Writestring
	JMP		_Finished

_Finished:
	Invoke ExitProcess,0	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
