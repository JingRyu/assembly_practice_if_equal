TITLE Program Template     (if_equal.asm)

INCLUDE Irvine32.inc

; (insert macro definitions here)

RIGHT_NUMBER = 7

.data

greeting			BYTE	"Welcome here!", 13, 10, 0
prompt_1			BYTE	"Pick between 1 and 10: ", 0
userVal				DWORD	?		;User' Guess
correct_string		BYTE	"Amazing!", 13, 10, "You won!", 0
incorrect_string	BYTE	"Sorry,", 13, 10, "Better next time!", 0

.code
main PROC

; Greet the user
mov		edx, OFFSET greeting
call	Writestring

; Get the user's guess
mov		edx, OFFSET prompt_1
call	Writestring
call	ReadDec
mov		userVal, eax

; Evaluate if correct and print appropriate reponse
	cmp		eax, RIGHT_NUMBER
	JE		_Correct
	mov		edx, OFFSET incorrect_string
	call	Writestring
	JMP		_Finished


_Correct:
	mov		edx, OFFSET correct_string
	call	Writestring

_Finished:
	Invoke ExitProcess,0	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
