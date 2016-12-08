opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_Rs232Conf
	FNCALL	_main,_SPI_Config
	FNCALL	_main,_convert_temp
	FNCALL	_main,___ftge
	FNCALL	_main,___ftneg
	FNCALL	_main,___ftdiv
	FNCALL	_main,___fttol
	FNCALL	_main,___awtoft
	FNCALL	_main,___ftmul
	FNCALL	_main,___bmul
	FNCALL	_main,___lbtoft
	FNCALL	_main,___ftadd
	FNCALL	_main,_RS232Tx
	FNCALL	_convert_temp,___lwtoft
	FNCALL	_convert_temp,___ftmul
	FNCALL	_Rs232Conf,___lmul
	FNCALL	_Rs232Conf,___altoft
	FNCALL	_Rs232Conf,___lwtoft
	FNCALL	_Rs232Conf,___ftadd
	FNCALL	_Rs232Conf,___ftmul
	FNCALL	_Rs232Conf,___ftdiv
	FNCALL	_Rs232Conf,___fttol
	FNCALL	___altoft,___ftpack
	FNCALL	___lwtoft,___ftpack
	FNCALL	___awtoft,___ftpack
	FNCALL	___lbtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNCALL	___ftadd,___ftpack
	FNROOT	_main
	FNCALL	intlevel1,_RSI
	global	intlevel1
	FNROOT	intlevel1
	global	main@F1128
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	file	"C:\Users\Ricardo\Mestrado\TAC\trab10\p10.c"
	line	26

;initializer for main@F1128
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	020h
	global	main@F1124
	global	_SSPBUF
_SSPBUF	set	19
	global	_TXREG
_TXREG	set	25
	global	_CARRY
_CARRY	set	24
	global	_CKP
_CKP	set	164
	global	_CREN
_CREN	set	196
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RB0
_RB0	set	48
	global	_RB4
_RB4	set	52
	global	_RCIF
_RCIF	set	101
	global	_SPEN
_SPEN	set	199
	global	_SSPEN
_SSPEN	set	165
	global	_SSPM0
_SSPM0	set	160
	global	_SSPM1
_SSPM1	set	161
	global	_SSPM2
_SSPM2	set	162
	global	_SSPM3
_SSPM3	set	163
	global	_SPBRG
_SPBRG	set	153
	global	_BF
_BF	set	1184
	global	_BRGH
_BRGH	set	1218
	global	_CKE
_CKE	set	1190
	global	_RCIE
_RCIE	set	1125
	global	_SMP
_SMP	set	1191
	global	_SYNC
_SYNC	set	1220
	global	_TRISB0
_TRISB0	set	1072
	global	_TRISB4
_TRISB4	set	1076
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	global	_TRISC5
_TRISC5	set	1085
	global	_TRISC6
_TRISC6	set	1086
	global	_TRISC7
_TRISC7	set	1087
	global	_TXEN
_TXEN	set	1221
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	global	_f
psect	nvBANK1,class=BANK1,space=1
global __pnvBANK1
__pnvBANK1:
_f:
       ds      2

	global	_RCREG
_RCREG	set	26
	file	"p10.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
main@F1124:
       ds      2

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"C:\Users\Ricardo\Mestrado\TAC\trab10\p10.c"
main@F1128:
       ds      7

; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	((__pbssBANK1)+0)&07Fh
	clrf	((__pbssBANK1)+1)&07Fh
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK1
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK1
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK1+7)
	movwf btemp-1,f
	movlw high(__pidataBANK1)
	movwf btemp,f
	movlw low(__pidataBANK1)
	movwf btemp+1,f
	movlw low(__pdataBANK1)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackBANK1,class=BANK1,space=1
global __pcstackBANK1
__pcstackBANK1:
	global	?_Rs232Conf
?_Rs232Conf:	; 0 bytes @ 0x0
	global	Rs232Conf@m
Rs232Conf@m:	; 2 bytes @ 0x0
	ds	2
	global	Rs232Conf@fosc
Rs232Conf@fosc:	; 2 bytes @ 0x2
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x4
	ds	4
	global	main@env
main@env:	; 7 bytes @ 0x8
	ds	7
	global	main@a
main@a:	; 2 bytes @ 0xF
	ds	2
	global	main@i
main@i:	; 2 bytes @ 0x11
	ds	2
	global	main@temperatura
main@temperatura:	; 3 bytes @ 0x13
	ds	3
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_SPI_Config
?_SPI_Config:	; 0 bytes @ 0x0
	global	?_RSI
?_RSI:	; 0 bytes @ 0x0
	global	??_RSI
??_RSI:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	4
	global	??_SPI_Config
??_SPI_Config:	; 0 bytes @ 0x4
	global	?_RS232Tx
?_RS232Tx:	; 0 bytes @ 0x4
	global	??___lmul
??___lmul:	; 0 bytes @ 0x4
	global	?___ftge
?___ftge:	; 1 bit 
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x4
	global	RS232Tx@tam
RS232Tx@tam:	; 1 bytes @ 0x4
	global	___ftge@ff1
___ftge@ff1:	; 3 bytes @ 0x4
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x4
	ds	1
	global	??_RS232Tx
??_RS232Tx:	; 0 bytes @ 0x5
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x5
	ds	1
	global	RS232Tx@s
RS232Tx@s:	; 1 bytes @ 0x6
	ds	1
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x7
	global	RS232Tx@m
RS232Tx@m:	; 2 bytes @ 0x7
	global	___ftge@ff2
___ftge@ff2:	; 3 bytes @ 0x7
	ds	1
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x8
	ds	1
	global	??___ftneg
??___ftneg:	; 0 bytes @ 0x9
	global	??___lwtoft
??___lwtoft:	; 0 bytes @ 0x9
	global	?___bmul
?___bmul:	; 1 bytes @ 0x9
	global	RS232Tx@k
RS232Tx@k:	; 1 bytes @ 0x9
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x9
	global	___lbtoft@c
___lbtoft@c:	; 1 bytes @ 0x9
	global	___awtoft@sign
___awtoft@sign:	; 1 bytes @ 0x9
	ds	1
	global	??_Rs232Conf
??_Rs232Conf:	; 0 bytes @ 0xA
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x0
	global	??___ftge
??___ftge:	; 0 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	ds	4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	ds	4
	global	?___fttol
?___fttol:	; 4 bytes @ 0x8
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x8
	ds	4
	global	??___fttol
??___fttol:	; 0 bytes @ 0xC
	ds	4
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x10
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x11
	ds	4
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x15
	ds	1
	global	??___bmul
??___bmul:	; 0 bytes @ 0x16
	global	?___awtoft
?___awtoft:	; 3 bytes @ 0x16
	global	?___ftneg
?___ftneg:	; 3 bytes @ 0x16
	global	?___lwtoft
?___lwtoft:	; 3 bytes @ 0x16
	global	?___altoft
?___altoft:	; 3 bytes @ 0x16
	global	___awtoft@c
___awtoft@c:	; 2 bytes @ 0x16
	global	___lwtoft@c
___lwtoft@c:	; 2 bytes @ 0x16
	global	___ftneg@f1
___ftneg@f1:	; 3 bytes @ 0x16
	global	___altoft@c
___altoft@c:	; 4 bytes @ 0x16
	ds	1
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x17
	ds	1
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x18
	ds	1
	global	??___awtoft
??___awtoft:	; 0 bytes @ 0x19
	global	?___lbtoft
?___lbtoft:	; 3 bytes @ 0x19
	ds	1
	global	??___altoft
??___altoft:	; 0 bytes @ 0x1A
	ds	2
	global	??___lbtoft
??___lbtoft:	; 0 bytes @ 0x1C
	global	___altoft@exp
___altoft@exp:	; 1 bytes @ 0x1C
	ds	1
	global	___altoft@sign
___altoft@sign:	; 1 bytes @ 0x1D
	ds	3
	global	?___ftadd
?___ftadd:	; 3 bytes @ 0x20
	global	___ftadd@f1
___ftadd@f1:	; 3 bytes @ 0x20
	ds	3
	global	___ftadd@f2
___ftadd@f2:	; 3 bytes @ 0x23
	ds	3
	global	??___ftadd
??___ftadd:	; 0 bytes @ 0x26
	ds	4
	global	___ftadd@sign
___ftadd@sign:	; 1 bytes @ 0x2A
	ds	1
	global	___ftadd@exp2
___ftadd@exp2:	; 1 bytes @ 0x2B
	ds	1
	global	___ftadd@exp1
___ftadd@exp1:	; 1 bytes @ 0x2C
	ds	1
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0x2D
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0x2D
	ds	3
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0x30
	ds	3
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0x33
	ds	4
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x37
	ds	1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x38
	ds	3
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x3B
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x3C
	ds	1
	global	?_convert_temp
?_convert_temp:	; 3 bytes @ 0x3D
	global	?___ftdiv
?___ftdiv:	; 3 bytes @ 0x3D
	global	convert_temp@num
convert_temp@num:	; 2 bytes @ 0x3D
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0x3D
	ds	3
	global	??_convert_temp
??_convert_temp:	; 0 bytes @ 0x40
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0x40
	ds	2
	global	convert_temp@tmp
convert_temp@tmp:	; 2 bytes @ 0x42
	ds	1
	global	??___ftdiv
??___ftdiv:	; 0 bytes @ 0x43
	ds	1
	global	convert_temp@tmp_2
convert_temp@tmp_2:	; 2 bytes @ 0x44
	ds	2
	global	convert_temp@tmp_3
convert_temp@tmp_3:	; 2 bytes @ 0x46
	ds	1
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0x47
	ds	1
	global	convert_temp@temp
convert_temp@temp:	; 3 bytes @ 0x48
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0x48
	ds	3
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0x4B
	global	convert_temp@value
convert_temp@value:	; 2 bytes @ 0x4B
	ds	1
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0x4C
	ds	1
;;Data sizes: Strings 0, constant 0, data 7, bss 2, persistent 2 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      10
;; BANK0           80     77      77
;; BANK1           80     22      33
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___lbtoft	float  size(1) Largest target is 0
;;
;; ?___ftpack	float  size(1) Largest target is 0
;;
;; ?___lmul	unsigned long  size(1) Largest target is 0
;;
;; ?___altoft	float  size(1) Largest target is 0
;;
;; ?___lwtoft	float  size(1) Largest target is 0
;;
;; ?___ftadd	float  size(1) Largest target is 0
;;
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?___awtoft	float  size(1) Largest target is 0
;;
;; ?___ftdiv	float  size(1) Largest target is 0
;;
;; ?___ftneg	float  size(1) Largest target is 0
;;
;; ?_convert_temp	float  size(1) Largest target is 0
;;
;; sp__RS232Rx	PTR unsigned char  size(1) Largest target is 1
;;		 -> RCREG(BITSFR0[1]), 
;;
;; RS232Tx@s	PTR unsigned char  size(1) Largest target is 7
;;		 -> main@env(BANK1[7]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->___ftge
;;   _main->___awtoft
;;   _main->___bmul
;;   _main->___lbtoft
;;   _main->_RS232Tx
;;   _convert_temp->___lwtoft
;;   _Rs232Conf->___lwtoft
;;   ___altoft->___ftpack
;;   ___altoft->___lmul
;;   ___lwtoft->___ftpack
;;   ___awtoft->___ftpack
;;   ___lbtoft->___ftpack
;;   ___ftmul->___awtoft
;;   ___ftmul->___lbtoft
;;   ___ftmul->___lwtoft
;;   ___ftdiv->___bmul
;;   ___ftdiv->___lwtoft
;;   ___ftadd->___lbtoft
;;   ___ftadd->___lwtoft
;;   ___ftneg->___ftpack
;;   ___fttol->___ftpack
;;   ___fttol->___lmul
;;   ___bmul->___ftpack
;;
;; Critical Paths under _RSI in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_convert_temp
;;   _main->___ftdiv
;;   _convert_temp->___ftmul
;;   _Rs232Conf->___ftdiv
;;   ___altoft->___fttol
;;   ___lwtoft->___fttol
;;   ___awtoft->___fttol
;;   ___lbtoft->___ftneg
;;   ___ftmul->___ftadd
;;   ___ftdiv->___ftmul
;;   ___ftadd->___lbtoft
;;   ___ftneg->___fttol
;;   ___fttol->___lmul
;;   ___bmul->___fttol
;;
;; Critical Paths under _RSI in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   _main->_Rs232Conf
;;
;; Critical Paths under _RSI in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _RSI in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _RSI in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                18    18      0    7992
;;                                              4 BANK1     18    18      0
;;                          _Rs232Conf
;;                         _SPI_Config
;;                       _convert_temp
;;                             ___ftge
;;                            ___ftneg
;;                            ___ftdiv
;;                            ___fttol
;;                           ___awtoft
;;                            ___ftmul
;;                             ___bmul
;;                           ___lbtoft
;;                            ___ftadd
;;                            _RS232Tx
;; ---------------------------------------------------------------------------------
;; (1) _convert_temp                                        16    13      3    1063
;;                                             61 BANK0     16    13      3
;;                           ___lwtoft
;;                            ___ftmul
;; ---------------------------------------------------------------------------------
;; (1) _Rs232Conf                                            4     0      4    3061
;;                                              0 BANK1      4     0      4
;;                             ___lmul
;;                           ___altoft
;;                           ___lwtoft
;;                            ___ftadd
;;                            ___ftmul
;;                            ___ftdiv
;;                            ___fttol
;; ---------------------------------------------------------------------------------
;; (2) ___altoft                                             8     4      4     347
;;                                             22 BANK0      8     4      4
;;                           ___ftpack
;;                             ___lmul (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___lwtoft                                             4     1      3     231
;;                                              9 COMMON     1     1      0
;;                                             22 BANK0      3     0      3
;;                           ___ftpack
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___awtoft                                             6     3      3     300
;;                                              9 COMMON     1     1      0
;;                                             22 BANK0      5     2      3
;;                           ___ftpack
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___lbtoft                                             8     5      3     231
;;                                              9 COMMON     1     1      0
;;                                             25 BANK0      7     4      3
;;                           ___ftpack
;;                            ___ftneg (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___ftmul                                             16    10      6     535
;;                                             45 BANK0     16    10      6
;;                           ___ftpack
;;                           ___awtoft (ARG)
;;                            ___fttol (ARG)
;;                            ___ftadd (ARG)
;;                            ___ftneg (ARG)
;;                           ___lbtoft (ARG)
;;                           ___lwtoft (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___ftdiv                                             16    10      6     489
;;                                             61 BANK0     16    10      6
;;                           ___ftpack
;;                            ___fttol (ARG)
;;                             ___bmul (ARG)
;;                           ___altoft (ARG)
;;                             ___lmul (ARG)
;;                            ___ftmul (ARG)
;;                            ___ftadd (ARG)
;;                           ___lwtoft (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___ftadd                                             13     7      6    1049
;;                                             32 BANK0     13     7      6
;;                           ___ftpack
;;                            ___ftneg (ARG)
;;                           ___lbtoft (ARG)
;;                            ___fttol (ARG)
;;                           ___lwtoft (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___ftge                                              12     6      6     136
;;                                              4 COMMON     6     0      6
;;                                              0 BANK0      6     6      0
;; ---------------------------------------------------------------------------------
;; (1) ___ftneg                                              3     0      3      45
;;                                             22 BANK0      3     0      3
;;                           ___ftpack (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___fttol                                             14    10      4     252
;;                                              8 BANK0     14    10      4
;;                           ___ftpack (ARG)
;;                             ___lmul (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___lmul                                              13     5      8      92
;;                                              4 COMMON     5     5      0
;;                                              0 BANK0      8     0      8
;; ---------------------------------------------------------------------------------
;; (2) ___ftpack                                             8     3      5     209
;;                                              4 COMMON     5     0      5
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (1) ___bmul                                               4     3      1      92
;;                                              9 COMMON     1     0      1
;;                                             22 BANK0      3     3      0
;;                            ___fttol (ARG)
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (1) _RS232Tx                                              6     5      1     136
;;                                              4 COMMON     6     5      1
;; ---------------------------------------------------------------------------------
;; (1) _SPI_Config                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _RSI                                                  4     4      0       0
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Rs232Conf
;;     ___lmul
;;     ___altoft
;;       ___ftpack
;;       ___lmul (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;     ___lwtoft
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;     ___ftadd
;;       ___ftpack
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___lbtoft (ARG)
;;         ___ftpack
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;       ___lwtoft (ARG)
;;         ___ftpack
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;     ___ftmul
;;       ___ftpack
;;       ___awtoft (ARG)
;;         ___ftpack
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;       ___ftadd (ARG)
;;         ___ftpack
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___lbtoft (ARG)
;;           ___ftpack
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;             ___fttol (ARG)
;;               ___ftpack (ARG)
;;               ___lmul (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;         ___lwtoft (ARG)
;;           ___ftpack
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___lbtoft (ARG)
;;         ___ftpack
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___lwtoft (ARG)
;;         ___ftpack
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;     ___ftdiv
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;       ___bmul (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;         ___ftpack (ARG)
;;       ___altoft (ARG)
;;         ___ftpack
;;         ___lmul (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___lmul (ARG)
;;       ___ftmul (ARG)
;;         ___ftpack
;;         ___awtoft (ARG)
;;           ___ftpack
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;         ___ftadd (ARG)
;;           ___ftpack
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;             ___fttol (ARG)
;;               ___ftpack (ARG)
;;               ___lmul (ARG)
;;           ___lbtoft (ARG)
;;             ___ftpack
;;             ___ftneg (ARG)
;;               ___ftpack (ARG)
;;               ___fttol (ARG)
;;                 ___ftpack (ARG)
;;                 ___lmul (ARG)
;;             ___fttol (ARG)
;;               ___ftpack (ARG)
;;               ___lmul (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;           ___lwtoft (ARG)
;;             ___ftpack
;;             ___fttol (ARG)
;;               ___ftpack (ARG)
;;               ___lmul (ARG)
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___lbtoft (ARG)
;;           ___ftpack
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;             ___fttol (ARG)
;;               ___ftpack (ARG)
;;               ___lmul (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___lwtoft (ARG)
;;           ___ftpack
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;       ___ftadd (ARG)
;;         ___ftpack
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___lbtoft (ARG)
;;           ___ftpack
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;             ___fttol (ARG)
;;               ___ftpack (ARG)
;;               ___lmul (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;         ___lwtoft (ARG)
;;           ___ftpack
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;       ___lwtoft (ARG)
;;         ___ftpack
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;     ___fttol
;;       ___ftpack (ARG)
;;       ___lmul (ARG)
;;   _SPI_Config
;;   _convert_temp
;;     ___lwtoft
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;     ___ftmul
;;       ___ftpack
;;       ___awtoft (ARG)
;;         ___ftpack
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;       ___ftadd (ARG)
;;         ___ftpack
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___lbtoft (ARG)
;;           ___ftpack
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;             ___fttol (ARG)
;;               ___ftpack (ARG)
;;               ___lmul (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;         ___lwtoft (ARG)
;;           ___ftpack
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___lbtoft (ARG)
;;         ___ftpack
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___lwtoft (ARG)
;;         ___ftpack
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;   ___ftge
;;   ___ftneg
;;     ___ftpack (ARG)
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;       ___lmul (ARG)
;;   ___ftdiv
;;     ___ftpack
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;       ___lmul (ARG)
;;     ___bmul (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;       ___ftpack (ARG)
;;     ___altoft (ARG)
;;       ___ftpack
;;       ___lmul (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;     ___lmul (ARG)
;;     ___ftmul (ARG)
;;       ___ftpack
;;       ___awtoft (ARG)
;;         ___ftpack
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;       ___ftadd (ARG)
;;         ___ftpack
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___lbtoft (ARG)
;;           ___ftpack
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;             ___fttol (ARG)
;;               ___ftpack (ARG)
;;               ___lmul (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;         ___lwtoft (ARG)
;;           ___ftpack
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___lbtoft (ARG)
;;         ___ftpack
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___lwtoft (ARG)
;;         ___ftpack
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;     ___ftadd (ARG)
;;       ___ftpack
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___lbtoft (ARG)
;;         ___ftpack
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;       ___lwtoft (ARG)
;;         ___ftpack
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;     ___lwtoft (ARG)
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;   ___fttol
;;     ___ftpack (ARG)
;;     ___lmul (ARG)
;;   ___awtoft
;;     ___ftpack
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;       ___lmul (ARG)
;;   ___ftmul
;;     ___ftpack
;;     ___awtoft (ARG)
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;       ___lmul (ARG)
;;     ___ftadd (ARG)
;;       ___ftpack
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___lbtoft (ARG)
;;         ___ftpack
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___lmul (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;       ___lwtoft (ARG)
;;         ___ftpack
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;     ___ftneg (ARG)
;;       ___ftpack (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;     ___lbtoft (ARG)
;;       ___ftpack
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;     ___lwtoft (ARG)
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;   ___bmul
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;       ___lmul (ARG)
;;     ___ftpack (ARG)
;;   ___lbtoft
;;     ___ftpack
;;     ___ftneg (ARG)
;;       ___ftpack (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;       ___lmul (ARG)
;;   ___ftadd
;;     ___ftpack
;;     ___ftneg (ARG)
;;       ___ftpack (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;     ___lbtoft (ARG)
;;       ___ftpack
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___lmul (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;       ___lmul (ARG)
;;     ___lwtoft (ARG)
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___lmul (ARG)
;;   _RS232Tx
;;
;; _RSI (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50     16      21       7       41.3%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      7B      12        0.0%
;;ABS                  0      0      78       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50     4D      4D       5       96.3%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      A       A       1       71.4%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 13 in file "C:\Users\Ricardo\Mestrado\TAC\trab10\p10.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  env             7    8[BANK1 ] unsigned char [7]
;;  temperatura     3   19[BANK1 ] float 
;;  i               2   17[BANK1 ] unsigned int 
;;  a               2   15[BANK1 ] unsigned char [2]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0      14       0       0
;;      Temps:          0       0       4       0       0
;;      Totals:         0       0      18       0       0
;;Total ram usage:       18 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_Rs232Conf
;;		_SPI_Config
;;		_convert_temp
;;		___ftge
;;		___ftneg
;;		___ftdiv
;;		___fttol
;;		___awtoft
;;		___ftmul
;;		___bmul
;;		___lbtoft
;;		___ftadd
;;		_RS232Tx
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Ricardo\Mestrado\TAC\trab10\p10.c"
	line	13
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	14
	
l5277:	
;p10.c: 14: TRISB0=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1072/8)^080h,(1072)&7
	line	15
;p10.c: 15: RB0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
	line	18
	
l5279:	
;p10.c: 18: Rs232Conf(9600, 4);
	movlw	low(02580h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_Rs232Conf)^080h
	movlw	high(02580h)
	movwf	((?_Rs232Conf)^080h)+1
	movlw	low(04h)
	movwf	0+(?_Rs232Conf)^080h+02h
	movlw	high(04h)
	movwf	(0+(?_Rs232Conf)^080h+02h)+1
	fcall	_Rs232Conf
	line	20
	
l5281:	
;p10.c: 20: SPI_Config();
	fcall	_SPI_Config
	line	23
	
l5283:	
;p10.c: 23: unsigned char a[2]={0,0};
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@F1124+1)^080h,w
	clrf	(main@a+1)^080h
	addwf	(main@a+1)^080h
	movf	(main@F1124)^080h,w
	clrf	(main@a)^080h
	addwf	(main@a)^080h

	line	24
	
l5285:	
;p10.c: 24: float temperatura=0.0;
	movlw	0x0
	movwf	(main@temperatura)^080h
	movlw	0x0
	movwf	(main@temperatura+1)^080h
	movlw	0x0
	movwf	(main@temperatura+2)^080h
	line	25
	
l5287:	
;p10.c: 25: unsigned int i=0;
	clrf	(main@i)^080h
	clrf	(main@i+1)^080h
	line	26
	
l5289:	
;p10.c: 26: char env[7]={0,0,0,0,0,0,' '};
	movlw	(main@env)&0ffh
	movwf	fsr0
	movlw	low(main@F1128)
	movwf	(??_main+0)^080h+0
	movf	fsr0,w
	movwf	((??_main+0)^080h+0+1)
	movlw	7
	movwf	((??_main+0)^080h+0+2)
u3470:
	movf	(??_main+0)^080h+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	
	movf	indf,w
	movwf	((??_main+0)^080h+0+3)
	incf	(??_main+0)^080h+0,f
	movf	((??_main+0)^080h+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)^080h+0+3),w
	movwf	indf
	incf	((??_main+0)^080h+0+1),f
	decfsz	((??_main+0)^080h+0+2),f
	goto	u3470
	goto	l5291
	line	28
;p10.c: 28: while(1){
	
l701:	
	line	29
	
l5291:	
;p10.c: 29: RB4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(52/8),(52)&7
	line	31
	
l5293:	
;p10.c: 31: for(i=0;i<30000;i++){}
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(main@i)^080h
	clrf	(main@i+1)^080h
	
l5295:	
	movlw	high(07530h)
	subwf	(main@i+1)^080h,w
	movlw	low(07530h)
	skipnz
	subwf	(main@i)^080h,w
	skipc
	goto	u3481
	goto	u3480
u3481:
	goto	l5299
u3480:
	goto	l703
	
l5297:	
	goto	l703
	
l702:	
	
l5299:	
	movlw	low(01h)
	addwf	(main@i)^080h,f
	skipnc
	incf	(main@i+1)^080h,f
	movlw	high(01h)
	addwf	(main@i+1)^080h,f
	movlw	high(07530h)
	subwf	(main@i+1)^080h,w
	movlw	low(07530h)
	skipnz
	subwf	(main@i)^080h,w
	skipc
	goto	u3491
	goto	u3490
u3491:
	goto	l5299
u3490:
	
l703:	
	line	33
;p10.c: 33: RB4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
	line	35
	
l5301:	
;p10.c: 35: SSPBUF=0x00;
	clrf	(19)	;volatile
	line	36
;p10.c: 36: while(BF==0);
	goto	l704
	
l705:	
	
l704:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u3501
	goto	u3500
u3501:
	goto	l704
u3500:
	goto	l5303
	
l706:	
	line	37
	
l5303:	
;p10.c: 37: a[0]=SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@a)^080h
	line	39
	
l5305:	
;p10.c: 39: SSPBUF=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(19)	;volatile
	line	40
;p10.c: 40: while(BF==0);
	goto	l707
	
l708:	
	
l707:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u3511
	goto	u3510
u3511:
	goto	l707
u3510:
	goto	l5307
	
l709:	
	line	41
	
l5307:	
;p10.c: 41: a[1]=SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	0+(main@a)^080h+01h
	line	43
;p10.c: 43: i=a[0];
	movf	(main@a)^080h,w
	movwf	(??_main+0)^080h+0
	clrf	(??_main+0)^080h+0+1
	movf	0+(??_main+0)^080h+0,w
	movwf	(main@i)^080h
	movf	1+(??_main+0)^080h+0,w
	movwf	(main@i+1)^080h
	line	44
;p10.c: 44: i=i<<8;
	movf	(main@i)^080h,w
	movwf	(??_main+0)^080h+0+1
	clrf	(??_main+0)^080h+0
	movf	0+(??_main+0)^080h+0,w
	movwf	(main@i)^080h
	movf	1+(??_main+0)^080h+0,w
	movwf	(main@i+1)^080h
	line	45
;p10.c: 45: i=i+a[1];
	movf	0+(main@a)^080h+01h,w
	addwf	(main@i)^080h,w
	movwf	(main@i)^080h
	movf	(main@i+1)^080h,w
	skipnc
	incf	(main@i+1)^080h,w
	movwf	((main@i)^080h)+1
	line	47
	
l5309:	
;p10.c: 47: temperatura =convert_temp(i);
	movf	(main@i+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_convert_temp+1)
	addwf	(?_convert_temp+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@i)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_convert_temp)
	addwf	(?_convert_temp)

	fcall	_convert_temp
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?_convert_temp)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@temperatura)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_convert_temp)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@temperatura+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(2+(?_convert_temp)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@temperatura+2)^080h
	line	49
	
l5311:	
;p10.c: 49: if(temperatura<0.0){
	movf	(main@temperatura)^080h,w
	movwf	(?___ftge)
	movf	(main@temperatura+1)^080h,w
	movwf	(?___ftge+1)
	movf	(main@temperatura+2)^080h,w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0x0
	movwf	1+(?___ftge)+03h
	movlw	0x0
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u3521
	goto	u3520
u3521:
	goto	l5317
u3520:
	line	50
	
l5313:	
;p10.c: 50: env[0]='-';
	movlw	(02Dh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@env)^080h
	line	51
	
l5315:	
;p10.c: 51: temperatura=-temperatura;
	movf	(main@temperatura)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftneg)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftneg+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftneg+2)
	fcall	___ftneg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftneg)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@temperatura)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___ftneg)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@temperatura+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(2+(?___ftneg)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@temperatura+2)^080h
	line	52
;p10.c: 52: }
	goto	l5319
	line	53
	
l710:	
	line	54
	
l5317:	
;p10.c: 53: else{
;p10.c: 54: env[0]=' ';
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@env)^080h
	goto	l5319
	line	55
	
l711:	
	line	57
	
l5319:	
;p10.c: 55: }
;p10.c: 57: if(temperatura>=100.0){
	movf	(main@temperatura)^080h,w
	movwf	(?___ftge)
	movf	(main@temperatura+1)^080h,w
	movwf	(?___ftge+1)
	movf	(main@temperatura+2)^080h,w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0xc8
	movwf	1+(?___ftge)+03h
	movlw	0x42
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfss	status,0
	goto	u3531
	goto	u3530
u3531:
	goto	l5323
u3530:
	line	58
	
l5321:	
;p10.c: 58: env[1]=((unsigned char)(temperatura/100.0))+48;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___ftdiv)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(?___ftdiv)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	2+(?___ftdiv)+03h
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0xc8
	movwf	(?___ftdiv+1)
	movlw	0x42
	movwf	(?___ftdiv+2)
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	(?___fttol)
	movf	(1+(?___ftdiv)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftdiv)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___fttol)))),w
	addlw	030h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	0+(main@env)^080h+01h
	line	59
;p10.c: 59: env[2]=((unsigned char)(temperatura/10.0))-(unsigned char)((float)(env[1]-48)*10.0)+48;
	movf	0+(main@env)^080h+01h,w
	addlw	low(-48)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___awtoft)
	movlw	high(-48)
	skipnc
	movlw	(high(-48)+1)&0ffh
	movwf	((?___awtoft))+1
	fcall	___awtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awtoft)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___awtoft)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___awtoft)),w
	movwf	2+(?___ftmul)+03h
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x20
	movwf	(?___ftmul+1)
	movlw	0x41
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	decf	0+(((0+(?___fttol)))),w
	xorlw	0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(main@temperatura)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___ftdiv)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(?___ftdiv)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	2+(?___ftdiv)+03h
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x20
	movwf	(?___ftdiv+1)
	movlw	0x41
	movwf	(?___ftdiv+2)
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	(?___fttol)
	movf	(1+(?___ftdiv)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftdiv)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(??_main+0)^080h+0,w
	addlw	030h
	movwf	(??_main+1)^080h+0
	movf	(??_main+1)^080h+0,w
	movwf	0+(main@env)^080h+02h
	line	60
;p10.c: 60: }
	goto	l713
	line	61
	
l712:	
	line	62
	
l5323:	
;p10.c: 61: else{
;p10.c: 62: env[2]=(unsigned char)(temperatura/10.0)+48;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___ftdiv)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(?___ftdiv)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	2+(?___ftdiv)+03h
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x20
	movwf	(?___ftdiv+1)
	movlw	0x41
	movwf	(?___ftdiv+2)
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	(?___fttol)
	movf	(1+(?___ftdiv)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftdiv)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___fttol)))),w
	addlw	030h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	0+(main@env)^080h+02h
	line	63
	
l713:	
	line	64
;p10.c: 63: }
;p10.c: 64: env[3]=(unsigned char)(temperatura)-((unsigned char)((temperatura/10.0))*10)+48;
	movlw	(0Ah)
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(?___bmul)
	movf	(main@temperatura)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___ftdiv)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(?___ftdiv)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	2+(?___ftdiv)+03h
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x20
	movwf	(?___ftdiv+1)
	movlw	0x41
	movwf	(?___ftdiv+2)
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	(?___fttol)
	movf	(1+(?___ftdiv)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftdiv)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___fttol)))),w
	fcall	___bmul
	xorlw	0ffh
	addlw	1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+1)^080h+0
	movf	(main@temperatura)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___fttol)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___fttol+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(??_main+1)^080h+0,w
	addlw	030h
	movwf	(??_main+2)^080h+0
	movf	(??_main+2)^080h+0,w
	movwf	0+(main@env)^080h+03h
	line	65
	
l5325:	
;p10.c: 65: env[4]='.';
	movlw	(02Eh)
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	0+(main@env)^080h+04h
	line	66
	
l5327:	
;p10.c: 66: env[5]=(unsigned char)((temperatura-(float)((unsigned char)(temperatura)))*10.0)+48;
	movf	(main@temperatura)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___fttol)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___fttol+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___fttol)))),w
	fcall	___lbtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lbtoft)),w
	movwf	(?___ftneg)
	movf	(1+(?___lbtoft)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___lbtoft)),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftneg)),w
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___ftneg)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___ftneg)),w
	movwf	2+(?___ftadd)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftadd)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftadd+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temperatura+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftadd+2)
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___ftadd)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___ftadd)),w
	movwf	2+(?___ftmul)+03h
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x20
	movwf	(?___ftmul+1)
	movlw	0x41
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___fttol)))),w
	addlw	030h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	0+(main@env)^080h+05h
	line	68
	
l5329:	
;p10.c: 68: RS232Tx(&env[0], 7);
	movlw	(07h)
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(?_RS232Tx)
	movlw	(main@env)&0ffh
	fcall	_RS232Tx
	goto	l5291
	line	69
	
l714:	
	line	28
	goto	l5291
	
l715:	
	line	71
	
l716:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_convert_temp
psect	text471,local,class=CODE,delta=2
global __ptext471
__ptext471:

;; *************** function _convert_temp *****************
;; Defined at:
;;		line 218 in file "C:\Users\Ricardo\Mestrado\TAC\trab10\SPI.c"
;; Parameters:    Size  Location     Type
;;  num             2   61[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  temp            3   72[BANK0 ] float 
;;  value           2   75[BANK0 ] unsigned int 
;;  tmp_3           2   70[BANK0 ] unsigned int 
;;  tmp_2           2   68[BANK0 ] unsigned int 
;;  tmp             2   66[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  3   61[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0      11       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lwtoft
;;		___ftmul
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text471
	file	"C:\Users\Ricardo\Mestrado\TAC\trab10\SPI.c"
	line	218
	global	__size_of_convert_temp
	__size_of_convert_temp	equ	__end_of_convert_temp-_convert_temp
	
_convert_temp:	
	opt	stack 4
; Regs used in _convert_temp: [wreg+status,2+status,0+pclath+cstack]
	line	221
	
l5259:	
;SPI.c: 221: unsigned int tmp = 0b1000000000000000;
	movlw	low(08000h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(convert_temp@tmp)
	movlw	high(08000h)
	movwf	((convert_temp@tmp))+1
	line	222
;SPI.c: 222: unsigned int tmp_2=0b0111111111111111;
	movlw	low(07FFFh)
	movwf	(convert_temp@tmp_2)
	movlw	high(07FFFh)
	movwf	((convert_temp@tmp_2))+1
	line	223
;SPI.c: 223: unsigned int tmp_3 = tmp & num;
	movf	(convert_temp@num),w
	andwf	(convert_temp@tmp),w
	movwf	(convert_temp@tmp_3)
	movf	(convert_temp@num+1),w
	andwf	(convert_temp@tmp+1),w
	movwf	1+(convert_temp@tmp_3)
	line	225
;SPI.c: 225: unsigned int value = num & tmp_2;
	movf	(convert_temp@tmp_2),w
	andwf	(convert_temp@num),w
	movwf	(convert_temp@value)
	movf	(convert_temp@tmp_2+1),w
	andwf	(convert_temp@num+1),w
	movwf	1+(convert_temp@value)
	line	229
	
l5261:	
;SPI.c: 227: float temp;
;SPI.c: 229: if(tmp_3 == 0){
	movf	((convert_temp@tmp_3+1)),w
	iorwf	((convert_temp@tmp_3)),w
	skipz
	goto	u3441
	goto	u3440
u3441:
	goto	l5267
u3440:
	line	230
	
l5263:	
;SPI.c: 230: value = num >> 3;
	movf	(convert_temp@num+1),w
	movwf	(??_convert_temp+0)+0+1
	movf	(convert_temp@num),w
	movwf	(??_convert_temp+0)+0
	movlw	03h
u3455:
	clrc
	rrf	(??_convert_temp+0)+1,f
	rrf	(??_convert_temp+0)+0,f
	addlw	-1
	skipz
	goto	u3455
	movf	0+(??_convert_temp+0)+0,w
	movwf	(convert_temp@value)
	movf	1+(??_convert_temp+0)+0,w
	movwf	(convert_temp@value+1)
	line	231
	
l5265:	
;SPI.c: 231: temp = (double)value * 0.0625;
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x80
	movwf	(?___ftmul+1)
	movlw	0x3d
	movwf	(?___ftmul+2)
	movf	(convert_temp@value+1),w
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(convert_temp@value),w
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___lwtoft)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___lwtoft)),w
	movwf	2+(?___ftmul)+03h
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(convert_temp@temp)
	movf	(1+(?___ftmul)),w
	movwf	(convert_temp@temp+1)
	movf	(2+(?___ftmul)),w
	movwf	(convert_temp@temp+2)
	line	232
;SPI.c: 232: }else{
	goto	l5273
	
l1468:	
	line	234
	
l5267:	
;SPI.c: 234: value=num;
	movf	(convert_temp@num+1),w
	clrf	(convert_temp@value+1)
	addwf	(convert_temp@value+1)
	movf	(convert_temp@num),w
	clrf	(convert_temp@value)
	addwf	(convert_temp@value)

	line	235
	
l5269:	
;SPI.c: 235: value = ~value;
	comf	(convert_temp@value),f
	comf	(convert_temp@value+1),f
	line	236
;SPI.c: 236: value = value >> 3;
	movf	(convert_temp@value+1),w
	movwf	(??_convert_temp+0)+0+1
	movf	(convert_temp@value),w
	movwf	(??_convert_temp+0)+0
	movlw	03h
u3465:
	clrc
	rrf	(??_convert_temp+0)+1,f
	rrf	(??_convert_temp+0)+0,f
	addlw	-1
	skipz
	goto	u3465
	movf	0+(??_convert_temp+0)+0,w
	movwf	(convert_temp@value)
	movf	1+(??_convert_temp+0)+0,w
	movwf	(convert_temp@value+1)
	line	237
;SPI.c: 237: value = value + 1;
	movf	(convert_temp@value),w
	addlw	low(01h)
	movwf	(convert_temp@value)
	movf	(convert_temp@value+1),w
	skipnc
	addlw	1
	addlw	high(01h)
	movwf	1+(convert_temp@value)
	line	238
	
l5271:	
;SPI.c: 238: temp = (double)value * (-0.0625);
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x80
	movwf	(?___ftmul+1)
	movlw	0xbd
	movwf	(?___ftmul+2)
	movf	(convert_temp@value+1),w
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(convert_temp@value),w
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___lwtoft)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___lwtoft)),w
	movwf	2+(?___ftmul)+03h
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(convert_temp@temp)
	movf	(1+(?___ftmul)),w
	movwf	(convert_temp@temp+1)
	movf	(2+(?___ftmul)),w
	movwf	(convert_temp@temp+2)
	goto	l5273
	line	239
	
l1469:	
	line	240
	
l5273:	
;SPI.c: 239: }
;SPI.c: 240: return temp;
	movf	(convert_temp@temp),w
	movwf	(?_convert_temp)
	movf	(convert_temp@temp+1),w
	movwf	(?_convert_temp+1)
	movf	(convert_temp@temp+2),w
	movwf	(?_convert_temp+2)
	goto	l1470
	
l5275:	
	line	241
	
l1470:	
	return
	opt stack 0
GLOBAL	__end_of_convert_temp
	__end_of_convert_temp:
;; =============== function _convert_temp ends ============

	signat	_convert_temp,4219
	global	_Rs232Conf
psect	text472,local,class=CODE,delta=2
global __ptext472
__ptext472:

;; *************** function _Rs232Conf *****************
;; Defined at:
;;		line 5 in file "C:\Users\Ricardo\Mestrado\TAC\trab10\Rs232.c"
;; Parameters:    Size  Location     Type
;;  m               2    0[BANK1 ] unsigned int 
;;  fosc            2    2[BANK1 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       4       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lmul
;;		___altoft
;;		___lwtoft
;;		___ftadd
;;		___ftmul
;;		___ftdiv
;;		___fttol
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text472
	file	"C:\Users\Ricardo\Mestrado\TAC\trab10\Rs232.c"
	line	5
	global	__size_of_Rs232Conf
	__size_of_Rs232Conf	equ	__end_of_Rs232Conf-_Rs232Conf
	
_Rs232Conf:	
	opt	stack 4
; Regs used in _Rs232Conf: [wreg+status,2+status,0+pclath+cstack]
	line	6
	
l5235:	
;Rs232.c: 6: f=fosc;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(Rs232Conf@fosc+1)^080h,w
	clrf	(_f+1)^080h
	addwf	(_f+1)^080h
	movf	(Rs232Conf@fosc)^080h,w
	clrf	(_f)^080h
	addwf	(_f)^080h

	line	8
	
l5237:	
;Rs232.c: 8: SYNC=0;
	bcf	(1220/8)^080h,(1220)&7
	line	9
	
l5239:	
;Rs232.c: 9: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	10
	
l5241:	
;Rs232.c: 10: SPBRG=(char)(((float)(fosc*1000000)/((float)16*((float)m+(float)1))));
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	3+(?___lmul)+04h
	movlw	0Fh
	movwf	2+(?___lmul)+04h
	movlw	042h
	movwf	1+(?___lmul)+04h
	movlw	040h
	movwf	0+(?___lmul)+04h

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(Rs232Conf@fosc)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lmul)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(Rs232Conf@fosc+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((?___lmul))+1
	clrf	2+((?___lmul))
	clrf	3+((?___lmul))
	fcall	___lmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(3+(?___lmul)),w
	movwf	(?___altoft+3)
	movf	(2+(?___lmul)),w
	movwf	(?___altoft+2)
	movf	(1+(?___lmul)),w
	movwf	(?___altoft+1)
	movf	(0+(?___lmul)),w
	movwf	(?___altoft)

	fcall	___altoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___altoft)),w
	movwf	0+(?___ftdiv)+03h
	movf	(1+(?___altoft)),w
	movwf	1+(?___ftdiv)+03h
	movf	(2+(?___altoft)),w
	movwf	2+(?___ftdiv)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(Rs232Conf@m+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(Rs232Conf@m)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___lwtoft)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___lwtoft)),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0x80
	movwf	(?___ftadd+1)
	movlw	0x3f
	movwf	(?___ftadd+2)
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___ftadd)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___ftadd)),w
	movwf	2+(?___ftmul)+03h
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x80
	movwf	(?___ftmul+1)
	movlw	0x41
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___ftdiv)
	movf	(1+(?___ftmul)),w
	movwf	(?___ftdiv+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___ftdiv+2)
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	(?___fttol)
	movf	(1+(?___ftdiv)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftdiv)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	15
	
l5243:	
;Rs232.c: 15: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	16
	
l5245:	
;Rs232.c: 16: CREN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(196/8),(196)&7
	line	17
	
l5247:	
;Rs232.c: 17: SPEN=1;
	bsf	(199/8),(199)&7
	line	18
	
l5249:	
;Rs232.c: 18: TRISC7=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1087/8)^080h,(1087)&7
	line	19
	
l5251:	
;Rs232.c: 19: TRISC6=1;
	bsf	(1086/8)^080h,(1086)&7
	line	22
	
l5253:	
;Rs232.c: 22: GIE=1;
	bsf	(95/8),(95)&7
	line	23
	
l5255:	
;Rs232.c: 23: PEIE=1;
	bsf	(94/8),(94)&7
	line	24
	
l5257:	
;Rs232.c: 24: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	26
	
l2157:	
	return
	opt stack 0
GLOBAL	__end_of_Rs232Conf
	__end_of_Rs232Conf:
;; =============== function _Rs232Conf ends ============

	signat	_Rs232Conf,8312
	global	___altoft
psect	text473,local,class=CODE,delta=2
global __ptext473
__ptext473:

;; *************** function ___altoft *****************
;; Defined at:
;;		line 43 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\altoft.c"
;; Parameters:    Size  Location     Type
;;  c               4   22[BANK0 ] long 
;; Auto vars:     Size  Location     Type
;;  sign            1   29[BANK0 ] unsigned char 
;;  exp             1   28[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   22[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_Rs232Conf
;; This function uses a non-reentrant model
;;
psect	text473
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\altoft.c"
	line	43
	global	__size_of___altoft
	__size_of___altoft	equ	__end_of___altoft-___altoft
	
___altoft:	
	opt	stack 4
; Regs used in ___altoft: [wreg+status,2+status,0+pclath+cstack]
	line	45
	
l5217:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___altoft@sign)
	line	46
	
l5219:	
	movlw	(08Eh)
	movwf	(??___altoft+0)+0
	movf	(??___altoft+0)+0,w
	movwf	(___altoft@exp)
	line	47
	
l5221:	
	btfss	(___altoft@c+3),7
	goto	u3411
	goto	u3410
u3411:
	goto	l5229
u3410:
	line	48
	
l5223:	
	comf	(___altoft@c),f
	comf	(___altoft@c+1),f
	comf	(___altoft@c+2),f
	comf	(___altoft@c+3),f
	incf	(___altoft@c),f
	skipnz
	incf	(___altoft@c+1),f
	skipnz
	incf	(___altoft@c+2),f
	skipnz
	incf	(___altoft@c+3),f
	line	49
	
l5225:	
	clrf	(___altoft@sign)
	bsf	status,0
	rlf	(___altoft@sign),f
	goto	l5229
	line	50
	
l3079:	
	line	52
	goto	l5229
	
l3081:	
	line	53
	
l5227:	
	movlw	01h
u3425:
	clrc
	rrf	(___altoft@c+3),f
	rrf	(___altoft@c+2),f
	rrf	(___altoft@c+1),f
	rrf	(___altoft@c),f
	addlw	-1
	skipz
	goto	u3425

	line	54
	movlw	(01h)
	movwf	(??___altoft+0)+0
	movf	(??___altoft+0)+0,w
	addwf	(___altoft@exp),f
	goto	l5229
	line	55
	
l3080:	
	line	52
	
l5229:	
	movlw	high highword(-16777216)
	andwf	(___altoft@c+3),w
	btfss	status,2
	goto	u3431
	goto	u3430
u3431:
	goto	l5227
u3430:
	goto	l5231
	
l3082:	
	line	56
	
l5231:	
	movf	(___altoft@c),w
	movwf	(?___ftpack)
	movf	(___altoft@c+1),w
	movwf	(?___ftpack+1)
	movf	(___altoft@c+2),w
	movwf	(?___ftpack+2)
	movf	(___altoft@exp),w
	movwf	(??___altoft+0)+0
	movf	(??___altoft+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___altoft@sign),w
	movwf	(??___altoft+1)+0
	movf	(??___altoft+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___altoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___altoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___altoft+2)
	goto	l3083
	
l5233:	
	line	57
	
l3083:	
	return
	opt stack 0
GLOBAL	__end_of___altoft
	__end_of___altoft:
;; =============== function ___altoft ends ============

	signat	___altoft,4219
	global	___lwtoft
psect	text474,local,class=CODE,delta=2
global __ptext474
__ptext474:

;; *************** function ___lwtoft *****************
;; Defined at:
;;		line 29 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2   22[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3   22[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       3       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_convert_temp
;;		_Rs232Conf
;; This function uses a non-reentrant model
;;
psect	text474
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwtoft.c"
	line	29
	global	__size_of___lwtoft
	__size_of___lwtoft	equ	__end_of___lwtoft-___lwtoft
	
___lwtoft:	
	opt	stack 4
; Regs used in ___lwtoft: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l5213:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwtoft@c),w
	movwf	(?___ftpack)
	movf	(___lwtoft@c+1),w
	movwf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	(??___lwtoft+0)+0
	movf	(??___lwtoft+0)+0,w
	movwf	0+(?___ftpack)+03h
	clrf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lwtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___lwtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___lwtoft+2)
	goto	l3074
	
l5215:	
	line	31
	
l3074:	
	return
	opt stack 0
GLOBAL	__end_of___lwtoft
	__end_of___lwtoft:
;; =============== function ___lwtoft ends ============

	signat	___lwtoft,4219
	global	___awtoft
psect	text475,local,class=CODE,delta=2
global __ptext475
__ptext475:

;; *************** function ___awtoft *****************
;; Defined at:
;;		line 33 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2   22[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   22[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         1       5       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text475
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awtoft.c"
	line	33
	global	__size_of___awtoft
	__size_of___awtoft	equ	__end_of___awtoft-___awtoft
	
___awtoft:	
	opt	stack 5
; Regs used in ___awtoft: [wreg+status,2+status,0+pclath+cstack]
	line	36
	
l5205:	
	clrf	(___awtoft@sign)
	line	37
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(___awtoft@c+1),7
	goto	u3401
	goto	u3400
u3401:
	goto	l5209
u3400:
	line	38
	
l5207:	
	comf	(___awtoft@c),f
	comf	(___awtoft@c+1),f
	incf	(___awtoft@c),f
	skipnz
	incf	(___awtoft@c+1),f
	line	39
	clrf	(___awtoft@sign)
	bsf	status,0
	rlf	(___awtoft@sign),f
	goto	l5209
	line	40
	
l2987:	
	line	41
	
l5209:	
	movf	(___awtoft@c),w
	movwf	(?___ftpack)
	movf	(___awtoft@c+1),w
	movwf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	(??___awtoft+0)+0
	movf	(??___awtoft+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___awtoft@sign),w
	movwf	(??___awtoft+1)+0
	movf	(??___awtoft+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___awtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___awtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___awtoft+2)
	goto	l2988
	
l5211:	
	line	42
	
l2988:	
	return
	opt stack 0
GLOBAL	__end_of___awtoft
	__end_of___awtoft:
;; =============== function ___awtoft ends ============

	signat	___awtoft,4219
	global	___lbtoft
psect	text476,local,class=CODE,delta=2
global __ptext476
__ptext476:

;; *************** function ___lbtoft *****************
;; Defined at:
;;		line 28 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lbtoft.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   25[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         1       7       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text476
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lbtoft.c"
	line	28
	global	__size_of___lbtoft
	__size_of___lbtoft	equ	__end_of___lbtoft-___lbtoft
	
___lbtoft:	
	opt	stack 5
; Regs used in ___lbtoft: [wreg+status,2+status,0+pclath+cstack]
;___lbtoft@c stored from wreg
	movwf	(___lbtoft@c)
	line	29
	
l5201:	
	movf	(___lbtoft@c),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??___lbtoft+0)+0)
	clrf	((??___lbtoft+0)+0+1)
	clrf	((??___lbtoft+0)+0+2)
	movf	0+(??___lbtoft+0)+0,w
	movwf	(?___ftpack)
	movf	1+(??___lbtoft+0)+0,w
	movwf	(?___ftpack+1)
	movf	2+(??___lbtoft+0)+0,w
	movwf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	(??___lbtoft+3)+0
	movf	(??___lbtoft+3)+0,w
	movwf	0+(?___ftpack)+03h
	clrf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lbtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___lbtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___lbtoft+2)
	goto	l2976
	
l5203:	
	line	30
	
l2976:	
	return
	opt stack 0
GLOBAL	__end_of___lbtoft
	__end_of___lbtoft:
;; =============== function ___lbtoft ends ============

	signat	___lbtoft,4219
	global	___ftmul
psect	text477,local,class=CODE,delta=2
global __ptext477
__ptext477:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3   45[BANK0 ] float 
;;  f2              3   48[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   56[BANK0 ] unsigned um
;;  sign            1   60[BANK0 ] unsigned char 
;;  cntr            1   59[BANK0 ] unsigned char 
;;  exp             1   55[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   45[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;;		_convert_temp
;;		_Rs232Conf
;; This function uses a non-reentrant model
;;
psect	text477
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 5
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l5151:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@exp)
	movf	((___ftmul@exp)),f
	skipz
	goto	u3261
	goto	u3260
u3261:
	goto	l5157
u3260:
	line	57
	
l5153:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l2950
	
l5155:	
	goto	l2950
	
l2949:	
	line	58
	
l5157:	
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	movf	((___ftmul@sign)),f
	skipz
	goto	u3271
	goto	u3270
u3271:
	goto	l5163
u3270:
	line	59
	
l5159:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l2950
	
l5161:	
	goto	l2950
	
l2951:	
	line	60
	
l5163:	
	movf	(___ftmul@sign),w
	addlw	07Bh
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	addwf	(___ftmul@exp),f
	line	61
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u3285:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3280:
	addlw	-1
	skipz
	goto	u3285
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	line	62
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u3295:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3290:
	addlw	-1
	skipz
	goto	u3295
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	xorwf	(___ftmul@sign),f
	line	63
	movlw	(080h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	andwf	(___ftmul@sign),f
	line	64
	
l5165:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l5167:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l5169:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l5171:	
	movlw	0
	movwf	(___ftmul@f3_as_product)
	movlw	0
	movwf	(___ftmul@f3_as_product+1)
	movlw	0
	movwf	(___ftmul@f3_as_product+2)
	line	69
	
l5173:	
	movlw	(07h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l5175
	line	70
	
l2952:	
	line	71
	
l5175:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3301
	goto	u3300
u3301:
	goto	l5179
u3300:
	line	72
	
l5177:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3311
	addwf	(___ftmul@f3_as_product+1),f
u3311:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3312
	addwf	(___ftmul@f3_as_product+2),f
u3312:

	goto	l5179
	
l2953:	
	line	73
	
l5179:	
	movlw	01h
u3325:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3325

	line	74
	
l5181:	
	movlw	01h
u3335:
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	addlw	-1
	skipz
	goto	u3335
	line	75
	
l5183:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3341
	goto	u3340
u3341:
	goto	l5175
u3340:
	goto	l5185
	
l2954:	
	line	76
	
l5185:	
	movlw	(09h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l5187
	line	77
	
l2955:	
	line	78
	
l5187:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3351
	goto	u3350
u3351:
	goto	l5191
u3350:
	line	79
	
l5189:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3361
	addwf	(___ftmul@f3_as_product+1),f
u3361:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3362
	addwf	(___ftmul@f3_as_product+2),f
u3362:

	goto	l5191
	
l2956:	
	line	80
	
l5191:	
	movlw	01h
u3375:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3375

	line	81
	
l5193:	
	movlw	01h
u3385:
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	addlw	-1
	skipz
	goto	u3385

	line	82
	
l5195:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3391
	goto	u3390
u3391:
	goto	l5187
u3390:
	goto	l5197
	
l2957:	
	line	83
	
l5197:	
	movf	(___ftmul@f3_as_product),w
	movwf	(?___ftpack)
	movf	(___ftmul@f3_as_product+1),w
	movwf	(?___ftpack+1)
	movf	(___ftmul@f3_as_product+2),w
	movwf	(?___ftpack+2)
	movf	(___ftmul@exp),w
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftmul@sign),w
	movwf	(??___ftmul+1)+0
	movf	(??___ftmul+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftmul)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftmul+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftmul+2)
	goto	l2950
	
l5199:	
	line	84
	
l2950:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	___ftdiv
psect	text478,local,class=CODE,delta=2
global __ptext478
__ptext478:

;; *************** function ___ftdiv *****************
;; Defined at:
;;		line 50 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftdiv.c"
;; Parameters:    Size  Location     Type
;;  f2              3   61[BANK0 ] float 
;;  f1              3   64[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3              3   72[BANK0 ] float 
;;  sign            1   76[BANK0 ] unsigned char 
;;  exp             1   75[BANK0 ] unsigned char 
;;  cntr            1   71[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   61[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;;		_Rs232Conf
;; This function uses a non-reentrant model
;;
psect	text478
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftdiv.c"
	line	50
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:	
	opt	stack 5
; Regs used in ___ftdiv: [wreg+status,2+status,0+pclath+cstack]
	line	55
	
l5109:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@exp)
	movf	((___ftdiv@exp)),f
	skipz
	goto	u3181
	goto	u3180
u3181:
	goto	l5115
u3180:
	line	56
	
l5111:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	l2940
	
l5113:	
	goto	l2940
	
l2939:	
	line	57
	
l5115:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@sign)
	movf	((___ftdiv@sign)),f
	skipz
	goto	u3191
	goto	u3190
u3191:
	goto	l5121
u3190:
	line	58
	
l5117:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	l2940
	
l5119:	
	goto	l2940
	
l2941:	
	line	59
	
l5121:	
	movlw	0
	movwf	(___ftdiv@f3)
	movlw	0
	movwf	(___ftdiv@f3+1)
	movlw	0
	movwf	(___ftdiv@f3+2)
	line	60
	
l5123:	
	movlw	(089h)
	addwf	(___ftdiv@sign),w
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	subwf	(___ftdiv@exp),f
	line	61
	
l5125:	
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u3205:
	clrc
	rrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u3200:
	addlw	-1
	skipz
	goto	u3205
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@sign)
	line	62
	
l5127:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u3215:
	clrc
	rrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u3210:
	addlw	-1
	skipz
	goto	u3215
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	xorwf	(___ftdiv@sign),f
	line	63
	
l5129:	
	movlw	(080h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	andwf	(___ftdiv@sign),f
	line	64
	
l5131:	
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	65
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	66
	
l5133:	
	bsf	(___ftdiv@f2)+(15/8),(15)&7
	line	67
	movlw	0FFh
	andwf	(___ftdiv@f2),f
	movlw	0FFh
	andwf	(___ftdiv@f2+1),f
	movlw	0
	andwf	(___ftdiv@f2+2),f
	line	68
	movlw	(018h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movwf	(___ftdiv@cntr)
	goto	l5135
	line	69
	
l2942:	
	line	70
	
l5135:	
	movlw	01h
u3225:
	clrc
	rlf	(___ftdiv@f3),f
	rlf	(___ftdiv@f3+1),f
	rlf	(___ftdiv@f3+2),f
	addlw	-1
	skipz
	goto	u3225
	line	71
	
l5137:	
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u3235
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u3235
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u3235:
	skipc
	goto	u3231
	goto	u3230
u3231:
	goto	l5143
u3230:
	line	72
	
l5139:	
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),f
	movf	(___ftdiv@f2+1),w
	skipc
	incfsz	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),f
	movf	(___ftdiv@f2+2),w
	skipc
	incf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),f
	line	73
	
l5141:	
	bsf	(___ftdiv@f3)+(0/8),(0)&7
	goto	l5143
	line	74
	
l2943:	
	line	75
	
l5143:	
	movlw	01h
u3245:
	clrc
	rlf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	addlw	-1
	skipz
	goto	u3245
	line	76
	
l5145:	
	movlw	low(01h)
	subwf	(___ftdiv@cntr),f
	btfss	status,2
	goto	u3251
	goto	u3250
u3251:
	goto	l5135
u3250:
	goto	l5147
	
l2944:	
	line	77
	
l5147:	
	movf	(___ftdiv@f3),w
	movwf	(?___ftpack)
	movf	(___ftdiv@f3+1),w
	movwf	(?___ftpack+1)
	movf	(___ftdiv@f3+2),w
	movwf	(?___ftpack+2)
	movf	(___ftdiv@exp),w
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftdiv@sign),w
	movwf	(??___ftdiv+1)+0
	movf	(??___ftdiv+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftdiv)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftdiv+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftdiv+2)
	goto	l2940
	
l5149:	
	line	78
	
l2940:	
	return
	opt stack 0
GLOBAL	__end_of___ftdiv
	__end_of___ftdiv:
;; =============== function ___ftdiv ends ============

	signat	___ftdiv,8315
	global	___ftadd
psect	text479,local,class=CODE,delta=2
global __ptext479
__ptext479:

;; *************** function ___ftadd *****************
;; Defined at:
;;		line 87 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftadd.c"
;; Parameters:    Size  Location     Type
;;  f1              3   32[BANK0 ] float 
;;  f2              3   35[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  exp1            1   44[BANK0 ] unsigned char 
;;  exp2            1   43[BANK0 ] unsigned char 
;;  sign            1   42[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   32[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;;		_Rs232Conf
;;		___ftsub
;; This function uses a non-reentrant model
;;
psect	text479
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftadd.c"
	line	87
	global	__size_of___ftadd
	__size_of___ftadd	equ	__end_of___ftadd-___ftadd
	
___ftadd:	
	opt	stack 5
; Regs used in ___ftadd: [wreg+status,2+status,0+pclath+cstack]
	line	90
	
l5039:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftadd@f1),w
	movwf	((??___ftadd+0)+0)
	movf	(___ftadd@f1+1),w
	movwf	((??___ftadd+0)+0+1)
	movf	(___ftadd@f1+2),w
	movwf	((??___ftadd+0)+0+2)
	clrc
	rlf	(??___ftadd+0)+1,w
	rlf	(??___ftadd+0)+2,w
	movwf	(??___ftadd+3)+0
	movf	(??___ftadd+3)+0,w
	movwf	(___ftadd@exp1)
	line	91
	movf	(___ftadd@f2),w
	movwf	((??___ftadd+0)+0)
	movf	(___ftadd@f2+1),w
	movwf	((??___ftadd+0)+0+1)
	movf	(___ftadd@f2+2),w
	movwf	((??___ftadd+0)+0+2)
	clrc
	rlf	(??___ftadd+0)+1,w
	rlf	(??___ftadd+0)+2,w
	movwf	(??___ftadd+3)+0
	movf	(??___ftadd+3)+0,w
	movwf	(___ftadd@exp2)
	line	92
	
l5041:	
	movf	(___ftadd@exp1),w
	skipz
	goto	u2940
	goto	l5047
u2940:
	
l5043:	
	movf	(___ftadd@exp2),w
	subwf	(___ftadd@exp1),w
	skipnc
	goto	u2951
	goto	u2950
u2951:
	goto	l5051
u2950:
	
l5045:	
	decf	(___ftadd@exp1),w
	xorlw	0ffh
	addwf	(___ftadd@exp2),w
	movwf	(??___ftadd+0)+0
	movlw	(019h)
	subwf	0+(??___ftadd+0)+0,w
	skipc
	goto	u2961
	goto	u2960
u2961:
	goto	l5051
u2960:
	goto	l5047
	
l2897:	
	line	93
	
l5047:	
	movf	(___ftadd@f2),w
	movwf	(?___ftadd)
	movf	(___ftadd@f2+1),w
	movwf	(?___ftadd+1)
	movf	(___ftadd@f2+2),w
	movwf	(?___ftadd+2)
	goto	l2898
	
l5049:	
	goto	l2898
	
l2895:	
	line	94
	
l5051:	
	movf	(___ftadd@exp2),w
	skipz
	goto	u2970
	goto	l2901
u2970:
	
l5053:	
	movf	(___ftadd@exp1),w
	subwf	(___ftadd@exp2),w
	skipnc
	goto	u2981
	goto	u2980
u2981:
	goto	l5057
u2980:
	
l5055:	
	decf	(___ftadd@exp2),w
	xorlw	0ffh
	addwf	(___ftadd@exp1),w
	movwf	(??___ftadd+0)+0
	movlw	(019h)
	subwf	0+(??___ftadd+0)+0,w
	skipc
	goto	u2991
	goto	u2990
u2991:
	goto	l5057
u2990:
	
l2901:	
	line	95
	goto	l2898
	
l2899:	
	line	96
	
l5057:	
	movlw	(06h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	movwf	(___ftadd@sign)
	line	97
	
l5059:	
	btfss	(___ftadd@f1+2),(23)&7
	goto	u3001
	goto	u3000
u3001:
	goto	l2902
u3000:
	line	98
	
l5061:	
	bsf	(___ftadd@sign)+(7/8),(7)&7
	
l2902:	
	line	99
	btfss	(___ftadd@f2+2),(23)&7
	goto	u3011
	goto	u3010
u3011:
	goto	l2903
u3010:
	line	100
	
l5063:	
	bsf	(___ftadd@sign)+(6/8),(6)&7
	
l2903:	
	line	101
	bsf	(___ftadd@f1)+(15/8),(15)&7
	line	102
	
l5065:	
	movlw	0FFh
	andwf	(___ftadd@f1),f
	movlw	0FFh
	andwf	(___ftadd@f1+1),f
	movlw	0
	andwf	(___ftadd@f1+2),f
	line	103
	
l5067:	
	bsf	(___ftadd@f2)+(15/8),(15)&7
	line	104
	movlw	0FFh
	andwf	(___ftadd@f2),f
	movlw	0FFh
	andwf	(___ftadd@f2+1),f
	movlw	0
	andwf	(___ftadd@f2+2),f
	line	106
	movf	(___ftadd@exp2),w
	subwf	(___ftadd@exp1),w
	skipnc
	goto	u3021
	goto	u3020
u3021:
	goto	l5079
u3020:
	goto	l5069
	line	109
	
l2905:	
	line	110
	
l5069:	
	movlw	01h
u3035:
	clrc
	rlf	(___ftadd@f2),f
	rlf	(___ftadd@f2+1),f
	rlf	(___ftadd@f2+2),f
	addlw	-1
	skipz
	goto	u3035
	line	111
	movlw	low(01h)
	subwf	(___ftadd@exp2),f
	line	112
	
l5071:	
	movf	(___ftadd@exp2),w
	xorwf	(___ftadd@exp1),w
	skipnz
	goto	u3041
	goto	u3040
u3041:
	goto	l5077
u3040:
	
l5073:	
	movlw	low(01h)
	subwf	(___ftadd@sign),f
	movf	((___ftadd@sign)),w
	andlw	07h
	btfss	status,2
	goto	u3051
	goto	u3050
u3051:
	goto	l5069
u3050:
	goto	l5077
	
l2907:	
	goto	l5077
	
l2908:	
	line	113
	goto	l5077
	
l2910:	
	line	114
	
l5075:	
	movlw	01h
u3065:
	clrc
	rrf	(___ftadd@f1+2),f
	rrf	(___ftadd@f1+1),f
	rrf	(___ftadd@f1),f
	addlw	-1
	skipz
	goto	u3065

	line	115
	movlw	(01h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	addwf	(___ftadd@exp1),f
	goto	l5077
	line	116
	
l2909:	
	line	113
	
l5077:	
	movf	(___ftadd@exp1),w
	xorwf	(___ftadd@exp2),w
	skipz
	goto	u3071
	goto	u3070
u3071:
	goto	l5075
u3070:
	goto	l2912
	
l2911:	
	line	117
	goto	l2912
	
l2904:	
	
l5079:	
	movf	(___ftadd@exp1),w
	subwf	(___ftadd@exp2),w
	skipnc
	goto	u3081
	goto	u3080
u3081:
	goto	l2912
u3080:
	goto	l5081
	line	120
	
l2914:	
	line	121
	
l5081:	
	movlw	01h
u3095:
	clrc
	rlf	(___ftadd@f1),f
	rlf	(___ftadd@f1+1),f
	rlf	(___ftadd@f1+2),f
	addlw	-1
	skipz
	goto	u3095
	line	122
	movlw	low(01h)
	subwf	(___ftadd@exp1),f
	line	123
	
l5083:	
	movf	(___ftadd@exp2),w
	xorwf	(___ftadd@exp1),w
	skipnz
	goto	u3101
	goto	u3100
u3101:
	goto	l5089
u3100:
	
l5085:	
	movlw	low(01h)
	subwf	(___ftadd@sign),f
	movf	((___ftadd@sign)),w
	andlw	07h
	btfss	status,2
	goto	u3111
	goto	u3110
u3111:
	goto	l5081
u3110:
	goto	l5089
	
l2916:	
	goto	l5089
	
l2917:	
	line	124
	goto	l5089
	
l2919:	
	line	125
	
l5087:	
	movlw	01h
u3125:
	clrc
	rrf	(___ftadd@f2+2),f
	rrf	(___ftadd@f2+1),f
	rrf	(___ftadd@f2),f
	addlw	-1
	skipz
	goto	u3125

	line	126
	movlw	(01h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	addwf	(___ftadd@exp2),f
	goto	l5089
	line	127
	
l2918:	
	line	124
	
l5089:	
	movf	(___ftadd@exp1),w
	xorwf	(___ftadd@exp2),w
	skipz
	goto	u3131
	goto	u3130
u3131:
	goto	l5087
u3130:
	goto	l2912
	
l2920:	
	goto	l2912
	line	128
	
l2913:	
	line	129
	
l2912:	
	btfss	(___ftadd@sign),(7)&7
	goto	u3141
	goto	u3140
u3141:
	goto	l5093
u3140:
	line	131
	
l5091:	
	movlw	0FFh
	xorwf	(___ftadd@f1),f
	movlw	0FFh
	xorwf	(___ftadd@f1+1),f
	movlw	0FFh
	xorwf	(___ftadd@f1+2),f
	line	132
	movlw	01h
	addwf	(___ftadd@f1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f1+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f1+2),f
	goto	l5093
	line	133
	
l2921:	
	line	134
	
l5093:	
	btfss	(___ftadd@sign),(6)&7
	goto	u3151
	goto	u3150
u3151:
	goto	l5097
u3150:
	line	136
	
l5095:	
	movlw	0FFh
	xorwf	(___ftadd@f2),f
	movlw	0FFh
	xorwf	(___ftadd@f2+1),f
	movlw	0FFh
	xorwf	(___ftadd@f2+2),f
	line	137
	movlw	01h
	addwf	(___ftadd@f2),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f2+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f2+2),f
	goto	l5097
	line	138
	
l2922:	
	line	139
	
l5097:	
	clrf	(___ftadd@sign)
	line	140
	movf	(___ftadd@f1),w
	addwf	(___ftadd@f2),f
	movf	(___ftadd@f1+1),w
	clrz
	skipnc
	incf	(___ftadd@f1+1),w
	skipnz
	goto	u3161
	addwf	(___ftadd@f2+1),f
u3161:
	movf	(___ftadd@f1+2),w
	clrz
	skipnc
	incf	(___ftadd@f1+2),w
	skipnz
	goto	u3162
	addwf	(___ftadd@f2+2),f
u3162:

	line	141
	
l5099:	
	btfss	(___ftadd@f2+2),(23)&7
	goto	u3171
	goto	u3170
u3171:
	goto	l5105
u3170:
	line	142
	
l5101:	
	movlw	0FFh
	xorwf	(___ftadd@f2),f
	movlw	0FFh
	xorwf	(___ftadd@f2+1),f
	movlw	0FFh
	xorwf	(___ftadd@f2+2),f
	line	143
	movlw	01h
	addwf	(___ftadd@f2),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f2+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f2+2),f
	line	144
	
l5103:	
	clrf	(___ftadd@sign)
	bsf	status,0
	rlf	(___ftadd@sign),f
	goto	l5105
	line	145
	
l2923:	
	line	146
	
l5105:	
	movf	(___ftadd@f2),w
	movwf	(?___ftpack)
	movf	(___ftadd@f2+1),w
	movwf	(?___ftpack+1)
	movf	(___ftadd@f2+2),w
	movwf	(?___ftpack+2)
	movf	(___ftadd@exp1),w
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftadd@sign),w
	movwf	(??___ftadd+1)+0
	movf	(??___ftadd+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftadd)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftadd+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftadd+2)
	goto	l2898
	
l5107:	
	line	148
	
l2898:	
	return
	opt stack 0
GLOBAL	__end_of___ftadd
	__end_of___ftadd:
;; =============== function ___ftadd ends ============

	signat	___ftadd,8315
	global	___ftge
psect	text480,local,class=CODE,delta=2
global __ptext480
__ptext480:

;; *************** function ___ftge *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftge.c"
;; Parameters:    Size  Location     Type
;;  ff1             3    4[COMMON] float 
;;  ff2             3    7[COMMON] float 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         6       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       6       0       0       0
;;      Totals:         6       6       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text480
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftge.c"
	line	5
	global	__size_of___ftge
	__size_of___ftge	equ	__end_of___ftge-___ftge
	
___ftge:	
	opt	stack 6
; Regs used in ___ftge: [wreg+status,2+status,0]
	line	6
	
l4995:	
	btfss	(___ftge@ff1+2),(23)&7
	goto	u2861
	goto	u2860
u2861:
	goto	l4999
u2860:
	line	7
	
l4997:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??___ftge+0)+0)
	movlw	0
	movwf	((??___ftge+0)+0+1)
	movlw	080h
	movwf	((??___ftge+0)+0+2)
	comf	(___ftge@ff1),w
	movwf	(??___ftge+3)+0
	comf	(___ftge@ff1+1),w
	movwf	((??___ftge+3)+0+1)
	comf	(___ftge@ff1+2),w
	movwf	((??___ftge+3)+0+2)
	incf	(??___ftge+3)+0,f
	skipnz
	incf	((??___ftge+3)+0+1),f
	skipnz
	incf	((??___ftge+3)+0+2),f
	movf	0+(??___ftge+3)+0,w
	addwf	(??___ftge+0)+0,f
	movf	1+(??___ftge+3)+0,w
	skipnc
	incfsz	1+(??___ftge+3)+0,w
	goto	u2871
	goto	u2872
u2871:
	addwf	(??___ftge+0)+1,f
	
u2872:
	movf	2+(??___ftge+3)+0,w
	skipnc
	incfsz	2+(??___ftge+3)+0,w
	goto	u2873
	goto	u2874
u2873:
	addwf	(??___ftge+0)+2,f
	
u2874:
	movf	0+(??___ftge+0)+0,w
	movwf	(___ftge@ff1)
	movf	1+(??___ftge+0)+0,w
	movwf	(___ftge@ff1+1)
	movf	2+(??___ftge+0)+0,w
	movwf	(___ftge@ff1+2)
	goto	l4999
	
l3018:	
	line	8
	
l4999:	
	btfss	(___ftge@ff2+2),(23)&7
	goto	u2881
	goto	u2880
u2881:
	goto	l5003
u2880:
	line	9
	
l5001:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??___ftge+0)+0)
	movlw	0
	movwf	((??___ftge+0)+0+1)
	movlw	080h
	movwf	((??___ftge+0)+0+2)
	comf	(___ftge@ff2),w
	movwf	(??___ftge+3)+0
	comf	(___ftge@ff2+1),w
	movwf	((??___ftge+3)+0+1)
	comf	(___ftge@ff2+2),w
	movwf	((??___ftge+3)+0+2)
	incf	(??___ftge+3)+0,f
	skipnz
	incf	((??___ftge+3)+0+1),f
	skipnz
	incf	((??___ftge+3)+0+2),f
	movf	0+(??___ftge+3)+0,w
	addwf	(??___ftge+0)+0,f
	movf	1+(??___ftge+3)+0,w
	skipnc
	incfsz	1+(??___ftge+3)+0,w
	goto	u2891
	goto	u2892
u2891:
	addwf	(??___ftge+0)+1,f
	
u2892:
	movf	2+(??___ftge+3)+0,w
	skipnc
	incfsz	2+(??___ftge+3)+0,w
	goto	u2893
	goto	u2894
u2893:
	addwf	(??___ftge+0)+2,f
	
u2894:
	movf	0+(??___ftge+0)+0,w
	movwf	(___ftge@ff2)
	movf	1+(??___ftge+0)+0,w
	movwf	(___ftge@ff2+1)
	movf	2+(??___ftge+0)+0,w
	movwf	(___ftge@ff2+2)
	goto	l5003
	
l3019:	
	line	10
	
l5003:	
	movlw	080h
	xorwf	(___ftge@ff1+2),f
	line	11
	
l5005:	
	movlw	080h
	xorwf	(___ftge@ff2+2),f
	line	12
	
l5007:	
	movf	(___ftge@ff2+2),w
	subwf	(___ftge@ff1+2),w
	skipz
	goto	u2905
	movf	(___ftge@ff2+1),w
	subwf	(___ftge@ff1+1),w
	skipz
	goto	u2905
	movf	(___ftge@ff2),w
	subwf	(___ftge@ff1),w
u2905:
	skipnc
	goto	u2901
	goto	u2900
u2901:
	goto	l5011
u2900:
	
l5009:	
	clrc
	
	goto	l3020
	
l4849:	
	
l5011:	
	setc
	
	goto	l3020
	
l4851:	
	goto	l3020
	
l5013:	
	line	13
	
l3020:	
	return
	opt stack 0
GLOBAL	__end_of___ftge
	__end_of___ftge:
;; =============== function ___ftge ends ============

	signat	___ftge,8312
	global	___ftneg
psect	text481,local,class=CODE,delta=2
global __ptext481
__ptext481:

;; *************** function ___ftneg *****************
;; Defined at:
;;		line 16 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftneg.c"
;; Parameters:    Size  Location     Type
;;  f1              3   22[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3   22[BANK0 ] float 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text481
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftneg.c"
	line	16
	global	__size_of___ftneg
	__size_of___ftneg	equ	__end_of___ftneg-___ftneg
	
___ftneg:	
	opt	stack 6
; Regs used in ___ftneg: [wreg]
	line	17
	
l4987:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftneg@f1+2),w
	iorwf	(___ftneg@f1+1),w
	iorwf	(___ftneg@f1),w
	skipnz
	goto	u2851
	goto	u2850
u2851:
	goto	l4991
u2850:
	line	18
	
l4989:	
	movlw	080h
	xorwf	(___ftneg@f1+2),f
	goto	l4991
	
l3014:	
	line	19
	
l4991:	
	goto	l3015
	
l4993:	
	line	20
	
l3015:	
	return
	opt stack 0
GLOBAL	__end_of___ftneg
	__end_of___ftneg:
;; =============== function ___ftneg ends ============

	signat	___ftneg,4219
	global	___fttol
psect	text482,local,class=CODE,delta=2
global __ptext482
__ptext482:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  lval            4   17[BANK0 ] unsigned long 
;;  exp1            1   21[BANK0 ] unsigned char 
;;  sign1           1   16[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    8[BANK0 ] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      14       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_Rs232Conf
;; This function uses a non-reentrant model
;;
psect	text482
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 6
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l4935:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	clrc
	rlf	(??___fttol+0)+1,w
	rlf	(??___fttol+0)+2,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@exp1)
	movf	((___fttol@exp1)),f
	skipz
	goto	u2741
	goto	u2740
u2741:
	goto	l4941
u2740:
	line	50
	
l4937:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l2961
	
l4939:	
	goto	l2961
	
l2960:	
	line	51
	
l4941:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u2755:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u2750:
	addlw	-1
	skipz
	goto	u2755
	movf	0+(??___fttol+0)+0,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l4943:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l4945:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l4947:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l4949:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l4951:	
	btfss	(___fttol@exp1),7
	goto	u2761
	goto	u2760
u2761:
	goto	l4961
u2760:
	line	57
	
l4953:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u2771
	goto	u2770
u2771:
	goto	l4959
u2770:
	line	58
	
l4955:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l2961
	
l4957:	
	goto	l2961
	
l2963:	
	goto	l4959
	line	59
	
l2964:	
	line	60
	
l4959:	
	movlw	01h
u2785:
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	addlw	-1
	skipz
	goto	u2785

	line	61
	movlw	(01h)
	movwf	(??___fttol+0)+0
	movf	(??___fttol+0)+0,w
	addwf	(___fttol@exp1),f
	btfss	status,2
	goto	u2791
	goto	u2790
u2791:
	goto	l4959
u2790:
	goto	l4971
	
l2965:	
	line	62
	goto	l4971
	
l2962:	
	line	63
	
l4961:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u2801
	goto	u2800
u2801:
	goto	l4969
u2800:
	line	64
	
l4963:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l2961
	
l4965:	
	goto	l2961
	
l2967:	
	line	65
	goto	l4969
	
l2969:	
	line	66
	
l4967:	
	movlw	01h
	movwf	(??___fttol+0)+0
u2815:
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	decfsz	(??___fttol+0)+0
	goto	u2815
	line	67
	movlw	low(01h)
	subwf	(___fttol@exp1),f
	goto	l4969
	line	68
	
l2968:	
	line	65
	
l4969:	
	movf	(___fttol@exp1),f
	skipz
	goto	u2821
	goto	u2820
u2821:
	goto	l4967
u2820:
	goto	l4971
	
l2970:	
	goto	l4971
	line	69
	
l2966:	
	line	70
	
l4971:	
	movf	(___fttol@sign1),w
	skipz
	goto	u2830
	goto	l4975
u2830:
	line	71
	
l4973:	
	comf	(___fttol@lval),f
	comf	(___fttol@lval+1),f
	comf	(___fttol@lval+2),f
	comf	(___fttol@lval+3),f
	incf	(___fttol@lval),f
	skipnz
	incf	(___fttol@lval+1),f
	skipnz
	incf	(___fttol@lval+2),f
	skipnz
	incf	(___fttol@lval+3),f
	goto	l4975
	
l2971:	
	line	72
	
l4975:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	goto	l2961
	
l4977:	
	line	73
	
l2961:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___lmul
psect	text483,local,class=CODE,delta=2
global __ptext483
__ptext483:

;; *************** function ___lmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[BANK0 ] unsigned long 
;;  multiplicand    4    4[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    5[COMMON] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       8       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         5       8       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Rs232Conf
;; This function uses a non-reentrant model
;;
psect	text483
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lmul.c"
	line	3
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
	opt	stack 5
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	4
	
l4915:	
	movlw	0
	movwf	(___lmul@product+3)
	movlw	0
	movwf	(___lmul@product+2)
	movlw	0
	movwf	(___lmul@product+1)
	movlw	0
	movwf	(___lmul@product)

	goto	l4917
	line	6
	
l2926:	
	line	7
	
l4917:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(___lmul@multiplier),(0)&7
	goto	u2691
	goto	u2690
u2691:
	goto	l4921
u2690:
	line	8
	
l4919:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2701
	addwf	(___lmul@product+1),f
u2701:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2702
	addwf	(___lmul@product+2),f
u2702:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2703
	addwf	(___lmul@product+3),f
u2703:

	goto	l4921
	
l2927:	
	line	9
	
l4921:	
	movlw	01h
	movwf	(??___lmul+0)+0
u2715:
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	decfsz	(??___lmul+0)+0
	goto	u2715
	line	10
	
l4923:	
	movlw	01h
u2725:
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	addlw	-1
	skipz
	goto	u2725

	line	11
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u2731
	goto	u2730
u2731:
	goto	l4917
u2730:
	goto	l4925
	
l2928:	
	line	12
	
l4925:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	goto	l2929
	
l4927:	
	line	13
	
l2929:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
;; =============== function ___lmul ends ============

	signat	___lmul,8316
	global	___ftpack
psect	text484,local,class=CODE,delta=2
global __ptext484
__ptext484:

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 63 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3    4[COMMON] unsigned um
;;  exp             1    7[COMMON] unsigned char 
;;  sign            1    8[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    4[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         5       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         5       3       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftadd
;;		___ftdiv
;;		___ftmul
;;		___lbtoft
;;		___awtoft
;;		___lwtoft
;;		___altoft
;;		___abtoft
;;		___lltoft
;;		___attoft
;;		___lttoft
;; This function uses a non-reentrant model
;;
psect	text484
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 5
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l4885:	
	movf	(___ftpack@exp),w
	skipz
	goto	u2580
	goto	l4889
u2580:
	
l4887:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u2591
	goto	u2590
u2591:
	goto	l4895
u2590:
	goto	l4889
	
l3185:	
	line	65
	
l4889:	
	movlw	0x0
	movwf	(?___ftpack)
	movlw	0x0
	movwf	(?___ftpack+1)
	movlw	0x0
	movwf	(?___ftpack+2)
	goto	l3186
	
l4891:	
	goto	l3186
	
l3183:	
	line	66
	goto	l4895
	
l3188:	
	line	67
	
l4893:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	68
	movlw	01h
u2605:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2605

	goto	l4895
	line	69
	
l3187:	
	line	66
	
l4895:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2611
	goto	u2610
u2611:
	goto	l4893
u2610:
	goto	l3190
	
l3189:	
	line	70
	goto	l3190
	
l3191:	
	line	71
	
l4897:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	72
	
l4899:	
	movlw	01h
	addwf	(___ftpack@arg),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+2),f
	line	73
	
l4901:	
	movlw	01h
u2625:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2625

	line	74
	
l3190:	
	line	70
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2631
	goto	u2630
u2631:
	goto	l4897
u2630:
	goto	l4905
	
l3192:	
	line	75
	goto	l4905
	
l3194:	
	line	76
	
l4903:	
	movlw	low(01h)
	subwf	(___ftpack@exp),f
	line	77
	movlw	01h
u2645:
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	addlw	-1
	skipz
	goto	u2645
	goto	l4905
	line	78
	
l3193:	
	line	75
	
l4905:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u2651
	goto	u2650
u2651:
	goto	l4903
u2650:
	
l3195:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u2661
	goto	u2660
u2661:
	goto	l3196
u2660:
	line	80
	
l4907:	
	movlw	0FFh
	andwf	(___ftpack@arg),f
	movlw	07Fh
	andwf	(___ftpack@arg+1),f
	movlw	0FFh
	andwf	(___ftpack@arg+2),f
	
l3196:	
	line	81
	clrc
	rrf	(___ftpack@exp),f

	line	82
	
l4909:	
	movf	(___ftpack@exp),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??___ftpack+0)+0)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+2)
	movlw	010h
u2675:
	clrc
	rlf	(??___ftpack+0)+0,f
	rlf	(??___ftpack+0)+1,f
	rlf	(??___ftpack+0)+2,f
u2670:
	addlw	-1
	skipz
	goto	u2675
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l4911:	
	movf	(___ftpack@sign),w
	skipz
	goto	u2680
	goto	l3197
u2680:
	line	84
	
l4913:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l3197:	
	line	85
	line	86
	
l3186:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	___bmul
psect	text485,local,class=CODE,delta=2
global __ptext485
__ptext485:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\bmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    9[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1   24[BANK0 ] unsigned char 
;;  product         1   23[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         1       3       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text485
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 6
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___bmul@multiplier)
	line	4
	
l4871:	
	clrf	(___bmul@product)
	line	6
	
l2845:	
	line	7
	btfss	(___bmul@multiplier),(0)&7
	goto	u2561
	goto	u2560
u2561:
	goto	l4875
u2560:
	line	8
	
l4873:	
	movf	(___bmul@multiplicand),w
	movwf	(??___bmul+0)+0
	movf	(??___bmul+0)+0,w
	addwf	(___bmul@product),f
	goto	l4875
	
l2846:	
	line	9
	
l4875:	
	clrc
	rlf	(___bmul@multiplicand),f

	line	10
	
l4877:	
	clrc
	rrf	(___bmul@multiplier),f

	line	11
	
l4879:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u2571
	goto	u2570
u2571:
	goto	l2845
u2570:
	goto	l4881
	
l2847:	
	line	12
	
l4881:	
	movf	(___bmul@product),w
	goto	l2848
	
l4883:	
	line	13
	
l2848:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_RS232Tx
psect	text486,local,class=CODE,delta=2
global __ptext486
__ptext486:

;; *************** function _RS232Tx *****************
;; Defined at:
;;		line 28 in file "C:\Users\Ricardo\Mestrado\TAC\trab10\Rs232.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR unsigned char 
;;		 -> main@env(7), 
;;  tam             1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  s               1    6[COMMON] PTR unsigned char 
;;		 -> main@env(7), 
;;  m               2    7[COMMON] unsigned short 
;;  k               1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text486
	file	"C:\Users\Ricardo\Mestrado\TAC\trab10\Rs232.c"
	line	28
	global	__size_of_RS232Tx
	__size_of_RS232Tx	equ	__end_of_RS232Tx-_RS232Tx
	
_RS232Tx:	
	opt	stack 6
; Regs used in _RS232Tx: [wreg-fsr0h+status,2+status,0]
;RS232Tx@s stored from wreg
	line	30
	movwf	(RS232Tx@s)
	
l4855:	
;Rs232.c: 30: for(unsigned char k=0; k<tam;k++){
	clrf	(RS232Tx@k)
	goto	l4869
	
l2161:	
	line	31
	
l4857:	
;Rs232.c: 31: TXREG=*(s+k);
	movf	(RS232Tx@k),w
	addwf	(RS232Tx@s),w
	movwf	(??_RS232Tx+0)+0
	movf	0+(??_RS232Tx+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	line	32
	
l4859:	
;Rs232.c: 32: for(unsigned short int m=0;m<500;m++){}
	clrf	(RS232Tx@m)
	clrf	(RS232Tx@m+1)
	
l4861:	
	movlw	high(01F4h)
	subwf	(RS232Tx@m+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(RS232Tx@m),w
	skipc
	goto	u2531
	goto	u2530
u2531:
	goto	l4865
u2530:
	goto	l4867
	
l4863:	
	goto	l4867
	
l2162:	
	
l4865:	
	movlw	low(01h)
	addwf	(RS232Tx@m),f
	skipnc
	incf	(RS232Tx@m+1),f
	movlw	high(01h)
	addwf	(RS232Tx@m+1),f
	movlw	high(01F4h)
	subwf	(RS232Tx@m+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(RS232Tx@m),w
	skipc
	goto	u2541
	goto	u2540
u2541:
	goto	l4865
u2540:
	goto	l4867
	
l2163:	
	line	30
	
l4867:	
	movlw	(01h)
	movwf	(??_RS232Tx+0)+0
	movf	(??_RS232Tx+0)+0,w
	addwf	(RS232Tx@k),f
	goto	l4869
	
l2160:	
	
l4869:	
	movf	(RS232Tx@tam),w
	subwf	(RS232Tx@k),w
	skipc
	goto	u2551
	goto	u2550
u2551:
	goto	l4857
u2550:
	goto	l2165
	
l2164:	
	line	34
	
l2165:	
	return
	opt stack 0
GLOBAL	__end_of_RS232Tx
	__end_of_RS232Tx:
;; =============== function _RS232Tx ends ============

	signat	_RS232Tx,8312
	global	_SPI_Config
psect	text487,local,class=CODE,delta=2
global __ptext487
__ptext487:

;; *************** function _SPI_Config *****************
;; Defined at:
;;		line 16 in file "C:\Users\Ricardo\Mestrado\TAC\trab10\SPI.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text487
	file	"C:\Users\Ricardo\Mestrado\TAC\trab10\SPI.c"
	line	16
	global	__size_of_SPI_Config
	__size_of_SPI_Config	equ	__end_of_SPI_Config-_SPI_Config
	
_SPI_Config:	
	opt	stack 6
; Regs used in _SPI_Config: []
	line	18
	
l4853:	
;SPI.c: 18: TRISC3=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1083/8)^080h,(1083)&7
	line	19
;SPI.c: 19: TRISC4=1;
	bsf	(1084/8)^080h,(1084)&7
	line	20
;SPI.c: 20: TRISC5=0;
	bcf	(1085/8)^080h,(1085)&7
	line	21
;SPI.c: 21: TRISB4=0;
	bcf	(1076/8)^080h,(1076)&7
	line	22
;SPI.c: 22: SSPEN=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(165/8),(165)&7
	line	23
;SPI.c: 23: SSPM0=0;
	bcf	(160/8),(160)&7
	line	24
;SPI.c: 24: SSPM1=0;
	bcf	(161/8),(161)&7
	line	25
;SPI.c: 25: SSPM2=0;
	bcf	(162/8),(162)&7
	line	26
;SPI.c: 26: SSPM3=0;
	bcf	(163/8),(163)&7
	line	27
;SPI.c: 27: CKP=0;
	bcf	(164/8),(164)&7
	line	28
;SPI.c: 28: CKE=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1190/8)^080h,(1190)&7
	line	29
;SPI.c: 29: SMP=0;
	bcf	(1191/8)^080h,(1191)&7
	line	30
;SPI.c: 30: SSPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(165/8),(165)&7
	line	31
;SPI.c: 31: RB4=1;
	bsf	(52/8),(52)&7
	line	32
	
l1403:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_Config
	__end_of_SPI_Config:
;; =============== function _SPI_Config ends ============

	signat	_SPI_Config,88
	global	_RSI
psect	text488,local,class=CODE,delta=2
global __ptext488
__ptext488:

;; *************** function _RSI *****************
;; Defined at:
;;		line 6 in file "C:\Users\Ricardo\Mestrado\TAC\trab10\p10.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text488
	file	"C:\Users\Ricardo\Mestrado\TAC\trab10\p10.c"
	line	6
	global	__size_of_RSI
	__size_of_RSI	equ	__end_of_RSI-_RSI
	
_RSI:	
	opt	stack 4
; Regs used in _RSI: []
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_RSI+0)
	movf	fsr0,w
	movwf	(??_RSI+1)
	movf	pclath,w
	movwf	(??_RSI+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_RSI+3)
	ljmp	_RSI
psect	text488
	line	8
	
i1l3689:	
;p10.c: 8: if(RCIF==1){
	btfss	(101/8),(101)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l694
u1_20:
	line	9
	
i1l3691:	
;p10.c: 9: RCIF=0;
	bcf	(101/8),(101)&7
	goto	i1l694
	line	10
	
i1l693:	
	line	11
	
i1l694:	
	movf	(??_RSI+3),w
	movwf	btemp+1
	movf	(??_RSI+2),w
	movwf	pclath
	movf	(??_RSI+1),w
	movwf	fsr0
	swapf	(??_RSI+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_RSI
	__end_of_RSI:
;; =============== function _RSI ends ============

	signat	_RSI,88
psect	text489,local,class=CODE,delta=2
global __ptext489
__ptext489:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
