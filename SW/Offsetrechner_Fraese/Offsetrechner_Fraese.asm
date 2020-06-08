.include	"m162def.inc"
.equ	F_CPU	=	8724000
.include	"..\Offsetrechner_Kommunikation.asm"
.equ	Enable_FZ	=	0
.equ	Enable_DZu	=	0
//.equ	Software_MW	=	1
//.equ	Test_E	=	0
.equ	Toleranz	=	768
.equ	Chk_Tol	=	0
.if(Toleranz>32767||Toleranz<0)
	.error	"Toleranz zu gro� bzw. negativ"
.endif
.if(Enable_FZ&Enable_DZu)
	.error	"Einen Eingang deaktivieren"
.endif
.if(Enable_FZ!=0&Enable_FZ!=1)
	.error	"Label \"Enable_FZ\" muss Wert '0' oder '1' haben!"
.endif
.if(Enable_DZu!=0&Enable_DZu!=1)
	.error	"Label \"Enable_DZu\" muss Wert '0' oder '1' haben!"
.endif
.def	T_X_L	=	r0
.def	T_X_H	=	r1
.def	Count_X	=	r2
.def	T_Y_L	=	r3
.def	T_Y_H	=	r4
.def	Count_Y	=	r5
.def	T_Z_L	=	r6
.def	T_Z_H	=	r7
.def	Count_Z	=	r8
.def	R_Zero	=	r9
.def	Ext_Int	=	r10
.def	W3_L	=	r11
.def	W3_M	=	r12
.def	W3_H	=	r13
.def	R_Ein	=	r14			; temp f�r Eingabe
.def	R_DA	=	r15			; temp f�r Interrupts, dauerhaft f�r Eingang aktiv, auf Display
.def	temp	=	r16
.def	W_L		=	r17
.def	W_M		=	r18
.def	W_H		=	r19
.def	Z_L		=	r20
.def	Z_M		=	r21
.def	Z_H		=	r22
.def	Y_L		=	r23
.def	Y_M		=	r24
.def	Y_H		=	r25
.def	X_L		=	r26
.def	X_M		=	r27
.def	X_H		=	r28
.def	W2_L	=	r29
.def	W2_M	=	r30
.def	W2_H	=	r31





.equ	E_DP_V	=	7
.equ	E_DP_M	=	6
.equ	E_DP_H	=	5
.equ	E_MA	=	2
.equ	E_D		=	0
.equ	SIG_FX	=	0
.equ	SIG_FY	=	1
.equ	SIG_Z	=	2
.equ	SIG_DX	=	3
.equ	SIG_DZ	=	4

.equ	DA_X_A	=	0
.equ	DA_Y_A	=	2
.equ	DA_Z_A	=	4
.equ	DA_Dis	=	6
.equ	DA_T3_F	=	7

.equ	P_X_H	=	PORTB
.equ	P_X_M	=	PORTB
.equ	P_X_V	=	PORTB
.equ	PIN_X_H	=	2	
.equ	PIN_X_M	=	1
.equ	PIN_X_V	=	0
.equ	P_Y_H	=	PORTA
.equ	P_Y_M	=	PORTA
.equ	P_Y_V	=	PORTA
.equ	PIN_Y_H	=	0
.equ	PIN_Y_M	=	1
.equ	PIN_Y_V	=	2
.equ	P_Z_H	=	PORTA
.equ	P_Z_M	=	PORTA
.equ	P_Z_V	=	PORTA
.equ	PIN_Z_H	=	3
.equ	PIN_Z_M	=	4
.equ	PIN_Z_V	=	5
.equ	P_Ab	=	PORTC
.equ	PIN_Ab	=	5
.equ	EEPROM_FX_L	=	0
;.equ	EEPROM_FX_M	=	1
;.equ	EEPROM_FX_H	=	2
.equ	EEPROM_FY_L	=	3
;.equ	EEPROM_FY_M	=	4
;.equ	EEPROM_FY_H	=	5
.equ	EEPROM_FZ_L	=	6
;.equ	EEPROM_FZ_M	=	7
;.equ	EEPROM_FZ_H	=	8
.equ	EEPROM_DX_L	=	9
;.equ	EEPROM_DX_M	=	10
;.equ	EEPROM_DX_H	=	11
.equ	EEPROM_DZ_L	=	12
;.equ	EEPROM_DZ_M	=	13
;.equ	EEPROM_DZ_H	=	14
.equ	EEPROM_DZu_L	=	15
;.equ	EEPROM_DZu_M	=	16
;.equ	EEPROM_DZu_H	=	17
.equ	EEPROM_MW	=	18				;1<<Fr�se | 0<<Drehbank
.equ	SRAM_C_X_L	=	RAMEND - 0	
.equ	SRAM_C_X_M	=	RAMEND - 1	
.equ	SRAM_C_X_H	=	RAMEND - 2
.equ	SRAM_C_Y_L	=	RAMEND - 3
.equ	SRAM_C_Y_M	=	RAMEND - 4
.equ	SRAM_C_Y_H	=	RAMEND - 5
.equ	SRAM_C_Z_L	=	RAMEND - 6
.equ	SRAM_C_Z_M	=	RAMEND - 7
.equ	SRAM_C_Z_H	=	RAMEND - 8
.equ	SRAM_T3		=	RAMEND - 9
.equ	RAMEND_		=	RAMEND - 10

.equ	P_FXC	=	PORTD
.equ	PIN_FXC	=	2
.equ	P_FXD	=	PORTD
.equ	PIN_FXD	=	4
.equ	P_FYC	=	PORTD
.equ	PIN_FYC	=	3
.equ	P_FYD	=	PORTD
.equ	PIN_FYD	=	5
.equ	P_ZC	=	PORTE
.equ	PIN_ZC	=	0
.equ	P_ZD	=	PORTE
.equ	PIN_ZD	=	1
.equ	P_DXC	=	PORTA
.equ	PIN_DXC	=	7
.equ	P_DXD	=	PORTE
.equ	PIN_DXD	=	2
.equ	P_DZC	=	PORTC
.equ	PIN_DZC	=	7
.equ	P_DZD	=	PORTC
.equ	PIN_DZD	=	6

;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;Makros

.macro Send;(Register)
	sbis	UCSR1A,UDRE1
	rjmp	PC-1
	out		UDR1,@0
.endmacro
.equ	PC_Send		=	3
.macro Send_Data
	Send	W_H
	Send	W_M
	Send	W_L
.endmacro
.equ	PC_Send_Data	=	3*PC_Send
.macro Convertion;(H:L)
	sbrs	@0,7
	rjmp	PC+12
	sbi		PORTA,6
	clc
	tst		@2
	brne	PC+2
	sec
	dec		@2
	sbci	@1,0
	sbci	@0,0
	com		@0
	com		@1
	com		@2
	lsr		@0
	ror		@1
	ror		@2
	lsr		@0
	ror		@1
	ror		@2
	mov		W3_M,@0
	mov		W3_L,@1
	lsr		@0
	ror		@1
	ror		@2
	sub		@2,W3_L
	sbc		@1,W3_M
	sbci	@0,0
	sbis	PORTA,6
	rjmp	PC+11
	cbi		PORTA,6
	com		@0
	com		@1
	com		@2
	clc
	inc		@2
	brne	PC+2
	sec
	adc		@1,R_Zero
	adc		@0,R_Zero
;	mov		W_H,@0
;	mov		W_M,@1
;	mov		W_L,@2
.endmacro

.macro	E_Ausgabe
	Send	W2_H
	Send	W2_M
	Send	W2_L
.endmacro
.equ	PC_E_Ausgabe	=	3*PC_Send

.macro	Convert_X
	Convertion	X_H,X_M,X_L
.endmacro

.macro	Convert_Y
	Convertion	Y_H,Y_M,Y_L
.endmacro

.macro	Convert_Z
	Convertion	Z_H,Z_M,Z_L
.endmacro

.macro	Datenerkennung ;Port,Pin
	sec
	sbic	@0-2,@1
	rjmp	PC+8					;1h
	clc								;1l
	sbis	@0-2,@1
	rjmp	PC+10					;1l-2l
	nop								;1l-2h
	sbic	@0-2,@1					;1l-2h -> 3 entscheidet
	sec
	rjmp	PC+6
	;1h	
	sbic	@0-2,@1
	rjmp	PC+4					;1h-2h
	nop								;1h-2l
	sbis	@0-2,@1					;1h-2l -> 3 entscheidet
	clc
.endmacro

.macro	_Datenerkennung ;Port,Pin
	sec
	sbis	@0-2,@1
	clc
.endmacro

.macro	Prep_Reg
	clr		X_H
	clr		X_M
	clr		X_L
	clr		Y_H
	clr		Y_M
	clr		Y_L
	clr		Z_H
	clr		Z_M
	clr		Z_L
	Clr_Timer_Data
.endmacro

.macro	Clr_Timer_Data
	clr		T_X_L
	clr		T_X_H
	clr		Count_X
	clr		T_Y_L
	clr		T_Y_H
	clr		Count_Y
	clr		T_Z_L
	clr		T_Z_H
	clr		Count_Z
	out		TCNT1H,R_Zero
	out		TCNT1L,R_Zero
.endmacro

.macro	Reset_T3
	sts		TCNT3H,R_Zero		;32-Bit Opcode
	sts		TCNT3L,R_Zero		;32-Bit Opcode
	.if(@0==1)
	sts		SRAM_T3,R_Zero		;32-Bit Opcode
	.endif
.endmacro

.macro	Start_T3
	Reset_T3 1
	ldi		temp,(1<<WGM32)|(5<<CS30)
	sts		TCCR3B,temp			;32-Bit Opcode
	ldi		temp,(1<<OCF3A)
	sts		ETIFR,temp			;32-Bit Opcode
	sts		ETIMSK,R_Zero		;32-Bit Opcode
.endmacro

.macro	Start_T3_Ani
	Reset_T3 1
	ldi		temp,(5<<CS30)
	sts		TCCR3B,temp			;32-Bit Opcode
	ldi		temp,(1<<OCF3B)
	sts		ETIFR,temp			;32-Bit Opcode
	sts		ETIMSK,temp			;32-Bit Opcode
	rcall	T3_Ani
.endmacro


.macro	Stop_T3
	sts		TCCR3B,R_Zero		;32-Bit Opcode
.endmacro


;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;--------------------------------Flash-Speicher-------------------------------------
;--------------------------------Flash-Speicher-------------------------------------
;--------------------------------Flash-Speicher-------------------------------------
;--------------------------------Flash-Speicher-------------------------------------
;--------------------------------Flash-Speicher-------------------------------------
;--------------------------------Flash-Speicher-------------------------------------
;--------------------------------Flash-Speicher-------------------------------------
;--------------------------------Flash-Speicher-------------------------------------
;--------------------------------Flash-Speicher-------------------------------------
;--------------------------------Flash-Speicher-------------------------------------
;--------------------------------Flash-Speicher-------------------------------------
;--------------------------------Flash-Speicher-------------------------------------
;--------------------------------Flash-Speicher-------------------------------------
;--------------------------------Flash-Speicher-------------------------------------
;--------------------------------Flash-Speicher-------------------------------------
;--------------------------------Flash-Speicher-------------------------------------
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################

.cseg
.org	0x00
	rjmp	RESET
.org	INT0addr
	rjmp	Fraese_X
.org	INT1addr
	rjmp	Fraese_Y
.if(Enable_FZ||Enable_DZu)
.org	INT2addr
	rjmp	FD_Z
.endif
.org	PCI0addr
	rjmp	Dreh_X
.org	PCI1addr
	rjmp	Dreh_Z
.org	OC3Baddr
	rjmp	T3_Ani
.org	OC1Aaddr
	rjmp	T1_COMP_A

.org	INT_VECTORS_SIZE
RESET:
;alte Register-Werte l�schen
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
;alte SRAM-Werte l�schen
	sts		SRAM_C_X_L,temp
	sts		SRAM_C_X_M,temp
	sts		SRAM_C_X_H,temp
	sts		SRAM_C_Y_L,temp
	sts		SRAM_C_Y_M,temp
	sts		SRAM_C_Y_H,temp
	sts		SRAM_C_Z_L,temp
	sts		SRAM_C_Z_M,temp
	sts		SRAM_C_Z_H,temp
	sts		SRAM_T3,temp
;Stackpointer initalisieren
	ldi		temp,HIGH(RAMEND_)
	out		SPH,temp
	ldi		temp,LOW(RAMEND_)
	out		SPL,temp
;Dezimalkommas X,Y,Z auf Displays initialisieren
	sbi		P_X_M,PIN_X_M
	sbi		P_X_H,PIN_X_H
	sbi		P_X_V,PIN_X_V
	sbi		P_Y_H,PIN_Y_H
	sbi		P_Y_M,PIN_Y_M
	sbi		P_Y_V,PIN_Y_V
	sbi		P_Z_H,PIN_Z_H
	sbi		P_Z_M,PIN_Z_M
	sbi		P_Z_V,PIN_Z_V
	sbi		P_X_V-1,PIN_X_V
	sbi		P_X_M-1,PIN_X_M
	sbi		P_X_H-1,PIN_X_H
	sbi		P_Y_H-1,PIN_Y_H
	sbi		P_Y_M-1,PIN_Y_M
	sbi		P_Y_V-1,PIN_Y_V
	sbi		P_Z_H-1,PIN_Z_H
	sbi		P_Z_M-1,PIN_Z_M
	sbi		P_Z_V-1,PIN_Z_V
;Pull-Ups an Messschieber-Eing�nge aktivieren
	;FX
	sbi		P_FXC,PIN_FXC
	sbi		P_FXD,PIN_FXD
	;FY
	sbi		P_FYC,PIN_FYC
	sbi		P_FYD,PIN_FYD
	;Z
	sbi		P_ZC,PIN_ZC
	sbi		P_ZD,PIN_ZD
	;DX
	sbi		P_DXC,PIN_DXC
	sbi		P_DXD,PIN_DXD
	;DZ
	sbi		P_DZC,PIN_DZC
	sbi		P_DZD,PIN_DZD

;UBRR f�r Display
	sbi		DDRB,3
	ldi		temp,HIGH(UBRR_Val)
	out		OCR1AH,temp
	ldi		temp,LOW(UBRR_Val)
	out		OCR1AL,temp
	ldi		temp,(1<<OCIE1A)
	out		TIMSK,temp	
	ldi		temp,(1<<WGM12)|(1<<CS10)
	out		TCCR1B,temp
	sei


	;Delay 64ms
	ldi		r19,250
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


/*	ldi		r19,250
	ldi		r18,250
	nop
	nop
	nop
	nop
	nop
	dec		r18
	brne	PC-6
	dec		r19
	brne	PC-9*/

	sbis	PORTB,3
	rjmp	PC-1
	
	cli

	clr		temp
	out		TIMSK,temp
	out		TCCR1B,temp
	out		OCR1AH,temp
	out		OCR1AL,temp

	;Delay 10ms
	ldi		r19,40
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










;USARTs initialisieren
	;8-Bit Charakter-Size
	ldi		temp,(1<<URSEL0)|(3<<UCSZ00)
	out		UCSR0C,temp
	out		UCSR1C,temp
	;BAUD-Rate
	ldi		temp,HIGH(UBRR_VAL)
	out		UBRR0H,temp
	out		UBRR1H,temp
	ldi		temp,LOW(UBRR_VAL)
	out		UBRR0L,temp
	out		UBRR1L,temp
	;USART0 <- Receive
	ldi		temp,(1<<RXEN0)
	out		UCSR0B,temp
	;USART1 <- Transmit
	ldi		temp,(1<<TXEN1)
	out		UCSR1B,temp
;Pin Change Interrupts
	ldi		temp,(1<<PCINT7)
	sts		PCMSK0,temp		;32-Bit Opcode
	ldi		temp,(1<<PCINT15)
	sts		PCMSK1,temp		;32-Bit Opcode
	clr		temp
	out		EEARH,temp
;Pin Abbruch Anzeige auf Ausgang
;	sbi		P_Ab-1,PIN_Ab
;Timer 1 starten
	ldi		temp,(2<<CS10)
	out		TCCR1B,temp
;Timer 3 initalisieren
	ldi		temp,HIGH(F_CPU/2048)				;T3_A=0.5s
	sts		OCR3AH,temp		;32-Bit Opcode
	ldi		temp,LOW(F_CPU/2048)
	sts		OCR3AL,temp		;32-Bit Opcode
	ldi		temp,HIGH(F_CPU/10240)				;T3_ICR=0.1s
	sts		OCR3BH,temp		;32-Bit Opcode
	ldi		temp,LOW(F_CPU/10240)
	sts		OCR3BL,temp		;32-Bit Opcode
;Interrupts zulassen
	sei

;Maschinenauswahl
	sbic	EECR,EEWE
	rjmp	PC-1
	ldi		temp,LOW(EEPROM_MW)
	out		EEARL,temp
	sbi		EECR,EERE
	in		temp,EEDR
	tst		temp
	brne	PC+2
	rjmp	Drehbank
	rjmp	Fraese


;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;Fraese
Show_MS_Fraese:
	ldi		temp,DC_A_Cli
	Send	temp
	Send	temp
	Send	temp
	Send	temp
	Send	temp
	Send	temp
	sbrs	R_DA,DA_Dis
	rjmp	S_F_Z_e
	sbrs	R_DA,DA_X_A
	rjmp	S_F_X_e
	lds		W_L,SRAM_C_X_L		;32-Bit Opcode
	lds		W_M,SRAM_C_X_M		;32-Bit Opcode
	lds		W_H,SRAM_C_X_H		;32-Bit Opcode
	rcall	FX_Offset
	rcall	Send_Data_X
S_F_X_e:
	sbrs	R_DA,DA_Y_A
	rjmp	S_F_Y_e
	lds		W_L,SRAM_C_Y_L		;32-Bit Opcode
	lds		W_M,SRAM_C_Y_M		;32-Bit Opcode
	lds		W_H,SRAM_C_Y_H		;32-Bit Opcode
	rcall	FY_Offset
	rcall	Send_Data_Y
S_F_Y_e:
.if(Enable_FZ)
	sbrs	R_DA,DA_Z_A
	rjmp	S_F_Z_e
	lds		W_L,SRAM_C_Z_L		;32-Bit Opcode
	lds		W_M,SRAM_C_Z_M		;32-Bit Opcode
	lds		W_H,SRAM_C_Z_H		;32-Bit Opcode
	rcall	FZ_Offset
	rcall	Send_Data_Z
.endif
S_F_Z_e:
	cbi		PORTC,SIG_DX
	cbi		PORTC,SIG_DZ
	.if(Enable_DZu)
	cbi		PORTC,SIG_Z
	.endif
	cbi		DDRC,SIG_DX
	cbi		DDRC,SIG_DZ
	.if(Enable_DZu)
	cbi		DDRC,SIG_Z
	.endif
	sbi		P_X_M,PIN_X_M
	sbi		P_X_H,PIN_X_H
	cbi		P_X_V,PIN_X_V
	sbi		P_Y_H,PIN_Y_H
	sbi		P_Y_M,PIN_Y_M
	cbi		P_Y_V,PIN_Y_V
	sbi		P_Z_H,PIN_Z_H
	sbi		P_Z_M,PIN_Z_M
	.if(Enable_FZ)
	cbi		P_Z_V,PIN_Z_V
	.else
	sbi		P_Z_V,PIN_Z_V
	.endif
	sei
	rjmp	Fraese_LOOP
Fraese:
	Prep_Reg
	.if(Enable_FZ)
	ldi		temp,(1<<INT1)|(1<<INT0)|(1<<INT2)
	.else
	ldi		temp,(1<<INT1)|(1<<INT0)
	.endif
	cli
	out		GICR,temp
	ldi		temp,(3<<ISC10)|(3<<ISC00)
	out		MCUCR,temp
	ldi		temp,(1<<ISC2)
	out		EMCUCR,temp
	.if(Enable_FZ)
	ldi		temp,(1<<SIG_FX)|(1<<SIG_FY)|(1<<SIG_Z)
	.else
	ldi		temp,(1<<SIG_FX)|(1<<SIG_FY)
	.endif
	mov		Ext_Int,temp
	cbi		PORTC,SIG_FX
	cbi		PORTC,SIG_FY
	cbi		PORTC,SIG_DX
	cbi		PORTC,SIG_DZ
	cbi		PORTC,SIG_Z
	cbi		DDRC,SIG_FX
	cbi		DDRC,SIG_FY
	cbi		DDRC,SIG_DX
	cbi		DDRC,SIG_DZ
	cbi		DDRC,SIG_Z
	sbi		P_X_V,PIN_X_V
	sbi		P_Y_V,PIN_Y_V
	sbi		P_Z_V,PIN_Z_V
	ldi		temp,(1<<DA_T3_F)
	mov		R_DA,temp
	Start_T3_Ani
	sei
Fraese_LOOP:
	sbis	PORTC,SIG_FX
	rjmp	PC+4
	rcall	Cal_FX
	sbrc	R_DA,DA_Dis
	rcall	Send_Data_X
	cbi		PORTC,SIG_FX

	sbis	PORTC,SIG_FY
	rjmp	PC+4
	rcall	Cal_FY
	sbrc	R_DA,DA_Dis
	rcall	Send_Data_Y
	cbi		PORTC,SIG_FY

.if(Enable_FZ)
	sbis	PORTC,SIG_Z
	rjmp	PC+4
	rcall	Cal_FZ
	sbrc	R_DA,DA_Dis
	rcall	Send_Data_Z
	cbi		PORTC,SIG_Z
.endif
	sbrc	R_DA,DA_Dis
	sbis	UCSR0A,RXC0
	rjmp	Fraese_LOOP
	rjmp	Eingabe_F
;	rjmp	Fraese_LOOP


;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;Drehbank


Show_MS_Drehbank:
	ldi		temp,DC_A_Cli
	Send	temp
	Send	temp
	Send	temp
	Send	temp
	Send	temp
	Send	temp
	sbrs	R_DA,DA_Dis
	rjmp	S_D_Z_e
	sbrs	R_DA,DA_X_A
	rjmp	S_D_X_e
	lds		W_L,SRAM_C_X_L		;32-Bit Opcode
	lds		W_M,SRAM_C_X_M		;32-Bit Opcode
	lds		W_H,SRAM_C_X_H		;32-Bit Opcode
	lsl		W_L			;Durchmesser rechnen
	rol		W_M
	rol		W_H
	rcall	DX_Offset
	rcall	Send_Data_X
S_D_X_e:
.if(Enable_DZu)
	sbrs	R_DA,DA_Y_A
	rjmp	S_D_Y_e
	lds		W_L,SRAM_C_Y_L		;32-Bit Opcode
	lds		W_M,SRAM_C_Y_M		;32-Bit Opcode
	lds		W_H,SRAM_C_Y_H		;32-Bit Opcode
	rcall	DZ_Offset
	rcall	Send_Data_Y
S_D_Y_e:
.endif
	sbrs	R_DA,DA_Z_A
	rjmp	S_D_Z_e
	lds		W_L,SRAM_C_Z_L		;32-Bit Opcode
	lds		W_M,SRAM_C_Z_M		;32-Bit Opcode
	lds		W_H,SRAM_C_Z_H		;32-Bit Opcode
	.if(Enable_DZu)
	rcall	DZu_Offset
	.else
	rcall	DZ_Offset
	.endif
	rcall	Send_Data_Z
S_D_Z_e:
	cbi		PORTC,SIG_FX
	cbi		PORTC,SIG_FY
	.if(Enable_FZ)
	cbi		PORTC,SIG_Z
	.endif
	cbi		DDRC,SIG_FX
	cbi		DDRC,SIG_FY
	.if(Enable_FZ)
	cbi		DDRC,SIG_Z
	.endif
	sbi		P_X_M,PIN_X_M
	sbi		P_X_H,PIN_X_H
	cbi		P_X_V,PIN_X_V
	sbi		P_Y_H,PIN_Y_H
	sbi		P_Y_M,PIN_Y_M
	.if(Enable_DZu)
	cbi		P_Y_V,PIN_Y_V
	.else
	sbi		P_Y_V,PIN_Y_V
	.endif
	sbi		P_Z_H,PIN_Z_H
	sbi		P_Z_M,PIN_Z_M
	cbi		P_Z_V,PIN_Z_V

	rjmp	Drehbank_LOOP
Drehbank:
	Prep_Reg
	.if(Enable_DZu)
	ldi		temp,(1<<PCIE0)|(1<<PCIE1)|(1<<INT2)
	.else
	ldi		temp,(1<<PCIE0)|(1<<PCIE1)
	.endif
	cli
	out		GICR,temp
	ldi		temp,(1<<ISC2)
	out		EMCUCR,temp
	.if(Enable_DZu)
	ldi		temp,(1<<SIG_DX)|(1<<SIG_DZ)|(1<<SIG_Z)
	.else
	ldi		temp,(1<<SIG_DX)|(1<<SIG_DZ)
	.endif
	mov		Ext_Int,temp
	cbi		PORTC,SIG_FX
	cbi		PORTC,SIG_FY
	cbi		PORTC,SIG_DX
	cbi		PORTC,SIG_DZ
	cbi		PORTC,SIG_Z
	cbi		DDRC,SIG_FX
	cbi		DDRC,SIG_FY
	cbi		DDRC,SIG_DX
	cbi		DDRC,SIG_DZ
	cbi		DDRC,SIG_Z
	sbi		P_X_V,PIN_X_V
	sbi		P_Y_V,PIN_Y_V
	sbi		P_Z_V,PIN_Z_V
	clr		R_DA
	Start_T3_Ani
	sei
Drehbank_LOOP:
	sbis	PORTC,SIG_DX
	rjmp	PC+4
	rcall	Cal_DX
	sbrc	R_DA,DA_Dis
	rcall	Send_Data_X
	cbi		PORTC,SIG_DX

	sbis	PORTC,SIG_DZ
	rjmp	PC+4
	rcall	Cal_DZ
	sbrc	R_DA,DA_Dis
	.if(Enable_DZu)
	rcall	Send_Data_Y
	.else
	rcall	Send_Data_Z
	.endif
	cbi		PORTC,SIG_DZ

.if(Enable_DZu)
	sbis	PORTC,SIG_Z
	rjmp	PC+4
	rcall	Cal_DZu
	sbrc	R_DA,DA_Dis
	rcall	Send_Data_Z
	cbi		PORTC,SIG_Z
.endif
	sbrc	R_DA,DA_Dis
	sbis	UCSR0A,RXC0
	rjmp	Drehbank_LOOP
;	sbis	UCSR0A,RXC0
;	rjmp	Drehbank_LOOP
	rjmp	Eingabe_D
;	rjmp	Drehbank_LOOP





;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;Interrupts


T1_COMP_A:
	sbis	PORTB,3
	rjmp	PC+4
	nop
	cbi		PORTB,3
	reti
	sbi		PORTB,3
	reti
T3_Ani:
	Reset_T3 0
	lds		temp,SRAM_T3
	cpi		temp,8
	brlo	PC+2
	rjmp	T3_e	
	mov		R_Ein,temp
	sei
	ldi		temp,DC_Z_Alt_N_P_1
	Send	temp
	cli

	ldi		ZL,LOW(2*Ani_Tab_X)
	ldi		ZH,HIGH(2*Ani_Tab_X)
	add		ZL,R_Ein
	adc		ZH,R_Zero
	lpm		W2_L,Z+
	ori		W2_L,0xF0
	push	W2_L		;High
	lpm		W2_L,Z+
	swap	W2_L
	lpm		temp,Z+
	or		W2_L,temp
	push	W2_L		;Middle
	lpm		W2_L,Z+
	swap	W2_L
	lpm		temp,Z
	or		W2_L,temp
	push	W2_L		;Low
	sei

	cli
	sbrs	R_DA,DA_T3_F
	rjmp	PC+4
	ldi		ZL,LOW(2*Ani_Tab_Y_F)
	ldi		ZH,HIGH(2*Ani_Tab_Y_F)
	rjmp	PC+3
	ldi		ZL,LOW(2*Ani_Tab_Y_D)
	ldi		ZH,HIGH(2*Ani_Tab_Y_D)
	add		ZL,R_Ein
	adc		ZH,R_Zero
	lpm		W2_L,Z+
	ori		W2_L,0xF0
	push	W2_L		;High
	lpm		W2_L,Z+
	swap	W2_L
	lpm		temp,Z+
	or		W2_L,temp
	push	W2_L		;Middle
	lpm		W2_L,Z+
	swap	W2_L
	lpm		temp,Z
	or		W2_L,temp
	push	W2_L		;Low
	sei

	cli
	ldi		ZL,LOW(2*Ani_Tab_Z)
	ldi		ZH,HIGH(2*Ani_Tab_Z)
	add		ZL,R_Ein
	adc		ZH,R_Zero
	lpm		W2_L,Z+
	ori		W2_L,0xF0
	push	W2_L		;High
	lpm		W2_L,Z+
	swap	W2_L
	lpm		temp,Z+
	or		W2_L,temp
	push	W2_L		;Middle
	lpm		W2_L,Z+
	swap	W2_L
	lpm		temp,Z
	or		W2_L,temp
	sei
	pop		W2_M
	pop		W2_H
	E_Ausgabe
	ldi		temp,DC_Y_Alt_N_P_1
	Send	temp
	pop		W2_L
	pop		W2_M
	pop		W2_H
	E_Ausgabe
	ldi		temp,DC_X_Alt_N_P_1
	Send	temp
	pop		W2_L
	pop		W2_M
	pop		W2_H
	E_Ausgabe
	cli
	mov		temp,R_Ein
	cpi		temp,7
	breq	PC+5
	inc		temp
	sts		SRAM_T3,temp		;32-Bit Opcode
	;	
	reti
	ldi		temp,-11
	sts		SRAM_T3,temp
	reti
T3_e:
	inc		temp
	breq	PC+10
	sts		SRAM_T3,temp		;32-Bit Opcode
	;
	cpi		temp,255
	brne	PC+5
	ldi		temp,DC_A_Cli
	Send 	temp
	;
	;
	reti
	sei
	Stop_T3
	ldi		temp,(1<<DA_Dis)
	or		R_DA,temp
	cbi		P_X_V,PIN_X_V
	sbrc	R_DA,DA_T3_F
	rjmp	PC+3+Enable_DZu
	.if(Enable_DZu)
	cbi		P_Y_V,PIN_Y_V
	.endif
	cbi		P_Z_V,PIN_Z_V
	ret
	cbi		P_Y_V,PIN_Y_V
	.if(Enable_FZ)
	cbi		P_Z_V,PIN_Z_V
	.endif
	ret
Fraese_X:
	sbrc	Ext_Int,SIG_FX
	rjmp	FX_H
	sbic	P_FXC-2,PIN_FXC
	reti

	Datenerkennung P_FXD,PIN_FXD

	ror		X_H
	ror		X_M
	ror		X_L
	inc		Count_X
	breq	PC+2
	reti
	push	temp
	in		temp,MCUCR
	ori		temp,(1<<ISC00)
	out		MCUCR,temp
	ldi		temp,(1<<SIG_FX)
	or		Ext_Int,temp
	in		R_Zero,TCNT1L
	in		temp,TCNT1H
	sub		R_Zero,T_X_L
	sbc		temp,T_X_H
	cpi		temp,2
	brsh	PC+3
	cbi		DDRC,SIG_FX
	sbi		PORTC,SIG_FX
	clr		R_Zero
	pop		temp
	reti
FX_H:
	sbis	P_FXC-2,PIN_FXC
	reti
	push	temp
	in		R_Zero,TCNT1L
	in		temp,TCNT1H
	sub		R_Zero,T_X_L
	sbc		temp,T_X_H
	cpi		temp,20
	brsh	PC+4
	clr		R_Zero
	pop		temp
	reti
	in		T_X_L,TCNT1L
	in		T_X_H,TCNT1H
	ldi		temp,232
	mov		Count_X,temp
	cbi		PORTC,SIG_FX
	sbi		DDRC,SIG_FX
	in		temp,MCUCR
	andi	temp,~(1<<ISC00)
	out		MCUCR,temp
	ldi		temp,~(1<<SIG_FX)
	and		Ext_Int,temp
	clr		R_Zero
	pop		temp
	clr		X_L
	clr		X_M
	clr		X_H
	reti
Fraese_Y:
	sbrc	Ext_Int,SIG_FY
	rjmp	FY_H
	sbic	P_FYC-2,PIN_FYC
	reti

	Datenerkennung P_FYD,PIN_FYD

	ror		Y_H
	ror		Y_M
	ror		Y_L
	inc		Count_Y
	breq	PC+2
	reti
	push	temp
	in		temp,MCUCR
	ori		temp,(1<<ISC10)
	out		MCUCR,temp
	ldi		temp,(1<<SIG_FY)
	or		Ext_Int,temp
	in		R_Zero,TCNT1L
	in		temp,TCNT1H
	sub		R_Zero,T_Y_L
	sbc		temp,T_Y_H
	cpi		temp,2
	brsh	PC+3
	cbi		DDRC,SIG_FY
	sbi		PORTC,SIG_FY
	clr		R_Zero
	pop		temp
	reti
FY_H:
	sbis	P_FYC-2,PIN_FYC
	reti
	push	temp
	in		R_Zero,TCNT1L
	in		temp,TCNT1H
	sub		R_Zero,T_Y_L
	sbc		temp,T_Y_H
	cpi		temp,20
	brsh	PC+4
	clr		R_Zero
	pop		temp
	reti
	in		T_Y_L,TCNT1L
	in		T_Y_H,TCNT1H
	ldi		temp,232
	mov		Count_Y,temp
	cbi		PORTC,SIG_FY
	sbi		DDRC,SIG_FY
	in		temp,MCUCR
	andi	temp,~(1<<ISC10)
	out		MCUCR,temp
	ldi		temp,~(1<<SIG_FY)
	and		Ext_Int,temp
	clr		R_Zero
	pop		temp
	clr		Y_L
	clr		Y_M
	clr		Y_H
	reti
.if(Enable_FZ||Enable_DZu)
FD_Z:
	sbrc	Ext_Int,SIG_Z
	rjmp	FDZ_H
	sbic	P_ZC-2,PIN_ZC
	reti

	Datenerkennung P_ZD,PIN_ZD

	ror		Z_H
	ror		Z_M
	ror		Z_L
	inc		Count_Z
	breq	PC+2
	reti
	push	temp
	ldi		temp,(1<<ISC2)
	out		EMCUCR,temp
	ldi		temp,(1<<SIG_Z)
	or		Ext_Int,temp
	in		R_Zero,TCNT1L
	in		temp,TCNT1H
	sub		R_Zero,T_Z_L
	sbc		temp,T_Z_H
	cpi		temp,2
	brsh	PC+3
	cbi		DDRC,SIG_Z
	sbi		PORTC,SIG_Z
	clr		R_Zero
	pop		temp
	reti
FDZ_H:
	sbis	P_ZC-2,PIN_ZC
	reti
	push	temp
	in		R_Zero,TCNT1L
	in		temp,TCNT1H
	sub		R_Zero,T_Z_L
	sbc		temp,T_Z_H
	cpi		temp,20
	brsh	PC+4
	clr		R_Zero
	pop		temp
	reti
	in		T_Z_L,TCNT1L
	in		T_Z_H,TCNT1H
	ldi		temp,232
	mov		Count_Z,temp
	cbi		PORTC,SIG_Z
	sbi		DDRC,SIG_Z
	clr		temp
	out		EMCUCR,temp
	ldi		temp,~(1<<SIG_Z)
	and		Ext_Int,temp
	clr		R_Zero
	pop		temp
	clr		Z_L
	clr		Z_M
	clr		Z_H
	reti
.endif
Dreh_X:
	sbrc	Ext_Int,SIG_DX
	rjmp	DX_H
	sbic	P_DXC-2,PIN_DXC
	reti

	Datenerkennung P_DXD,PIN_DXD

	ror		X_H
	ror		X_M
	ror		X_L
	inc		Count_X
	breq	PC+2
	reti
	push	temp
	ldi		temp,(1<<SIG_DX)
	or		Ext_Int,temp
	in		R_Zero,TCNT1L
	in		temp,TCNT1H
	sub		R_Zero,T_X_L
	sbc		temp,T_X_H
	cpi		temp,3
	brsh	PC+3
	cbi		DDRC,SIG_DX
	sbi		PORTC,SIG_DX
	clr		R_Zero
	pop		temp
	reti
DX_H:
	sbis	P_DXC-2,PIN_DXC
	reti
	push	temp
	in		R_Zero,TCNT1L
	in		temp,TCNT1H
	sub		R_Zero,T_X_L
	sbc		temp,T_X_H
	cpi		temp,20
	brsh	PC+4
	clr		R_Zero
	pop		temp
	reti
	in		T_X_L,TCNT1L
	in		T_X_H,TCNT1H
	ldi		temp,232
	mov		Count_X,temp
	cbi		PORTC,SIG_DX
	sbi		DDRC,SIG_DX
	ldi		temp,~(1<<SIG_DX)
	and		Ext_Int,temp
	clr		R_Zero
	pop		temp
	clr		X_L
	clr		X_M
	clr		X_H
	reti
Dreh_Z:
	sbrc	Ext_Int,SIG_DZ
	rjmp	DZ_H
	sbic	P_DZC-2,PIN_DZC
	reti

	Datenerkennung P_DZD,PIN_DZD

	.if(Enable_DZu)
	ror		Y_H
	ror		Y_M
	ror		Y_L
	inc		Count_Y
	.else
	ror		Z_H
	ror		Z_M
	ror		Z_L
	inc		Count_Z
	.endif
	breq	PC+2
	reti
	push	temp
	ldi		temp,(1<<SIG_DZ)
	or		Ext_Int,temp
	in		R_Zero,TCNT1L
	in		temp,TCNT1H
	.if(Enable_DZu)
	sub		R_Zero,T_Y_L
	sbc		temp,T_Y_H
	.else
	sub		R_Zero,T_Z_L
	sbc		temp,T_Z_H
	.endif
	cpi		temp,3
	brsh	PC+3
	cbi		DDRC,SIG_DZ
	sbi		PORTC,SIG_DZ
	clr		R_Zero
	pop		temp
	reti
DZ_H:
	sbis	P_DZC-2,PIN_DZC
	reti
	push	temp
	in		R_Zero,TCNT1L
	in		temp,TCNT1H
	.if(Enable_DZu)
	sub		R_Zero,T_Y_L
	sbc		temp,T_Y_H
	cpi		temp,20
	brsh	PC+4
	clr		R_Zero
	pop		temp
	reti
	in		T_Y_L,TCNT1L
	in		T_Y_H,TCNT1H
	ldi		temp,232
	mov		Count_Y,temp
	cbi		PORTC,SIG_DZ
	sbi		DDRC,SIG_DZ
	ldi		temp,~(1<<SIG_DZ)
	and		Ext_Int,temp
	clr		R_Zero
	pop		temp
	clr		Y_L
	clr		Y_M
	clr		Y_H
	.else
	sub		R_Zero,T_Z_L
	sbc		temp,T_Z_H
	cpi		temp,20
	brsh	PC+4
	clr		R_Zero
	pop		temp
	reti
	in		T_Z_L,TCNT1L
	in		T_Z_H,TCNT1H
	ldi		temp,232
	mov		Count_Z,temp
	cbi		PORTC,SIG_DZ
	sbi		DDRC,SIG_DZ
	ldi		temp,~(1<<SIG_DZ)
	and		Ext_Int,temp
	clr		R_Zero
	pop		temp
	clr		Z_L
	clr		Z_M
	clr		Z_H
	.endif
	reti

;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;Unterprogramme

T3_OVF:
	push	temp
	lds		temp,SRAM_T3		;32-Bit Opcode
	inc		temp
	sts		SRAM_T3,temp		;32-Bit Opcode
	ldi		temp,DC_A_Clk
	Send	temp
	pop		temp
	ret

Send_Data_X:
	ldi		temp,DC_X_S_E_P_1
	Send	temp
	Send_Data
	ret
Send_Data_Y:
	ldi		temp,DC_Y_S_E_P_1
	Send	temp
	Send_Data
	ret
Send_Data_Z:
	ldi		temp,DC_Z_S_E_P_1
	Send	temp
	Send_Data
	ret
Cal_FX:
	cli
	Convert_X
	sei
	mov		W_L,X_L
	mov		W_M,X_M
	mov		W_H,X_H
	ldi		temp,(1<<DA_X_A)
	or		R_DA,temp
	sts		SRAM_C_X_L,X_L		;32-Bit Opcode
	sts		SRAM_C_X_M,X_M		;32-Bit Opcode
	sts		SRAM_C_X_H,X_H		;32-Bit Opcode
FX_Offset:
	;Offset rechnen, X-Pointer bleibt unver�ndert
	sbic	EECR,EEWE
	rjmp	PC-1
	ldi		temp,LOW(EEPROM_FX_L)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_L,EEDR
	ldi		temp,LOW(EEPROM_FX_L+1)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_M,EEDR
	ldi		temp,LOW(EEPROM_FX_L+2)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_H,EEDR
	add		W_L,W3_L
	adc		W_M,W3_M
	adc		W_H,W3_H
	ret
Cal_FY:
	cli
	Convert_Y
	;Scale umdrehen
	com		Y_H
	com		Y_M
	com		Y_L
	sei
	mov		W_L,Y_L
	mov		W_M,Y_M
	mov		W_H,Y_H
	ldi		temp,(1<<DA_Y_A)
	or		R_DA,temp
	sts		SRAM_C_Y_L,Y_L		;32-Bit Opcode
	sts		SRAM_C_Y_M,Y_M		;32-Bit Opcode
	sts		SRAM_C_Y_H,Y_H		;32-Bit Opcode
FY_Offset:
	;Offset rechnen, Y-Pointer bleibt unver�ndert
	sbic	EECR,EEWE
	rjmp	PC-1
	ldi		temp,LOW(EEPROM_FY_L)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_L,EEDR
	ldi		temp,LOW(EEPROM_FY_L+1)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_M,EEDR
	ldi		temp,LOW(EEPROM_FY_L+2)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_H,EEDR
	add		W_L,W3_L
	adc		W_M,W3_M
	adc		W_H,W3_H
	ret
.if(Enable_FZ)
Cal_FZ:
	cli
	Convert_Z
	sei
	mov		W_L,Z_L
	mov		W_M,Z_M
	mov		W_H,Z_H
	ldi		temp,(1<<DA_Z_A)
	or		R_DA,temp
	sts		SRAM_C_Z_L,Z_L		;32-Bit Opcode
	sts		SRAM_C_Z_M,Z_M		;32-Bit Opcode
	sts		SRAM_C_Z_H,Z_H		;32-Bit Opcode
FZ_Offset:
	;Offset rechnen, Z-Pointer bleibt unver�ndert
	sbic	EECR,EEWE
	rjmp	PC-1
	ldi		temp,LOW(EEPROM_FZ_L)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_L,EEDR
	ldi		temp,LOW(EEPROM_FZ_L+1)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_M,EEDR
	ldi		temp,LOW(EEPROM_FZ_L+2)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_H,EEDR
	add		W_L,W3_L
	adc		W_M,W3_M
	adc		W_H,W3_H
	ret
.endif
Cal_DX:
	cli
	;Durchmesser rechnen
	lsl		X_L
	rol		X_M
	rol		X_H
	Convert_X
	sei
	mov		W_L,X_L
	mov		W_M,X_M
	mov		W_H,X_H
	ldi		temp,(1<<DA_X_A)
	or		R_DA,temp
	sts		SRAM_C_X_L,X_L		;32-Bit Opcode
	sts		SRAM_C_X_M,X_M		;32-Bit Opcode
	sts		SRAM_C_X_H,X_H		;32-Bit Opcode
DX_Offset:
	;Offset rechnen, X-Pointer bleibt unver�ndert
	sbic	EECR,EEWE
	rjmp	PC-1
	ldi		temp,LOW(EEPROM_DX_L)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_L,EEDR
	ldi		temp,LOW(EEPROM_DX_L+1)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_M,EEDR
	ldi		temp,LOW(EEPROM_DX_L+2)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_H,EEDR
	add		W_L,W3_L
	adc		W_M,W3_M
	adc		W_H,W3_H
	ret
Cal_DZ:
.if(Enable_DZu)
	cli
	Convert_Y
	sei
	mov		W_L,Y_L
	mov		W_M,Y_M
	mov		W_H,Y_H
	ldi		temp,(1<<DA_Y_A)
	or		R_DA,temp
	sts		SRAM_C_Y_L,Y_L		;32-Bit Opcode
	sts		SRAM_C_Y_M,Y_M		;32-Bit Opcode
	sts		SRAM_C_Y_H,Y_H		;32-Bit Opcode
.else
	cli
	Convert_Z
	;Scale umdrehen
	com		Z_H
	com		Z_M
	com		Z_L

	sei
	mov		W_L,Z_L
	mov		W_M,Z_M
	mov		W_H,Z_H
	ldi		temp,(1<<DA_Z_A)
	or		R_DA,temp
	sts		SRAM_C_Z_L,Z_L		;32-Bit Opcode
	sts		SRAM_C_Z_M,Z_M		;32-Bit Opcode
	sts		SRAM_C_Z_H,Z_H		;32-Bit Opcode
.endif
DZ_Offset:
	;Offset rechnen, Y/Z-Pointer bleibt unver�ndert
	sbic	EECR,EEWE
	rjmp	PC-1
	ldi		temp,LOW(EEPROM_DZ_L)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_L,EEDR
	ldi		temp,LOW(EEPROM_DZ_L+1)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_M,EEDR
	ldi		temp,LOW(EEPROM_DZ_L+2)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_H,EEDR
	add		W_L,W3_L
	adc		W_M,W3_M
	adc		W_H,W3_H
	ret
.if(Enable_DZu)
Cal_DZu:
	cli
	Convert_Z
	;Scale umdrehen
	com		Z_H
	com		Z_M
	com		Z_L
	sei
	mov		W_L,Z_L
	mov		W_M,Z_M
	mov		W_H,Z_H
	ldi		temp,(1<<DA_Z_A)
	or		R_DA,temp
	sts		SRAM_C_Z_L,Z_L		;32-Bit Opcode
	sts		SRAM_C_Z_M,Z_M		;32-Bit Opcode
	sts		SRAM_C_Z_H,Z_H		;32-Bit Opcode
DZu_Offset:
	;Offset rechnen, Z-Pointer bleibt unver�ndert
	sbic	EECR,EEWE
	rjmp	PC-1
	ldi		temp,LOW(EEPROM_DZu_L)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_L,EEDR
	ldi		temp,LOW(EEPROM_DZu_L+1)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_M,EEDR
	ldi		temp,LOW(EEPROM_DZu_L+2)
	out		EEARL,temp
	sbi		EECR,EERE
	in		W3_H,EEDR
	add		W_L,W3_L
	adc		W_M,W3_M
	adc		W_H,W3_H
	ret
.endif
Send_Data_X_S:
	ldi		temp,DC_Y_S_E_P_0
	Send	temp
	Send_Data
	ret
Send_Data_Y_S:
	ldi		temp,DC_X_S_E_P_0
	Send	temp
	Send_Data
	ret
Send_Data_Z_S:
	ldi		temp,DC_Y_S_E_P_0
	Send	temp
	Send_Data
	ret
E_Prep_Send:
	sbrc	R_Ein,E_D+1
	rjmp	PC+7
	sbrc	R_Ein,E_D
	rjmp	PC+3
	ldi		temp,DC_X_S_N_P_1
	ret
	ldi		temp,DC_Y_S_N_P_1
	ret
	ldi		temp,DC_Z_S_N_P_1
	ret
E_Update_DP:
	sbrc	R_Ein,E_D+1
	rjmp	PC+23
	sbrc	R_Ein,E_D
	rjmp	PC+11
	sbi		P_X_V,PIN_X_V
	sbrs	R_Ein,E_DP_V
	cbi		P_X_V,PIN_X_V
	sbi		P_X_M,PIN_X_M
	sbrs	R_Ein,E_DP_M
	cbi		P_X_M,PIN_X_M
	sbi		P_X_H,PIN_X_H
	sbrs	R_Ein,E_DP_H
	cbi		P_X_H,PIN_X_H
	ret
	sbi		P_Y_V,PIN_Y_V
	sbrs	R_Ein,E_DP_V
	cbi		P_Y_V,PIN_Y_V
	sbi		P_Y_M,PIN_Y_M
	sbrs	R_Ein,E_DP_M
	cbi		P_Y_M,PIN_Y_M
	sbi		P_Y_H,PIN_Y_H
	sbrs	R_Ein,E_DP_H
	cbi		P_Y_H,PIN_Y_H
	ret
	sbi		P_Z_V,PIN_Z_V
	sbrs	R_Ein,E_DP_V
	cbi		P_Z_V,PIN_Z_V
	sbi		P_Z_M,PIN_Z_M
	sbrs	R_Ein,E_DP_M
	cbi		P_Z_M,PIN_Z_M
	sbi		P_Z_H,PIN_Z_H
	sbrs	R_Ein,E_DP_H
	cbi		P_Z_H,PIN_Z_H
	ret
E_Get_Offset:
.if(Enable_FZ||Enable_DZu)
	sbrs	R_Ein,D_MA+1
	rjmp	PC+3
	.if(Enable_FZ)
	rcall	FZ_Offset
	.else
	rcall	DZu_Offset
	.endif
	ret
.endif
	sbrc	R_Ein,E_MA
	rjmp	PC+7
	sbrc	R_Ein,E_MA+2
	rjmp	PC+3
	rcall	FX_Offset
	ret
	rcall	DX_Offset
	ret
	sbrc	R_Ein,E_MA+2
	rjmp	PC+3
	rcall	FY_Offset
	ret
	rcall	DZ_Offset
	ret

;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;Eingabe

Eingabe_F:
	in		temp,UDR0
	cli
	cpi		temp,Ein_Abbr
	breq	PC+(12+Enable_FZ*3)
	cpi		temp,Ein_0
	brne	PC+2
	rjmp	EF_XY0
	cpi		temp,Ein_X
	brne	PC+2
	rjmp	EF_X
	cpi		temp,Ein_Y
	brne	PC+2
	rjmp	EF_Y
	.if(Enable_FZ)
	cpi		temp,Ein_Z
	brne	PC+2
	rjmp	EF_Z
	.endif
	sei
	rjmp	Fraese_LOOP
	sei
	sbic	EECR,EEWE
	rjmp	PC-1
	ldi		temp,LOW(EEPROM_MW)
	out		EEARL,temp
	clr		temp
	out		EEDR,temp
	cbi		EECR,EEWE
	cli
	sbi		EECR,EEMWE
	sbi		EECR,EEWE
	sei
	rjmp	Drehbank
EF_XY0:
	Start_T3
	sei
	ser		W2_H
	ldi		W2_M,0xF0
	clr		W2_L
	ldi		temp,DC_A_Cli
	Send	temp
	Send	temp
	Send	temp
	Send	temp
	Send	temp
	Send	temp
	cbi		P_X_V,PIN_X_V
	cbi		P_Y_V,PIN_Y_V
	sbi		P_Z_V,PIN_Z_V
	ldi		temp,DC_X_S_N_B_1
	Send	temp
	E_Ausgabe
	ldi		temp,DC_Y_S_N_B_1
	Send	temp
	E_Ausgabe
EF_XY0_L:
	sei
	sbis	PORTC,SIG_FX
	rjmp	PC+4
	rcall	Cal_FX
	nop
	cbi		PORTC,SIG_FX
	sbis	PORTC,SIG_FY
	rjmp	PC+4
	rcall	Cal_FY
	nop
	cbi		PORTC,SIG_FY
.if(Enable_FZ)
	sbis	PORTC,SIG_Z
	rjmp	PC+4
	rcall	Cal_FZ
	nop
	cbi		PORTC,SIG_Z
.endif
	lds		temp,ETIFR			;32-Bit Opcode
	;
	sbrs	temp,OCF3A
	rjmp	PC+5
	ldi		temp,(1<<OCF3A)
	sts		ETIFR,temp			;32-Bit Opcode
	;
	rcall	T3_OVF
	lds		temp,SRAM_T3		;32-Bit Opcode
	;
	cpi		temp,40
	brlo	PC+4
	cpi		temp,40
	brlo	PC+2
	rjmp	EF_Return
	sbis	UCSR0A,RXC0
	rjmp	EF_XY0_L+1
	in		temp,UDR0
	cli
	cpi		temp,Ein_Abbr
	brne	PC+2
	rjmp	EF_Return
	cpi		temp,Ein_0
	brne	EF_XY0_L
	sei
;EEPROM Write X
	lds		W3_L,SRAM_C_X_L
	lds		W3_M,SRAM_C_X_M
	lds		W3_H,SRAM_C_X_H
	clr		W_L
	clr		W_M
	clr		W_H
	cli
	sub		W_L,W3_L
	sbc		W_M,W3_M
	sbc		W_H,W3_H
	sei
	ldi		temp,EEPROM_FX_L
	sbic	EECR,EEWE
	rjmp	PC-1
	out		EEARL,temp
	out		EEDR,W_L
	cbi		EECR,EEWE
	cli
	sbi		EECR,EEMWE
	sbi		EECR,EEWE
	sei
	sbic	EECR,EEWE
	rjmp	PC-1
	ldi		temp,EEPROM_FX_L+1
	out		EEARL,temp
	out		EEDR,W_M
	cbi		EECR,EEWE
	cli
	sbi		EECR,EEMWE
	sbi		EECR,EEWE
	sei
	sbic	EECR,EEWE
	rjmp	PC-1
	ldi		temp,EEPROM_FX_L+2
	out		EEARL,temp
	out		EEDR,W_H
	cbi		EECR,EEWE
	cli
	sbi		EECR,EEMWE
	sbi		EECR,EEWE
	sei
;EEPROM Write Y
	lds		W3_L,SRAM_C_Y_L
	lds		W3_M,SRAM_C_Y_M
	lds		W3_H,SRAM_C_Y_H
	clr		W_L
	clr		W_M
	clr		W_H
	cli
	sub		W_L,W3_L
	sbc		W_M,W3_M
	sbc		W_H,W3_H
	sei
	ldi		temp,EEPROM_FY_L
	sbic	EECR,EEWE
	rjmp	PC-1
	out		EEARL,temp
	out		EEDR,W_L
	cbi		EECR,EEWE
	cli
	sbi		EECR,EEMWE
	sbi		EECR,EEWE
	sei
	sbic	EECR,EEWE
	rjmp	PC-1
	ldi		temp,EEPROM_FY_L+1
	out		EEARL,temp
	out		EEDR,W_M
	cbi		EECR,EEWE
	cli
	sbi		EECR,EEMWE
	sbi		EECR,EEWE
	sei
	sbic	EECR,EEWE
	rjmp	PC-1
	ldi		temp,EEPROM_FY_L+2
	out		EEARL,temp
	out		EEARL,W2_H
	out		EEDR,W_H
	cbi		EECR,EEWE
	cli
	sbi		EECR,EEMWE
	sbi		EECR,EEWE
EF_Return:
	sei
	clr		W2_H
	clr		W2_M
	clr		W2_L
	Stop_T3
	rjmp	Show_MS_Fraese
EF_X:
	ldi		temp,0b01100000
	mov		R_Ein,temp
	rjmp	E_Univ
EF_Y:
	ldi		temp,0b01100101
	mov		R_Ein,temp
	rjmp	E_Univ
.if(Enable_FZ)
EF_Z:
	ldi		temp,0b01101010
	mov		R_Ein,temp
	rjmp	E_Univ
.endif
Eingabe_D:
	in		temp,UDR0
	cli
	cpi		temp,Ein_Abbr
	breq	PC+(9+Enable_DZu*3)
	cpi		temp,Ein_X
	brne	PC+2
	rjmp	ED_X
	.if(Enable_DZu)
	cpi		temp,Ein_Y
	brne	PC+2
	rjmp	ED_Z
	cpi		temp,Ein_Z
	brne	PC+2
	rjmp	ED_Zu
	.else
	cpi		temp,Ein_Z
	brne	PC+2
	rjmp	ED_Z
	.endif
	sei
	rjmp	Drehbank_LOOP
	sei
	sbic	EECR,EEWE
	rjmp	PC-1
	ldi		temp,LOW(EEPROM_MW)
	out		EEARL,temp
	ldi		temp,1
	out		EEDR,temp
	cbi		EECR,EEWE
	cli
	sbi		EECR,EEMWE
	sbi		EECR,EEWE
	sei
	rjmp	Fraese
ED_X:
	ldi		temp,0b01110000
	mov		R_Ein,temp
	rjmp	E_Univ
.if(Enable_DZu)
ED_Z:
	ldi		temp,0b01110101
	mov		R_Ein,temp
	rjmp	E_Univ
ED_Zu:
	ldi		temp,0b01111010
	mov		R_Ein,temp
	rjmp	E_Univ
.else
ED_Z:
	ldi		temp,0b01110110
	mov		R_Ein,temp
	rjmp	E_Univ
.endif

E_L:
	sbrc	R_Ein,E_MA+2
	rjmp	E_L_Dreh
	sbrc	R_Ein,E_D+1
	rjmp	PC+17
	sbrc	R_Ein,E_D
	rjmp	PC+8

	sbis	PORTC,SIG_FX
	rjmp	PC+4
	rcall	Cal_FX
	rcall	Send_Data_X_S
	cbi		PORTC,SIG_FX
	rcall	E_Sub_L
	rjmp	PC-6

	sbis	PORTC,SIG_FY
	rjmp	PC+4
	rcall	Cal_FY
	rcall	Send_Data_Y_S
	cbi		PORTC,SIG_FY
	rcall	E_Sub_L
	rjmp	PC-6

.if(Enable_FZ)
	sbrc	R_Ein,E_D
	rjmp	PC+8
	sbis	PORTC,SIG_Z
	rjmp	PC+4
	rcall	Cal_FZ
	rcall	Send_Data_Z_S
	cbi		PORTC,SIG_Z
	rcall	E_Sub_L
	rjmp	PC-6
	rcall	E_Sub_L
	rjmp	PC-1
.else
	rcall	E_Sub_L
	rjmp	PC-1
.endif
E_L_Dreh:
	sbrc	R_Ein,E_D+1
	rjmp	PC+12+5*Enable_DZu
	sbrc	R_Ein,E_D
	rjmp	PC+8

	sbis	PORTC,SIG_DX
	rjmp	PC+4
	rcall	Cal_DX
	rcall	Send_Data_X_S
	cbi		PORTC,SIG_DX
	rcall	E_Sub_L
	rjmp	PC-6

	.if(Enable_DZu)
	sbis	PORTC,SIG_DZ
	rjmp	PC+4
	rcall	Cal_DZ
	rcall	Send_Data_Y_S
	cbi		PORTC,SIG_DZ
	rcall	E_Sub_L
	rjmp	PC-6

	sbrc	R_Ein,E_D
	rjmp	PC+8

	sbis	PORTC,SIG_Z
	rjmp	PC+4
	rcall	Cal_DZu
	rcall	Send_Data_Z_S
	cbi		PORTC,SIG_Z
	rcall	E_Sub_L
	rjmp	PC-6

	rcall	E_Sub_L
	rjmp	PC-1

	sbrc	R_Ein,E_D

	.else
	rcall	E_Sub_L
	rjmp	PC-1

	sbrc	R_Ein,E_D
	rjmp	PC-3

	sbis	PORTC,SIG_DZ
	rjmp	PC+4
	rcall	Cal_DZ
	rcall	Send_Data_Z_S
	cbi		PORTC,SIG_DZ
	rcall	E_Sub_L
	rjmp	PC-6
	.endif
E_Sub_L:
	lds		temp,ETIFR			;32-Bit Opcode
	;
	sbrs	temp,OCF3A
	rjmp	PC+5
	ldi		temp,(1<<OCF3A)
	sts		ETIFR,temp			;32-Bit Opcode
	;
	rcall	T3_OVF
	lds		temp,SRAM_T3		;32-Bit Opcode
	;
	cli
	cpi		temp,40
	brlo	PC+2
	rjmp	E_Return-4
	sei
	sbis	UCSR0A,RXC0
	ret
	sts		SRAM_T3,R_Zero		;32-Bit Opcode
	;
	in		temp,UDR0
	cli
	cpi		temp,Ein_Abbr
	breq	PC+5
	pop		R_Zero
	pop		R_Zero
	clr		R_Zero
	ret
	pop		temp
	pop		temp
	pop		temp
	pop		temp
E_Return:
	sei
	clr		W2_H
	clr		W2_M
	clr		W2_L
	Stop_T3

	sbrc	R_Ein,E_MA+2
	rjmp	Show_MS_Drehbank
	sbrs	R_Ein,E_D
	rjmp	Show_MS_Fraese
	sbrs	R_Ein,E_D+1
	rjmp	Show_MS_Fraese
	ret
E_Univ:
	clr		temp
	sbrc	R_Ein,E_D+1
	rjmp	PC+9
	sbrc	R_Ein,E_D
	rjmp	PC+4
	sbrc	R_DA,DA_X_A
	inc		temp
	rjmp	PC+8
	sbrc	R_DA,DA_Y_A
	inc		temp
	rjmp	PC+5
	sbrc	R_Ein,E_D
	rjmp	PC+3
	sbrc	R_DA,DA_Z_A
	inc		temp
	tst		temp
	brne	PC+2;----------------------------##########################################################################################
	rjmp	E_Return
	Start_T3
	sei
	ser		W2_H
	ldi		W2_M,0xF0
	clr		W2_L
;	mov		temp,R_Ein
;	andi	temp,(3<<E_D)|(1<<(E_MA+2))
;	cpi		temp,(3<<E_D)
;	brne	Std_E_Univ
;	ldi		temp,DC_Z_Cli
;	Send	temp
	

Std_E_Univ:
	ldi		temp,DC_A_Cli
	Send	temp
	Send	temp
	Send	temp
	Send	temp
	Send	temp
	Send	temp
	sbrc	R_Ein,E_D+1
	rjmp	PC+(26+(2*PC_Send)+(2*PC_E_Ausgabe))
	cbi		P_X_V,PIN_X_V
	cbi		P_Y_V,PIN_Y_V
	sbi		P_Z_V,PIN_Z_V
	sbrc	R_Ein,E_D
	rjmp	PC+(11+PC_Send+PC_E_Ausgabe)
	ldi		temp,DC_X_S_N_B_1
	Send	temp
	E_Ausgabe
	lds		W_L,SRAM_C_X_L		;32-Bit Opcode
	;
	lds		W_M,SRAM_C_X_M		;32-Bit Opcode
	;
	lds		W_H,SRAM_C_X_H		;32-Bit Opcode
	;
	rcall	E_Get_Offset
	rcall	Send_Data_X_S
	rjmp	E_1
	ldi		temp,DC_Y_S_N_B_1
	Send	temp
	E_Ausgabe
	lds		W_L,SRAM_C_Y_L		;32-Bit Opcode
	;
	lds		W_M,SRAM_C_Y_M		;32-Bit Opcode
	;
	lds		W_H,SRAM_C_Y_H		;32-Bit Opcode
	;
	rcall	E_Get_Offset
	rcall	Send_Data_Y_S
	rjmp	E_1
	sbi		P_X_V,PIN_X_V
	cbi		P_Y_V,PIN_Y_V
	cbi		P_Z_V,PIN_Z_V
	ldi		temp,DC_Z_S_N_B_1
	Send	temp
	E_Ausgabe
	lds		W_L,SRAM_C_Z_L		;32-Bit Opcode
	;
	lds		W_M,SRAM_C_Z_M		;32-Bit Opcode
	;
	lds		W_H,SRAM_C_Z_H		;32-Bit Opcode
	;
	rcall	E_Get_Offset
	rcall	Send_Data_Z_S
	rjmp	PC+3
E_1:
	rcall	E_Update_DP
	sei
	rcall	E_L
	cpi		temp,Ein_X
	brne	PC+6
	sbrc	R_Ein,E_D
	rjmp	E_1+1
	sbrc	R_Ein,E_D+1
	rjmp	E_1+1
	rjmp	E_EEW
	cpi		temp,Ein_Y
	brne	PC+6
	sbrs	R_Ein,E_D
	rjmp	E_1+1
	sbrc	R_Ein,E_D+1
	rjmp	E_1+1
	rjmp	E_EEW
	cpi		temp,Ein_Z
	brne	PC+6
	sbrc	R_Ein,E_D
	rjmp	E_1+1
	sbrs	R_Ein,E_D+1
	rjmp	E_1+1
	rjmp	E_EEW

	ldi		W_L,(1<<E_DP_V)
	or		R_Ein,W_L
	cpi		temp,Ein_0
	brne	PC+8+PC_Send+PC_E_Ausgabe
	tst		W2_L
	brne	PC+3
	ser		W2_M
	ldi		W2_L,0xF0
	sei
	rcall	E_Prep_Send
	Send	temp
	E_Ausgabe
	rjmp	E_1
	cpi		temp,Ein_Neg
	brne	PC+10+PC_Send+PC_E_Ausgabe
	ser		W2_M
	cpi		W2_L,0xA0
	breq	PC+3
	ldi		W2_L,0xA0
	rjmp	PC+2
	ldi		W2_L,0xF0
	sei
	rcall	E_Prep_Send
	Send	temp
	E_Ausgabe
	rjmp	E_1
	cpi		temp,Ein_.
	brne	PC+10+PC_Send+PC_E_Ausgabe
	tst		W2_L
	brne	PC+3
	ser		W2_M
	ldi		W2_L,0xF0
	sei
	ldi		W_L,~(1<<E_DP_H)
	and		R_Ein,W_L
	rcall	E_Prep_Send
	Send	temp
	E_Ausgabe
	rjmp	E_2
	ser		W2_M
	lsr		temp
	lsr		temp
	andi	temp,0x0F
	tst		W2_L
	brne	PC+2
	ori		temp,0xF0
	or		W2_L,temp
	sei
	rcall	E_Prep_Send
	Send	temp
	E_Ausgabe
E_2:
	rcall	E_Update_DP
	sei
	rcall	E_L
	cpi		temp,Ein_X
	brne	PC+6
	sbrc	R_Ein,E_D
	rjmp	E_2+1
	sbrc	R_Ein,E_D+1
	rjmp	E_2+1
	rjmp	E_EEW
	cpi		temp,Ein_Y
	brne	PC+6
	sbrs	R_Ein,E_D
	rjmp	E_2+1
	sbrc	R_Ein,E_D+1
	rjmp	E_2+1
	rjmp	E_EEW
	cpi		temp,Ein_Z
	brne	PC+6
	sbrc	R_Ein,E_D
	rjmp	E_2+1
	sbrs	R_Ein,E_D+1
	rjmp	E_2+1
	rjmp	E_EEW

	cpi		temp,Ein_Neg
	brne	PC+9+PC_Send+PC_E_Ausgabe
	sbrs	W2_L,6
	rjmp	PC+3
	andi	W2_L,0xAF
	rjmp	PC+2
	ori		W2_L,0xF0
	sei
	rcall	E_Prep_Send
	Send	temp
	E_Ausgabe
	rjmp	E_2+2
	cpi		temp,Ein_.
	brne	PC+4
	ldi		W_L,~(1<<E_DP_H)
	and		R_Ein,W_L
	rjmp	E_2
	sbrs	W2_L,6
	ldi		W2_M,0xFA
	swap	W2_L
	andi	W2_L,0xF0
	lsr		temp
	lsr		temp
	andi	temp,0x0F
	or		W2_L,temp
	sbrc	R_Ein,E_DP_H
	rjmp	PC+5
	ldi		W_L,(1<<E_DP_H)
	or		R_Ein,W_L
	ldi		W_L,~(1<<E_DP_M)
	and		R_Ein,W_L
	sei
	rcall	E_Prep_Send
	Send	temp
	E_Ausgabe
E_3:
	rcall	E_Update_DP
	sei
	rcall	E_L
	cpi		temp,Ein_X
	brne	PC+6
	sbrc	R_Ein,E_D
	rjmp	E_3+1
	sbrc	R_Ein,E_D+1
	rjmp	E_3+1
	rjmp	E_EEW
	cpi		temp,Ein_Y
	brne	PC+6
	sbrs	R_Ein,E_D
	rjmp	E_3+1
	sbrc	R_Ein,E_D+1
	rjmp	E_3+1
	rjmp	E_EEW
	cpi		temp,Ein_Z
	brne	PC+6
	sbrc	R_Ein,E_D
	rjmp	E_3+1
	sbrs	R_Ein,E_D+1
	rjmp	E_3+1
	rjmp	E_EEW

	cpi		temp,Ein_Neg
	brne	PC+9+PC_Send+PC_E_Ausgabe
	sbrs	W2_M,2
	rjmp	PC+3
	ldi		W2_M,0xFA
	rjmp	PC+2
	ser		W2_M
	sei
	rcall	E_Prep_Send
	Send	temp
	E_Ausgabe
	rjmp	E_3+2
	cpi		temp,Ein_.
	brne	PC+5
	sbrc	R_Ein,E_DP_M
	ldi		W_L,~(1<<E_DP_H)
	and		R_Ein,W_L
	rjmp	E_3
	sbrs	W2_M,2
	ldi		W2_M,0xA0
	andi	W2_M,0xF0
	swap	W2_L
	mov		W_L,W2_L
	andi	W_L,0x0F
	or		W2_M,W_L
	andi	W2_L,0xF0
	lsr		temp
	lsr		temp
	andi	temp,0x0F
	or		W2_L,temp
	sbrc	R_Ein,E_DP_M
	rjmp	PC+8+PC_Send+PC_E_Ausgabe
	ldi		W_L,(1<<E_DP_M)
	or		R_Ein,W_L
	ldi		W_L,~(1<<E_DP_V)
	and		R_Ein,W_L
	sei
	rcall	E_Prep_Send
	Send	temp
	E_Ausgabe
	rjmp	E_Del
	sbrc	R_Ein,E_DP_H
	rjmp	PC+6
	ldi		W_L,(1<<E_DP_H)
	or		R_Ein,W_L
	ldi		W_L,~(1<<E_DP_M)
	and		R_Ein,W_L
	rjmp	PC+3
	ldi		W_L,~(1<<E_DP_H)
	and		R_Ein,W_L
	sei
	rcall	E_Prep_Send
	Send	temp
	E_Ausgabe
E_4:
	rcall	E_Update_DP
	sei
	rcall	E_L
	cpi		temp,Ein_X
	brne	PC+6
	sbrc	R_Ein,E_D
	rjmp	E_4+1
	sbrc	R_Ein,E_D+1
	rjmp	E_4+1
	rjmp	E_EEW
	cpi		temp,Ein_Y
	brne	PC+6
	sbrs	R_Ein,E_D
	rjmp	E_4+1
	sbrc	R_Ein,E_D+1
	rjmp	E_4+1
	rjmp	E_EEW
	cpi		temp,Ein_Z
	brne	PC+6
	sbrc	R_Ein,E_D
	rjmp	E_4+1
	sbrs	R_Ein,E_D+1
	rjmp	E_4+1
	rjmp	E_EEW

	cpi		temp,Ein_Neg
	brne	PC+9+PC_Send+PC_E_Ausgabe
	sbrs	W2_M,6
	rjmp	PC+3
	andi	W2_M,0xAF
	rjmp	PC+2
	ori		W2_M,0xF0
	sei
	rcall	E_Prep_Send
	Send	temp
	E_Ausgabe
	rjmp	E_4+2
	cpi		temp,Ein_.
	brne	PC+2
	rjmp	E_4+1
	sbrs	W2_M,6
	andi	W2_H,0xFA
	swap	W2_M
	andi	W2_M,0xF0
	swap	W2_L
	mov		W_L,W2_L
	andi	W_L,0x0F
	or		W2_M,W_L
	andi	W2_L,0xF0
	lsr		temp
	lsr		temp
	andi	temp,0x0F
	or		W2_L,temp
	sbrc	R_Ein,E_DP_M
	rjmp	PC+8+PC_Send+PC_E_Ausgabe
	ldi		W_L,(1<<E_DP_M)
	or		R_Ein,W_L
	ldi		W_L,~(1<<E_DP_V)
	and		R_Ein,W_L
	sei
	rcall	E_Prep_Send
	Send	temp
	E_Ausgabe
	rjmp	E_Del
	ldi		W_L,(1<<E_DP_H)
	or		R_Ein,W_L
	ldi		W_L,~(1<<E_DP_M)
	and		R_Ein,W_L
	sei
	rcall	E_Prep_Send
	Send	temp
	E_Ausgabe
E_5:
	rcall	E_Update_DP
	sei
	rcall	E_L
	cpi		temp,Ein_X
	brne	PC+6
	sbrc	R_Ein,E_D
	rjmp	E_5+1
	sbrc	R_Ein,E_D+1
	rjmp	E_5+1
	rjmp	E_EEW
	cpi		temp,Ein_Y
	brne	PC+6
	sbrs	R_Ein,E_D
	rjmp	E_5+1
	sbrc	R_Ein,E_D+1
	rjmp	E_5+1
	rjmp	E_EEW
	cpi		temp,Ein_Z
	brne	PC+6
	sbrc	R_Ein,E_D
	rjmp	E_5+1
	sbrs	R_Ein,E_D+1
	rjmp	E_5+1
	rjmp	E_EEW

	cpi		temp,Ein_Neg
	brne	PC+9+PC_Send+PC_E_Ausgabe
	sbrs	W2_H,2
	rjmp	PC+3
	ldi		W2_H,0xFA
	rjmp	PC+2
	ser		W2_H
	sei
	rcall	E_Prep_Send
	Send	temp
	E_Ausgabe
	rjmp	E_5+2
	cpi		temp,Ein_.
	brne	PC+2
	rjmp	E_5+1
	swap	W2_H
	andi	W2_H,0xF0
	swap	W2_M
	mov		W_L,W2_M
	andi	W_L,0x0F
	or		W2_H,W_L
	andi	W2_M,0xF0
	swap	W2_L
	mov		W_L,W2_L
	andi	W_L,0x0F
	or		W2_M,W_L
	andi	W2_L,0xF0
	lsr		temp
	lsr		temp
	andi	temp,0x0F
	or		W2_L,temp
	ldi		W_L,(1<<E_DP_M)
	or		R_Ein,W_L
	ldi		W_L,~(1<<E_DP_V)
	and		R_Ein,W_L
	sei
	rcall	E_Prep_Send
	Send	temp
	E_Ausgabe
E_Del:
	rcall	E_Update_DP
	sei
	rcall	E_L
	cpi		temp,Ein_X
	brne	PC+6
	sbrc	R_Ein,E_D
	rjmp	E_Del+1
	sbrc	R_Ein,E_D+1
	rjmp	E_Del+1
	rjmp	E_EEW
	cpi		temp,Ein_Y
	brne	PC+6
	sbrs	R_Ein,E_D
	rjmp	E_Del+1
	sbrc	R_Ein,E_D+1
	rjmp	E_Del+1
	rjmp	E_EEW
	cpi		temp,Ein_Z
	brne	PC+6
	sbrc	R_Ein,E_D
	rjmp	E_Del+1
	sbrs	R_Ein,E_D+1
	rjmp	E_Del+1
	rjmp	E_EEW
	cpi		temp,Ein_Neg
	brne	E_Del+1
	mov		temp,W2_M
	andi	temp,0xF0
	cpi		temp,0xA0
	brlo	PC+6
	breq	PC+3
	andi	W2_M,0xAF
	rjmp	PC+17
	ori		W2_M,0xF0
	rjmp	PC+15
	mov		temp,W2_H
	andi	temp,0x0F
	cpi		temp,0x0A
	brlo	PC+6
	breq	PC+3
	ldi		W2_H,0xFA
	rjmp	PC+8
	ser		W2_H
	rjmp	PC+6
	sbrc	W2_H,6
	rjmp	PC+3
	ori		W2_H,0xF0
	rjmp	PC+2
	andi	W2_H,0xAF
	sei
	rcall	E_Prep_Send
	Send	temp
	E_Ausgabe
	rjmp	E_Del+1
E_EEW:
	sei
	cli
	sbrs	R_Ein,E_DP_V
	rjmp	PC+19
	sbrc	R_Ein,E_DP_M
	rjmp	PC+14
	lsl		W2_L
	rol		W2_M
	rol		W2_H
	lsl		W2_L
	rol		W2_M
	rol		W2_H
	lsl		W2_L
	rol		W2_M
	rol		W2_H
	lsl		W2_L
	rol		W2_M
	rol		W2_H
	rjmp	PC+4
	mov		W2_H,W2_M
	mov		W2_M,W2_L
	clr		W2_L
	cpi		W2_M,0xF0
	brne	PC+11
	tst		W2_L
	brne	PC+9
	sei
	cli
	clr		W2_M
	clr		W2_H
	clr		W_L
	clr		W_M
	clr		W_H
	rjmp	E_Berechnung_e
	sei
	cli
;E_Berechnung:
	clr		W_L
	clr		W_M
	clr		W_H
	sbrs	W2_H,6
	rjmp	PC+9
	mov		temp,W2_H
	andi	temp,0x0F
	cpi		temp,0x0A
	breq	PC+5
	mov		temp,W2_M
	andi	temp,0xF0
	cpi		temp,0xA0
	brne	PC+2
	sbi		PORTA,6
	andi	W2_H,0x0F
	cpi		W2_H,0x0A
	brlo	PC+7
	clr		W2_H
	mov		temp,W2_M
	andi	temp,0xF0
	cpi		temp,0xA0
	brlo	PC+2
	andi	W2_M,0x0F
	mov		W_L,W2_L
	andi	W_L,0x0F
	swap	W2_L
	andi	W2_L,0x0F
	breq	PC+4
	subi	W_L,-10
	dec		W2_L
	brne	PC-2
	mov		temp,W2_M
	andi	temp,0x0F
	breq	PC+6
	subi	W_L,-100
	sbci	W_M,0xFF
	sbci	W_H,0xFF
	dec		temp
	brne	PC-4
	mov		temp,W2_M
	swap	temp
	andi	temp,0x0F
	breq	PC+6
	subi	W_L,LOW(-1000)
	sbci	W_M,HIGH(-1000)
	sbci	W_H,0xFF
	dec		temp
	brne	PC-4
	mov		temp,W2_H
	andi	temp,0x0F
	breq	PC+6
	subi	W_L,LOW(-10000)
	sbci	W_M,HIGH(-10000)
	sbci	W_H,0xFF
	dec		temp
	brne	PC-4
	sbis	PORTA,6
	rjmp	E_Berechnung_e
	cbi		PORTA,6
	com		W_L
	com		W_M
	com		W_H
	clc
	inc		W_L
	brne	PC+2
	sec
	adc		W_M,R_Zero
	adc		W_H,R_Zero
E_Berechnung_e:
	sbrc	R_Ein,E_D+1
	rjmp	PC+17
	sbrc	R_Ein,E_D
	rjmp	PC+8
	lds		W3_L,SRAM_C_X_L		;32-Bit Opcode
	;
	lds		W3_M,SRAM_C_X_M		;32-Bit Opcode
	;
	lds		W3_H,SRAM_C_X_H		;32-Bit Opcode
	;
	rjmp	PC+14
	lds		W3_L,SRAM_C_Y_L		;32-Bit Opcode
	;
	lds		W3_M,SRAM_C_Y_M		;32-Bit Opcode
	;
	lds		W3_H,SRAM_C_Y_H		;32-Bit Opcode
	;
	rjmp	PC+7
	lds		W3_L,SRAM_C_Z_L		;32-Bit Opcode
	;
	lds		W3_M,SRAM_C_Z_M		;32-Bit Opcode
	;
	lds		W3_H,SRAM_C_Z_H		;32-Bit Opcode
	;
	cli
	sub		W_L,W3_L
	sbc		W_M,W3_M
	sbc		W_H,W3_H
	sei

.if(Enable_FZ||Enable_DZu)
	sbrs	R_Ein,E_MA+1
	rjmp	PC+3
	.if(Enable_FZ)
	ldi		temp,EEPROM_FZ_L
	.else
	ldi		temp,EEPROM_DZu_L
	.endif
	rjmp	PC+14
.endif
	sbrc	R_Ein,E_MA
	rjmp	PC+7
	sbrc	R_Ein,E_MA+2
	rjmp	PC+3
	ldi		temp,EEPROM_FX_L
	rjmp	PC+8
	ldi		temp,EEPROM_DX_L
	rjmp	PC+6
	sbrc	R_Ein,E_MA+2
	rjmp	PC+3
	ldi		temp,EEPROM_FY_L
	rjmp	PC+2
	ldi		temp,EEPROM_DZ_L

	sbic	EECR,EEWE
	rjmp	PC-1
	out		EEARL,temp
	out		EEDR,W_L
	cbi		EECR,EEWE
	cli
	sbi		EECR,EEMWE
	sbi		EECR,EEWE
	sei
	sbic	EECR,EEWE
	rjmp	PC-1
	inc		temp
	out		EEARL,temp
	out		EEDR,W_M
	cbi		EECR,EEWE
	cli
	sbi		EECR,EEMWE
	sbi		EECR,EEWE
	sei
	sbic	EECR,EEWE
	rjmp	PC-1
	inc		temp
	out		EEARL,temp
	out		EEDR,W_H
	cbi		EECR,EEWE
	cli
	sbi		EECR,EEMWE
	sbi		EECR,EEWE
	sei
	rjmp	E_Return

Ani_Tab_X:
.db		0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x03,0x02,0x01,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f
Ani_Tab_Y_F:
.db		0x0f,0x0f,0x0f,0x0f,0x0a,0x0a,0x0a,0x0b,0x0f,0x08,0x0f,0x0c,0x0a,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f
Ani_Tab_Y_D:
.db		0x0f,0x0f,0x0f,0x0f,0x0a,0x0a,0x0a,0x0b,0x0f,0x09,0x0f,0x0c,0x0a,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f
Ani_Tab_Z:
.db		0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x05,0x06,0x07,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f





;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;--------------------------------EEPROM-Speicher------------------------------------
;--------------------------------EEPROM-Speicher------------------------------------
;--------------------------------EEPROM-Speicher------------------------------------
;--------------------------------EEPROM-Speicher------------------------------------
;--------------------------------EEPROM-Speicher------------------------------------
;--------------------------------EEPROM-Speicher------------------------------------
;--------------------------------EEPROM-Speicher------------------------------------
;--------------------------------EEPROM-Speicher------------------------------------
;--------------------------------EEPROM-Speicher------------------------------------
;--------------------------------EEPROM-Speicher------------------------------------
;--------------------------------EEPROM-Speicher------------------------------------
;--------------------------------EEPROM-Speicher------------------------------------
;--------------------------------EEPROM-Speicher------------------------------------
;--------------------------------EEPROM-Speicher------------------------------------
;--------------------------------EEPROM-Speicher------------------------------------
;--------------------------------EEPROM-Speicher------------------------------------
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################
;###################################################################################


.eseg
.org	0x00
.db	100,10,0,100,10,0,100,10,0,100,10,0,100,10,0,100,10,0,1

