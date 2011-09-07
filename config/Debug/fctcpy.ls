   1                     ;	MOVEABLE CODE INITIALIZATION
   2                     ;	Copyright (c) 2006 by COSMIC Software
   3                     ;
   4                     	xdef	__fctcpy
   5                     	xref	__idesc__
   6                     	xref.b	c_x
   8                     ;
   9  0000               __fctcpy:
  10  0000 ae0000        	ldw	x,#__idesc__		; start address
  11  0003               ibcl:
  12  0003 e602          	ld	a,(2,x)			; test flag byte
  13  0005 2723          	jreq	cend			; no more segment
  14  0007 a560          	bcp	a,#$60			; test for moveable code segment
  15  0009 2705          	jreq	cseg			; yes, copy it
  16  000b 1c0005        	addw	x,#5			; next descriptor
  17  000e 20f3          	jra	ibcl			; and loop
  18  0010               cseg:
  19  0010 9093          	ldw	y,x			; move end
  20  0012 90ee05        	ldw	y,(5,y)			; address in
  21  0015 90bf00        	ldw	c_x,y			; memory
  22  0018 9093          	ldw	y,x
  23  001a 90ee03        	ldw	y,(3,y)			; ram address
  24  001d fe            	ldw	x,(x)			; start address
  25  001e               dbcl:
  26  001e f6            	ld	a,(x)			; transfer
  27  001f 90f7          	ld	(y),a			; byte
  28  0021 905c          	incw	y			; next
  29  0023 5c            	incw	x			; byte
  30  0024 b300          	cpw	x,c_x			; source
  31  0026 26f6          	jrne	dbcl			; address
  32  0028 a601          	ld	a,#1			; non zero result
  33  002a               cend:
  34  002a 5f            	clrw	x			; complete
  35  002b 97            	ld	xl,a			; result
  36  002c 81            	ret				; and return
  37                     ;
  38                     	end
