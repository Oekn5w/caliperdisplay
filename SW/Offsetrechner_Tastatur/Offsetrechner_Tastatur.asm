.include	"tn2313def.inc"
.equ	F_CPU	=	8167000
.include	"..\Offsetrechner_Kommunikation.asm"
;Wertetabelle
.equ	T_B0	=	Ein_4	;4
.equ	T_B1	=	Ein_6	;6
.equ	T_B2	=	Ein_9	;9
.equ	T_B3	=	Ein_8	;8
.equ	T_B4	=	Ein_7	;7
.equ	T_B5	=	Ein_.	;.
.equ	T_B6	=	Ein_0	;0
.equ	T_B7	=	Ein_Neg	;+/-
.equ	T_D0	=	Ein_Y	;Y
.equ	T_D2	=	Ein_1	;1
.equ	T_D3	=	Ein_2	;2
.equ	T_D4	=	Ein_3	;3
.equ	T_D5	=	Ein_X	;X
.equ	T_D6	=	Ein_5	;5
.equ	T_A0	=	Ein_Abbr	;Abbruch
.equ	T_A1	=	Ein_Z	;Z
.def	temp	=	r16
.macro	Entprellen
	rcall	Delay_20ms
	sbic	@0,@1
	ret
	rcall	Delay_20ms
	sbic	@0,@1
	ret
	sbi		UCSRA,TXC
	sbis	UCSRA,UDRE
	rjmp	PC-1
	ldi		temp,@2
	out		UDR,temp
	sbis	@0,@1
	rjmp	PC-1
	rcall	Delay_20ms
	ret
.endmacro
RESET:
	clr		r0
	clr		r1
	clr		r2
	clr		r3
	clr		r4
	clr		r5
	clr		r6
	clr		r7
	clr		r8
	clr		r9
	clr		r10
	clr		r11
	clr		r12
	clr		r13
	clr		r14
	clr		r15
	clr		r16
	clr		r17
	clr		r18
	clr		r19
	clr		r20
	clr		r21
	clr		r22
	clr		r23
	clr		r24
	clr		r25
	clr		r26
	clr		r27
	clr		r28
	clr		r29
	clr		r30
	clr		r31
	ldi		temp,LOW(RAMEND)
	out		SPL,temp
	rcall	Delay_20ms
	ldi		temp,HIGH(UBRR_VAL)
	out		UBRRH,temp
	ldi		temp,LOW(UBRR_VAL)
	out		UBRRL,temp
	ldi		temp,(1<<TXEN)
	out		UCSRB,temp
	ldi		temp,(3<<UCSZ0)
	out		UCSRC,temp
	ser		temp
	out		PORTB,temp
	ldi		temp,0b01111101
	out		PORTD,temp
	ldi		temp,0b00000011
	out		PORTA,temp
LOOP:
	in		temp,PINB
	cpi		temp,0xFF
	breq	PC+2
	rcall	Low_Level_B
	in		temp,PIND
	ori		temp,(1<<7)|(1<<1)
	cpi		temp,0xFF
	breq	PC+2
	rcall	Low_Level_D
	in		temp,PINA
	ori		temp,0b11111100
	cpi		temp,0xFF
	breq	PC+2
	rcall	Low_Level_A
	rjmp	LOOP
Low_Level_A:
	sbrs	temp,0
	rjmp	A0
	sbrs	temp,1
	rjmp	A1
	ret
A0:	Entprellen	PINA,0,T_A0
A1:	Entprellen	PINA,1,T_A1
Low_Level_B:
	sbrs	temp,0
	rjmp	B0
	sbrs	temp,1
	rjmp	B1
	sbrs	temp,2
	rjmp	B2
	sbrs	temp,3
	rjmp	B3
	sbrs	temp,4
	rjmp	B4
	sbrs	temp,5
	rjmp	B5
	sbrs	temp,6
	rjmp	B6
	sbrs	temp,7
	rjmp	B7
	ret
B0:	Entprellen	PINB,0,T_B0
B1:	Entprellen	PINB,1,T_B1
B2:	Entprellen	PINB,2,T_B2
B3:	Entprellen	PINB,3,T_B3
B4:	Entprellen	PINB,4,T_B4
B5:	Entprellen	PINB,5,T_B5
B6:	Entprellen	PINB,6,T_B6
B7:	Entprellen	PINB,7,T_B7
Low_Level_D:
	sbrs	temp,0
	rjmp	D0
	sbrs	temp,2
	rjmp	D2
	sbrs	temp,3
	rjmp	D3
	sbrs	temp,4
	rjmp	D4
	sbrs	temp,5
	rjmp	D5
	sbrs	temp,6
	rjmp	D6
	ret
D0:	Entprellen	PIND,0,T_D0
D2:	Entprellen	PIND,2,T_D2
D3:	Entprellen	PIND,3,T_D3
D4:	Entprellen	PIND,4,T_D4
D5:	Entprellen	PIND,5,T_D5
D6:	Entprellen	PIND,6,T_D6
Delay_20ms:
	ldi		r19,80
	ldi		r18,250
	nop
	nop
	nop
	nop
	nop
	dec		r18
	brne	PC-6
	dec		r19
	brne	PC-9
	ret
