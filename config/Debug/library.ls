   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2489                     ; 3 void Delay(u16 num)
2489                     ; 4 {
2490                     	switch	.text
2491  0000               f_Delay:
2493  0000 89            	pushw	x
2494       00000000      OFST:	set	0
2497  0001 2004          	jra	L1741
2498  0003               L7641:
2499                     ; 7 	    CLEAR_WATCHDOG;
2501  0003 357f50d1      	mov	_WWDG,#127
2503  0007               L1741:
2504                     ; 5 	while(num--)
2506  0007 1e01          	ldw	x,(OFST+1,sp)
2507  0009 1d0001        	subw	x,#1
2508  000c 1f01          	ldw	(OFST+1,sp),x
2509  000e 1c0001        	addw	x,#1
2510  0011 a30000        	cpw	x,#0
2511  0014 26ed          	jrne	L7641
2512                     ; 9 }
2515  0016 85            	popw	x
2516  0017 87            	retf
2543                     ; 10 void Generate_CheckSum(void)
2543                     ; 11 {
2544                     	switch	.text
2545  0018               f_Generate_CheckSum:
2549                     ; 12 	CheckHead=0x55;
2551  0018 35550000      	mov	_CheckHead,#85
2552                     ; 13 	CheckSum=ResetSource;		
2554  001c 450000        	mov	_CheckSum,_ResetSource
2555                     ; 14 	CheckSum+=Clock.sec;
2557  001f b600          	ld	a,_CheckSum
2558  0021 bb00          	add	a,_Clock
2559  0023 b700          	ld	_CheckSum,a
2560                     ; 15 	CheckSum+=Clock.min;
2562  0025 b600          	ld	a,_CheckSum
2563  0027 bb01          	add	a,_Clock+1
2564  0029 b700          	ld	_CheckSum,a
2565                     ; 16 	CheckSum+=Clock.hour;
2567  002b b600          	ld	a,_CheckSum
2568  002d bb02          	add	a,_Clock+2
2569  002f b700          	ld	_CheckSum,a
2570                     ; 17 	CheckSum+=Clock.date;
2572  0031 b600          	ld	a,_CheckSum
2573  0033 bb04          	add	a,_Clock+4
2574  0035 b700          	ld	_CheckSum,a
2575                     ; 18 	CheckSum+=Clock.month;
2577  0037 b600          	ld	a,_CheckSum
2578  0039 bb05          	add	a,_Clock+5
2579  003b b700          	ld	_CheckSum,a
2580                     ; 19 	CheckSum+=Clock.year;
2582  003d b600          	ld	a,_CheckSum
2583  003f bb06          	add	a,_Clock+6
2584  0041 b700          	ld	_CheckSum,a
2585                     ; 20 	CheckSum=~CheckSum;
2587  0043 3300          	cpl	_CheckSum
2588                     ; 21 	CheckTail=0xaa;
2590  0045 35aa0000      	mov	_CheckTail,#170
2591                     ; 22 }
2594  0049 87            	retf
2642                     ; 23 BoolT Check_CheckSum(void)
2642                     ; 24 {
2643                     	switch	.text
2644  004a               f_Check_CheckSum:
2648                     ; 25 	if(CheckHead!=0x55)
2650  004a b600          	ld	a,_CheckHead
2651  004c a155          	cp	a,#85
2652  004e 2702          	jreq	L5251
2653                     ; 27 		return FALSE;
2655  0050 4f            	clr	a
2658  0051 87            	retf
2659  0052               L5251:
2660                     ; 29 	if(CheckTail!=0xaa)
2662  0052 b600          	ld	a,_CheckTail
2663  0054 a1aa          	cp	a,#170
2664  0056 2702          	jreq	L7251
2665                     ; 31 		return FALSE;
2667  0058 4f            	clr	a
2670  0059 87            	retf
2671  005a               L7251:
2672                     ; 33 	CheckSum+=ResetSource;
2674  005a b600          	ld	a,_CheckSum
2675  005c bb00          	add	a,_ResetSource
2676  005e b700          	ld	_CheckSum,a
2677                     ; 34 	CheckSum+=Clock.sec;
2679  0060 b600          	ld	a,_CheckSum
2680  0062 bb00          	add	a,_Clock
2681  0064 b700          	ld	_CheckSum,a
2682                     ; 35 	CheckSum+=Clock.min;
2684  0066 b600          	ld	a,_CheckSum
2685  0068 bb01          	add	a,_Clock+1
2686  006a b700          	ld	_CheckSum,a
2687                     ; 36 	CheckSum+=Clock.hour;
2689  006c b600          	ld	a,_CheckSum
2690  006e bb02          	add	a,_Clock+2
2691  0070 b700          	ld	_CheckSum,a
2692                     ; 37 	CheckSum+=Clock.date;
2694  0072 b600          	ld	a,_CheckSum
2695  0074 bb04          	add	a,_Clock+4
2696  0076 b700          	ld	_CheckSum,a
2697                     ; 38 	CheckSum+=Clock.month;
2699  0078 b600          	ld	a,_CheckSum
2700  007a bb05          	add	a,_Clock+5
2701  007c b700          	ld	_CheckSum,a
2702                     ; 39 	CheckSum+=Clock.year;	
2704  007e b600          	ld	a,_CheckSum
2705  0080 bb06          	add	a,_Clock+6
2706  0082 b700          	ld	_CheckSum,a
2707                     ; 40 	if(CheckSum!=0xFF)
2709  0084 b600          	ld	a,_CheckSum
2710  0086 a1ff          	cp	a,#255
2711  0088 2702          	jreq	L1351
2712                     ; 42 		return FALSE;
2714  008a 4f            	clr	a
2717  008b 87            	retf
2718  008c               L1351:
2719                     ; 44 	return TRUE;
2721  008c a601          	ld	a,#1
2724  008e 87            	retf
2736                     	xdef	f_Check_CheckSum
2737                     	xdef	f_Generate_CheckSum
2738                     	xdef	f_Delay
2739                     	xref.b	_CheckTail
2740                     	xref.b	_CheckSum
2741                     	xref.b	_ResetSource
2742                     	xref.b	_Clock
2743                     	xref.b	_CheckHead
2762                     	end
