   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2358                     ; 3 void Delay(u16 num)
2358                     ; 4 {
2360                     	switch	.text
2361  0000               _Delay:
2363  0000 89            	pushw	x
2364       00000000      OFST:	set	0
2367  0001 2004          	jra	L5041
2368  0003               L3041:
2369                     ; 7 	    CLEAR_WATCHDOG;
2371  0003 357f50d1      	mov	_WWDG,#127
2373  0007               L5041:
2374                     ; 5 	while(num--)
2376  0007 1e01          	ldw	x,(OFST+1,sp)
2377  0009 1d0001        	subw	x,#1
2378  000c 1f01          	ldw	(OFST+1,sp),x
2379  000e 1c0001        	addw	x,#1
2380  0011 a30000        	cpw	x,#0
2381  0014 26ed          	jrne	L3041
2382                     ; 9 }
2385  0016 85            	popw	x
2386  0017 81            	ret
2399                     	xdef	_Delay
2418                     	end
