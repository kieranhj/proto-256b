; ============================================================================
; Skeleton for 256b demos
; ============================================================================

.equ _DEBUG, 1		;

.include "swis.h.asm"

.org 0x8000

Start:
	; Set screen MODE
	mov r0, #22
	swi OS_WriteC
	mov r0, #13
	swi OS_WriteC
	mov r0, #5		; turn off cursor with VDU 5
	swi OS_WriteC

	; Get screen address
	adr r0, screen_addr
	mov r1, r0
	swi OS_ReadVduVariables

	mov r8, #320
	add r9, r8, r8, lsl #1	; 320x3

main_loop:
	; start of screen
	ldr r7, screen_addr
	; read OS timer to R0
	swi OS_ReadMonotonicTime

	mov r2, #255	; y counter
y_loop:
	mov r1, #320	; x counter
x_loop:
	; do fun stuff here!

	.if 0			; MODE 13 diagnonal coloured dots
	add r3, r1, r0
	add r5, r2, r1
	eor r4, r1, r5
	eor r3, r3, r4
	str r3, [r7], #4
	.endif

	.if 0			; MODE 13 sliding checkerboards
	add r3, r2, r0
	eor r3, r1, r3
	bic r3, r3, #63
	add r4, r1, r0
	eor r4, r4, r2
	bic r4, r4, #31
	orr r3, r3, r4, lsl#16
	str r3, [r7], #4
	.endif

	; XOR texture 4x4 pixel blocks
	eor r3, r1, r2
	orr r3, r3, r3, lsl #8
	orr r3, r3, r3, lsl #16
	str r3, [r7, r8]
	str r3, [r7, r8, lsl #1]
	str r3, [r7, r9]
	str r3, [r7], #1

	subs r1, r1, #1
	bne x_loop

	add r7, r7, r9

	subs r2, r2, #4
	bge y_loop

	.if _DEBUG
	swi OS_ReadEscapeState
	bcc main_loop
	mov pc, lr
	.else
	b main_loop
	.endif

screen_addr:
	.long VD_ScreenStart, -1

.if 0
\\ MODE 13 diagonal coloured dots.
0MO.13:DIM P% 256:[.s equd148:equd-1
1.t adr 0,s:mov 1,0:swi &31:mov 0,#0
2.m ldr 7,s:mov 2, #255
3.y mov 1,#320
4.x add 3,1,0:add 5,2,1:eor 4,1,5:eor 3,3,4:str 3,[7],#4:subs 1,1,#4:bne x:subs 2,2,#1:bge y:add 0,0,#4:b m
5]:CALL t
\\ MODE 13 sliding checkerboards
0MO.13:DIM P% 256:[.s equd148:equd-1
1.t adr0,s:mov1,0:swi&31:mov0,#0
2.m ldr7,s:mov2,#255
3.y mov1,#320
4.x add3,2,0:eor3,1,3:bic3,3,#63:add4,1,0:eor4,4,2:bic4,4,#31:orr3,3,4,lsl#16:str3,[7],#4:subs1,1,#4:bnex:subs2,2,#1:bgey:add0,0,#4:b m
5]:CALL t
.endif
