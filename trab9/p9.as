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
	FNCALL	_main,_initSPI
	FNCALL	_main,_readStatus
	FNCALL	_main,_escreveByteEEPROM
	FNCALL	_main,_delay
	FNCALL	_main,_lerByteEEPROM
	FNROOT	_main
	global	main@F1109
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\Ricardo\Mestrado\TAC\trab9\p9.c"
	line	5

;initializer for main@F1109
	retlw	034h
	retlw	064h
	retlw	0
	retlw	0
	retlw	0C8h
	retlw	0
	retlw	021h
	retlw	0
	retlw	0
	retlw	0Fh
	global	main@F1111
	global	_SSPBUF
_SSPBUF	set	19
	global	_CARRY
_CARRY	set	24
	global	_CKP
_CKP	set	164
	global	_GIE
_GIE	set	95
	global	_RB4
_RB4	set	52
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
	global	_BF
_BF	set	1184
	global	_CKE
_CKE	set	1190
	global	_SMP
_SMP	set	1191
	global	_TRISB4
_TRISB4	set	1076
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	global	_TRISC5
_TRISC5	set	1085
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
	file	"p9.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
main@F1111:
       ds      10

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\Ricardo\Mestrado\TAC\trab9\p9.c"
main@F1109:
       ds      10

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
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
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+10)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_initSPI
?_initSPI:	; 0 bytes @ 0x0
	global	??_initSPI
??_initSPI:	; 0 bytes @ 0x0
	global	??_readStatus
??_readStatus:	; 0 bytes @ 0x0
	global	?_escreveByteEEPROM
?_escreveByteEEPROM:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	??_delay
??_delay:	; 0 bytes @ 0x0
	global	?_lerByteEEPROM
?_lerByteEEPROM:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_readStatus
?_readStatus:	; 1 bytes @ 0x0
	global	escreveByteEEPROM@len
escreveByteEEPROM@len:	; 1 bytes @ 0x0
	global	lerByteEEPROM@len
lerByteEEPROM@len:	; 1 bytes @ 0x0
	global	delay@i
delay@i:	; 4 bytes @ 0x0
	ds	1
	global	readStatus@lixo
readStatus@lixo:	; 1 bytes @ 0x1
	global	escreveByteEEPROM@posicao
escreveByteEEPROM@posicao:	; 1 bytes @ 0x1
	global	lerByteEEPROM@posicao
lerByteEEPROM@posicao:	; 1 bytes @ 0x1
	ds	1
	global	??_escreveByteEEPROM
??_escreveByteEEPROM:	; 0 bytes @ 0x2
	global	??_lerByteEEPROM
??_lerByteEEPROM:	; 0 bytes @ 0x2
	global	readStatus@status
readStatus@status:	; 1 bytes @ 0x2
	ds	2
	global	escreveByteEEPROM@valor
escreveByteEEPROM@valor:	; 1 bytes @ 0x4
	global	lerByteEEPROM@lixo
lerByteEEPROM@lixo:	; 1 bytes @ 0x4
	ds	1
	global	escreveByteEEPROM@lixo
escreveByteEEPROM@lixo:	; 1 bytes @ 0x5
	global	lerByteEEPROM@destino
lerByteEEPROM@destino:	; 1 bytes @ 0x5
	ds	1
	global	escreveByteEEPROM@i
escreveByteEEPROM@i:	; 1 bytes @ 0x6
	global	lerByteEEPROM@i
lerByteEEPROM@i:	; 1 bytes @ 0x6
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x7
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@env
main@env:	; 10 bytes @ 0x0
	ds	10
	global	main@recp
main@recp:	; 10 bytes @ 0xA
	ds	10
	global	main@idx
main@idx:	; 1 bytes @ 0x14
	ds	1
	global	main@val
main@val:	; 1 bytes @ 0x15
	ds	1
	global	main@tam
main@tam:	; 1 bytes @ 0x16
	ds	1
;;Data sizes: Strings 0, constant 0, data 10, bss 10, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      11
;; BANK0           80     23      43
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lerByteEEPROM@destino	PTR unsigned char  size(1) Largest target is 10
;;		 -> main@recp(BANK0[10]), 
;;
;; escreveByteEEPROM@valor	PTR unsigned char  size(1) Largest target is 10
;;		 -> main@env(BANK0[10]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_escreveByteEEPROM
;;   _main->_lerByteEEPROM
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
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
;; (0) _main                                                27    27      0     486
;;                                              7 COMMON     4     4      0
;;                                              0 BANK0     23    23      0
;;                            _initSPI
;;                         _readStatus
;;                  _escreveByteEEPROM
;;                              _delay
;;                      _lerByteEEPROM
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                4     4      0      47
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _lerByteEEPROM                                        8     6      2     158
;;                                              0 COMMON     7     5      2
;; ---------------------------------------------------------------------------------
;; (1) _escreveByteEEPROM                                    7     5      2     160
;;                                              0 COMMON     7     5      2
;; ---------------------------------------------------------------------------------
;; (1) _readStatus                                           3     3      0      24
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _initSPI                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _initSPI
;;   _readStatus
;;   _escreveByteEEPROM
;;   _delay
;;   _lerByteEEPROM
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
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      37      12        0.0%
;;ABS                  0      0      36       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               50     17      2B       5       53.8%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      B       B       1       78.6%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 4 in file "C:\Users\Ricardo\Mestrado\TAC\trab9\p9.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  recp           10   10[BANK0 ] unsigned char [10]
;;  env            10    0[BANK0 ] unsigned char [10]
;;  tam             1   22[BANK0 ] unsigned char 
;;  val             1   21[BANK0 ] unsigned char 
;;  idx             1   20[BANK0 ] unsigned char 
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
;;      Locals:         0      23       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4      23       0       0       0
;;Total ram usage:       27 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_initSPI
;;		_readStatus
;;		_escreveByteEEPROM
;;		_delay
;;		_lerByteEEPROM
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Ricardo\Mestrado\TAC\trab9\p9.c"
	line	4
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	5
	
l3523:	
;p9.c: 5: unsigned char env[10]={52,100,0,0,200,0,33,0,0,15};
	movlw	(main@env)&0ffh
	movwf	fsr0
	movlw	low(main@F1109)
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	10
	movwf	((??_main+0)+0+2)
u2550:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u2550
	line	6
;p9.c: 6: unsigned char recp[10]={0,0,0,0,0,0,0,0,0,0};
	movlw	(main@recp)&0ffh
	movwf	fsr0
	movlw	low(main@F1111)
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	10
	movwf	((??_main+0)+0+2)
u2560:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u2560
	line	7
	
l3525:	
;p9.c: 7: unsigned char idx = 0,tam=10, val=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@idx)
	
l3527:	
	movlw	(0Ah)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@tam)
	
l3529:	
	clrf	(main@val)
	line	8
	
l3531:	
;p9.c: 8: initSPI();
	fcall	_initSPI
	goto	l3533
	line	9
;p9.c: 9: while(1) {
	
l699:	
	line	10
	
l3533:	
;p9.c: 10: val = readStatus();
	fcall	_readStatus
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@val)
	line	11
	
l3535:	
;p9.c: 11: escreveByteEEPROM(&env[0],tam,0x30);
	movf	(main@tam),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_escreveByteEEPROM)
	movlw	(030h)
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	0+(?_escreveByteEEPROM)+01h
	movlw	(main@env)&0ffh
	fcall	_escreveByteEEPROM
	line	12
	
l3537:	
;p9.c: 12: delay();
	fcall	_delay
	line	13
	
l3539:	
;p9.c: 13: lerByteEEPROM(&recp[0],tam,0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@tam),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_lerByteEEPROM)
	movlw	(030h)
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	0+(?_lerByteEEPROM)+01h
	movlw	(main@recp)&0ffh
	fcall	_lerByteEEPROM
	goto	l3533
	line	15
	
l700:	
	line	9
	goto	l3533
	
l701:	
	line	16
	
l702:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_delay
psect	text187,local,class=CODE,delta=2
global __ptext187
__ptext187:

;; *************** function _delay *****************
;; Defined at:
;;		line 210 in file "C:\Users\Ricardo\Mestrado\TAC\trab9\SPI.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               4    0[COMMON] unsigned long 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text187
	file	"C:\Users\Ricardo\Mestrado\TAC\trab9\SPI.c"
	line	210
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg]
	line	211
	
l3517:	
;SPI.c: 211: unsigned long i = 0;
	movlw	0
	movwf	(delay@i+3)
	movlw	0
	movwf	(delay@i+2)
	movlw	0
	movwf	(delay@i+1)
	movlw	0
	movwf	(delay@i)

	line	212
;SPI.c: 212: for(i=0;i<50000;i++)
	movlw	0
	movwf	(delay@i+3)
	movlw	0
	movwf	(delay@i+2)
	movlw	0
	movwf	(delay@i+1)
	movlw	0
	movwf	(delay@i)

	movlw	0
	subwf	(delay@i+3),w
	skipz
	goto	u2535
	movlw	0
	subwf	(delay@i+2),w
	skipz
	goto	u2535
	movlw	0C3h
	subwf	(delay@i+1),w
	skipz
	goto	u2535
	movlw	050h
	subwf	(delay@i),w
u2535:
	skipc
	goto	u2531
	goto	u2530
u2531:
	goto	l1446
u2530:
	goto	l1448
	
l3519:	
	goto	l1448
	line	213
	
l1446:	
	line	214
;SPI.c: 213: {
;SPI.c: 214: _nop();
	nop
	line	212
	
l3521:	
	movlw	01h
	addwf	(delay@i),f
	movlw	0
	skipnc
movlw 1
	addwf	(delay@i+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(delay@i+2),f
	movlw	0
	skipnc
movlw 1
	addwf	(delay@i+3),f
	movlw	0
	subwf	(delay@i+3),w
	skipz
	goto	u2545
	movlw	0
	subwf	(delay@i+2),w
	skipz
	goto	u2545
	movlw	0C3h
	subwf	(delay@i+1),w
	skipz
	goto	u2545
	movlw	050h
	subwf	(delay@i),w
u2545:
	skipc
	goto	u2541
	goto	u2540
u2541:
	goto	l1446
u2540:
	goto	l1448
	
l1447:	
	line	216
	
l1448:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,88
	global	_lerByteEEPROM
psect	text188,local,class=CODE,delta=2
global __ptext188
__ptext188:

;; *************** function _lerByteEEPROM *****************
;; Defined at:
;;		line 157 in file "C:\Users\Ricardo\Mestrado\TAC\trab9\SPI.c"
;; Parameters:    Size  Location     Type
;;  destino         1    wreg     PTR unsigned char 
;;		 -> main@recp(10), 
;;  len             1    0[COMMON] unsigned char 
;;  posicao         1    1[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  destino         1    5[COMMON] PTR unsigned char 
;;		 -> main@recp(10), 
;;  i               1    6[COMMON] unsigned char 
;;  lixo            1    4[COMMON] unsigned char 
;;  byte            1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text188
	file	"C:\Users\Ricardo\Mestrado\TAC\trab9\SPI.c"
	line	157
	global	__size_of_lerByteEEPROM
	__size_of_lerByteEEPROM	equ	__end_of_lerByteEEPROM-_lerByteEEPROM
	
_lerByteEEPROM:	
	opt	stack 7
; Regs used in _lerByteEEPROM: [wreg-fsr0h+status,2+status,0]
;lerByteEEPROM@destino stored from wreg
	line	161
	movwf	(lerByteEEPROM@destino)
	
l3495:	
;SPI.c: 158: unsigned char byte;
;SPI.c: 159: unsigned char lixo;
;SPI.c: 161: for(unsigned char i=0;i++;i<len){
	clrf	(lerByteEEPROM@i)
	goto	l3515
	
l1426:	
	line	162
;SPI.c: 162: RB4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
	line	163
	
l3497:	
;SPI.c: 163: SSPBUF = 0x03;
	movlw	(03h)
	movwf	(19)	;volatile
	line	164
;SPI.c: 164: while(BF==0);
	goto	l1427
	
l1428:	
	
l1427:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u2481
	goto	u2480
u2481:
	goto	l1427
u2480:
	goto	l3499
	
l1429:	
	line	165
	
l3499:	
;SPI.c: 165: lixo = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_lerByteEEPROM+0)+0
	movf	(??_lerByteEEPROM+0)+0,w
	movwf	(lerByteEEPROM@lixo)
	line	166
	
l3501:	
;SPI.c: 166: SSPBUF = (posicao+i)>>8;
	movf	(lerByteEEPROM@posicao),w
	addwf	(lerByteEEPROM@i),w
	movwf	(??_lerByteEEPROM+0)+0
	clrf	(??_lerByteEEPROM+0)+0+1
	rlf	1+(??_lerByteEEPROM+0)+0,f
	
	movf	1+(??_lerByteEEPROM+0)+0,w
	movwf	(19)	;volatile
	line	167
;SPI.c: 167: while(BF==0);
	goto	l1430
	
l1431:	
	
l1430:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u2491
	goto	u2490
u2491:
	goto	l1430
u2490:
	goto	l3503
	
l1432:	
	line	168
	
l3503:	
;SPI.c: 168: lixo = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_lerByteEEPROM+0)+0
	movf	(??_lerByteEEPROM+0)+0,w
	movwf	(lerByteEEPROM@lixo)
	line	169
	
l3505:	
;SPI.c: 169: SSPBUF = (posicao+i)&0xFF;
	movf	(lerByteEEPROM@i),w
	addwf	(lerByteEEPROM@posicao),w
	movwf	(19)	;volatile
	line	170
;SPI.c: 170: while(BF==0);
	goto	l1433
	
l1434:	
	
l1433:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u2501
	goto	u2500
u2501:
	goto	l1433
u2500:
	goto	l3507
	
l1435:	
	line	171
	
l3507:	
;SPI.c: 171: lixo = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_lerByteEEPROM+0)+0
	movf	(??_lerByteEEPROM+0)+0,w
	movwf	(lerByteEEPROM@lixo)
	line	172
	
l3509:	
;SPI.c: 172: SSPBUF = 0x00;
	clrf	(19)	;volatile
	line	173
;SPI.c: 173: while(BF==0);
	goto	l1436
	
l1437:	
	
l1436:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u2511
	goto	u2510
u2511:
	goto	l1436
u2510:
	goto	l3511
	
l1438:	
	line	174
	
l3511:	
;SPI.c: 174: *(destino+i) = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_lerByteEEPROM+0)+0
	movf	(lerByteEEPROM@i),w
	addwf	(lerByteEEPROM@destino),w
	movwf	(??_lerByteEEPROM+1)+0
	movf	0+(??_lerByteEEPROM+1)+0,w
	movwf	fsr0
	movf	(??_lerByteEEPROM+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	175
	
l3513:	
;SPI.c: 175: RB4 = 1;
	bsf	(52/8),(52)&7
	goto	l3515
	line	161
	
l1425:	
	
l3515:	
	movlw	(01h)
	movwf	(??_lerByteEEPROM+0)+0
	movf	(??_lerByteEEPROM+0)+0,w
	addwf	(lerByteEEPROM@i),f
	movf	((lerByteEEPROM@i)),w
	xorlw	01h
	skipz
	goto	u2521
	goto	u2520
u2521:
	goto	l1426
u2520:
	goto	l1440
	
l1439:	
	line	177
	
l1440:	
	return
	opt stack 0
GLOBAL	__end_of_lerByteEEPROM
	__end_of_lerByteEEPROM:
;; =============== function _lerByteEEPROM ends ============

	signat	_lerByteEEPROM,12408
	global	_escreveByteEEPROM
psect	text189,local,class=CODE,delta=2
global __ptext189
__ptext189:

;; *************** function _escreveByteEEPROM *****************
;; Defined at:
;;		line 123 in file "C:\Users\Ricardo\Mestrado\TAC\trab9\SPI.c"
;; Parameters:    Size  Location     Type
;;  valor           1    wreg     PTR unsigned char 
;;		 -> main@env(10), 
;;  len             1    0[COMMON] unsigned char 
;;  posicao         1    1[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  valor           1    4[COMMON] PTR unsigned char 
;;		 -> main@env(10), 
;;  i               1    6[COMMON] unsigned char 
;;  lixo            1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text189
	file	"C:\Users\Ricardo\Mestrado\TAC\trab9\SPI.c"
	line	123
	global	__size_of_escreveByteEEPROM
	__size_of_escreveByteEEPROM	equ	__end_of_escreveByteEEPROM-_escreveByteEEPROM
	
_escreveByteEEPROM:	
	opt	stack 7
; Regs used in _escreveByteEEPROM: [wreg-fsr0h+status,2+status,0]
;escreveByteEEPROM@valor stored from wreg
	line	125
	movwf	(escreveByteEEPROM@valor)
	
l3467:	
;SPI.c: 124: unsigned char lixo;
;SPI.c: 125: for(unsigned char i=0;i++;i<len){
	clrf	(escreveByteEEPROM@i)
	goto	l3493
	
l1405:	
	line	126
;SPI.c: 126: RB4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
	line	127
	
l3469:	
;SPI.c: 127: SSPBUF = 0x06;
	movlw	(06h)
	movwf	(19)	;volatile
	line	128
;SPI.c: 128: while(BF==0);
	goto	l1406
	
l1407:	
	
l1406:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u2421
	goto	u2420
u2421:
	goto	l1406
u2420:
	goto	l3471
	
l1408:	
	line	129
	
l3471:	
;SPI.c: 129: lixo = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_escreveByteEEPROM+0)+0
	movf	(??_escreveByteEEPROM+0)+0,w
	movwf	(escreveByteEEPROM@lixo)
	line	130
	
l3473:	
;SPI.c: 130: RB4 = 1;
	bsf	(52/8),(52)&7
	line	131
	
l3475:	
;SPI.c: 131: RB4 = 0;
	bcf	(52/8),(52)&7
	line	132
;SPI.c: 132: SSPBUF = 0x02;
	movlw	(02h)
	movwf	(19)	;volatile
	line	133
;SPI.c: 133: while(BF==0);
	goto	l1409
	
l1410:	
	
l1409:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u2431
	goto	u2430
u2431:
	goto	l1409
u2430:
	goto	l3477
	
l1411:	
	line	134
	
l3477:	
;SPI.c: 134: lixo = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_escreveByteEEPROM+0)+0
	movf	(??_escreveByteEEPROM+0)+0,w
	movwf	(escreveByteEEPROM@lixo)
	line	135
	
l3479:	
;SPI.c: 135: SSPBUF = (posicao+i)>>8;
	movf	(escreveByteEEPROM@posicao),w
	addwf	(escreveByteEEPROM@i),w
	movwf	(??_escreveByteEEPROM+0)+0
	clrf	(??_escreveByteEEPROM+0)+0+1
	rlf	1+(??_escreveByteEEPROM+0)+0,f
	
	movf	1+(??_escreveByteEEPROM+0)+0,w
	movwf	(19)	;volatile
	line	136
;SPI.c: 136: while(BF==0);
	goto	l1412
	
l1413:	
	
l1412:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u2441
	goto	u2440
u2441:
	goto	l1412
u2440:
	goto	l3481
	
l1414:	
	line	137
	
l3481:	
;SPI.c: 137: lixo = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_escreveByteEEPROM+0)+0
	movf	(??_escreveByteEEPROM+0)+0,w
	movwf	(escreveByteEEPROM@lixo)
	line	138
	
l3483:	
;SPI.c: 138: SSPBUF = (posicao+i)&0xFF;
	movf	(escreveByteEEPROM@i),w
	addwf	(escreveByteEEPROM@posicao),w
	movwf	(19)	;volatile
	line	139
;SPI.c: 139: while(BF==0);
	goto	l1415
	
l1416:	
	
l1415:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u2451
	goto	u2450
u2451:
	goto	l1415
u2450:
	goto	l3485
	
l1417:	
	line	140
	
l3485:	
;SPI.c: 140: lixo = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_escreveByteEEPROM+0)+0
	movf	(??_escreveByteEEPROM+0)+0,w
	movwf	(escreveByteEEPROM@lixo)
	line	141
	
l3487:	
;SPI.c: 141: SSPBUF = *(valor+i);
	movf	(escreveByteEEPROM@i),w
	addwf	(escreveByteEEPROM@valor),w
	movwf	(??_escreveByteEEPROM+0)+0
	movf	0+(??_escreveByteEEPROM+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(19)	;volatile
	line	142
;SPI.c: 142: while(BF==0);
	goto	l1418
	
l1419:	
	
l1418:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u2461
	goto	u2460
u2461:
	goto	l1418
u2460:
	goto	l3489
	
l1420:	
	line	143
	
l3489:	
;SPI.c: 143: lixo = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_escreveByteEEPROM+0)+0
	movf	(??_escreveByteEEPROM+0)+0,w
	movwf	(escreveByteEEPROM@lixo)
	line	144
	
l3491:	
;SPI.c: 144: RB4 = 1;
	bsf	(52/8),(52)&7
	goto	l3493
	line	125
	
l1404:	
	
l3493:	
	movlw	(01h)
	movwf	(??_escreveByteEEPROM+0)+0
	movf	(??_escreveByteEEPROM+0)+0,w
	addwf	(escreveByteEEPROM@i),f
	movf	((escreveByteEEPROM@i)),w
	xorlw	01h
	skipz
	goto	u2471
	goto	u2470
u2471:
	goto	l1405
u2470:
	goto	l1422
	
l1421:	
	line	146
	
l1422:	
	return
	opt stack 0
GLOBAL	__end_of_escreveByteEEPROM
	__end_of_escreveByteEEPROM:
;; =============== function _escreveByteEEPROM ends ============

	signat	_escreveByteEEPROM,12408
	global	_readStatus
psect	text190,local,class=CODE,delta=2
global __ptext190
__ptext190:

;; *************** function _readStatus *****************
;; Defined at:
;;		line 86 in file "C:\Users\Ricardo\Mestrado\TAC\trab9\SPI.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  status          1    2[COMMON] unsigned char 
;;  lixo            1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text190
	file	"C:\Users\Ricardo\Mestrado\TAC\trab9\SPI.c"
	line	86
	global	__size_of_readStatus
	__size_of_readStatus	equ	__end_of_readStatus-_readStatus
	
_readStatus:	
	opt	stack 7
; Regs used in _readStatus: [wreg+status,2]
	line	89
	
l3453:	
;SPI.c: 87: unsigned char lixo;
;SPI.c: 88: unsigned char status;
;SPI.c: 89: RB4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
	line	91
	
l3455:	
;SPI.c: 91: SSPBUF = 0x05;
	movlw	(05h)
	movwf	(19)	;volatile
	line	92
;SPI.c: 92: while(BF==0);
	goto	l1389
	
l1390:	
	
l1389:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l1389
u2400:
	goto	l3457
	
l1391:	
	line	93
	
l3457:	
;SPI.c: 93: lixo = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_readStatus+0)+0
	movf	(??_readStatus+0)+0,w
	movwf	(readStatus@lixo)
	line	94
	
l3459:	
;SPI.c: 94: SSPBUF = 0x00;
	clrf	(19)	;volatile
	line	95
;SPI.c: 95: while(BF==0);
	goto	l1392
	
l1393:	
	
l1392:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l1392
u2410:
	goto	l3461
	
l1394:	
	line	96
	
l3461:	
;SPI.c: 96: status = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_readStatus+0)+0
	movf	(??_readStatus+0)+0,w
	movwf	(readStatus@status)
	line	97
	
l3463:	
;SPI.c: 97: RB4 = 1;
	bsf	(52/8),(52)&7
	line	98
;SPI.c: 98: return status;
	movf	(readStatus@status),w
	goto	l1395
	
l3465:	
	line	99
	
l1395:	
	return
	opt stack 0
GLOBAL	__end_of_readStatus
	__end_of_readStatus:
;; =============== function _readStatus ends ============

	signat	_readStatus,89
	global	_initSPI
psect	text191,local,class=CODE,delta=2
global __ptext191
__ptext191:

;; *************** function _initSPI *****************
;; Defined at:
;;		line 185 in file "C:\Users\Ricardo\Mestrado\TAC\trab9\SPI.c"
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text191
	file	"C:\Users\Ricardo\Mestrado\TAC\trab9\SPI.c"
	line	185
	global	__size_of_initSPI
	__size_of_initSPI	equ	__end_of_initSPI-_initSPI
	
_initSPI:	
	opt	stack 7
; Regs used in _initSPI: []
	line	186
	
l3451:	
;SPI.c: 186: TRISC4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1084/8)^080h,(1084)&7
	line	187
;SPI.c: 187: TRISC5 = 0;
	bcf	(1085/8)^080h,(1085)&7
	line	188
;SPI.c: 188: TRISC3 = 0;
	bcf	(1083/8)^080h,(1083)&7
	line	189
;SPI.c: 189: TRISB4 = 0;
	bcf	(1076/8)^080h,(1076)&7
	line	190
;SPI.c: 190: RB4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(52/8),(52)&7
	line	192
;SPI.c: 192: SMP = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1191/8)^080h,(1191)&7
	line	193
;SPI.c: 193: CKE = 1;
	bsf	(1190/8)^080h,(1190)&7
	line	196
;SPI.c: 196: SSPEN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(165/8),(165)&7
	line	197
;SPI.c: 197: CKP = 0;
	bcf	(164/8),(164)&7
	line	198
;SPI.c: 198: SSPM3 = 0;
	bcf	(163/8),(163)&7
	line	199
;SPI.c: 199: SSPM2 = 0;
	bcf	(162/8),(162)&7
	line	200
;SPI.c: 200: SSPM1 = 0;
	bcf	(161/8),(161)&7
	line	201
;SPI.c: 201: SSPM0 = 0;
	bcf	(160/8),(160)&7
	line	202
;SPI.c: 202: RB4=1;
	bsf	(52/8),(52)&7
	line	203
	
l1443:	
	return
	opt stack 0
GLOBAL	__end_of_initSPI
	__end_of_initSPI:
;; =============== function _initSPI ends ============

	signat	_initSPI,88
psect	text192,local,class=CODE,delta=2
global __ptext192
__ptext192:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
