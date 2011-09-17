   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2356                     ; 3 void Delay(u16 num)
2356                     ; 4 {
2357                     	switch	.text
2358  0000               f_Delay:
2360  0000 89            	pushw	x
2361       00000000      OFST:	set	0
2364  0001 2004          	jra	L3041
2365  0003               L1041:
2366                     ; 7 	    CLEAR_WATCHDOG;
2368  0003 357f50d1      	mov	_WWDG,#127
2370  0007               L3041:
2371                     ; 5 	while(num--)
2373  0007 1e01          	ldw	x,(OFST+1,sp)
2374  0009 1d0001        	subw	x,#1
2375  000c 1f01          	ldw	(OFST+1,sp),x
2376  000e 1c0001        	addw	x,#1
2377  0011 a30000        	cpw	x,#0
2378  0014 26ed          	jrne	L1041
2379                     ; 9 }
2382  0016 85            	popw	x
2383  0017 87            	retf
2395                     	xdef	f_Delay
2414                     	end
