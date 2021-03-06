.equ BAUD  = 9600                               ; Baudrate
.equ Blink_Period	=	5
; Berechnungen
.equ UBRR_VAL   = ((F_CPU+BAUD*8)/(BAUD*16)-1)  ; clever runden
.equ BAUD_REAL  = (F_CPU/(16*(UBRR_VAL+1)))      ; Reale Baudrate
.equ BAUD_ERROR = ((BAUD_REAL*1000)/BAUD-1000)  ; Fehler in Promille

.if ((BAUD_ERROR>10) || (BAUD_ERROR<-10))       ; max. +/-10 Promille Fehler
  .error "Systematischer Fehler der Baudrate grösser 1 Prozent und damit zu hoch!"
.endif
.equ D_T1_CTC	= (F_CPU*Blink_Period)/2560

.equ	Dig_Empty	=	0b00001111
.equ	Dig_Neg		=	0b00001010
.equ	Dig_0		=	0b00000000
.equ	Dig_1		=	0b00000001
.equ	Dig_2		=	0b00000010
.equ	Dig_3		=	0b00000011
.equ	Dig_4		=	0b00000100
.equ	Dig_5		=	0b00000101
.equ	Dig_6		=	0b00000110
.equ	Dig_7		=	0b00000111
.equ	Dig_8		=	0b00001000
.equ	Dig_9		=	0b00001001

.equ	Dig2_R		=	0b00000000
.equ	Dig2_RO		=	0b00000001
.equ	Dig2_O		=	0b00000010
.equ	Dig2_LO		=	0b00000011
.equ	Dig2_L		=	0b00000100
.equ	Dig2_LU		=	0b00000101
.equ	Dig2_U		=	0b00000110
.equ	Dig2_RU		=	0b00000111
.equ	Dig2_F		=	0b00001000
.equ	Dig2_D		=	0b00001001
.equ	Dig2_MI		=	0b00001010
.equ	Dig2_L_		=	0b00001011
.equ	Dig2_R_		=	0b00001100
.equ	Dig2_o_O	=	0b00001101
.equ	Dig2_o_U	=	0b00001110

.equ	Ein_0		=	0b11000011
.equ	Ein_1		=	0b11000111
.equ	Ein_2		=	0b11001011
.equ	Ein_3		=	0b11001111
.equ	Ein_4		=	0b11010011
.equ	Ein_5		=	0b11010111
.equ	Ein_6		=	0b11011011
.equ	Ein_7		=	0b11011111
.equ	Ein_8		=	0b11100011
.equ	Ein_9		=	0b11100111
.equ	Ein_Neg		=	0b11101011
.equ	Ein_.		=	0b11101111
.equ	Ein_Abbr	=	0b11110011
.equ	Ein_X		=	0b11110111
.equ	Ein_Y		=	0b11111011
.equ	Ein_Z		=	0b11111111
.equ	D_G_Call	=	0b00000000
.equ	D_Call_X	=	0b00000001
.equ	D_Call_Y	=	0b00000010
.equ	D_Call_Z	=	0b00000011
.equ	D_PIN_E_Call	=	2
.equ	D_PIN_Bl	=	3
.equ	D_PIN_SF	=	7
.equ	D_PIN_I		=	4
.equ	D_PIN_EA	=	5
.equ	D_Cl_D	=	0b00000000
.equ	D_Tg_Cl	=	0b00010000
.equ	D_Ani	=	0b01010000

.equ	DC_X_S_N_P_0	=	D_Call_X
.equ	DC_X_S_N_P_1	=	D_Call_X|(1<<D_PIN_I)
.equ	DC_X_S_N_B_0	=	D_Call_X|(1<<D_PIN_Bl)
.equ	DC_X_S_N_B_1	=	D_Call_X|(1<<D_PIN_Bl)|(1<<D_PIN_I)
.equ	DC_X_S_E_P_0	=	D_Call_X|(1<<D_PIN_E_Call)
.equ	DC_X_S_E_P_1	=	D_Call_X|(1<<D_PIN_E_Call)|(1<<D_PIN_I)
.equ	DC_X_S_E_B_0	=	D_Call_X|(1<<D_PIN_Bl)|(1<<D_PIN_E_Call)
.equ	DC_X_S_E_B_1	=	D_Call_X|(1<<D_PIN_Bl)|(1<<D_PIN_E_Call)|(1<<D_PIN_I)
.equ	DC_X_Alt_N_P_0	=	D_Call_X|(1<<D_PIN_EA)
.equ	DC_X_Alt_N_P_1	=	D_Call_X|(1<<D_PIN_I)|(1<<D_PIN_EA)
.equ	DC_X_Alt_N_B_0	=	D_Call_X|(1<<D_PIN_Bl)|(1<<D_PIN_EA)
.equ	DC_X_Alt_N_B_1	=	D_Call_X|(1<<D_PIN_Bl)|(1<<D_PIN_I)|(1<<D_PIN_EA)
.equ	DC_X_Alt_E_P_0	=	D_Call_X|(1<<D_PIN_E_Call)|(1<<D_PIN_EA)
.equ	DC_X_Alt_E_P_1	=	D_Call_X|(1<<D_PIN_E_Call)|(1<<D_PIN_I)|(1<<D_PIN_EA)
.equ	DC_X_Alt_E_B_0	=	D_Call_X|(1<<D_PIN_Bl)|(1<<D_PIN_E_Call)|(1<<D_PIN_EA)
.equ	DC_X_Alt_E_B_1	=	D_Call_X|(1<<D_PIN_Bl)|(1<<D_PIN_E_Call)|(1<<D_PIN_I)|(1<<D_PIN_EA)
.equ	DC_X_Cli	=	D_Call_X|(1<<D_PIN_SF)|D_Cl_D
.equ	DC_Y_S_N_P_0	=	D_Call_Y
.equ	DC_Y_S_N_P_1	=	D_Call_Y|(1<<D_PIN_I)
.equ	DC_Y_S_N_B_0	=	D_Call_Y|(1<<D_PIN_Bl)
.equ	DC_Y_S_N_B_1	=	D_Call_Y|(1<<D_PIN_Bl)|(1<<D_PIN_I)
.equ	DC_Y_S_E_P_0	=	D_Call_Y|(1<<D_PIN_E_Call)
.equ	DC_Y_S_E_P_1	=	D_Call_Y|(1<<D_PIN_E_Call)|(1<<D_PIN_I)
.equ	DC_Y_S_E_B_0	=	D_Call_Y|(1<<D_PIN_Bl)|(1<<D_PIN_E_Call)
.equ	DC_Y_S_E_B_1	=	D_Call_Y|(1<<D_PIN_Bl)|(1<<D_PIN_E_Call)|(1<<D_PIN_I)
.equ	DC_Y_Alt_N_P_0	=	D_Call_Y|(1<<D_PIN_EA)
.equ	DC_Y_Alt_N_P_1	=	D_Call_Y|(1<<D_PIN_I)|(1<<D_PIN_EA)
.equ	DC_Y_Alt_N_B_0	=	D_Call_Y|(1<<D_PIN_Bl)|(1<<D_PIN_EA)
.equ	DC_Y_Alt_N_B_1	=	D_Call_Y|(1<<D_PIN_Bl)|(1<<D_PIN_I)|(1<<D_PIN_EA)
.equ	DC_Y_Alt_E_P_0	=	D_Call_Y|(1<<D_PIN_E_Call)|(1<<D_PIN_EA)
.equ	DC_Y_Alt_E_P_1	=	D_Call_Y|(1<<D_PIN_E_Call)|(1<<D_PIN_I)|(1<<D_PIN_EA)
.equ	DC_Y_Alt_E_B_0	=	D_Call_Y|(1<<D_PIN_Bl)|(1<<D_PIN_E_Call)|(1<<D_PIN_EA)
.equ	DC_Y_Alt_E_B_1	=	D_Call_Y|(1<<D_PIN_Bl)|(1<<D_PIN_E_Call)|(1<<D_PIN_I)|(1<<D_PIN_EA)
.equ	DC_Y_Cli	=	D_Call_Y|(1<<D_PIN_SF)|D_Cl_D
.equ	DC_Z_S_N_P_0	=	D_Call_Z
.equ	DC_Z_S_N_P_1	=	D_Call_Z|(1<<D_PIN_I)
.equ	DC_Z_S_N_B_0	=	D_Call_Z|(1<<D_PIN_Bl)
.equ	DC_Z_S_N_B_1	=	D_Call_Z|(1<<D_PIN_Bl)|(1<<D_PIN_I)
.equ	DC_Z_S_E_P_0	=	D_Call_Z|(1<<D_PIN_E_Call)
.equ	DC_Z_S_E_P_1	=	D_Call_Z|(1<<D_PIN_E_Call)|(1<<D_PIN_I)
.equ	DC_Z_S_E_B_0	=	D_Call_Z|(1<<D_PIN_Bl)|(1<<D_PIN_E_Call)
.equ	DC_Z_S_E_B_1	=	D_Call_Z|(1<<D_PIN_Bl)|(1<<D_PIN_E_Call)|(1<<D_PIN_I)
.equ	DC_Z_Alt_N_P_0	=	D_Call_Z|(1<<D_PIN_EA)
.equ	DC_Z_Alt_N_P_1	=	D_Call_Z|(1<<D_PIN_I)|(1<<D_PIN_EA)
.equ	DC_Z_Alt_N_B_0	=	D_Call_Z|(1<<D_PIN_Bl)|(1<<D_PIN_EA)
.equ	DC_Z_Alt_N_B_1	=	D_Call_Z|(1<<D_PIN_Bl)|(1<<D_PIN_I)|(1<<D_PIN_EA)
.equ	DC_Z_Alt_E_P_0	=	D_Call_Z|(1<<D_PIN_E_Call)|(1<<D_PIN_EA)
.equ	DC_Z_Alt_E_P_1	=	D_Call_Z|(1<<D_PIN_E_Call)|(1<<D_PIN_I)|(1<<D_PIN_EA)
.equ	DC_Z_Alt_E_B_0	=	D_Call_Z|(1<<D_PIN_Bl)|(1<<D_PIN_E_Call)|(1<<D_PIN_EA)
.equ	DC_Z_Alt_E_B_1	=	D_Call_Z|(1<<D_PIN_Bl)|(1<<D_PIN_E_Call)|(1<<D_PIN_I)|(1<<D_PIN_EA)
.equ	DC_Z_Cli	=	D_Call_Z|(1<<D_PIN_SF)|D_Cl_D
.equ	DC_A_S_N_P_0	=	D_G_Call
.equ	DC_A_S_N_P_1	=	D_G_Call|(1<<D_PIN_I)
.equ	DC_A_S_N_B_0	=	D_G_Call|(1<<D_PIN_Bl)
.equ	DC_A_S_N_B_1	=	D_G_Call|(1<<D_PIN_Bl)|(1<<D_PIN_I)
.equ	DC_A_S_E_P_0	=	D_G_Call|(1<<D_PIN_E_Call)
.equ	DC_A_S_E_P_1	=	D_G_Call|(1<<D_PIN_E_Call)|(1<<D_PIN_I)
.equ	DC_A_S_E_B_0	=	D_G_Call|(1<<D_PIN_Bl)|(1<<D_PIN_E_Call)
.equ	DC_A_S_E_B_1	=	D_G_Call|(1<<D_PIN_Bl)|(1<<D_PIN_E_Call)|(1<<D_PIN_I)
.equ	DC_A_Alt_N_P_0	=	D_G_Call|(1<<D_PIN_EA)
.equ	DC_A_Alt_N_P_1	=	D_G_Call|(1<<D_PIN_I)|(1<<D_PIN_EA)
.equ	DC_A_Alt_N_B_0	=	D_G_Call|(1<<D_PIN_Bl)|(1<<D_PIN_EA)
.equ	DC_A_Alt_N_B_1	=	D_G_Call|(1<<D_PIN_Bl)|(1<<D_PIN_I)|(1<<D_PIN_EA)
.equ	DC_A_Alt_E_P_0	=	D_G_Call|(1<<D_PIN_E_Call)|(1<<D_PIN_EA)
.equ	DC_A_Alt_E_P_1	=	D_G_Call|(1<<D_PIN_E_Call)|(1<<D_PIN_I)|(1<<D_PIN_EA)
.equ	DC_A_Alt_E_B_0	=	D_G_Call|(1<<D_PIN_Bl)|(1<<D_PIN_E_Call)|(1<<D_PIN_EA)
.equ	DC_A_Alt_E_B_1	=	D_G_Call|(1<<D_PIN_Bl)|(1<<D_PIN_E_Call)|(1<<D_PIN_I)|(1<<D_PIN_EA)
.equ	DC_A_Cli	=	D_G_Call|(1<<D_PIN_SF)|D_Cl_D
.equ	DC_A_Clk	=	D_G_Call|(1<<D_PIN_SF)|D_Tg_Cl


