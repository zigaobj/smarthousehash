   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
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
3171                     .const:	section	.text
3172  0000               L5161:
3173  0000 0003          	dc.w	3
3174  0002 10242040      	dc.l	270803008
3175  0006 02d1          	dc.w	L1751
3176  0008 1029c080      	dc.l	271171712
3177  000c 02d1          	dc.w	L1751
3178  000e 10466677      	dc.l	273049207
3179  0012 02d1          	dc.w	L1751
3180  0014 030b          	dc.w	L7161
3181                     ; 365 void Can_Store_Rcvd_Msg(void)	//中断服务程序中执行
3181                     ; 366 {
3182                     	scross	off
3183                     	switch	.text
3184  0267               f_Can_Store_Rcvd_Msg:
3186  0267 5203          	subw	sp,#3
3187       00000003      OFST:	set	3
3190                     ; 368 	u8 *u8p =&CAN_PAGE_MDAR1;
3192  0269 ae542e        	ldw	x,#_CAN+14
3193  026c 1f01          	ldw	(OFST-2,sp),x
3194                     ; 370 	CAN.PSR = CAN_PS_FIFO; //进入接收数据FIFO页面
3196  026e 35075427      	mov	_CAN+7,#7
3197                     ; 371     CanTxRxBuffer.id =CAN_PAGE_MIDR1&0x1F;
3199  0272 c6542a        	ld	a,_CAN+10
3200  0275 a41f          	and	a,#31
3201  0277 c70003        	ld	_CanTxRxBuffer+3,a
3202  027a 4f            	clr	a
3203  027b c70002        	ld	_CanTxRxBuffer+2,a
3204  027e c70001        	ld	_CanTxRxBuffer+1,a
3205  0281 c70000        	ld	_CanTxRxBuffer,a
3206                     ; 372     CanTxRxBuffer.id <<=8; //移位计算更优
3208  0284 ae0000        	ldw	x,#_CanTxRxBuffer
3209  0287 a608          	ld	a,#8
3210  0289 8d000000      	callf	d_lglsh
3212                     ; 373     CanTxRxBuffer.id +=CAN_PAGE_MIDR2;
3214  028d c6542b        	ld	a,_CAN+11
3215  0290 ae0000        	ldw	x,#_CanTxRxBuffer
3216  0293 88            	push	a
3217  0294 8d000000      	callf	d_lgadc
3219  0298 84            	pop	a
3220                     ; 374     CanTxRxBuffer.id <<=8;
3222  0299 ae0000        	ldw	x,#_CanTxRxBuffer
3223  029c a608          	ld	a,#8
3224  029e 8d000000      	callf	d_lglsh
3226                     ; 375     CanTxRxBuffer.id +=CAN_PAGE_MIDR3;
3228  02a2 c6542c        	ld	a,_CAN+12
3229  02a5 ae0000        	ldw	x,#_CanTxRxBuffer
3230  02a8 88            	push	a
3231  02a9 8d000000      	callf	d_lgadc
3233  02ad 84            	pop	a
3234                     ; 376     CanTxRxBuffer.id <<=8;
3236  02ae ae0000        	ldw	x,#_CanTxRxBuffer
3237  02b1 a608          	ld	a,#8
3238  02b3 8d000000      	callf	d_lglsh
3240                     ; 377     CanTxRxBuffer.id +=CAN_PAGE_MIDR4;
3242  02b7 c6542d        	ld	a,_CAN+13
3243  02ba ae0000        	ldw	x,#_CanTxRxBuffer
3244  02bd 88            	push	a
3245  02be 8d000000      	callf	d_lgadc
3247  02c2 84            	pop	a
3248                     ; 379     switch(CanTxRxBuffer.id)
3250  02c3 ae0000        	ldw	x,#_CanTxRxBuffer
3251  02c6 8d000000      	callf	d_ltor
3254  02ca ae0000        	ldw	x,#L5161
3255  02cd 8d000000      	callf	d_jltab
3256  02d1               L1751:
3257                     ; 385     		CanTxRxBuffer.id = can_msg_id32; //保存ID
3259  02d1 ce0002        	ldw	x,_can_msg_id32+2
3260  02d4 cf0002        	ldw	_CanTxRxBuffer+2,x
3261  02d7 ce0000        	ldw	x,_can_msg_id32
3262  02da cf0000        	ldw	_CanTxRxBuffer,x
3263                     ; 386     		CanTxRxBuffer.dlc= CAN_PAGE_MDLCR; //此帧长度(字节数)
3265  02dd 5554290004    	mov	_CanTxRxBuffer+4,_CAN+9
3266                     ; 387 			for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
3268  02e2 0f03          	clr	(OFST+0,sp)
3270  02e4 2017          	jra	L5261
3271  02e6               L1261:
3272                     ; 389 				CanTxRxBuffer.data[idx]=u8p[idx];
3274  02e6 7b03          	ld	a,(OFST+0,sp)
3275  02e8 5f            	clrw	x
3276  02e9 97            	ld	xl,a
3277  02ea 89            	pushw	x
3278  02eb 7b03          	ld	a,(OFST+0,sp)
3279  02ed 97            	ld	xl,a
3280  02ee 7b04          	ld	a,(OFST+1,sp)
3281  02f0 1b05          	add	a,(OFST+2,sp)
3282  02f2 2401          	jrnc	L62
3283  02f4 5c            	incw	x
3284  02f5               L62:
3285  02f5 02            	rlwa	x,a
3286  02f6 f6            	ld	a,(x)
3287  02f7 85            	popw	x
3288  02f8 d70005        	ld	(_CanTxRxBuffer+5,x),a
3289                     ; 387 			for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
3291  02fb 0c03          	inc	(OFST+0,sp)
3292  02fd               L5261:
3295  02fd c60004        	ld	a,_CanTxRxBuffer+4
3296  0300 1103          	cp	a,(OFST+0,sp)
3297  0302 22e2          	jrugt	L1261
3298                     ; 391             CanMsgAnalyze(&CanTxRxBuffer);
3300  0304 ae0000        	ldw	x,#_CanTxRxBuffer
3301  0307 8db103b1      	callf	L5531f_CanMsgAnalyze
3303                     ; 392             break;
3305  030b               L3751:
3306                     ; 394         default:
3306                     ; 395     		break;
3308  030b               L7161:
3309                     ; 397 }
3312  030b 5b03          	addw	sp,#3
3313  030d 87            	retf
3347                     ; 407 void ISR_Can_Tx(void)
3347                     ; 408 {
3349                     	switch	.text
3350  030e               f_ISR_Can_Tx:
3352  030e 88            	push	a
3353       00000001      OFST:	set	1
3356                     ; 410     CanSavePg();
3358  030f 5554270000    	mov	_CanPage,_CAN+7
3359                     ; 412     CAN.PSR =CAN_PS_CTRL;
3361  0314 35065427      	mov	_CAN+7,#6
3362                     ; 413     if(CAN_PAGE_ESR)
3364  0318 725d5428      	tnz	_CAN+8
3365  031c 2714          	jreq	L5461
3366                     ; 415         ErrorCode=CAN_PAGE_ESR;
3368  031e c65428        	ld	a,_CAN+8
3369  0321 6b01          	ld	(OFST+0,sp),a
3370                     ; 416         if((CAN_PAGE_ESR&CAN_PAGE_ESR_LEC)!=0)
3372  0323 c65428        	ld	a,_CAN+8
3373  0326 a570          	bcp	a,#112
3374  0328 2704          	jreq	L7461
3375                     ; 418             CAN_PAGE_ESR =0;//|=CAN_PAGE_ESR_LEC;
3377  032a 725f5428      	clr	_CAN+8
3378  032e               L7461:
3379                     ; 420         CAN.MSR |=CAN_MSR_ERRI;
3381  032e 72145421      	bset	_CAN+1,#2
3382  0332               L5461:
3383                     ; 422     CanRestorePg();
3385  0332 5500005427    	mov	_CAN+7,_CanPage
3386                     ; 423 }
3389  0337 84            	pop	a
3390  0338 87            	retf
3415                     ; 434 void ISR_Can_Rx(void)
3415                     ; 435 {
3416                     	switch	.text
3417  0339               f_ISR_Can_Rx:
3421                     ; 436 	CanSavePg();   
3423  0339 5554270000    	mov	_CanPage,_CAN+7
3424                     ; 438 	if (CAN.RFR & CAN_RFR_FOVR)
3426  033e c65424        	ld	a,_CAN+4
3427  0341 a510          	bcp	a,#16
3428  0343 2706          	jreq	L1661
3429                     ; 440 		CAN.RFR |= CAN_RFR_FOVR;		/* clear the FIFO Overrun (FOVR) bit */
3431  0345 72185424      	bset	_CAN+4,#4
3433  0349 2019          	jra	L1761
3434  034b               L1661:
3435                     ; 442 	else if (CAN.RFR & CAN_RFR_FULL)
3437  034b c65424        	ld	a,_CAN+4
3438  034e a508          	bcp	a,#8
3439  0350 2712          	jreq	L1761
3440                     ; 444 		CAN.RFR |= CAN_RFR_FULL;		/* clear the FIFO full (FULL) bit */      
3442  0352 72165424      	bset	_CAN+4,#3
3443  0356 200c          	jra	L1761
3444  0358               L7661:
3445                     ; 448         Can_Store_Rcvd_Msg();
3447  0358 8d670267      	callf	f_Can_Store_Rcvd_Msg
3449                     ; 449         CAN.RFR |= CAN_RFR_RFOM; // Release mailbox
3451  035c 721a5424      	bset	_CAN+4,#5
3452                     ; 450 		CAN.RFR |= CAN_RFR_RFOM; //此语句要用2句,原因还没搞明白
3454  0360 721a5424      	bset	_CAN+4,#5
3455  0364               L1761:
3456                     ; 446 	while (CAN.RFR & CAN_RFR_FMP)	/* Check until FMP != 0 */
3458  0364 c65424        	ld	a,_CAN+4
3459  0367 a503          	bcp	a,#3
3460  0369 26ed          	jrne	L7661
3461                     ; 452 	CanRestorePg();
3463  036b 5500005427    	mov	_CAN+7,_CanPage
3464                     ; 453 }
3467  0370 87            	retf
3498                     ; 463 u8 CanIllumLevel(u8 Byte)
3498                     ; 464 {
3499                     	switch	.text
3500  0371               f_CanIllumLevel:
3502  0371 88            	push	a
3503       00000000      OFST:	set	0
3506                     ; 465     switch(Byte)
3509                     ; 488             break;
3510  0372 4d            	tnz	a
3511  0373 2717          	jreq	L5761
3512  0375 a00b          	sub	a,#11
3513  0377 271d          	jreq	L1071
3514  0379 4a            	dec	a
3515  037a 2716          	jreq	L7761
3516  037c a0ee          	sub	a,#238
3517  037e 271c          	jreq	L3071
3518  0380               L5071:
3519                     ; 479         default:
3519                     ; 480             if(Byte&0x0F)
3521  0380 7b01          	ld	a,(OFST+1,sp)
3522  0382 a50f          	bcp	a,#15
3523  0384 271c          	jreq	L7271
3524                     ; 482                 Byte=0xFF;
3526  0386 a6ff          	ld	a,#255
3527  0388 6b01          	ld	(OFST+1,sp),a
3529  038a 2020          	jra	L5271
3530  038c               L5761:
3531                     ; 467         case PARA_ILL_OFF:
3531                     ; 468             Byte=0x7F;
3533  038c a67f          	ld	a,#127
3534  038e 6b01          	ld	(OFST+1,sp),a
3535                     ; 469             break;
3537  0390 201a          	jra	L5271
3538  0392               L7761:
3539                     ; 470         case PARA_ILL_LV0:
3539                     ; 471             Byte=0; //背光0级亮度
3541  0392 0f01          	clr	(OFST+1,sp)
3542                     ; 472             break;
3544  0394 2016          	jra	L5271
3545  0396               L1071:
3546                     ; 473         case PARA_ILL_LV1:
3546                     ; 474             Byte=1; //背光1级亮度
3548  0396 a601          	ld	a,#1
3549  0398 6b01          	ld	(OFST+1,sp),a
3550                     ; 475             break;
3552  039a 2010          	jra	L5271
3553  039c               L3071:
3554                     ; 476         case PARA_ILL_LV17:
3554                     ; 477             Byte=17; //背光17级亮度
3556  039c a611          	ld	a,#17
3557  039e 6b01          	ld	(OFST+1,sp),a
3558                     ; 478             break;
3560  03a0 200a          	jra	L5271
3561  03a2               L7271:
3562                     ; 486                 Byte=((Byte>>4)&0x0F)+1;
3564  03a2 7b01          	ld	a,(OFST+1,sp)
3565  03a4 4e            	swap	a
3566  03a5 a40f          	and	a,#15
3567  03a7 a40f          	and	a,#15
3568  03a9 4c            	inc	a
3569  03aa 6b01          	ld	(OFST+1,sp),a
3570  03ac               L5271:
3571                     ; 490     return(Byte);
3573  03ac 7b01          	ld	a,(OFST+1,sp)
3576  03ae 5b01          	addw	sp,#1
3577  03b0 87            	retf
3634                     	switch	.const
3635  0016               L7671:
3636  0016 0003          	dc.w	3
3637  0018 10242040      	dc.l	270803008
3638  001c 03c2          	dc.w	L3371
3639  001e 1029c080      	dc.l	271171712
3640  0022 041a          	dc.w	L7371
3641  0024 10466677      	dc.l	273049207
3642  0028 03d6          	dc.w	L5371
3643  002a 0420          	dc.w	L1771
3644                     ; 502 static void CanMsgAnalyze(CanMsgTypeDef *pCanMsg)
3644                     ; 503 {
3645                     	scross	off
3646                     	switch	.text
3647  03b1               L5531f_CanMsgAnalyze:
3649  03b1 89            	pushw	x
3650  03b2 89            	pushw	x
3651       00000002      OFST:	set	2
3654                     ; 506     BoolT FlagCANDataOK=TRUE;
3656  03b3 a601          	ld	a,#1
3657  03b5 6b01          	ld	(OFST-1,sp),a
3658                     ; 508     switch(pCanMsg->id)
3660  03b7 8d000000      	callf	d_ltor
3663  03bb ae0016        	ldw	x,#L7671
3664  03be 8d000000      	callf	d_jltab
3665  03c2               L3371:
3666                     ; 512             if(0x4A==pCanMsg->data[0])
3668  03c2 1e03          	ldw	x,(OFST+1,sp)
3669  03c4 e605          	ld	a,(5,x)
3670  03c6 a14a          	cp	a,#74
3671  03c8 2606          	jrne	L3771
3672                     ; 514                 CAR_ACC_FLAG=1;
3674  03ca 72100000      	bset	_NodeState,#0
3676  03ce 2050          	jra	L1771
3677  03d0               L3771:
3678                     ; 518                 CAR_ACC_FLAG=0;
3680  03d0 72110000      	bres	_NodeState,#0
3681  03d4 204a          	jra	L1771
3682  03d6               L5371:
3683                     ; 524             u8Temp=CanIllumLevel(pCanMsg->data[0]);
3685  03d6 1e03          	ldw	x,(OFST+1,sp)
3686  03d8 e605          	ld	a,(5,x)
3687  03da 8d710371      	callf	f_CanIllumLevel
3689  03de 6b02          	ld	(OFST+0,sp),a
3690                     ; 525             if(0xFF!=u8Temp)
3692  03e0 7b02          	ld	a,(OFST+0,sp)
3693  03e2 a1ff          	cp	a,#255
3694  03e4 273a          	jreq	L1771
3695                     ; 527                 if(0x7F==u8Temp)
3697  03e6 7b02          	ld	a,(OFST+0,sp)
3698  03e8 a17f          	cp	a,#127
3699  03ea 2614          	jrne	L1002
3700                     ; 529                     if(NodeState.IllumeLevel==u8Temp)
3702  03ec c60003        	ld	a,_NodeState+3
3703  03ef 1102          	cp	a,(OFST+0,sp)
3704  03f1 2602          	jrne	L3002
3705                     ; 531                         FlagCANDataOK=FALSE; //重复的数据,不需发给主机
3707  03f3 0f01          	clr	(OFST-1,sp)
3708  03f5               L3002:
3709                     ; 533                     CAR_ILLUME_FLAG =0;
3711  03f5 72130000      	bres	_NodeState,#1
3712                     ; 534                     NodeState.IllumeLevel=u8Temp;
3714  03f9 7b02          	ld	a,(OFST+0,sp)
3715  03fb c70003        	ld	_NodeState+3,a
3717  03fe 2012          	jra	L5002
3718  0400               L1002:
3719                     ; 538                     if(NodeState.IllumeLevel==u8Temp)
3721  0400 c60003        	ld	a,_NodeState+3
3722  0403 1102          	cp	a,(OFST+0,sp)
3723  0405 2602          	jrne	L7002
3724                     ; 540                         FlagCANDataOK=FALSE; //重复的数据,不需发给主机
3726  0407 0f01          	clr	(OFST-1,sp)
3727  0409               L7002:
3728                     ; 542                     CAR_ILLUME_FLAG =1;
3730  0409 72120000      	bset	_NodeState,#1
3731                     ; 543                     NodeState.IllumeLevel=u8Temp;
3733  040d 7b02          	ld	a,(OFST+0,sp)
3734  040f c70003        	ld	_NodeState+3,a
3735  0412               L5002:
3736                     ; 545                 if(TRUE==FlagCANDataOK)
3738  0412 7b01          	ld	a,(OFST-1,sp)
3739  0414 a101          	cp	a,#1
3740  0416 2608          	jrne	L1771
3741  0418 2006          	jra	L1771
3742  041a               L7371:
3743                     ; 556             SendToCan(pCanMsg);
3745  041a 1e03          	ldw	x,(OFST+1,sp)
3746  041c 8d630463      	callf	f_SendToCan
3748                     ; 557             break;
3750  0420               L1771:
3751                     ; 560     CanFlagAnalyse();
3753  0420 8d270427      	callf	f_CanFlagAnalyse
3755                     ; 561 }
3758  0424 5b04          	addw	sp,#4
3759  0426 87            	retf
3784                     ; 572 void CanFlagAnalyse(void)
3784                     ; 573 {
3786                     	switch	.text
3787  0427               f_CanFlagAnalyse:
3791                     ; 574 	if(CAR_ACC_FLAG)
3793  0427 c60000        	ld	a,_NodeState
3794  042a a501          	bcp	a,#1
3795  042c 2706          	jreq	L3202
3796                     ; 576 		ACC_CTRL=1 ;      
3798  042e 72145023      	bset	_GPIOH,#2
3800  0432 2004          	jra	L5202
3801  0434               L3202:
3802                     ; 580 		ACC_CTRL=0;   
3804  0434 72155023      	bres	_GPIOH,#2
3805  0438               L5202:
3806                     ; 582 }
3809  0438 87            	retf
3833                     ; 592 BoolT CANGetEmptyMegBox(void)
3833                     ; 593 {
3834                     	switch	.text
3835  0439               f_CANGetEmptyMegBox:
3839                     ; 594     if(CAN.TPR &CAN_TPR_TME0)
3841  0439 c65423        	ld	a,_CAN+3
3842  043c a504          	bcp	a,#4
3843  043e 2706          	jreq	L7302
3844                     ; 596         CAN.PSR =CAN_PS_TXMB0;
3846  0440 725f5427      	clr	_CAN+7
3848  0444 2018          	jra	L1402
3849  0446               L7302:
3850                     ; 598     else if(CAN.TPR &CAN_TPR_TME1)
3852  0446 c65423        	ld	a,_CAN+3
3853  0449 a508          	bcp	a,#8
3854  044b 2706          	jreq	L3402
3855                     ; 600         CAN.PSR =CAN_PS_TXMB1;
3857  044d 35015427      	mov	_CAN+7,#1
3859  0451 200b          	jra	L1402
3860  0453               L3402:
3861                     ; 602     else if(CAN.TPR &CAN_TPR_TME2)
3863  0453 c65423        	ld	a,_CAN+3
3864  0456 a510          	bcp	a,#16
3865  0458 2707          	jreq	L7402
3866                     ; 604         CAN.PSR =CAN_PS_TXMB2;
3868  045a 35055427      	mov	_CAN+7,#5
3870  045e               L1402:
3871                     ; 610     return TRUE;
3873  045e a601          	ld	a,#1
3876  0460 87            	retf
3877  0461               L7402:
3878                     ; 608         return FALSE;
3880  0461 4f            	clr	a
3883  0462 87            	retf
3920                     ; 621 void SendToCan(CanMsgTypeDef *pCanMsg)
3920                     ; 622 {
3921                     	switch	.text
3922  0463               f_SendToCan:
3926                     ; 623     CanMsgTransmit(pCanMsg);
3928  0463 8da201a2      	callf	f_CanMsgTransmit
3930                     ; 624 }
3933  0467 87            	retf
3966                     ; 634 void Can_Main(void)
3966                     ; 635 {
3967                     	switch	.text
3968  0468               f_Can_Main:
3972                     ; 636 	switch(CanBusState)
3974  0468 c60000        	ld	a,_CanBusState
3976                     ; 673 			CLEAR_WWDG;			
3977  046b 4d            	tnz	a
3978  046c 2722          	jreq	L3702
3979  046e 4a            	dec	a
3980  046f 2737          	jreq	L5702
3981  0471 4a            	dec	a
3982  0472 2604          	jrne	L05
3983  0474 acfc04fc      	jpf	L1012
3984  0478               L05:
3985  0478 4a            	dec	a
3986  0479 2604          	jrne	L25
3987  047b ac080508      	jpf	L1212
3988  047f               L25:
3989  047f 4a            	dec	a
3990  0480 276d          	jreq	L7702
3991  0482               L5012:
3992                     ; 672 			BEGIN_WWDG;			
3994  0482 357f50d2      	mov	_WWDG+1,#127
3997  0486 35ff50d1      	mov	_WWDG,#255
3998                     ; 673 			CLEAR_WWDG;			
4001  048a 357f50d1      	mov	_WWDG,#127
4002  048e               L5212:
4004  048e 20fe          	jra	L5212
4005  0490               L3702:
4006                     ; 638 		case CAN_INITIAL:
4006                     ; 639 			CanWakeUp();                                                                      
4008  0490 8d8f018f      	callf	f_CanWakeUp
4010                     ; 640 			CanInit(CAN_MCR_ABOM | CAN_MCR_AWUM |CAN_MCR_NART);
4012  0494 a670          	ld	a,#112
4013  0496 8d000000      	callf	f_CanInit
4015                     ; 641 			CanInterruptRestore();
4017  049a 8d500250      	callf	f_CanInterruptRestore
4019                     ; 642 			CanBusWakeup();
4021  049e 72175014      	bres	_GPIOE,#3
4022                     ; 643 			CanBusState=CAN_RUNNING;
4025  04a2 35010000      	mov	_CanBusState,#1
4026                     ; 644 			break;
4028  04a6 2060          	jra	L1212
4029  04a8               L5702:
4030                     ; 645 		case CAN_RUNNING:
4030                     ; 646 		    CanTxRxBuffer.id=CANID_SWITCHSTATE;
4032  04a8 aec080        	ldw	x,#49280
4033  04ab cf0002        	ldw	_CanTxRxBuffer+2,x
4034  04ae ae1029        	ldw	x,#4137
4035  04b1 cf0000        	ldw	_CanTxRxBuffer,x
4036                     ; 647 		    CanTxRxBuffer.dlc=8;
4038  04b4 35080004      	mov	_CanTxRxBuffer+4,#8
4039                     ; 648 		    CanTxRxBuffer.data[0]=BYTE_3(DebugWord[0]);
4041  04b8 5500000005    	mov	_CanTxRxBuffer+5,_DebugWord
4042                     ; 649 		    CanTxRxBuffer.data[1]=BYTE_2(DebugWord[0]);
4044  04bd 5500010006    	mov	_CanTxRxBuffer+6,_DebugWord+1
4045                     ; 650 		    CanTxRxBuffer.data[2]=BYTE_1(DebugWord[0]);
4047  04c2 5500020007    	mov	_CanTxRxBuffer+7,_DebugWord+2
4048                     ; 651 		    CanTxRxBuffer.data[3]=BYTE_0(DebugWord[0]);
4050  04c7 c60003        	ld	a,_DebugWord+3
4051  04ca a4ff          	and	a,#255
4052  04cc c70008        	ld	_CanTxRxBuffer+8,a
4053                     ; 652 		    CanTxRxBuffer.data[4]=BYTE_3(DebugWord[1]);
4055  04cf 5500040009    	mov	_CanTxRxBuffer+9,_DebugWord+4
4056                     ; 653 		    CanTxRxBuffer.data[5]=BYTE_2(DebugWord[1]);
4058  04d4 550005000a    	mov	_CanTxRxBuffer+10,_DebugWord+5
4059                     ; 654 		    CanTxRxBuffer.data[6]=BYTE_1(DebugWord[1]);
4061  04d9 550006000b    	mov	_CanTxRxBuffer+11,_DebugWord+6
4062                     ; 655 		    CanTxRxBuffer.data[7]=BYTE_0(DebugWord[1]);
4064  04de c60007        	ld	a,_DebugWord+7
4065  04e1 a4ff          	and	a,#255
4066  04e3 c7000c        	ld	_CanTxRxBuffer+12,a
4067                     ; 656             SendToCan(&CanTxRxBuffer);
4069  04e6 ae0000        	ldw	x,#_CanTxRxBuffer
4070  04e9 8d630463      	callf	f_SendToCan
4072                     ; 657 			break;
4074  04ed 2019          	jra	L1212
4075  04ef               L7702:
4076                     ; 658 		case CAN_ACCOFF:
4076                     ; 659 			if(CAR_ACC_FLAG==1)
4078  04ef c60000        	ld	a,_NodeState
4079  04f2 a501          	bcp	a,#1
4080  04f4 2712          	jreq	L1212
4081                     ; 661 				CanBusState=CAN_RUNNING;
4083  04f6 35010000      	mov	_CanBusState,#1
4084  04fa 200c          	jra	L1212
4085  04fc               L1012:
4086                     ; 664 		case CAN_WAITSLEEP:
4086                     ; 665 			CanSleep();
4088  04fc 8d770177      	callf	f_CanSleep
4090                     ; 666 			CanBusSleep();
4092  0500 72165014      	bset	_GPIOE,#3
4093                     ; 667 			CanBusState=CAN_SLEEP;	
4096  0504 35030000      	mov	_CanBusState,#3
4097                     ; 668 			break;
4099  0508               L1212:
4100                     ; 680 }
4103  0508 87            	retf
4115                     	xdef	f_CANGetEmptyMegBox
4116                     	xdef	f_CanMsgTransmit
4117                     	xref	_DebugWord
4118                     	xdef	f_Can_Main
4119                     	xdef	f_CanFlagAnalyse
4120                     	xdef	f_SendToCan
4121                     	xdef	f_CanIllumLevel
4122                     	xdef	f_ISR_Can_Rx
4123                     	xdef	f_ISR_Can_Tx
4124                     	xdef	f_Can_Store_Rcvd_Msg
4125                     	xdef	f_CanInterruptRestore
4126                     	xdef	f_CanInterruptDisable
4127                     	xdef	f_CanWakeUp
4128                     	xdef	f_Can_Wakeup_Enable
4129                     	xdef	f_CanSleep
4130                     	xdef	f_CanInit
4131                     	xref	_can_msg_id32
4132                     	xref	_CanTxRxBuffer
4133                     	xref	_CanBusState
4134                     	xref	_NodeState
4135                     	xref	_CanPage
4136                     	xref.b	c_x
4155                     	xref	d_jltab
4156                     	xref	d_ltor
4157                     	xref	d_lgadc
4158                     	xref	d_lglsh
4159                     	end
