.equ	F_CPU	=	8000000
.include	"tn2313def.inc"
.include	"..\Offsetrechner_Kommunikation.asm"

.def	R_Zero	=	r0
.def	C_Dig_1	=	r1
.def	C_Dig_2	=	r2
.def	C_Dig_3	=	r3
.def	C_Dig_4	=	r4
.def	C_Dig_5	=	r5
.def	C_Dig_6	=	r6
.def	Display_Call	=	r7
.def	Ignore_Call_1	=	r8
.def	Ignore_Call_2	=	r9
.def	R_Intensity	=	r10
.def	R_DC_Conf	=	r11
.def	R_T1_L		=	r12
.def	R_T1_H		=	r13
.def	C_Received_Data	=	r15
.def	temp	=	r16
.def	temp_2	=	r17
.def	Addressed	=	r18
.def	Digit_Active	=	r19
.def	R_Dig_1	=	r20
.def	R_Dig_2	=	r21
.def	R_Dig_3	=	r22
.def	R_Dig_4	=	r23
.def	R_Dig_5	=	r24
.def	R_Dig_6	=	r25
.def	Data_L	=	r26
.def	Data_M	=	r27
.def	Data_H	=	r28
.def	Received_Data	=	r29

.equ	SRAM_Comp_H	=	RAMEND
.equ	SRAM_Comp_L	=	RAMEND-1
.equ	Seg_a		=	5
.equ	Seg_b		=	4
.equ	Seg_c		=	2
.equ	Seg_d		=	1
.equ	Seg_e		=	0
.equ	Seg_f		=	6
.equ	Seg_g		=	7
.equ	Seg_0		=	(1<<Seg_a)|(1<<Seg_b)|(1<<Seg_c)|(1<<Seg_d)|(1<<Seg_e)|(1<<Seg_f)
.equ	Seg_1		=	(1<<Seg_b)|(1<<Seg_c)
.equ	Seg_2		=	(1<<Seg_a)|(1<<Seg_b)|(1<<Seg_d)|(1<<Seg_e)|(1<<Seg_g)
.equ	Seg_3		=	(1<<Seg_a)|(1<<Seg_b)|(1<<Seg_c)|(1<<Seg_d)|(1<<Seg_g)
.equ	Seg_4		=	(1<<Seg_b)|(1<<Seg_c)|(1<<Seg_f)|(1<<Seg_g)
.equ	Seg_5		=	(1<<Seg_a)|(1<<Seg_c)|(1<<Seg_d)|(1<<Seg_f)|(1<<Seg_g)
.equ	Seg_6		=	(1<<Seg_a)|(1<<Seg_c)|(1<<Seg_d)|(1<<Seg_e)|(1<<Seg_f)|(1<<Seg_g)
.equ	Seg_7		=	(1<<Seg_a)|(1<<Seg_b)|(1<<Seg_c)
.equ	Seg_8		=	(1<<Seg_a)|(1<<Seg_b)|(1<<Seg_c)|(1<<Seg_d)|(1<<Seg_e)|(1<<Seg_f)|(1<<Seg_g)
.equ	Seg_9		=	(1<<Seg_a)|(1<<Seg_b)|(1<<Seg_c)|(1<<Seg_d)|(1<<Seg_f)|(1<<Seg_g)
.equ	Seg_Neg		=	(1<<Seg_g)

.equ	Seg_R		=	(1<<Seg_b)|(1<<Seg_c)
.equ	Seg_RO		=	(1<<Seg_a)|(1<<Seg_b)|(1<<Seg_c)
.equ	Seg_O		=	(1<<Seg_a)
.equ	Seg_LO		=	(1<<Seg_a)|(1<<Seg_e)|(1<<Seg_f)
.equ	Seg_L		=	(1<<Seg_e)|(1<<Seg_f)
.equ	Seg_LU		=	(1<<Seg_d)|(1<<Seg_e)|(1<<Seg_f)
.equ	Seg_U		=	(1<<Seg_d)
.equ	Seg_RU		=	(1<<Seg_b)|(1<<Seg_c)|(1<<Seg_d)
.equ	Seg_Fr		=	(1<<Seg_a)|(1<<Seg_e)|(1<<Seg_f)|(1<<Seg_g)
.equ	Seg_Dr		=	(1<<Seg_b)|(1<<Seg_c)|(1<<Seg_d)|(1<<Seg_e)|(1<<Seg_g)
.equ	Seg_L_		=	(1<<Seg_a)|(1<<Seg_d)|(1<<Seg_e)|(1<<Seg_f)
.equ	Seg_R_		=	(1<<Seg_a)|(1<<Seg_b)|(1<<Seg_c)|(1<<Seg_d)
.equ	Seg_o_O		=	(1<<Seg_a)|(1<<Seg_b)|(1<<Seg_f)|(1<<Seg_g)
.equ	Seg_o_U		=	(1<<Seg_c)|(1<<Seg_d)|(1<<Seg_e)|(1<<Seg_g)

.equ	Seg_Empty	=	0
.macro	NOPS
	nop
	nop
.endmacro
.macro	Convert_Digit	;Register
	sbrc	R_DC_Conf,1
	rjmp	PC+7
	ldi		ZL,LOW(2*DK_tab)
	ldi		ZH,HIGH(2*DK_tab)
	add		ZL,@0
	adc		ZH,R_Zero
	lpm		@0,Z
	rjmp	PC+6
	ldi		ZL,LOW(2*DK_tab_2)
	ldi		ZH,HIGH(2*DK_tab_2)
	add		ZL,@0
	adc		ZH,R_Zero
	lpm		@0,Z
.endmacro
.org	0x00
	rjmp	RESET
.org	ICP1addr
	rjmp	Continue_Init
.org	OC1Aaddr
	rjmp	Tim1_COMPA
.org	OVF0addr
	rjmp	Tim0_OVF
.org	URXCaddr
	rjmp	Data_Received
.org	INT_VECTORS_SIZE
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
	ldi		R_Dig_1,~Seg_Empty
	ldi		R_Dig_2,~Seg_Empty
	ldi		R_Dig_3,~Seg_Empty
	ldi		R_Dig_4,~Seg_Empty
	ldi		R_Dig_5,~Seg_Empty
	ldi		R_Dig_6,~Seg_Empty
	ldi		Digit_Active,0


	dec		R_Intensity

	ldi		temp,LOW(RAMEND-2)
	out		SPL,temp

	ldi		temp,0xF7
	out		PORTB,temp
	out		DDRB,temp
	ldi		temp,0x1A
	out		PORTD,temp
	out		DDRD,temp
	sbi		DDRD,6
	ldi		temp,0x03
	out		PORTA,temp
	out		DDRA,temp	

	ldi		temp,(0<<CS00)
	out		TCCR0B,temp
	ldi		temp,(1<<TOIE0)
	out		TIMSK,temp

	sei
	




;UBRR von Master
	ldi		temp,0
	out		TCNT1H,temp
	ldi		temp,3
	out		TCNT1L,temp
	ldi		temp,(1<<CS10)
	sbic	PIND,0
	rjmp	PC-1
	sbis	PIND,0
	rjmp	PC-1
	out		TCCR1B,temp
	clr		temp

	ldi		temp_2,31
	sbic	PIND,0
	rjmp	PC-1
	sbis	PIND,0
	rjmp	PC-1
	dec		temp_2
	brne	PC-5

	sbic	PIND,0
	rjmp	PC-1
	sbis	PIND,0
	rjmp	PC-1

	out		TCCR1B,temp
	in		temp,TCNT1L
	in		temp_2,TCNT1H

	;*4
	lsl		temp
	rol		temp_2
	lsl		temp
	rol		temp_2

	out		OCR1AH,temp_2
	out		OCR1AL,temp

	sbrs	temp,7
	dec		temp_2
	out		UBRRH,R_Zero
	out		UBRRL,temp_2

	clr		temp
	lsl		temp_2
	rol		temp
	lsl		temp_2
	rol		temp
	lsl		temp_2
	rol		temp
	out		ICR1H,temp
	out		ICR1L,temp_2



	out		TCNT1H,R_Zero
	out		TCNT1L,R_Zero
	ldi		temp,(3<<WGM12)|(1<<CS10)
	out		TCCR1B,temp
	ldi		temp,(1<<ICF1)
	out		TIFR,temp
	ldi		temp,(1<<ICIE1)|(1<<TOIE0)
	out		TIMSK,temp
	sei

	sbic	PIND,0
	rjmp	PC-1
	out		TCNT1H,R_Zero
	out		TCNT1L,R_Zero
	sbis	PIND,0
	rjmp	PC-1
	out		TCNT1H,R_Zero
	out		TCNT1L,R_Zero
	rjmp	PC-8

Continue_Init:
	pop		temp
	pop		temp

	ldi 	temp,(1<<TOIE0)
	out		TIMSK,temp
	out		TCCR1B,R_Zero
	out		TCNT1H,R_Zero
	out		TCNT1L,R_Zero
	out		ICR1H,R_Zero
	out		ICR1L,R_Zero

	ldi		R_Dig_1,~Seg_Empty
	ldi		R_Dig_2,~Seg_Empty
	ldi		R_Dig_3,~Seg_Empty
	ldi		R_Dig_4,~Seg_Empty
	ldi		R_Dig_5,~Seg_Empty
	ldi		R_Dig_6,~Seg_Empty

	;EEPROM Konstanten laden
	sbic	EECR,EEPE
	rjmp	PC-1
	ldi		temp,0
	out		EEAR,temp
	sbi		EECR,EERE
	in		temp,EEDR
	clr		temp_2
	clr		Addressed
	sbrc	temp,0
	inc		temp_2
	sbrc	temp,1
	inc		temp_2
	sbrc	temp,2
	inc		temp_2
	andi	temp,0xF0
	cpi		temp_2,2
	brlo	PC+2
	inc		temp
	clr		temp_2
	sbrc	temp,4
	inc		temp_2
	sbrc	temp,5
	inc		temp_2
	sbrc	temp,6
	inc		temp_2
	andi	temp,0x01
	cpi		temp_2,2
	brlo	PC+2
	ori		temp,(1<<1)
	clr		temp_2
	cpi		temp,3
	brlo	PC+2
	clr		temp
	lsl		temp
	lsl		temp
	lsl		temp
	ldi		ZL,LOW(EEPROM_tab)
	ldi		ZH,HIGH(EEPROM_tab)
	add		ZL,temp
	adc		ZH,R_Zero
	icall


	ldi		temp,(3<<UCSZ0)
	out		UCSRC,temp
	ldi		temp,(1<<RXEN)|(1<<RXCIE)
	out		UCSRB,temp


/*	ldi		temp,0xF7
	out		PORTB,temp
	out		DDRB,temp
	ldi		temp,0x1A
	out		PORTD,temp
	out		DDRD,temp
	sbi		DDRD,6
	ldi		temp,0x03
	out		PORTA,temp
	out		DDRA,temp*/	
	ldi		temp,(1<<WGM12)
	out		TCCR1B,temp
	ldi		temp,(1<<TOIE0)|(0<<OCIE1A)
	out		TIMSK,temp
	clr		R_Intensity
	dec		R_Intensity

;	ldi		temp,(1<<CS00)
;	out		TCCR0B,temp

	clr		temp
	sei
LOOP:
	rjmp	LOOP
Data_Received:
	in		Received_Data,UDR
/*	inc		Data_L
	brne	PC+4
	inc		Data_M
	brne	PC+2
	inc		Data_H

	push	Data_H
	push	Data_M
	push	Data_L
	rcall	Berechnung
	pop		Data_L
	pop		Data_M
	pop		Data_H
	reti*/
/*	in		R_Dig_5,UDR
	com		R_Dig_5
	dec		R_Dig_6
	reti*/

	mov		C_Received_Data,Received_Data
	tst		Addressed
	brne	PC+2
	rjmp	D_Call
	cpi		Addressed,7
	brlo	PC+6
	breq	PC+3
	dec		Addressed
	reti
	clr		Addressed
	reti
	cpi		Addressed,4
	brlo	PC+10
	mov		Data_H,Data_M
	mov		Data_M,Data_L
	mov		Data_L,Received_Data
	cpi		Addressed,4
	brne	PC+3
	clr		Addressed
	rjmp	Berechnung
	dec		Addressed
	reti
	cpi		Addressed,1
	breq	PC+2
	rjmp	Addr_2_3
	mov		R_Dig_6,Received_Data
	andi	R_Dig_6,0x0F
	swap	Received_Data
	mov		R_Dig_5,Received_Data
	andi	R_Dig_5,0x0F
	mov		R_Dig_1,C_Dig_1
	mov		R_Dig_2,C_Dig_2
	mov		R_Dig_3,C_Dig_3
	mov		R_Dig_4,C_Dig_4
	clr		Addressed
	cpi		R_Dig_1,0x0F
	brne	PC+19
	cpi		R_Dig_2,0x0F
	brne	PC+17
	cpi		R_Dig_3,0x0F
	brne	PC+15
	cpi		R_Dig_4,0x0F
	brne	PC+13
	cpi		R_Dig_5,0x0F
	brne	PC+11
	cpi		R_Dig_6,0x0F
	brne	PC+9
	out		TCCR0B,R_Zero
	ldi		Received_Data,(1<<WGM12)
	out		TCCR1B,Received_Data
	ldi		Received_Data,0x1A
	out		PORTD,Received_Data
	ldi		Received_Data,0x03
	out		PORTA,Received_Data
	reti
	Convert_Digit	R_Dig_1
	Convert_Digit	R_Dig_2
	Convert_Digit	R_Dig_3
	Convert_Digit	R_Dig_4
	Convert_Digit	R_Dig_5
	Convert_Digit	R_Dig_6
	ldi		Received_Data,(1<<CS00)
	out		TCCR0B,Received_Data
	reti


	sbrs	R_DC_Conf,0
	rjmp	PC+6
	ldi		Received_Data,(1<<WGM12)|(1<<CS12)
	out		TCCR1B,Received_Data
	out		TCNT1H,R_Zero
	out		TCNT1L,R_Zero
	reti
	ldi		Received_Data,(1<<WGM12)
	out		TCCR1B,Received_Data
	reti
Addr_2_3:
	cpi		Addressed,2
	brne	PC+9
	ldi		Received_Data,0x0F
	mov		C_Dig_4,C_Received_Data
	and		C_Dig_4,Received_Data
	mov		C_Dig_3,C_Received_Data
	swap	C_Dig_3
	and		C_Dig_3,Received_Data
	dec		Addressed
	reti
	ldi		Received_Data,0x0F
	mov		C_Dig_2,C_Received_Data
	and		C_Dig_2,Received_Data
	mov		C_Dig_1,C_Received_Data
	swap	C_Dig_1
	and		C_Dig_1,Received_Data
	dec		Addressed
	reti
D_Call:
	andi	Received_Data,0x03
	cp		Received_Data,Ignore_Call_1
	breq	PC+3
	cp		Received_Data,Ignore_Call_2
	brne	PC+4
	sbrs	C_Received_Data,D_PIN_SF
	ldi		Addressed,9
	reti
	cpi		Received_Data,D_G_Call
	breq	Display_Called
	cp		Received_Data,Display_Call
	breq	Display_Called
	clr		Addressed
	reti
Display_Called:
	sbrc	C_Received_Data,D_PIN_SF
	rjmp	D_C_Special_Function
	mov		Received_Data,C_Received_Data
	ldi		temp,255
	sbrs	Received_Data,D_PIN_I
	ldi		temp,170
	mov		R_Intensity,temp

	clr		R_DC_Conf
	sbrc	C_Received_Data,D_PIN_Bl
	inc		R_DC_Conf
	sbrs	C_Received_Data,D_PIN_EA
	rjmp	PC+3
	inc		R_DC_Conf
	inc		R_DC_Conf

	sbrc	C_Received_Data,D_PIN_E_Call
	rjmp	PC+3;9
	ldi		Addressed,3
/*	mov		C_Dig_1,R_Dig_1
	mov		C_Dig_2,R_Dig_2
	mov		C_Dig_3,R_Dig_3
	mov		C_Dig_4,R_Dig_4
	mov		C_Dig_5,R_Dig_5
	mov		C_Dig_6,R_Dig_6*/
	reti
	ldi		Addressed,6
	reti
D_C_Special_Function:
	mov		Received_Data,C_Received_Data
	andi	Received_Data,0x70
	cpi		Received_Data,D_Cl_D
	breq	PC+8
	clr		Addressed
	sbrs	R_DC_Conf,0
	reti
	cpi		Received_Data,D_Tg_Cl
	brne	PC-2
	rjmp	Tim1_COMPA

	ldi		R_Dig_1,~Seg_Empty
	ldi		R_Dig_2,~Seg_Empty
	ldi		R_Dig_3,~Seg_Empty
	ldi		R_Dig_4,~Seg_Empty
	ldi		R_Dig_5,~Seg_Empty
	ldi		R_Dig_6,~Seg_Empty
	out		TCCR0B,R_Zero
	ldi		Addressed,(1<<WGM12)
	out		TCCR1B,Addressed
	ldi		Addressed,0x1A
	out		PORTD,Addressed
	ldi		Addressed,0x03
	out		PORTA,Addressed
	clr		Addressed
	reti
Tim1_COMPA:
	in		temp,TCCR0B
	tst		temp
	breq	PC+11
	out		TCCR0B,R_Zero
	cbi		PORTD,6
	sbi		PORTD,4
	sbi		PORTD,3
	sbi		PORTA,0
	sbi		PORTA,1
	sbi		PORTD,1
	ldi		temp,(1<<TOV0)
	out		TIFR,temp
	reti
	ldi		temp,(1<<CS00)
	out		TCCR0B,temp
	reti
Tim0_OVF:
	cpi		Digit_Active,25
	brsh	PC+6
	ldi		ZL,LOW(DA_tab)
	ldi		ZH,HIGH(DA_tab)
	add		ZL,Digit_Active
	adc		ZH,R_Zero
	icall
	inc		Digit_Active
	reti
Show_Digit_1:
	out		PORTB,R_Dig_1
	NOPS
	sbi		PORTD,6
	ret
Show_Digit_2:
	out		PORTB,R_Dig_2
	NOPS
	cbi		PORTD,4
	ret
Show_Digit_3:
	out		PORTB,R_Dig_3
	NOPS
	cbi		PORTD,3
	ret
Show_Digit_4:
	out		PORTB,R_Dig_4
	NOPS
	cbi		PORTA,0
	ret
Show_Digit_5:
	out		PORTB,R_Dig_5
	NOPS
	cbi		PORTA,1
	ret
Show_Digit_6:
	out		PORTB,R_Dig_6
	NOPS
	cbi		PORTD,1
	ret
Berechnung:
	tst		Data_L
	brne	PC+22
	tst		Data_M
	brne	PC+20
	tst		Data_H
	brne	PC+18
	ldi		R_Dig_1,~Seg_Empty
	ldi		R_Dig_2,~Seg_Empty
	ldi		R_Dig_3,~Seg_Empty
	ldi		R_Dig_4,~Seg_0
	ldi		R_Dig_5,~Seg_0
	ldi		R_Dig_6,(1<<CS00)
	out		TCCR0B,R_Dig_6
	sbrs	R_DC_Conf,0
	rjmp	PC+3
	ldi		R_Dig_6,(1<<WGM12)|(1<<CS12)
	rjmp	PC+4
	out		TCNT1H,R_Zero
	out		TCNT1L,R_Zero
	ldi		R_Dig_6,(1<<WGM12)
	out		TCCR1B,R_Dig_6
	ldi		R_Dig_6,~Seg_0
	reti

	clr		C_Dig_1
	clr		C_Dig_2
	clr		C_Dig_3
	clr		C_Dig_4
	clr		C_Dig_5
	clr		C_Dig_6
	sbrs	Data_H,7
	rjmp	PC+12
	sbr		Addressed,(1<<7)
	clc
	tst		Data_L
	brne	PC+2
	sec
	dec		Data_L
	sbci	Data_M,0
	sbci	Data_H,0
	com		Data_H
	com		Data_M
	com		Data_L
		;Hunderttausender l�schen
	subi	Data_L,(100000&0x0000FF)
	sbci	Data_M,((100000&0x00FF00)>>8)
	sbci	Data_H,(100000>>16)
	brcc	PC-3
	subi	Data_L,(-100000&0x0000FF)
	sbci	Data_M,((-100000&0x00FF00)>>8)
	sbci	Data_H,(-100000>>16)
		;Zehntausender
	ser		Received_Data
	inc		Received_Data
	subi	Data_L,LOW(10000)
	sbci	Data_M,HIGH(10000)
	sbci	Data_H,0
	brcc	PC-4
	mov		C_Dig_2,Received_Data
		;Tausender
	ldi		Received_Data,10
	dec		Received_Data
	subi	Data_L,LOW(-1000)
	sbci	Data_M,HIGH(-1000)
	sbci	Data_H,0xFF
	brcs	PC-4
	mov		C_Dig_3,Received_Data
		;Hunderter
	ser		Received_Data
	inc		Received_Data
	subi	Data_L,100
	sbci	Data_M,0
	sbci	Data_H,0
	brcc	PC-4
	mov		C_Dig_4,Received_Data
		;Zehner
	ldi		Received_Data,10
	dec		Received_Data
	subi	Data_L,-10
	sbci	Data_M,0xFF
	sbci	Data_H,0xFF
	brcs	PC-4
	mov		C_Dig_5,Received_Data
		;Einer
	mov		C_Dig_6,Data_L
	clr		Data_L

	ldi		Received_Data,Dig_Neg
	ldi		temp,Dig_Empty
	sbrs	Addressed,7
	rjmp	PC+13
	tst		C_Dig_2
	breq	PC+3
	mov		C_Dig_1,Received_Data
	rjmp	PC+16
	mov		C_Dig_1,temp
	tst		C_Dig_3
	breq	PC+3
	mov		C_Dig_2,Received_Data
	rjmp	PC+11
	mov		C_Dig_2,temp
	mov		C_Dig_3,Received_Data
	rjmp	PC+8
	mov		C_Dig_1,temp
	tst		C_Dig_2
	brne	PC+5
	mov		C_Dig_2,temp
	tst		C_Dig_3
	brne	PC+2
	mov		C_Dig_3,temp

	clr		Addressed
	mov		R_Dig_1,C_Dig_1
	mov		R_Dig_2,C_Dig_2
	mov		R_Dig_3,C_Dig_3
	mov		R_Dig_4,C_Dig_4
	mov		R_Dig_5,C_Dig_5
	mov		R_Dig_6,C_Dig_6

	Convert_Digit	R_Dig_1
	Convert_Digit	R_Dig_2
	Convert_Digit	R_Dig_3
	Convert_Digit	R_Dig_4
	Convert_Digit	R_Dig_5
	Convert_Digit	R_Dig_6

	ldi		temp,(1<<CS00)
	out		TCCR0B,temp
	reti
	
	sbrs	R_DC_Conf,0
	rjmp	PC+6
	ldi		temp,(1<<WGM12)|(1<<CS12)
	out		TCCR1B,temp
	out		TCNT1H,R_Zero
	out		TCNT1L,R_Zero
	reti
	ldi		temp,(1<<WGM12)
	out		TCCR1B,temp
	reti
DK_tab:
	.db		~Seg_0,~Seg_1,~Seg_2,~Seg_3,~Seg_4,~Seg_5,~Seg_6,~Seg_7,~Seg_8 \
	,~Seg_9,~Seg_Neg,~Seg_Empty,~Seg_Empty,~Seg_Empty,~Seg_Empty,~Seg_Empty
DK_tab_2:
	.db		~Seg_R,~Seg_RO,~Seg_O,~Seg_LO,~Seg_L,~Seg_LU,~Seg_U,~Seg_RU,~Seg_Fr \
	,~Seg_Dr,~Seg_Neg,~Seg_L_,~Seg_R_,~Seg_o_O,~Seg_o_U,~Seg_Empty
DA_tab:
	rjmp	Show_Digit_1
	cbi		PORTD,6
	ret
	rjmp	Show_Digit_2
	sbi		PORTD,4
	ret
	rjmp	Show_Digit_3
	sbi		PORTD,3
	ret
	rjmp	Show_Digit_4
	sbi		PORTA,0
	ret
	rjmp	Show_Digit_5
	sbi		PORTA,1
	ret
	rjmp	Show_Digit_6
	sbi		PORTD,1
	ret
	ret
	ret
	ret
	ret
	ret
	ret
	mov		Digit_Active,R_Intensity
	ret
EEPROM_tab:
;X
	ldi		temp,D_Call_X
	mov		Display_Call,temp
	ldi		temp,D_Call_Y
	mov		Ignore_Call_1,temp
	ldi		temp,D_Call_Z
	mov		Ignore_Call_2,temp
	ret
	nop
;Y
	ldi		temp,D_Call_Y
	mov		Display_Call,temp
	ldi		temp,D_Call_X
	mov		Ignore_Call_1,temp
	ldi		temp,D_Call_Z
	mov		Ignore_Call_2,temp
	ret
	nop
;Z
	ldi		temp,D_Call_Z
	mov		Display_Call,temp
	ldi		temp,D_Call_X
	mov		Ignore_Call_1,temp
	ldi		temp,D_Call_Y
	mov		Ignore_Call_2,temp
	ret
