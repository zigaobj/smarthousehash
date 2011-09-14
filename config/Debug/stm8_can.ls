   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.3 - 19 Nov 2007
2359                     ; 18 void CanInit(u8 CAN_MasterCtrlReg)
2359                     ; 19 {
2360                     	switch	.text
2361  0000               f_CanInit:
2363  0000 88            	push	a
2364       00000000      OFST:	set	0
2367                     ; 20     CLK.PCKENR2|=CLK_PCKENR2_CAN; // 开启CAN时钟，stm8 的外设时钟可控
2369  0001 721e50ca      	bset	_CLK+10,#7
2370                     ; 22     CAN.PSR =CAN_PS_TXMB0;
2372  0005 725f5427      	clr	_CAN+7
2373                     ; 23     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;
2375  0009 72125428      	bset	_CAN+8,#1
2376                     ; 25     CAN.PSR =CAN_PS_TXMB1;
2378  000d 35015427      	mov	_CAN+7,#1
2379                     ; 26     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;
2381  0011 72125428      	bset	_CAN+8,#1
2382                     ; 28     CAN.PSR =CAN_PS_TXMB2;
2384  0015 35055427      	mov	_CAN+7,#5
2385                     ; 29     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;
2387  0019 72125428      	bset	_CAN+8,#1
2388                     ; 31     CAN.MCR |=CAN_MCR_INRQ; // Request initialisation
2390  001d 72105420      	bset	_CAN,#0
2392  0021 2001          	jra	L3041
2393  0023               L1041:
2394                     ; 34         _asm("nop");
2397  0023 9d            nop
2399  0024               L3041:
2400                     ; 32     while(!(CAN.MSR &CAN_MSR_INAK)) // Wait until acknowledged
2402  0024 c65421        	ld	a,_CAN+1
2403  0027 a501          	bcp	a,#1
2404  0029 27f8          	jreq	L1041
2405                     ; 39     CAN.TSR |=CAN_TSR_RQCP0 |CAN_TSR_RQCP1 |CAN_TSR_RQCP2;
2407  002b c65422        	ld	a,_CAN+2
2408  002e aa07          	or	a,#7
2409  0030 c75422        	ld	_CAN+2,a
2411  0033 2004          	jra	L1141
2412  0035               L7041:
2413                     ; 44         CAN.RFR =CAN_RFR_RFOM; //释放一级FIFO
2415  0035 35205424      	mov	_CAN+4,#32
2416  0039               L1141:
2417                     ; 42     while(CAN.RFR &CAN_RFR_FMP)
2419  0039 c65424        	ld	a,_CAN+4
2420  003c a503          	bcp	a,#3
2421  003e 26f5          	jrne	L7041
2422                     ; 48     CAN.RFR |=CAN_RFR_FOVR; 
2424  0040 72185424      	bset	_CAN+4,#4
2425                     ; 51 	CAN.MSR =CAN_MSR_WKUI;
2427  0044 35085421      	mov	_CAN+1,#8
2428                     ; 54 	CAN.MCR |= CAN_MasterCtrlReg;
2430  0048 c65420        	ld	a,_CAN
2431  004b 1a01          	or	a,(OFST+1,sp)
2432  004d c75420        	ld	_CAN,a
2433                     ; 58 	CAN.PSR =CAN_PS_CTRL;	
2435  0050 35065427      	mov	_CAN+7,#6
2436                     ; 59 	CAN_PAGE_FCR1 = 0x00;
2438  0054 725f5432      	clr	_CAN+18
2439                     ; 60 	CAN_PAGE_FCR2 = 0x00;
2441  0058 725f5433      	clr	_CAN+19
2442                     ; 61 	CAN_PAGE_FCR3 = 0x00;
2444  005c 725f5434      	clr	_CAN+20
2445                     ; 64 	CAN_PAGE_FCR1 = CAN_FCR1_FILTER0_SCALE_1_32BIT;
2447  0060 35065432      	mov	_CAN+18,#6
2448                     ; 79 	CAN_PAGE_FMR1 = 0x00;	/* Filter 0, 1, 2, 3 Low/High Register in Mask mode */
2450  0064 725f5430      	clr	_CAN+16
2451                     ; 80 	CAN_PAGE_FMR2 = 0x00;	/* Filter 4, 5 Low/High Register in Mask mode */
2453  0068 725f5431      	clr	_CAN+17
2454                     ; 102 	CAN.PSR = CAN_PS_FILTER01;
2456  006c 35025427      	mov	_CAN+7,#2
2457                     ; 104 	CAN_PAGE_FLR1 = 0x00;
2459  0070 725f5428      	clr	_CAN+8
2460                     ; 105 	CAN_PAGE_FLR2 = 0x00;
2462  0074 725f5429      	clr	_CAN+9
2463                     ; 106 	CAN_PAGE_FLR3 = 0x00;
2465  0078 725f542a      	clr	_CAN+10
2466                     ; 107 	CAN_PAGE_FLR4 = 0x00;
2468  007c 725f542b      	clr	_CAN+11
2469                     ; 108 	CAN_PAGE_FLR5 = 0x00;
2471  0080 725f542c      	clr	_CAN+12
2472                     ; 109 	CAN_PAGE_FLR6 = 0x00;
2474  0084 725f542d      	clr	_CAN+13
2475                     ; 110 	CAN_PAGE_FLR7 = 0x00;
2477  0088 725f542e      	clr	_CAN+14
2478                     ; 111 	CAN_PAGE_FLR8 = 0x00;
2480  008c 725f542f      	clr	_CAN+15
2481                     ; 113 	CAN_PAGE_FHR1 = 0x00;
2483  0090 725f5430      	clr	_CAN+16
2484                     ; 114 	CAN_PAGE_FHR2 = 0x00;
2486  0094 725f5431      	clr	_CAN+17
2487                     ; 115 	CAN_PAGE_FHR3 = 0x00;
2489  0098 725f5432      	clr	_CAN+18
2490                     ; 116 	CAN_PAGE_FHR4 = 0x00;
2492  009c 725f5433      	clr	_CAN+19
2493                     ; 117 	CAN_PAGE_FHR5 = 0x00;
2495  00a0 725f5434      	clr	_CAN+20
2496                     ; 118 	CAN_PAGE_FHR6 = 0x00;
2498  00a4 725f5435      	clr	_CAN+21
2499                     ; 119 	CAN_PAGE_FHR7 = 0x00;
2501  00a8 725f5436      	clr	_CAN+22
2502                     ; 120 	CAN_PAGE_FHR8 = 0x00;
2504  00ac 725f5437      	clr	_CAN+23
2505                     ; 123 	CAN.PSR = CAN_PS_FILTER23;
2507  00b0 35035427      	mov	_CAN+7,#3
2508                     ; 125 	CAN_PAGE_FLR1 = 0x00;
2510  00b4 725f5428      	clr	_CAN+8
2511                     ; 126 	CAN_PAGE_FLR2 = 0x00;
2513  00b8 725f5429      	clr	_CAN+9
2514                     ; 127 	CAN_PAGE_FLR3 = 0x00;
2516  00bc 725f542a      	clr	_CAN+10
2517                     ; 128 	CAN_PAGE_FLR4 = 0x00;
2519  00c0 725f542b      	clr	_CAN+11
2520                     ; 129 	CAN_PAGE_FLR5 = 0x00;
2522  00c4 725f542c      	clr	_CAN+12
2523                     ; 130 	CAN_PAGE_FLR6 = 0x00;
2525  00c8 725f542d      	clr	_CAN+13
2526                     ; 131 	CAN_PAGE_FLR7 = 0x00;
2528  00cc 725f542e      	clr	_CAN+14
2529                     ; 132 	CAN_PAGE_FLR8 = 0x00;
2531  00d0 725f542f      	clr	_CAN+15
2532                     ; 134 	CAN_PAGE_FHR1 = 0x00;
2534  00d4 725f5430      	clr	_CAN+16
2535                     ; 135 	CAN_PAGE_FHR2 = 0x00;
2537  00d8 725f5431      	clr	_CAN+17
2538                     ; 136 	CAN_PAGE_FHR3 = 0x00;
2540  00dc 725f5432      	clr	_CAN+18
2541                     ; 137 	CAN_PAGE_FHR4 = 0x00;
2543  00e0 725f5433      	clr	_CAN+19
2544                     ; 138 	CAN_PAGE_FHR5 = 0x00;
2546  00e4 725f5434      	clr	_CAN+20
2547                     ; 139 	CAN_PAGE_FHR6 = 0x00;
2549  00e8 725f5435      	clr	_CAN+21
2550                     ; 140 	CAN_PAGE_FHR7 = 0x00;
2552  00ec 725f5436      	clr	_CAN+22
2553                     ; 141 	CAN_PAGE_FHR8 = 0x00;
2555  00f0 725f5437      	clr	_CAN+23
2556                     ; 144 	CAN.PSR = CAN_PS_FILTER45;
2558  00f4 35045427      	mov	_CAN+7,#4
2559                     ; 146 	CAN_PAGE_FLR1 = 0xff;
2561  00f8 35ff5428      	mov	_CAN+8,#255
2562                     ; 147 	CAN_PAGE_FLR2 = 0xff;
2564  00fc 35ff5429      	mov	_CAN+9,#255
2565                     ; 148 	CAN_PAGE_FLR3 = 0xff;
2567  0100 35ff542a      	mov	_CAN+10,#255
2568                     ; 149 	CAN_PAGE_FLR4 = 0xff;
2570  0104 35ff542b      	mov	_CAN+11,#255
2571                     ; 150 	CAN_PAGE_FLR5 = 0xff;
2573  0108 35ff542c      	mov	_CAN+12,#255
2574                     ; 151 	CAN_PAGE_FLR6 = 0xff;
2576  010c 35ff542d      	mov	_CAN+13,#255
2577                     ; 152 	CAN_PAGE_FLR7 = 0xff;
2579  0110 35ff542e      	mov	_CAN+14,#255
2580                     ; 153 	CAN_PAGE_FLR8 = 0xff;
2582  0114 35ff542f      	mov	_CAN+15,#255
2583                     ; 155 	CAN_PAGE_FHR1 = 0xff;
2585  0118 35ff5430      	mov	_CAN+16,#255
2586                     ; 156 	CAN_PAGE_FHR2 = 0xff;
2588  011c 35ff5431      	mov	_CAN+17,#255
2589                     ; 157 	CAN_PAGE_FHR3 = 0xff;
2591  0120 35ff5432      	mov	_CAN+18,#255
2592                     ; 158 	CAN_PAGE_FHR4 = 0xff;
2594  0124 35ff5433      	mov	_CAN+19,#255
2595                     ; 159 	CAN_PAGE_FHR5 = 0xff;
2597  0128 35ff5434      	mov	_CAN+20,#255
2598                     ; 160 	CAN_PAGE_FHR6 = 0xff;
2600  012c 35ff5435      	mov	_CAN+21,#255
2601                     ; 161 	CAN_PAGE_FHR7 = 0xff;
2603  0130 35ff5436      	mov	_CAN+22,#255
2604                     ; 162 	CAN_PAGE_FHR8 = 0xff;
2606  0134 35ff5437      	mov	_CAN+23,#255
2607                     ; 165 	CAN.PSR = CAN_PS_CTRL;	
2609  0138 35065427      	mov	_CAN+7,#6
2610                     ; 166 	CAN_PAGE_FCR1 |= CAN_FCR1_FILTER0_ACTIVE;	/* Filter 0 active */
2612  013c 72105432      	bset	_CAN+18,#0
2613                     ; 174 	CAN.PSR =CAN_PS_CTRL;
2615  0140 35065427      	mov	_CAN+7,#6
2616                     ; 175 	CAN_PAGE_BTR1 =(CAN_PAGE_BTR1_BRP&(CAN_PAGE_BTR1_BRP_RESET_VALUE-1))
2616                     ; 176 	              |(CAN_PAGE_BTR1_SJW&((CAN_PAGE_BTR1_SJW_RESET_VALUE-1)<<6));		// see can.h for modification of
2618  0144 359d542c      	mov	_CAN+12,#157
2619                     ; 177 	CAN_PAGE_BTR2 =(CAN_PAGE_BTR2_BS1&(CAN_PAGE_BTR2_BS1_RESET_VALUE-1)) 	        // bit timing parameters.
2619                     ; 178 	              |(CAN_PAGE_BTR2_BS2&((CAN_PAGE_BTR2_BS2_RESET_VALUE-1)<<4))
2619                     ; 179 	               |CAN_PAGE_BTR2_CLKS;
2621  0148 35a3542d      	mov	_CAN+13,#163
2622                     ; 184 	CAN.DGR |= CAN_DGR_TXM2E;	/* enable 3th Tx mailboxe */ 
2624  014c 72185426      	bset	_CAN+6,#4
2625                     ; 186 	CAN.MCR &= ~CAN_MCR_INRQ;	/* Leave the Init mode */
2627  0150 72115420      	bres	_CAN,#0
2629  0154 2001          	jra	L7141
2630  0156               L5141:
2631                     ; 189 		_asm("nop");
2634  0156 9d            nop
2636  0157               L7141:
2637                     ; 187 	while ((CAN.MSR &CAN_MSR_INAK))	/* Wait until acknowledged */ 
2639  0157 c65421        	ld	a,_CAN+1
2640  015a a501          	bcp	a,#1
2641  015c 26f8          	jrne	L5141
2642                     ; 192 }
2645  015e 84            	pop	a
2646  015f 87            	retf
2670                     ; 201 void Can_Wakeup_Enable(void)
2670                     ; 202 {
2671                     	switch	.text
2672  0160               f_Can_Wakeup_Enable:
2676                     ; 203 	CanSavePg();
2678  0160 5554270000    	mov	_CanPage,_CAN+7
2679                     ; 205 	CAN.IER = CAN_IER_WKUIE | /* Wake-up Interrupt */
2679                     ; 206 			  CAN_IER_FOVIE | /* FIFO overrun Interrupt */
2679                     ; 207 			  CAN_IER_FFIE  | /* FIFO Full Interrupt */
2679                     ; 208 			  CAN_IER_FMPIE | /* FIFO Message Pending Interrupt */
2679                     ; 209 			  CAN_IER_TMEIE;  /* Transmit Mailbox Empty Interrupt */
2681  0165 358f5425      	mov	_CAN+5,#143
2682                     ; 211 	CAN.PSR = CAN_PS_CTRL;
2684  0169 35065427      	mov	_CAN+7,#6
2685                     ; 212 	CAN_PAGE_EIER = CAN_PAGE_EIER_ERRIE|	/* Error Interrupt */
2685                     ; 213 				    CAN_PAGE_EIER_LECIE|	/* Last Error Code Interrupt */
2685                     ; 214 				    CAN_PAGE_EIER_BOFIE|	/* Bus-Off Interrupt */
2685                     ; 215 				    CAN_PAGE_EIER_EPVIE|	/* Error Passive Interrupt */
2685                     ; 216 				    CAN_PAGE_EIER_EWGIE;	/* Error Warning Interrupt */
2687  016d 35975429      	mov	_CAN+9,#151
2688                     ; 218 	CanRestorePg();
2690  0171 5500005427    	mov	_CAN+7,_CanPage
2691                     ; 219 }
2694  0176 87            	retf
2719                     ; 228 void CanSleep(void)
2719                     ; 229 {
2720                     	switch	.text
2721  0177               f_CanSleep:
2725                     ; 230     CanInit(CAN_MCR_AWUM);
2727  0177 a620          	ld	a,#32
2728  0179 8d000000      	callf	f_CanInit
2730                     ; 231     Can_Wakeup_Enable();
2732  017d 8d600160      	callf	f_Can_Wakeup_Enable
2735  0181 2004          	jra	L5441
2736  0183               L3441:
2737                     ; 237         CAN.MCR |= CAN_MCR_SLEEP;		
2739  0183 72125420      	bset	_CAN,#1
2740  0187               L5441:
2741                     ; 234     while(!(CAN.MSR &CAN_MSR_SLAK))
2743  0187 c65421        	ld	a,_CAN+1
2744  018a a502          	bcp	a,#2
2745  018c 27f5          	jreq	L3441
2746                     ; 239 }
2749  018e 87            	retf
2774                     ; 248 void CanWakeUp(void)
2774                     ; 249 {
2775                     	switch	.text
2776  018f               f_CanWakeUp:
2780                     ; 250 	CanBusWakeup();
2782  018f 72175014      	bres	_GPIOE,#3
2783                     ; 253 	CAN.MCR &= ~CAN_MCR_SLEEP;	
2786  0193 72135420      	bres	_CAN,#1
2788  0197 2001          	jra	L3641
2789  0199               L1641:
2790                     ; 258         _asm("nop");
2793  0199 9d            nop
2795  019a               L3641:
2796                     ; 256 	while(CAN.MSR & CAN_MSR_SLAK)
2798  019a c65421        	ld	a,_CAN+1
2799  019d a502          	bcp	a,#2
2800  019f 26f8          	jrne	L1641
2801                     ; 260 }
2804  01a1 87            	retf
2900                     ; 275 BoolT CanMsgTransmit(CanMsgTypeDef *pCanMsg)
2900                     ; 276 {
2901                     	switch	.text
2902  01a2               f_CanMsgTransmit:
2904  01a2 89            	pushw	x
2905  01a3 88            	push	a
2906       00000001      OFST:	set	1
2909                     ; 279 	if(CAN.TPR & CAN_TPR_TME0)			/* Mailbox 1 empty ? */
2911  01a4 c65423        	ld	a,_CAN+3
2912  01a7 a504          	bcp	a,#4
2913  01a9 270a          	jreq	L5351
2914                     ; 281 		CAN.PSR = CAN_PS_TXMB0;
2916  01ab 725f5427      	clr	_CAN+7
2917                     ; 282 		MailboxNumber = 1;
2919  01af a601          	ld	a,#1
2920  01b1 6b01          	ld	(OFST+0,sp),a
2922  01b3 2020          	jra	L7351
2923  01b5               L5351:
2924                     ; 284 	else if(CAN.TPR & CAN_TPR_TME1)	/* Mailbox 2 empty ? */
2926  01b5 c65423        	ld	a,_CAN+3
2927  01b8 a508          	bcp	a,#8
2928  01ba 270a          	jreq	L1451
2929                     ; 286 		CAN.PSR = CAN_PS_TXMB1;
2931  01bc 35015427      	mov	_CAN+7,#1
2932                     ; 287 		MailboxNumber = 2;		
2934  01c0 a602          	ld	a,#2
2935  01c2 6b01          	ld	(OFST+0,sp),a
2937  01c4 200f          	jra	L7351
2938  01c6               L1451:
2939                     ; 289 	else if(CAN.TPR & CAN_TPR_TME2)	/* Mailbox 3 empty ? */
2941  01c6 c65423        	ld	a,_CAN+3
2942  01c9 a510          	bcp	a,#16
2943  01cb 2768          	jreq	L5451
2944                     ; 291 		CAN.PSR = CAN_PS_TXMB2;
2946  01cd 35055427      	mov	_CAN+7,#5
2947                     ; 292 		MailboxNumber = 3;		
2949  01d1 a603          	ld	a,#3
2950  01d3 6b01          	ld	(OFST+0,sp),a
2952  01d5               L7351:
2953                     ; 301     CAN_PAGE_MDLCR = pCanMsg->dlc;
2955  01d5 1e02          	ldw	x,(OFST+1,sp)
2956  01d7 e604          	ld	a,(4,x)
2957  01d9 c75429        	ld	_CAN+9,a
2958                     ; 303     *((u32*)&CAN_PAGE_MIDR1)=pCanMsg->id;
2960  01dc 1e02          	ldw	x,(OFST+1,sp)
2961  01de e603          	ld	a,(3,x)
2962  01e0 c7542d        	ld	_CAN+13,a
2963  01e3 e602          	ld	a,(2,x)
2964  01e5 c7542c        	ld	_CAN+12,a
2965  01e8 e601          	ld	a,(1,x)
2966  01ea c7542b        	ld	_CAN+11,a
2967  01ed f6            	ld	a,(x)
2968  01ee c7542a        	ld	_CAN+10,a
2969                     ; 304     CAN_PAGE_MIDR1|= CAN_ID_EXT;
2971  01f1 721c542a      	bset	_CAN+10,#6
2972                     ; 306     CAN_PAGE_MDAR1 =pCanMsg->data[0];
2974  01f5 1e02          	ldw	x,(OFST+1,sp)
2975  01f7 e605          	ld	a,(5,x)
2976  01f9 c7542e        	ld	_CAN+14,a
2977                     ; 307     CAN_PAGE_MDAR2 =pCanMsg->data[1];
2979  01fc 1e02          	ldw	x,(OFST+1,sp)
2980  01fe e606          	ld	a,(6,x)
2981  0200 c7542f        	ld	_CAN+15,a
2982                     ; 308     CAN_PAGE_MDAR3 =pCanMsg->data[2];
2984  0203 1e02          	ldw	x,(OFST+1,sp)
2985  0205 e607          	ld	a,(7,x)
2986  0207 c75430        	ld	_CAN+16,a
2987                     ; 309     CAN_PAGE_MDAR4 =pCanMsg->data[3];
2989  020a 1e02          	ldw	x,(OFST+1,sp)
2990  020c e608          	ld	a,(8,x)
2991  020e c75431        	ld	_CAN+17,a
2992                     ; 310     CAN_PAGE_MDAR5 =pCanMsg->data[4];
2994  0211 1e02          	ldw	x,(OFST+1,sp)
2995  0213 e609          	ld	a,(9,x)
2996  0215 c75432        	ld	_CAN+18,a
2997                     ; 311     CAN_PAGE_MDAR6 =pCanMsg->data[5];
2999  0218 1e02          	ldw	x,(OFST+1,sp)
3000  021a e60a          	ld	a,(10,x)
3001  021c c75433        	ld	_CAN+19,a
3002                     ; 312     CAN_PAGE_MDAR7 =pCanMsg->data[6];
3004  021f 1e02          	ldw	x,(OFST+1,sp)
3005  0221 e60b          	ld	a,(11,x)
3006  0223 c75434        	ld	_CAN+20,a
3007                     ; 313     CAN_PAGE_MDAR8 =pCanMsg->data[7];
3009  0226 1e02          	ldw	x,(OFST+1,sp)
3010  0228 e60c          	ld	a,(12,x)
3011  022a c75435        	ld	_CAN+21,a
3012                     ; 315     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_TXRQ;
3014  022d 72105428      	bset	_CAN+8,#0
3015                     ; 316 	return(TRUE);
3017  0231 a601          	ld	a,#1
3019  0233 2001          	jra	L61
3020  0235               L5451:
3021                     ; 296 		return (FALSE);
3023  0235 4f            	clr	a
3025  0236               L61:
3027  0236 5b03          	addw	sp,#3
3028  0238 87            	retf
3053                     ; 326 void CanInterruptDisable(void)
3053                     ; 327 {
3054                     	switch	.text
3055  0239               f_CanInterruptDisable:
3059                     ; 328 	CanSavePg();
3061  0239 5554270000    	mov	_CanPage,_CAN+7
3062                     ; 330 	CAN.IER = 0x00; 
3064  023e 725f5425      	clr	_CAN+5
3065                     ; 331 	CAN.PSR = CAN_PS_CTRL;         
3067  0242 35065427      	mov	_CAN+7,#6
3068                     ; 332 	CAN_PAGE_EIER = 0x00;
3070  0246 725f5429      	clr	_CAN+9
3071                     ; 334 	CanRestorePg();
3073  024a 5500005427    	mov	_CAN+7,_CanPage
3074                     ; 335 }
3077  024f 87            	retf
3102                     ; 344 void CanInterruptRestore (void)
3102                     ; 345 {
3103                     	switch	.text
3104  0250               f_CanInterruptRestore:
3108                     ; 346 	CanSavePg();
3110  0250 5554270000    	mov	_CanPage,_CAN+7
3111                     ; 348 	CAN.IER = 	//CAN_IER_WKUIE |	/* Wake-up Interrupt */
3111                     ; 349 				CAN_IER_FOVIE /* FIFO overrun Interrupt */
3111                     ; 350 				|CAN_IER_FFIE /* FIFO Full Interrupt */
3111                     ; 351 				|CAN_IER_FMPIE /* FIFO Message Pending Interrupt */
3111                     ; 352 				//|CAN_IER_TMEIE	/* Transmit Mailbox Empty Interrupt */
3111                     ; 353                 ;
3113  0255 350e5425      	mov	_CAN+5,#14
3114                     ; 354 	CAN.PSR = CAN_PS_CTRL;
3116  0259 35065427      	mov	_CAN+7,#6
3117                     ; 355 	CAN_PAGE_EIER = CAN_PAGE_EIER_ERRIE|    /* Error Interrupt */
3117                     ; 356 				    CAN_PAGE_EIER_LECIE|        /* Last Error Code Interrupt */
3117                     ; 357 				    CAN_PAGE_EIER_BOFIE|        /* Bus-Off Interrupt */
3117                     ; 358 				    CAN_PAGE_EIER_EPVIE|        /* Error Passive Interrupt */
3117                     ; 359 				    CAN_PAGE_EIER_EWGIE;        /* Error Warning Interrupt */
3119  025d 35975429      	mov	_CAN+9,#151
3120                     ; 361 	CanRestorePg();
3122  0261 5500005427    	mov	_CAN+7,_CanPage
3123                     ; 362 }
3126  0266 87            	retf
3170                     .const:	section	.text
3171  0000               L5161:
3172  0000 0003          	dc.w	3
3173  0002 10242040      	dc.l	270803008
3174  0006 02d1          	dc.w	L1751
3175  0008 1029c080      	dc.l	271171712
3176  000c 02d1          	dc.w	L1751
3177  000e 10466677      	dc.l	273049207
3178  0012 02d1          	dc.w	L1751
3179  0014 02ff          	dc.w	L7161
3180                     ; 365 void Can_Store_Rcvd_Msg(void)	//中断服务程序中执行
3180                     ; 366 {
3181                     	switch	.text
3182  0267               f_Can_Store_Rcvd_Msg:
3184  0267 5203          	subw	sp,#3
3185       00000003      OFST:	set	3
3188                     ; 368 	u8 *u8p =&CAN_PAGE_MDAR1;
3190  0269 ae542e        	ldw	x,#_CAN+14
3191  026c 1f01          	ldw	(OFST-2,sp),x
3192                     ; 370 	CAN.PSR = CAN_PS_FIFO; //进入接收数据FIFO页面
3194  026e 35075427      	mov	_CAN+7,#7
3195                     ; 371     CanTxRxBuffer.id =CAN_PAGE_MIDR1&0x1F;
3197  0272 c6542a        	ld	a,_CAN+10
3198  0275 a41f          	and	a,#31
3199  0277 c70003        	ld	_CanTxRxBuffer+3,a
3200  027a 4f            	clr	a
3201  027b c70002        	ld	_CanTxRxBuffer+2,a
3202  027e c70001        	ld	_CanTxRxBuffer+1,a
3203  0281 c70000        	ld	_CanTxRxBuffer,a
3204                     ; 372     CanTxRxBuffer.id <<=8; //移位计算更优
3206  0284 ae0000        	ldw	x,#_CanTxRxBuffer
3207  0287 a608          	ld	a,#8
3208  0289 8d000000      	callf	d_lglsh
3210                     ; 373     CanTxRxBuffer.id +=CAN_PAGE_MIDR2;
3212  028d c6542b        	ld	a,_CAN+11
3213  0290 ae0000        	ldw	x,#_CanTxRxBuffer
3214  0293 88            	push	a
3215  0294 8d000000      	callf	d_lgadc
3217  0298 84            	pop	a
3218                     ; 374     CanTxRxBuffer.id <<=8;
3220  0299 ae0000        	ldw	x,#_CanTxRxBuffer
3221  029c a608          	ld	a,#8
3222  029e 8d000000      	callf	d_lglsh
3224                     ; 375     CanTxRxBuffer.id +=CAN_PAGE_MIDR3;
3226  02a2 c6542c        	ld	a,_CAN+12
3227  02a5 ae0000        	ldw	x,#_CanTxRxBuffer
3228  02a8 88            	push	a
3229  02a9 8d000000      	callf	d_lgadc
3231  02ad 84            	pop	a
3232                     ; 376     CanTxRxBuffer.id <<=8;
3234  02ae ae0000        	ldw	x,#_CanTxRxBuffer
3235  02b1 a608          	ld	a,#8
3236  02b3 8d000000      	callf	d_lglsh
3238                     ; 377     CanTxRxBuffer.id +=CAN_PAGE_MIDR4;
3240  02b7 c6542d        	ld	a,_CAN+13
3241  02ba ae0000        	ldw	x,#_CanTxRxBuffer
3242  02bd 88            	push	a
3243  02be 8d000000      	callf	d_lgadc
3245  02c2 84            	pop	a
3246                     ; 379     switch(CanTxRxBuffer.id)
3248  02c3 ae0000        	ldw	x,#_CanTxRxBuffer
3249  02c6 8d000000      	callf	d_ltor
3252  02ca ae0000        	ldw	x,#L5161
3253  02cd 8d000000      	callf	d_jltab
3254  02d1               L1751:
3255                     ; 385     		CanTxRxBuffer.dlc= CAN_PAGE_MDLCR; //此帧长度(字节数)
3257  02d1 5554290004    	mov	_CanTxRxBuffer+4,_CAN+9
3258                     ; 386 			for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
3260  02d6 0f03          	clr	(OFST+0,sp)
3262  02d8 2017          	jra	L5261
3263  02da               L1261:
3264                     ; 388 				CanTxRxBuffer.data[idx]=u8p[idx];
3266  02da 7b03          	ld	a,(OFST+0,sp)
3267  02dc 5f            	clrw	x
3268  02dd 97            	ld	xl,a
3269  02de 89            	pushw	x
3270  02df 7b03          	ld	a,(OFST+0,sp)
3271  02e1 97            	ld	xl,a
3272  02e2 7b04          	ld	a,(OFST+1,sp)
3273  02e4 1b05          	add	a,(OFST+2,sp)
3274  02e6 2401          	jrnc	L62
3275  02e8 5c            	incw	x
3276  02e9               L62:
3277  02e9 02            	rlwa	x,a
3278  02ea f6            	ld	a,(x)
3279  02eb 85            	popw	x
3280  02ec d70005        	ld	(_CanTxRxBuffer+5,x),a
3281                     ; 386 			for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
3283  02ef 0c03          	inc	(OFST+0,sp)
3284  02f1               L5261:
3287  02f1 c60004        	ld	a,_CanTxRxBuffer+4
3288  02f4 1103          	cp	a,(OFST+0,sp)
3289  02f6 22e2          	jrugt	L1261
3290                     ; 390             CanMsgAnalyze(&CanTxRxBuffer);
3292  02f8 ae0000        	ldw	x,#_CanTxRxBuffer
3293  02fb 8da503a5      	callf	L5531f_CanMsgAnalyze
3295                     ; 391             break;
3297  02ff               L3751:
3298                     ; 393         default:
3298                     ; 394     		break;
3300  02ff               L7161:
3301                     ; 396 }
3304  02ff 5b03          	addw	sp,#3
3305  0301 87            	retf
3338                     ; 406 void ISR_Can_Tx(void)
3338                     ; 407 {
3339                     	switch	.text
3340  0302               f_ISR_Can_Tx:
3342  0302 88            	push	a
3343       00000001      OFST:	set	1
3346                     ; 409     CanSavePg();
3348  0303 5554270000    	mov	_CanPage,_CAN+7
3349                     ; 411     CAN.PSR =CAN_PS_CTRL;
3351  0308 35065427      	mov	_CAN+7,#6
3352                     ; 412     if(CAN_PAGE_ESR)
3354  030c 725d5428      	tnz	_CAN+8
3355  0310 2714          	jreq	L5461
3356                     ; 414         ErrorCode=CAN_PAGE_ESR;
3358  0312 c65428        	ld	a,_CAN+8
3359  0315 6b01          	ld	(OFST+0,sp),a
3360                     ; 415         if((CAN_PAGE_ESR&CAN_PAGE_ESR_LEC)!=0)
3362  0317 c65428        	ld	a,_CAN+8
3363  031a a570          	bcp	a,#112
3364  031c 2704          	jreq	L7461
3365                     ; 417             CAN_PAGE_ESR =0;//|=CAN_PAGE_ESR_LEC;
3367  031e 725f5428      	clr	_CAN+8
3368  0322               L7461:
3369                     ; 419         CAN.MSR |=CAN_MSR_ERRI;
3371  0322 72145421      	bset	_CAN+1,#2
3372  0326               L5461:
3373                     ; 421     CanRestorePg();
3375  0326 5500005427    	mov	_CAN+7,_CanPage
3376                     ; 422 }
3379  032b 84            	pop	a
3380  032c 87            	retf
3405                     ; 433 void ISR_Can_Rx(void)
3405                     ; 434 {
3406                     	switch	.text
3407  032d               f_ISR_Can_Rx:
3411                     ; 435 	CanSavePg();   
3413  032d 5554270000    	mov	_CanPage,_CAN+7
3414                     ; 437 	if (CAN.RFR & CAN_RFR_FOVR)
3416  0332 c65424        	ld	a,_CAN+4
3417  0335 a510          	bcp	a,#16
3418  0337 2706          	jreq	L1661
3419                     ; 439 		CAN.RFR |= CAN_RFR_FOVR;		/* clear the FIFO Overrun (FOVR) bit */
3421  0339 72185424      	bset	_CAN+4,#4
3423  033d 2019          	jra	L1761
3424  033f               L1661:
3425                     ; 441 	else if (CAN.RFR & CAN_RFR_FULL)
3427  033f c65424        	ld	a,_CAN+4
3428  0342 a508          	bcp	a,#8
3429  0344 2712          	jreq	L1761
3430                     ; 443 		CAN.RFR |= CAN_RFR_FULL;		/* clear the FIFO full (FULL) bit */      
3432  0346 72165424      	bset	_CAN+4,#3
3433  034a 200c          	jra	L1761
3434  034c               L7661:
3435                     ; 447         Can_Store_Rcvd_Msg();
3437  034c 8d670267      	callf	f_Can_Store_Rcvd_Msg
3439                     ; 448         CAN.RFR |= CAN_RFR_RFOM; // Release mailbox
3441  0350 721a5424      	bset	_CAN+4,#5
3442                     ; 449 		CAN.RFR |= CAN_RFR_RFOM; //此语句要用2句,原因还没搞明白
3444  0354 721a5424      	bset	_CAN+4,#5
3445  0358               L1761:
3446                     ; 445 	while (CAN.RFR & CAN_RFR_FMP)	/* Check until FMP != 0 */
3448  0358 c65424        	ld	a,_CAN+4
3449  035b a503          	bcp	a,#3
3450  035d 26ed          	jrne	L7661
3451                     ; 451 	CanRestorePg();
3453  035f 5500005427    	mov	_CAN+7,_CanPage
3454                     ; 452 }
3457  0364 87            	retf
3488                     ; 462 u8 CanIllumLevel(u8 Byte)
3488                     ; 463 {
3489                     	switch	.text
3490  0365               f_CanIllumLevel:
3492  0365 88            	push	a
3493       00000000      OFST:	set	0
3496                     ; 464     switch(Byte)
3499                     ; 487             break;
3500  0366 4d            	tnz	a
3501  0367 2717          	jreq	L5761
3502  0369 a00b          	sub	a,#11
3503  036b 271d          	jreq	L1071
3504  036d 4a            	dec	a
3505  036e 2716          	jreq	L7761
3506  0370 a0ee          	sub	a,#238
3507  0372 271c          	jreq	L3071
3508  0374               L5071:
3509                     ; 478         default:
3509                     ; 479             if(Byte&0x0F)
3511  0374 7b01          	ld	a,(OFST+1,sp)
3512  0376 a50f          	bcp	a,#15
3513  0378 271c          	jreq	L7271
3514                     ; 481                 Byte=0xFF;
3516  037a a6ff          	ld	a,#255
3517  037c 6b01          	ld	(OFST+1,sp),a
3519  037e 2020          	jra	L5271
3520  0380               L5761:
3521                     ; 466         case PARA_ILL_OFF:
3521                     ; 467             Byte=0x7F;
3523  0380 a67f          	ld	a,#127
3524  0382 6b01          	ld	(OFST+1,sp),a
3525                     ; 468             break;
3527  0384 201a          	jra	L5271
3528  0386               L7761:
3529                     ; 469         case PARA_ILL_LV0:
3529                     ; 470             Byte=0; //背光0级亮度
3531  0386 0f01          	clr	(OFST+1,sp)
3532                     ; 471             break;
3534  0388 2016          	jra	L5271
3535  038a               L1071:
3536                     ; 472         case PARA_ILL_LV1:
3536                     ; 473             Byte=1; //背光1级亮度
3538  038a a601          	ld	a,#1
3539  038c 6b01          	ld	(OFST+1,sp),a
3540                     ; 474             break;
3542  038e 2010          	jra	L5271
3543  0390               L3071:
3544                     ; 475         case PARA_ILL_LV17:
3544                     ; 476             Byte=17; //背光17级亮度
3546  0390 a611          	ld	a,#17
3547  0392 6b01          	ld	(OFST+1,sp),a
3548                     ; 477             break;
3550  0394 200a          	jra	L5271
3551  0396               L7271:
3552                     ; 485                 Byte=((Byte>>4)&0x0F)+1;
3554  0396 7b01          	ld	a,(OFST+1,sp)
3555  0398 4e            	swap	a
3556  0399 a40f          	and	a,#15
3557  039b a40f          	and	a,#15
3558  039d 4c            	inc	a
3559  039e 6b01          	ld	(OFST+1,sp),a
3560  03a0               L5271:
3561                     ; 489     return(Byte);
3563  03a0 7b01          	ld	a,(OFST+1,sp)
3566  03a2 5b01          	addw	sp,#1
3567  03a4 87            	retf
3623                     	switch	.const
3624  0016               L7671:
3625  0016 0003          	dc.w	3
3626  0018 10242040      	dc.l	270803008
3627  001c 03b6          	dc.w	L3371
3628  001e 1029c080      	dc.l	271171712
3629  0022 040c          	dc.w	L7371
3630  0024 10466677      	dc.l	273049207
3631  0028 03ca          	dc.w	L5371
3632  002a 040c          	dc.w	L1771
3633                     ; 501 static void CanMsgAnalyze(CanMsgTypeDef *pCanMsg)
3633                     ; 502 {
3634                     	switch	.text
3635  03a5               L5531f_CanMsgAnalyze:
3637  03a5 89            	pushw	x
3638  03a6 89            	pushw	x
3639       00000002      OFST:	set	2
3642                     ; 505     BoolT FlagCANDataOK=TRUE;
3644  03a7 a601          	ld	a,#1
3645  03a9 6b01          	ld	(OFST-1,sp),a
3646                     ; 507     switch(pCanMsg->id)
3648  03ab 8d000000      	callf	d_ltor
3651  03af ae0016        	ldw	x,#L7671
3652  03b2 8d000000      	callf	d_jltab
3653  03b6               L3371:
3654                     ; 511             if(0x4A==pCanMsg->data[0])
3656  03b6 1e03          	ldw	x,(OFST+1,sp)
3657  03b8 e605          	ld	a,(5,x)
3658  03ba a14a          	cp	a,#74
3659  03bc 2606          	jrne	L3771
3660                     ; 513                 CAR_ACC_FLAG=1;
3662  03be 72100000      	bset	_NodeState,#0
3664  03c2 2048          	jra	L1771
3665  03c4               L3771:
3666                     ; 517                 CAR_ACC_FLAG=0;
3668  03c4 72110000      	bres	_NodeState,#0
3669  03c8 2042          	jra	L1771
3670  03ca               L5371:
3671                     ; 523             u8Temp=CanIllumLevel(pCanMsg->data[0]);
3673  03ca 1e03          	ldw	x,(OFST+1,sp)
3674  03cc e605          	ld	a,(5,x)
3675  03ce 8d650365      	callf	f_CanIllumLevel
3677  03d2 6b02          	ld	(OFST+0,sp),a
3678                     ; 524             if(0xFF!=u8Temp)
3680  03d4 7b02          	ld	a,(OFST+0,sp)
3681  03d6 a1ff          	cp	a,#255
3682  03d8 2732          	jreq	L1771
3683                     ; 526                 if(0x7F==u8Temp)
3685  03da 7b02          	ld	a,(OFST+0,sp)
3686  03dc a17f          	cp	a,#127
3687  03de 2614          	jrne	L1002
3688                     ; 528                     if(NodeState.IllumeLevel==u8Temp)
3690  03e0 c60003        	ld	a,_NodeState+3
3691  03e3 1102          	cp	a,(OFST+0,sp)
3692  03e5 2602          	jrne	L3002
3693                     ; 530                         FlagCANDataOK=FALSE; //重复的数据,不需发给主机
3695  03e7 0f01          	clr	(OFST-1,sp)
3696  03e9               L3002:
3697                     ; 532                     CAR_ILLUME_FLAG =0;
3699  03e9 72130000      	bres	_NodeState,#1
3700                     ; 533                     NodeState.IllumeLevel=u8Temp;
3702  03ed 7b02          	ld	a,(OFST+0,sp)
3703  03ef c70003        	ld	_NodeState+3,a
3705  03f2 2012          	jra	L5002
3706  03f4               L1002:
3707                     ; 537                     if(NodeState.IllumeLevel==u8Temp)
3709  03f4 c60003        	ld	a,_NodeState+3
3710  03f7 1102          	cp	a,(OFST+0,sp)
3711  03f9 2602          	jrne	L7002
3712                     ; 539                         FlagCANDataOK=FALSE; //重复的数据,不需发给主机
3714  03fb 0f01          	clr	(OFST-1,sp)
3715  03fd               L7002:
3716                     ; 541                     CAR_ILLUME_FLAG =1;
3718  03fd 72120000      	bset	_NodeState,#1
3719                     ; 542                     NodeState.IllumeLevel=u8Temp;
3721  0401 7b02          	ld	a,(OFST+0,sp)
3722  0403 c70003        	ld	_NodeState+3,a
3723  0406               L5002:
3724                     ; 544                 if(TRUE==FlagCANDataOK)
3726  0406 7b01          	ld	a,(OFST-1,sp)
3727  0408 a101          	cp	a,#1
3728  040a 2700          	jreq	L1771
3729  040c               L7371:
3730                     ; 556             break;
3732  040c               L1771:
3733                     ; 559     CanFlagAnalyse();
3735  040c 8d130413      	callf	f_CanFlagAnalyse
3737                     ; 560 }
3740  0410 5b04          	addw	sp,#4
3741  0412 87            	retf
3765                     ; 571 void CanFlagAnalyse(void)
3765                     ; 572 {
3766                     	switch	.text
3767  0413               f_CanFlagAnalyse:
3771                     ; 573 	if(CAR_ACC_FLAG)
3773  0413 c60000        	ld	a,_NodeState
3774  0416 a501          	bcp	a,#1
3775  0418 2706          	jreq	L3202
3776                     ; 575 		ACC_CTRL=1 ;      
3778  041a 72145023      	bset	_GPIOH,#2
3780  041e 2004          	jra	L5202
3781  0420               L3202:
3782                     ; 579 		ACC_CTRL=0;   
3784  0420 72155023      	bres	_GPIOH,#2
3785  0424               L5202:
3786                     ; 581 }
3789  0424 87            	retf
3813                     ; 591 BoolT CANGetEmptyMegBox(void)
3813                     ; 592 {
3814                     	switch	.text
3815  0425               f_CANGetEmptyMegBox:
3819                     ; 593     if(CAN.TPR &CAN_TPR_TME0)
3821  0425 c65423        	ld	a,_CAN+3
3822  0428 a504          	bcp	a,#4
3823  042a 2706          	jreq	L7302
3824                     ; 595         CAN.PSR =CAN_PS_TXMB0;
3826  042c 725f5427      	clr	_CAN+7
3828  0430 2018          	jra	L1402
3829  0432               L7302:
3830                     ; 597     else if(CAN.TPR &CAN_TPR_TME1)
3832  0432 c65423        	ld	a,_CAN+3
3833  0435 a508          	bcp	a,#8
3834  0437 2706          	jreq	L3402
3835                     ; 599         CAN.PSR =CAN_PS_TXMB1;
3837  0439 35015427      	mov	_CAN+7,#1
3839  043d 200b          	jra	L1402
3840  043f               L3402:
3841                     ; 601     else if(CAN.TPR &CAN_TPR_TME2)
3843  043f c65423        	ld	a,_CAN+3
3844  0442 a510          	bcp	a,#16
3845  0444 2707          	jreq	L7402
3846                     ; 603         CAN.PSR =CAN_PS_TXMB2;
3848  0446 35055427      	mov	_CAN+7,#5
3850  044a               L1402:
3851                     ; 609     return TRUE;
3853  044a a601          	ld	a,#1
3856  044c 87            	retf
3857  044d               L7402:
3858                     ; 607         return FALSE;
3860  044d 4f            	clr	a
3863  044e 87            	retf
3900                     ; 620 void SendToCan(CanMsgTypeDef *pCanMsg)
3900                     ; 621 {
3901                     	switch	.text
3902  044f               f_SendToCan:
3906                     ; 622     CanMsgTransmit(pCanMsg);
3908  044f 8da201a2      	callf	f_CanMsgTransmit
3910                     ; 623 }
3913  0453 87            	retf
3947                     ; 633 void Can_Main(void)
3947                     ; 634 {
3948                     	switch	.text
3949  0454               f_Can_Main:
3953                     ; 635 	switch(CanBusState)
3955  0454 c60000        	ld	a,_CanBusState
3957                     ; 673 			CLEAR_WWDG;			
3958  0457 4d            	tnz	a
3959  0458 2722          	jreq	L3702
3960  045a 4a            	dec	a
3961  045b 2737          	jreq	L5702
3962  045d 4a            	dec	a
3963  045e 2604          	jrne	L05
3964  0460 ace504e5      	jpf	L1012
3965  0464               L05:
3966  0464 4a            	dec	a
3967  0465 2604          	jrne	L25
3968  0467 acf104f1      	jpf	L1212
3969  046b               L25:
3970  046b 4a            	dec	a
3971  046c 276a          	jreq	L7702
3972  046e               L5012:
3973                     ; 672 			BEGIN_WWDG;			
3975  046e 357f50d2      	mov	_WWDG+1,#127
3978  0472 35ff50d1      	mov	_WWDG,#255
3979                     ; 673 			CLEAR_WWDG;			
3982  0476 357f50d1      	mov	_WWDG,#127
3983  047a               L5212:
3985  047a 20fe          	jra	L5212
3986  047c               L3702:
3987                     ; 637 		case CAN_INITIAL:
3987                     ; 638 			CanWakeUp();
3989  047c 8d8f018f      	callf	f_CanWakeUp
3991                     ; 639 			CanInit(CAN_MCR_ABOM | CAN_MCR_AWUM |CAN_MCR_NART);
3993  0480 a670          	ld	a,#112
3994  0482 8d000000      	callf	f_CanInit
3996                     ; 640 			CanInterruptRestore();
3998  0486 8d500250      	callf	f_CanInterruptRestore
4000                     ; 641 			CanBusWakeup();
4002  048a 72175014      	bres	_GPIOE,#3
4003                     ; 642 			CanBusState=CAN_RUNNING;
4006  048e 35010000      	mov	_CanBusState,#1
4007                     ; 643 			break;
4009  0492 205d          	jra	L1212
4010  0494               L5702:
4011                     ; 644 		case CAN_RUNNING:
4011                     ; 645 		    CanTxRxBuffer.id=CANID_SWITCHSTATE;
4013  0494 aec080        	ldw	x,#49280
4014  0497 cf0002        	ldw	_CanTxRxBuffer+2,x
4015  049a ae1029        	ldw	x,#4137
4016  049d cf0000        	ldw	_CanTxRxBuffer,x
4017                     ; 646 		    CanTxRxBuffer.dlc=8;
4019  04a0 35080004      	mov	_CanTxRxBuffer+4,#8
4020                     ; 647 		    CanTxRxBuffer.data[0]=BYTE_3(DebugWord[0]);
4022  04a4 5500000005    	mov	_CanTxRxBuffer+5,_DebugWord
4023                     ; 648 		    CanTxRxBuffer.data[1]=BYTE_2(DebugWord[0]);
4025  04a9 5500010006    	mov	_CanTxRxBuffer+6,_DebugWord+1
4026                     ; 649 		    CanTxRxBuffer.data[2]=BYTE_1(DebugWord[0]);
4028  04ae 5500020007    	mov	_CanTxRxBuffer+7,_DebugWord+2
4029                     ; 651 		    CanTxRxBuffer.data[3]=LED;
4031  04b3 55500a0008    	mov	_CanTxRxBuffer+8,_GPIOC
4032                     ; 652 		    CanTxRxBuffer.data[4]=BYTE_3(DebugWord[1]);
4034  04b8 5500040009    	mov	_CanTxRxBuffer+9,_DebugWord+4
4035                     ; 653 		    CanTxRxBuffer.data[5]=BYTE_2(DebugWord[1]);
4037  04bd 550005000a    	mov	_CanTxRxBuffer+10,_DebugWord+5
4038                     ; 654 		    CanTxRxBuffer.data[6]=BYTE_1(DebugWord[1]);
4040  04c2 550006000b    	mov	_CanTxRxBuffer+11,_DebugWord+6
4041                     ; 655 		    CanTxRxBuffer.data[7]=BYTE_0(DebugWord[1]);
4043  04c7 c60007        	ld	a,_DebugWord+7
4044  04ca a4ff          	and	a,#255
4045  04cc c7000c        	ld	_CanTxRxBuffer+12,a
4046                     ; 656             SendToCan(&CanTxRxBuffer);
4048  04cf ae0000        	ldw	x,#_CanTxRxBuffer
4049  04d2 8d4f044f      	callf	f_SendToCan
4051                     ; 657 			break;
4053  04d6 2019          	jra	L1212
4054  04d8               L7702:
4055                     ; 658 		case CAN_ACCOFF:
4055                     ; 659 			if(CAR_ACC_FLAG==1)
4057  04d8 c60000        	ld	a,_NodeState
4058  04db a501          	bcp	a,#1
4059  04dd 2712          	jreq	L1212
4060                     ; 661 				CanBusState=CAN_RUNNING;
4062  04df 35010000      	mov	_CanBusState,#1
4063  04e3 200c          	jra	L1212
4064  04e5               L1012:
4065                     ; 664 		case CAN_WAITSLEEP:
4065                     ; 665 			CanSleep();
4067  04e5 8d770177      	callf	f_CanSleep
4069                     ; 666 			CanBusSleep();
4071  04e9 72165014      	bset	_GPIOE,#3
4072                     ; 667 			CanBusState=CAN_SLEEP;	
4075  04ed 35030000      	mov	_CanBusState,#3
4076                     ; 668 			break;
4078  04f1               L1212:
4079                     ; 680 }
4082  04f1 87            	retf
4094                     	xdef	f_CANGetEmptyMegBox
4095                     	xdef	f_CanMsgTransmit
4096                     	xref	_DebugWord
4097                     	xdef	f_Can_Main
4098                     	xdef	f_CanFlagAnalyse
4099                     	xdef	f_SendToCan
4100                     	xdef	f_CanIllumLevel
4101                     	xdef	f_ISR_Can_Rx
4102                     	xdef	f_ISR_Can_Tx
4103                     	xdef	f_Can_Store_Rcvd_Msg
4104                     	xdef	f_CanInterruptRestore
4105                     	xdef	f_CanInterruptDisable
4106                     	xdef	f_CanWakeUp
4107                     	xdef	f_Can_Wakeup_Enable
4108                     	xdef	f_CanSleep
4109                     	xdef	f_CanInit
4110                     	xref	_CanTxRxBuffer
4111                     	xref	_CanBusState
4112                     	xref	_NodeState
4113                     	xref	_CanPage
4114                     	xref.b	c_x
4133                     	xref	d_jltab
4134                     	xref	d_ltor
4135                     	xref	d_lgadc
4136                     	xref	d_lglsh
4137                     	end
