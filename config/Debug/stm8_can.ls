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
2445                     ; 79 	CAN_PAGE_FMR1 = 0x00;	/* Filter 0, 1, 2, 3 Low/High Register in Mask mode */
2447  0060 725f5430      	clr	_CAN+16
2448                     ; 80 	CAN_PAGE_FMR2 = 0x00;	/* Filter 4, 5 Low/High Register in Mask mode */
2450  0064 725f5431      	clr	_CAN+17
2451                     ; 102 	CAN.PSR = CAN_PS_FILTER01;
2453  0068 35025427      	mov	_CAN+7,#2
2454                     ; 104 	CAN_PAGE_FLR1 = 0x00;
2456  006c 725f5428      	clr	_CAN+8
2457                     ; 105 	CAN_PAGE_FLR2 = 0x80; //mask first bit
2459  0070 35805429      	mov	_CAN+9,#128
2460                     ; 106 	CAN_PAGE_FLR3 = 0x00;
2462  0074 725f542a      	clr	_CAN+10
2463                     ; 107 	CAN_PAGE_FLR4 = 0x08; //mask 5th bit
2465  0078 3508542b      	mov	_CAN+11,#8
2466                     ; 108 	CAN_PAGE_FLR5 = 0x00;
2468  007c 725f542c      	clr	_CAN+12
2469                     ; 109 	CAN_PAGE_FLR6 = 0x40; //mask second bit
2471  0080 3540542d      	mov	_CAN+13,#64
2472                     ; 110 	CAN_PAGE_FLR7 = 0x00;
2474  0084 725f542e      	clr	_CAN+14
2475                     ; 111 	CAN_PAGE_FLR8 = 0x00; //All Pass
2477  0088 725f542f      	clr	_CAN+15
2478                     ; 113 	CAN_PAGE_FHR1 = 0x00;
2480  008c 725f5430      	clr	_CAN+16
2481                     ; 114 	CAN_PAGE_FHR2 = 0x00;
2483  0090 725f5431      	clr	_CAN+17
2484                     ; 115 	CAN_PAGE_FHR3 = 0x00;
2486  0094 725f5432      	clr	_CAN+18
2487                     ; 116 	CAN_PAGE_FHR4 = 0x00;
2489  0098 725f5433      	clr	_CAN+19
2490                     ; 117 	CAN_PAGE_FHR5 = 0x00;
2492  009c 725f5434      	clr	_CAN+20
2493                     ; 118 	CAN_PAGE_FHR6 = 0x00;
2495  00a0 725f5435      	clr	_CAN+21
2496                     ; 119 	CAN_PAGE_FHR7 = 0x00;
2498  00a4 725f5436      	clr	_CAN+22
2499                     ; 120 	CAN_PAGE_FHR8 = 0x00;
2501  00a8 725f5437      	clr	_CAN+23
2502                     ; 123 	CAN.PSR = CAN_PS_FILTER23;
2504  00ac 35035427      	mov	_CAN+7,#3
2505                     ; 125 	CAN_PAGE_FLR1 = 0x00;
2507  00b0 725f5428      	clr	_CAN+8
2508                     ; 126 	CAN_PAGE_FLR2 = 0x00;
2510  00b4 725f5429      	clr	_CAN+9
2511                     ; 127 	CAN_PAGE_FLR3 = 0x00;
2513  00b8 725f542a      	clr	_CAN+10
2514                     ; 128 	CAN_PAGE_FLR4 = 0x00;
2516  00bc 725f542b      	clr	_CAN+11
2517                     ; 129 	CAN_PAGE_FLR5 = 0x00;
2519  00c0 725f542c      	clr	_CAN+12
2520                     ; 130 	CAN_PAGE_FLR6 = 0x00;
2522  00c4 725f542d      	clr	_CAN+13
2523                     ; 131 	CAN_PAGE_FLR7 = 0x00;
2525  00c8 725f542e      	clr	_CAN+14
2526                     ; 132 	CAN_PAGE_FLR8 = 0x00;
2528  00cc 725f542f      	clr	_CAN+15
2529                     ; 134 	CAN_PAGE_FHR1 = 0x00;
2531  00d0 725f5430      	clr	_CAN+16
2532                     ; 135 	CAN_PAGE_FHR2 = 0x00;
2534  00d4 725f5431      	clr	_CAN+17
2535                     ; 136 	CAN_PAGE_FHR3 = 0x00;
2537  00d8 725f5432      	clr	_CAN+18
2538                     ; 137 	CAN_PAGE_FHR4 = 0x00;
2540  00dc 725f5433      	clr	_CAN+19
2541                     ; 138 	CAN_PAGE_FHR5 = 0x00;
2543  00e0 725f5434      	clr	_CAN+20
2544                     ; 139 	CAN_PAGE_FHR6 = 0x00;
2546  00e4 725f5435      	clr	_CAN+21
2547                     ; 140 	CAN_PAGE_FHR7 = 0x00;
2549  00e8 725f5436      	clr	_CAN+22
2550                     ; 141 	CAN_PAGE_FHR8 = 0x00;
2552  00ec 725f5437      	clr	_CAN+23
2553                     ; 144 	CAN.PSR = CAN_PS_FILTER45;
2555  00f0 35045427      	mov	_CAN+7,#4
2556                     ; 146 	CAN_PAGE_FLR1 = 0xff;
2558  00f4 35ff5428      	mov	_CAN+8,#255
2559                     ; 147 	CAN_PAGE_FLR2 = 0xff;
2561  00f8 35ff5429      	mov	_CAN+9,#255
2562                     ; 148 	CAN_PAGE_FLR3 = 0xff;
2564  00fc 35ff542a      	mov	_CAN+10,#255
2565                     ; 149 	CAN_PAGE_FLR4 = 0xff;
2567  0100 35ff542b      	mov	_CAN+11,#255
2568                     ; 150 	CAN_PAGE_FLR5 = 0xff;
2570  0104 35ff542c      	mov	_CAN+12,#255
2571                     ; 151 	CAN_PAGE_FLR6 = 0xff;
2573  0108 35ff542d      	mov	_CAN+13,#255
2574                     ; 152 	CAN_PAGE_FLR7 = 0xff;
2576  010c 35ff542e      	mov	_CAN+14,#255
2577                     ; 153 	CAN_PAGE_FLR8 = 0xff;
2579  0110 35ff542f      	mov	_CAN+15,#255
2580                     ; 155 	CAN_PAGE_FHR1 = 0xff;
2582  0114 35ff5430      	mov	_CAN+16,#255
2583                     ; 156 	CAN_PAGE_FHR2 = 0xff;
2585  0118 35ff5431      	mov	_CAN+17,#255
2586                     ; 157 	CAN_PAGE_FHR3 = 0xff;
2588  011c 35ff5432      	mov	_CAN+18,#255
2589                     ; 158 	CAN_PAGE_FHR4 = 0xff;
2591  0120 35ff5433      	mov	_CAN+19,#255
2592                     ; 159 	CAN_PAGE_FHR5 = 0xff;
2594  0124 35ff5434      	mov	_CAN+20,#255
2595                     ; 160 	CAN_PAGE_FHR6 = 0xff;
2597  0128 35ff5435      	mov	_CAN+21,#255
2598                     ; 161 	CAN_PAGE_FHR7 = 0xff;
2600  012c 35ff5436      	mov	_CAN+22,#255
2601                     ; 162 	CAN_PAGE_FHR8 = 0xff;
2603  0130 35ff5437      	mov	_CAN+23,#255
2604                     ; 165 	CAN.PSR = CAN_PS_CTRL;	
2606  0134 35065427      	mov	_CAN+7,#6
2607                     ; 166 	CAN_PAGE_FCR1 |= CAN_FCR1_FILTER0_ACTIVE;	/* Filter 0 active */
2609  0138 72105432      	bset	_CAN+18,#0
2610                     ; 174 	CAN.PSR =CAN_PS_CTRL;
2612  013c 35065427      	mov	_CAN+7,#6
2613                     ; 175 	CAN_PAGE_BTR1 =(CAN_PAGE_BTR1_BRP&(CAN_PAGE_BTR1_BRP_RESET_VALUE-1))
2613                     ; 176 	              |(CAN_PAGE_BTR1_SJW&((CAN_PAGE_BTR1_SJW_RESET_VALUE-1)<<6));		// see can.h for modification of
2615  0140 359d542c      	mov	_CAN+12,#157
2616                     ; 177 	CAN_PAGE_BTR2 =(CAN_PAGE_BTR2_BS1&(CAN_PAGE_BTR2_BS1_RESET_VALUE-1)) 	        // bit timing parameters.
2616                     ; 178 	              |(CAN_PAGE_BTR2_BS2&((CAN_PAGE_BTR2_BS2_RESET_VALUE-1)<<4))
2616                     ; 179 	               |CAN_PAGE_BTR2_CLKS;
2618  0144 35a3542d      	mov	_CAN+13,#163
2619                     ; 184 	CAN.DGR |= CAN_DGR_TXM2E;	/* enable 3th Tx mailboxe */ 
2621  0148 72185426      	bset	_CAN+6,#4
2622                     ; 186 	CAN.MCR &= ~CAN_MCR_INRQ;	/* Leave the Init mode */
2624  014c 72115420      	bres	_CAN,#0
2626  0150 2001          	jra	L7141
2627  0152               L5141:
2628                     ; 189 		_asm("nop");
2631  0152 9d            nop
2633  0153               L7141:
2634                     ; 187 	while ((CAN.MSR &CAN_MSR_INAK))	/* Wait until acknowledged */ 
2636  0153 c65421        	ld	a,_CAN+1
2637  0156 a501          	bcp	a,#1
2638  0158 26f8          	jrne	L5141
2639                     ; 192 }
2642  015a 84            	pop	a
2643  015b 87            	retf
2667                     ; 201 void Can_Wakeup_Enable(void)
2667                     ; 202 {
2668                     	switch	.text
2669  015c               f_Can_Wakeup_Enable:
2673                     ; 203 	CanSavePg();
2675  015c 5554270000    	mov	_CanPage,_CAN+7
2676                     ; 205 	CAN.IER = CAN_IER_WKUIE | /* Wake-up Interrupt */
2676                     ; 206 			  CAN_IER_FOVIE | /* FIFO overrun Interrupt */
2676                     ; 207 			  CAN_IER_FFIE  | /* FIFO Full Interrupt */
2676                     ; 208 			  CAN_IER_FMPIE | /* FIFO Message Pending Interrupt */
2676                     ; 209 			  CAN_IER_TMEIE;  /* Transmit Mailbox Empty Interrupt */
2678  0161 358f5425      	mov	_CAN+5,#143
2679                     ; 211 	CAN.PSR = CAN_PS_CTRL;
2681  0165 35065427      	mov	_CAN+7,#6
2682                     ; 212 	CAN_PAGE_EIER = CAN_PAGE_EIER_ERRIE|	/* Error Interrupt */
2682                     ; 213 				    CAN_PAGE_EIER_LECIE|	/* Last Error Code Interrupt */
2682                     ; 214 				    CAN_PAGE_EIER_BOFIE|	/* Bus-Off Interrupt */
2682                     ; 215 				    CAN_PAGE_EIER_EPVIE|	/* Error Passive Interrupt */
2682                     ; 216 				    CAN_PAGE_EIER_EWGIE;	/* Error Warning Interrupt */
2684  0169 35975429      	mov	_CAN+9,#151
2685                     ; 218 	CanRestorePg();
2687  016d 5500005427    	mov	_CAN+7,_CanPage
2688                     ; 219 }
2691  0172 87            	retf
2716                     ; 228 void CanSleep(void)
2716                     ; 229 {
2717                     	switch	.text
2718  0173               f_CanSleep:
2722                     ; 230     CanInit(CAN_MCR_AWUM);
2724  0173 a620          	ld	a,#32
2725  0175 8d000000      	callf	f_CanInit
2727                     ; 231     Can_Wakeup_Enable();
2729  0179 8d5c015c      	callf	f_Can_Wakeup_Enable
2732  017d 2004          	jra	L5441
2733  017f               L3441:
2734                     ; 237         CAN.MCR |= CAN_MCR_SLEEP;		
2736  017f 72125420      	bset	_CAN,#1
2737  0183               L5441:
2738                     ; 234     while(!(CAN.MSR &CAN_MSR_SLAK))
2740  0183 c65421        	ld	a,_CAN+1
2741  0186 a502          	bcp	a,#2
2742  0188 27f5          	jreq	L3441
2743                     ; 239 }
2746  018a 87            	retf
2771                     ; 248 void CanWakeUp(void)
2771                     ; 249 {
2772                     	switch	.text
2773  018b               f_CanWakeUp:
2777                     ; 250 	CanBusWakeup();
2779  018b 72175014      	bres	_GPIOE,#3
2780                     ; 253 	CAN.MCR &= ~CAN_MCR_SLEEP;	
2783  018f 72135420      	bres	_CAN,#1
2785  0193 2001          	jra	L3641
2786  0195               L1641:
2787                     ; 258         _asm("nop");
2790  0195 9d            nop
2792  0196               L3641:
2793                     ; 256 	while(CAN.MSR & CAN_MSR_SLAK)
2795  0196 c65421        	ld	a,_CAN+1
2796  0199 a502          	bcp	a,#2
2797  019b 26f8          	jrne	L1641
2798                     ; 260 }
2801  019d 87            	retf
2897                     ; 275 BoolT CanMsgTransmit(CanMsgTypeDef *pCanMsg)
2897                     ; 276 {
2898                     	switch	.text
2899  019e               f_CanMsgTransmit:
2901  019e 89            	pushw	x
2902  019f 88            	push	a
2903       00000001      OFST:	set	1
2906                     ; 279 	if(CAN.TPR & CAN_TPR_TME0)			/* Mailbox 1 empty ? */
2908  01a0 c65423        	ld	a,_CAN+3
2909  01a3 a504          	bcp	a,#4
2910  01a5 270a          	jreq	L5351
2911                     ; 281 		CAN.PSR = CAN_PS_TXMB0;
2913  01a7 725f5427      	clr	_CAN+7
2914                     ; 282 		MailboxNumber = 1;
2916  01ab a601          	ld	a,#1
2917  01ad 6b01          	ld	(OFST+0,sp),a
2919  01af 2020          	jra	L7351
2920  01b1               L5351:
2921                     ; 284 	else if(CAN.TPR & CAN_TPR_TME1)	/* Mailbox 2 empty ? */
2923  01b1 c65423        	ld	a,_CAN+3
2924  01b4 a508          	bcp	a,#8
2925  01b6 270a          	jreq	L1451
2926                     ; 286 		CAN.PSR = CAN_PS_TXMB1;
2928  01b8 35015427      	mov	_CAN+7,#1
2929                     ; 287 		MailboxNumber = 2;		
2931  01bc a602          	ld	a,#2
2932  01be 6b01          	ld	(OFST+0,sp),a
2934  01c0 200f          	jra	L7351
2935  01c2               L1451:
2936                     ; 289 	else if(CAN.TPR & CAN_TPR_TME2)	/* Mailbox 3 empty ? */
2938  01c2 c65423        	ld	a,_CAN+3
2939  01c5 a510          	bcp	a,#16
2940  01c7 2749          	jreq	L5451
2941                     ; 291 		CAN.PSR = CAN_PS_TXMB2;
2943  01c9 35055427      	mov	_CAN+7,#5
2944                     ; 292 		MailboxNumber = 3;		
2946  01cd a603          	ld	a,#3
2947  01cf 6b01          	ld	(OFST+0,sp),a
2949  01d1               L7351:
2950                     ; 301     CAN_PAGE_MDLCR = 4;
2952  01d1 35045429      	mov	_CAN+9,#4
2953                     ; 303     *((u32*)&CAN_PAGE_MIDR1)=pCanMsg->id;
2955  01d5 1e02          	ldw	x,(OFST+1,sp)
2956  01d7 e603          	ld	a,(3,x)
2957  01d9 c7542d        	ld	_CAN+13,a
2958  01dc e602          	ld	a,(2,x)
2959  01de c7542c        	ld	_CAN+12,a
2960  01e1 e601          	ld	a,(1,x)
2961  01e3 c7542b        	ld	_CAN+11,a
2962  01e6 f6            	ld	a,(x)
2963  01e7 c7542a        	ld	_CAN+10,a
2964                     ; 304     CAN_PAGE_MIDR1|= CAN_ID_EXT;
2966  01ea 721c542a      	bset	_CAN+10,#6
2967                     ; 310     CAN_PAGE_MDAR1 =0x51;
2969  01ee 3551542e      	mov	_CAN+14,#81
2970                     ; 311     CAN_PAGE_MDAR2 =0x52;
2972  01f2 3552542f      	mov	_CAN+15,#82
2973                     ; 312     CAN_PAGE_MDAR3 =0x53;
2975  01f6 35535430      	mov	_CAN+16,#83
2976                     ; 313     CAN_PAGE_MDAR4 =0x54;
2978  01fa 35545431      	mov	_CAN+17,#84
2979                     ; 314     CAN_PAGE_MDAR5 =0x55;
2981  01fe 35555432      	mov	_CAN+18,#85
2982                     ; 315     CAN_PAGE_MDAR6 =0x56;
2984  0202 35565433      	mov	_CAN+19,#86
2985                     ; 316     CAN_PAGE_MDAR7 =0x57;
2987  0206 35575434      	mov	_CAN+20,#87
2988                     ; 317     CAN_PAGE_MDAR8 =0x58;
2990  020a 35585435      	mov	_CAN+21,#88
2991                     ; 320 	return(TRUE);
2993  020e a601          	ld	a,#1
2995  0210 2001          	jra	L61
2996  0212               L5451:
2997                     ; 296 		return (FALSE);
2999  0212 4f            	clr	a
3001  0213               L61:
3003  0213 5b03          	addw	sp,#3
3004  0215 87            	retf
3029                     ; 330 void CanInterruptDisable(void)
3029                     ; 331 {
3030                     	switch	.text
3031  0216               f_CanInterruptDisable:
3035                     ; 332 	CanSavePg();
3037  0216 5554270000    	mov	_CanPage,_CAN+7
3038                     ; 334 	CAN.IER = 0x00; 
3040  021b 725f5425      	clr	_CAN+5
3041                     ; 335 	CAN.PSR = CAN_PS_CTRL;         
3043  021f 35065427      	mov	_CAN+7,#6
3044                     ; 336 	CAN_PAGE_EIER = 0x00;
3046  0223 725f5429      	clr	_CAN+9
3047                     ; 338 	CanRestorePg();
3049  0227 5500005427    	mov	_CAN+7,_CanPage
3050                     ; 339 }
3053  022c 87            	retf
3078                     ; 348 void CanInterruptRestore (void)
3078                     ; 349 {
3079                     	switch	.text
3080  022d               f_CanInterruptRestore:
3084                     ; 350 	CanSavePg();
3086  022d 5554270000    	mov	_CanPage,_CAN+7
3087                     ; 352 	CAN.IER = 	//CAN_IER_WKUIE |	/* Wake-up Interrupt */
3087                     ; 353 				CAN_IER_FOVIE | /* FIFO overrun Interrupt */
3087                     ; 354 				CAN_IER_FFIE  |	/* FIFO Full Interrupt */
3087                     ; 355 				CAN_IER_FMPIE;// |	/* FIFO Message Pending Interrupt */
3089  0232 350e5425      	mov	_CAN+5,#14
3090                     ; 358 	CAN.PSR = CAN_PS_CTRL;
3092  0236 35065427      	mov	_CAN+7,#6
3093                     ; 359 	CAN_PAGE_EIER = CAN_PAGE_EIER_ERRIE|    /* Error Interrupt */
3093                     ; 360 				    CAN_PAGE_EIER_LECIE|        /* Last Error Code Interrupt */
3093                     ; 361 				    CAN_PAGE_EIER_BOFIE|        /* Bus-Off Interrupt */
3093                     ; 362 				    CAN_PAGE_EIER_EPVIE|        /* Error Passive Interrupt */
3093                     ; 363 				    CAN_PAGE_EIER_EWGIE;        /* Error Warning Interrupt */
3095  023a 35975429      	mov	_CAN+9,#151
3096                     ; 365 	CanRestorePg();
3098  023e 5500005427    	mov	_CAN+7,_CanPage
3099                     ; 366 }
3102  0243 87            	retf
3147                     .const:	section	.text
3148  0000               L5161:
3149  0000 0003          	dc.w	3
3150  0002 10242040      	dc.l	270803008
3151  0006 02ae          	dc.w	L1751
3152  0008 1029c080      	dc.l	271171712
3153  000c 02ae          	dc.w	L1751
3154  000e 10466677      	dc.l	273049207
3155  0012 02ae          	dc.w	L1751
3156  0014 02e8          	dc.w	L7161
3157                     ; 369 void Can_Store_Rcvd_Msg(void)	//中断服务程序中执行
3157                     ; 370 {
3158                     	switch	.text
3159  0244               f_Can_Store_Rcvd_Msg:
3161  0244 5203          	subw	sp,#3
3162       00000003      OFST:	set	3
3165                     ; 372 	u8 *u8p =&CAN_PAGE_MDAR1;
3167  0246 ae542e        	ldw	x,#_CAN+14
3168  0249 1f01          	ldw	(OFST-2,sp),x
3169                     ; 374 	CAN.PSR = CAN_PS_FIFO; //进入接收数据FIFO页面
3171  024b 35075427      	mov	_CAN+7,#7
3172                     ; 375     CanTxRxBuffer.id =CAN_PAGE_MIDR1&0x1F;
3174  024f c6542a        	ld	a,_CAN+10
3175  0252 a41f          	and	a,#31
3176  0254 c70003        	ld	_CanTxRxBuffer+3,a
3177  0257 4f            	clr	a
3178  0258 c70002        	ld	_CanTxRxBuffer+2,a
3179  025b c70001        	ld	_CanTxRxBuffer+1,a
3180  025e c70000        	ld	_CanTxRxBuffer,a
3181                     ; 376     CanTxRxBuffer.id <<=8; //移位计算更优
3183  0261 ae0000        	ldw	x,#_CanTxRxBuffer
3184  0264 a608          	ld	a,#8
3185  0266 8d000000      	callf	d_lglsh
3187                     ; 377     CanTxRxBuffer.id +=CAN_PAGE_MIDR2;
3189  026a c6542b        	ld	a,_CAN+11
3190  026d ae0000        	ldw	x,#_CanTxRxBuffer
3191  0270 88            	push	a
3192  0271 8d000000      	callf	d_lgadc
3194  0275 84            	pop	a
3195                     ; 378     CanTxRxBuffer.id <<=8;
3197  0276 ae0000        	ldw	x,#_CanTxRxBuffer
3198  0279 a608          	ld	a,#8
3199  027b 8d000000      	callf	d_lglsh
3201                     ; 379     CanTxRxBuffer.id +=CAN_PAGE_MIDR3;
3203  027f c6542c        	ld	a,_CAN+12
3204  0282 ae0000        	ldw	x,#_CanTxRxBuffer
3205  0285 88            	push	a
3206  0286 8d000000      	callf	d_lgadc
3208  028a 84            	pop	a
3209                     ; 380     CanTxRxBuffer.id <<=8;
3211  028b ae0000        	ldw	x,#_CanTxRxBuffer
3212  028e a608          	ld	a,#8
3213  0290 8d000000      	callf	d_lglsh
3215                     ; 381     CanTxRxBuffer.id +=CAN_PAGE_MIDR4;
3217  0294 c6542d        	ld	a,_CAN+13
3218  0297 ae0000        	ldw	x,#_CanTxRxBuffer
3219  029a 88            	push	a
3220  029b 8d000000      	callf	d_lgadc
3222  029f 84            	pop	a
3223                     ; 383     switch(CanTxRxBuffer.id)
3225  02a0 ae0000        	ldw	x,#_CanTxRxBuffer
3226  02a3 8d000000      	callf	d_ltor
3229  02a7 ae0000        	ldw	x,#L5161
3230  02aa 8d000000      	callf	d_jltab
3231  02ae               L1751:
3232                     ; 389     		CanTxRxBuffer.id = can_msg_id32; //保存ID
3234  02ae ce0002        	ldw	x,_can_msg_id32+2
3235  02b1 cf0002        	ldw	_CanTxRxBuffer+2,x
3236  02b4 ce0000        	ldw	x,_can_msg_id32
3237  02b7 cf0000        	ldw	_CanTxRxBuffer,x
3238                     ; 390     		CanTxRxBuffer.dlc= CAN_PAGE_MDLCR; //此帧长度(字节数)
3240  02ba 5554290004    	mov	_CanTxRxBuffer+4,_CAN+9
3241                     ; 391 			for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
3243  02bf 0f03          	clr	(OFST+0,sp)
3245  02c1 2017          	jra	L5261
3246  02c3               L1261:
3247                     ; 393 				CanTxRxBuffer.data[idx]=u8p[idx];
3249  02c3 7b03          	ld	a,(OFST+0,sp)
3250  02c5 5f            	clrw	x
3251  02c6 97            	ld	xl,a
3252  02c7 89            	pushw	x
3253  02c8 7b03          	ld	a,(OFST+0,sp)
3254  02ca 97            	ld	xl,a
3255  02cb 7b04          	ld	a,(OFST+1,sp)
3256  02cd 1b05          	add	a,(OFST+2,sp)
3257  02cf 2401          	jrnc	L62
3258  02d1 5c            	incw	x
3259  02d2               L62:
3260  02d2 02            	rlwa	x,a
3261  02d3 f6            	ld	a,(x)
3262  02d4 85            	popw	x
3263  02d5 d70005        	ld	(_CanTxRxBuffer+5,x),a
3264                     ; 391 			for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
3266  02d8 0c03          	inc	(OFST+0,sp)
3267  02da               L5261:
3270  02da c60004        	ld	a,_CanTxRxBuffer+4
3271  02dd 1103          	cp	a,(OFST+0,sp)
3272  02df 22e2          	jrugt	L1261
3273                     ; 395             CanMsgAnalyze(&CanTxRxBuffer);
3275  02e1 ae0000        	ldw	x,#_CanTxRxBuffer
3276  02e4 8d8e038e      	callf	L5531f_CanMsgAnalyze
3278                     ; 396             break;
3280  02e8               L3751:
3281                     ; 398         default:
3281                     ; 399     		break;
3283  02e8               L7161:
3284                     ; 401 }
3287  02e8 5b03          	addw	sp,#3
3288  02ea 87            	retf
3321                     ; 411 void ISR_Can_Tx(void)
3321                     ; 412 {
3322                     	switch	.text
3323  02eb               f_ISR_Can_Tx:
3325  02eb 88            	push	a
3326       00000001      OFST:	set	1
3329                     ; 414     CanSavePg();
3331  02ec 5554270000    	mov	_CanPage,_CAN+7
3332                     ; 416     CAN.PSR =CAN_PS_CTRL;
3334  02f1 35065427      	mov	_CAN+7,#6
3335                     ; 417     if(CAN_PAGE_ESR)
3337  02f5 725d5428      	tnz	_CAN+8
3338  02f9 2714          	jreq	L5461
3339                     ; 419         ErrorCode=CAN_PAGE_ESR;
3341  02fb c65428        	ld	a,_CAN+8
3342  02fe 6b01          	ld	(OFST+0,sp),a
3343                     ; 420         if((CAN_PAGE_ESR&CAN_PAGE_ESR_LEC)!=0)
3345  0300 c65428        	ld	a,_CAN+8
3346  0303 a570          	bcp	a,#112
3347  0305 2704          	jreq	L7461
3348                     ; 422             CAN_PAGE_ESR =0;//|=CAN_PAGE_ESR_LEC;
3350  0307 725f5428      	clr	_CAN+8
3351  030b               L7461:
3352                     ; 424         CAN.MSR |=CAN_MSR_ERRI;
3354  030b 72145421      	bset	_CAN+1,#2
3355  030f               L5461:
3356                     ; 426     CanRestorePg();
3358  030f 5500005427    	mov	_CAN+7,_CanPage
3359                     ; 427 }
3362  0314 84            	pop	a
3363  0315 87            	retf
3388                     ; 438 void ISR_Can_Rx(void)
3388                     ; 439 {
3389                     	switch	.text
3390  0316               f_ISR_Can_Rx:
3394                     ; 440 	CanSavePg();   
3396  0316 5554270000    	mov	_CanPage,_CAN+7
3397                     ; 442 	if (CAN.RFR & CAN_RFR_FOVR)
3399  031b c65424        	ld	a,_CAN+4
3400  031e a510          	bcp	a,#16
3401  0320 2706          	jreq	L1661
3402                     ; 444 		CAN.RFR |= CAN_RFR_FOVR;		/* clear the FIFO Overrun (FOVR) bit */
3404  0322 72185424      	bset	_CAN+4,#4
3406  0326 2019          	jra	L1761
3407  0328               L1661:
3408                     ; 446 	else if (CAN.RFR & CAN_RFR_FULL)
3410  0328 c65424        	ld	a,_CAN+4
3411  032b a508          	bcp	a,#8
3412  032d 2712          	jreq	L1761
3413                     ; 448 		CAN.RFR |= CAN_RFR_FULL;		/* clear the FIFO full (FULL) bit */      
3415  032f 72165424      	bset	_CAN+4,#3
3416  0333 200c          	jra	L1761
3417  0335               L7661:
3418                     ; 452         Can_Store_Rcvd_Msg();
3420  0335 8d440244      	callf	f_Can_Store_Rcvd_Msg
3422                     ; 453         CAN.RFR |= CAN_RFR_RFOM; // Release mailbox
3424  0339 721a5424      	bset	_CAN+4,#5
3425                     ; 454 		CAN.RFR |= CAN_RFR_RFOM; //此语句要用2句,原因还没搞明白
3427  033d 721a5424      	bset	_CAN+4,#5
3428  0341               L1761:
3429                     ; 450 	while (CAN.RFR & CAN_RFR_FMP)	/* Check until FMP != 0 */
3431  0341 c65424        	ld	a,_CAN+4
3432  0344 a503          	bcp	a,#3
3433  0346 26ed          	jrne	L7661
3434                     ; 456 	CanRestorePg();
3436  0348 5500005427    	mov	_CAN+7,_CanPage
3437                     ; 457 }
3440  034d 87            	retf
3471                     ; 467 u8 CanIllumLevel(u8 Byte)
3471                     ; 468 {
3472                     	switch	.text
3473  034e               f_CanIllumLevel:
3475  034e 88            	push	a
3476       00000000      OFST:	set	0
3479                     ; 469     switch(Byte)
3482                     ; 492             break;
3483  034f 4d            	tnz	a
3484  0350 2717          	jreq	L5761
3485  0352 a00b          	sub	a,#11
3486  0354 271d          	jreq	L1071
3487  0356 4a            	dec	a
3488  0357 2716          	jreq	L7761
3489  0359 a0ee          	sub	a,#238
3490  035b 271c          	jreq	L3071
3491  035d               L5071:
3492                     ; 483         default:
3492                     ; 484             if(Byte&0x0F)
3494  035d 7b01          	ld	a,(OFST+1,sp)
3495  035f a50f          	bcp	a,#15
3496  0361 271c          	jreq	L7271
3497                     ; 486                 Byte=0xFF;
3499  0363 a6ff          	ld	a,#255
3500  0365 6b01          	ld	(OFST+1,sp),a
3502  0367 2020          	jra	L5271
3503  0369               L5761:
3504                     ; 471         case PARA_ILL_OFF:
3504                     ; 472             Byte=0x7F;
3506  0369 a67f          	ld	a,#127
3507  036b 6b01          	ld	(OFST+1,sp),a
3508                     ; 473             break;
3510  036d 201a          	jra	L5271
3511  036f               L7761:
3512                     ; 474         case PARA_ILL_LV0:
3512                     ; 475             Byte=0; //背光0级亮度
3514  036f 0f01          	clr	(OFST+1,sp)
3515                     ; 476             break;
3517  0371 2016          	jra	L5271
3518  0373               L1071:
3519                     ; 477         case PARA_ILL_LV1:
3519                     ; 478             Byte=1; //背光1级亮度
3521  0373 a601          	ld	a,#1
3522  0375 6b01          	ld	(OFST+1,sp),a
3523                     ; 479             break;
3525  0377 2010          	jra	L5271
3526  0379               L3071:
3527                     ; 480         case PARA_ILL_LV17:
3527                     ; 481             Byte=17; //背光17级亮度
3529  0379 a611          	ld	a,#17
3530  037b 6b01          	ld	(OFST+1,sp),a
3531                     ; 482             break;
3533  037d 200a          	jra	L5271
3534  037f               L7271:
3535                     ; 490                 Byte=((Byte>>4)&0x0F)+1;
3537  037f 7b01          	ld	a,(OFST+1,sp)
3538  0381 4e            	swap	a
3539  0382 a40f          	and	a,#15
3540  0384 a40f          	and	a,#15
3541  0386 4c            	inc	a
3542  0387 6b01          	ld	(OFST+1,sp),a
3543  0389               L5271:
3544                     ; 494     return(Byte);
3546  0389 7b01          	ld	a,(OFST+1,sp)
3549  038b 5b01          	addw	sp,#1
3550  038d 87            	retf
3607                     	switch	.const
3608  0016               L7671:
3609  0016 0003          	dc.w	3
3610  0018 10242040      	dc.l	270803008
3611  001c 039f          	dc.w	L3371
3612  001e 1029c080      	dc.l	271171712
3613  0022 03f7          	dc.w	L7371
3614  0024 10466677      	dc.l	273049207
3615  0028 03b3          	dc.w	L5371
3616  002a 03fd          	dc.w	L1771
3617                     ; 506 static void CanMsgAnalyze(CanMsgTypeDef *pCanMsg)
3617                     ; 507 {
3618                     	switch	.text
3619  038e               L5531f_CanMsgAnalyze:
3621  038e 89            	pushw	x
3622  038f 89            	pushw	x
3623       00000002      OFST:	set	2
3626                     ; 510     BoolT FlagCANDataOK=TRUE;
3628  0390 a601          	ld	a,#1
3629  0392 6b01          	ld	(OFST-1,sp),a
3630                     ; 512     switch(pCanMsg->id)
3632  0394 8d000000      	callf	d_ltor
3635  0398 ae0016        	ldw	x,#L7671
3636  039b 8d000000      	callf	d_jltab
3637  039f               L3371:
3638                     ; 516             if(0x4A==pCanMsg->data[0])
3640  039f 1e03          	ldw	x,(OFST+1,sp)
3641  03a1 e605          	ld	a,(5,x)
3642  03a3 a14a          	cp	a,#74
3643  03a5 2606          	jrne	L3771
3644                     ; 518                 CAR_ACC_FLAG=1;
3646  03a7 72100000      	bset	_NodeState,#0
3648  03ab 2050          	jra	L1771
3649  03ad               L3771:
3650                     ; 522                 CAR_ACC_FLAG=0;
3652  03ad 72110000      	bres	_NodeState,#0
3653  03b1 204a          	jra	L1771
3654  03b3               L5371:
3655                     ; 528             u8Temp=CanIllumLevel(pCanMsg->data[0]);
3657  03b3 1e03          	ldw	x,(OFST+1,sp)
3658  03b5 e605          	ld	a,(5,x)
3659  03b7 8d4e034e      	callf	f_CanIllumLevel
3661  03bb 6b02          	ld	(OFST+0,sp),a
3662                     ; 529             if(0xFF!=u8Temp)
3664  03bd 7b02          	ld	a,(OFST+0,sp)
3665  03bf a1ff          	cp	a,#255
3666  03c1 273a          	jreq	L1771
3667                     ; 531                 if(0x7F==u8Temp)
3669  03c3 7b02          	ld	a,(OFST+0,sp)
3670  03c5 a17f          	cp	a,#127
3671  03c7 2614          	jrne	L1002
3672                     ; 533                     if(NodeState.IllumeLevel==u8Temp)
3674  03c9 c60003        	ld	a,_NodeState+3
3675  03cc 1102          	cp	a,(OFST+0,sp)
3676  03ce 2602          	jrne	L3002
3677                     ; 535                         FlagCANDataOK=FALSE; //重复的数据,不需发给主机
3679  03d0 0f01          	clr	(OFST-1,sp)
3680  03d2               L3002:
3681                     ; 537                     CAR_ILLUME_FLAG =0;
3683  03d2 72130000      	bres	_NodeState,#1
3684                     ; 538                     NodeState.IllumeLevel=u8Temp;
3686  03d6 7b02          	ld	a,(OFST+0,sp)
3687  03d8 c70003        	ld	_NodeState+3,a
3689  03db 2012          	jra	L5002
3690  03dd               L1002:
3691                     ; 542                     if(NodeState.IllumeLevel==u8Temp)
3693  03dd c60003        	ld	a,_NodeState+3
3694  03e0 1102          	cp	a,(OFST+0,sp)
3695  03e2 2602          	jrne	L7002
3696                     ; 544                         FlagCANDataOK=FALSE; //重复的数据,不需发给主机
3698  03e4 0f01          	clr	(OFST-1,sp)
3699  03e6               L7002:
3700                     ; 546                     CAR_ILLUME_FLAG =1;
3702  03e6 72120000      	bset	_NodeState,#1
3703                     ; 547                     NodeState.IllumeLevel=u8Temp;
3705  03ea 7b02          	ld	a,(OFST+0,sp)
3706  03ec c70003        	ld	_NodeState+3,a
3707  03ef               L5002:
3708                     ; 549                 if(TRUE==FlagCANDataOK)
3710  03ef 7b01          	ld	a,(OFST-1,sp)
3711  03f1 a101          	cp	a,#1
3712  03f3 2608          	jrne	L1771
3713  03f5 2006          	jra	L1771
3714  03f7               L7371:
3715                     ; 560             SendToCan(pCanMsg);
3717  03f7 1e03          	ldw	x,(OFST+1,sp)
3718  03f9 8d400440      	callf	f_SendToCan
3720                     ; 561             break;
3722  03fd               L1771:
3723                     ; 564     CanFlagAnalyse();
3725  03fd 8d040404      	callf	f_CanFlagAnalyse
3727                     ; 565 }
3730  0401 5b04          	addw	sp,#4
3731  0403 87            	retf
3755                     ; 576 void CanFlagAnalyse(void)
3755                     ; 577 {
3756                     	switch	.text
3757  0404               f_CanFlagAnalyse:
3761                     ; 578 	if(CAR_ACC_FLAG)
3763  0404 c60000        	ld	a,_NodeState
3764  0407 a501          	bcp	a,#1
3765  0409 2706          	jreq	L3202
3766                     ; 580 		ACC_CTRL=1 ;      
3768  040b 72145023      	bset	_GPIOH,#2
3770  040f 2004          	jra	L5202
3771  0411               L3202:
3772                     ; 584 		ACC_CTRL=0;   
3774  0411 72155023      	bres	_GPIOH,#2
3775  0415               L5202:
3776                     ; 586 }
3779  0415 87            	retf
3803                     ; 596 BoolT CANGetEmptyMegBox(void)
3803                     ; 597 {
3804                     	switch	.text
3805  0416               f_CANGetEmptyMegBox:
3809                     ; 598     if(CAN.TPR &CAN_TPR_TME0)
3811  0416 c65423        	ld	a,_CAN+3
3812  0419 a504          	bcp	a,#4
3813  041b 2706          	jreq	L7302
3814                     ; 600         CAN.PSR =CAN_PS_TXMB0;
3816  041d 725f5427      	clr	_CAN+7
3818  0421 2018          	jra	L1402
3819  0423               L7302:
3820                     ; 602     else if(CAN.TPR &CAN_TPR_TME1)
3822  0423 c65423        	ld	a,_CAN+3
3823  0426 a508          	bcp	a,#8
3824  0428 2706          	jreq	L3402
3825                     ; 604         CAN.PSR =CAN_PS_TXMB1;
3827  042a 35015427      	mov	_CAN+7,#1
3829  042e 200b          	jra	L1402
3830  0430               L3402:
3831                     ; 606     else if(CAN.TPR &CAN_TPR_TME2)
3833  0430 c65423        	ld	a,_CAN+3
3834  0433 a510          	bcp	a,#16
3835  0435 2707          	jreq	L7402
3836                     ; 608         CAN.PSR =CAN_PS_TXMB2;
3838  0437 35055427      	mov	_CAN+7,#5
3840  043b               L1402:
3841                     ; 614     return TRUE;
3843  043b a601          	ld	a,#1
3846  043d 87            	retf
3847  043e               L7402:
3848                     ; 612         return FALSE;
3850  043e 4f            	clr	a
3853  043f 87            	retf
3890                     ; 625 void SendToCan(CanMsgTypeDef *pCanMsg)
3890                     ; 626 {
3891                     	switch	.text
3892  0440               f_SendToCan:
3896                     ; 627     CanMsgTransmit(pCanMsg);
3898  0440 8d9e019e      	callf	f_CanMsgTransmit
3900                     ; 628 }
3903  0444 87            	retf
3935                     ; 638 void Can_Main(void)
3935                     ; 639 {
3936                     	switch	.text
3937  0445               f_Can_Main:
3941                     ; 640 	switch(CanBusState)
3943  0445 c60000        	ld	a,_CanBusState
3945                     ; 669 			CLEAR_WWDG;			
3946  0448 4d            	tnz	a
3947  0449 271a          	jreq	L3702
3948  044b 4a            	dec	a
3949  044c 272f          	jreq	L5702
3950  044e 4a            	dec	a
3951  044f 2752          	jreq	L1012
3952  0451 4a            	dec	a
3953  0452 275b          	jreq	L1212
3954  0454 4a            	dec	a
3955  0455 273f          	jreq	L7702
3956  0457               L5012:
3957                     ; 668 			BEGIN_WWDG;			
3959  0457 357f50d2      	mov	_WWDG+1,#127
3962  045b 35ff50d1      	mov	_WWDG,#255
3963                     ; 669 			CLEAR_WWDG;			
3966  045f 357f50d1      	mov	_WWDG,#127
3967  0463               L5212:
3969  0463 20fe          	jra	L5212
3970  0465               L3702:
3971                     ; 642 		case CAN_INITIAL:
3971                     ; 643 			CanWakeUp();                                                                      
3973  0465 8d8b018b      	callf	f_CanWakeUp
3975                     ; 644 			CanInit(CAN_MCR_ABOM | CAN_MCR_AWUM |CAN_MCR_NART);
3977  0469 a670          	ld	a,#112
3978  046b 8d000000      	callf	f_CanInit
3980                     ; 645 			CanInterruptRestore();
3982  046f 8d2d022d      	callf	f_CanInterruptRestore
3984                     ; 646 			CanBusWakeup();
3986  0473 72175014      	bres	_GPIOE,#3
3987                     ; 647 			CanBusState=CAN_RUNNING;
3990  0477 35010000      	mov	_CanBusState,#1
3991                     ; 648 			break;
3993  047b 2032          	jra	L1212
3994  047d               L5702:
3995                     ; 649 		case CAN_RUNNING:
3995                     ; 650 		    CanTxRxBuffer.id=CANID_SWITCHSTATE;
3997  047d aec080        	ldw	x,#49280
3998  0480 cf0002        	ldw	_CanTxRxBuffer+2,x
3999  0483 ae1029        	ldw	x,#4137
4000  0486 cf0000        	ldw	_CanTxRxBuffer,x
4001                     ; 651 		    CanTxRxBuffer.dlc=8;
4003  0489 35080004      	mov	_CanTxRxBuffer+4,#8
4004                     ; 652             SendToCan(&CanTxRxBuffer);
4006  048d ae0000        	ldw	x,#_CanTxRxBuffer
4007  0490 8d400440      	callf	f_SendToCan
4009                     ; 653 			break;
4011  0494 2019          	jra	L1212
4012  0496               L7702:
4013                     ; 654 		case CAN_ACCOFF:
4013                     ; 655 			if(CAR_ACC_FLAG==1)
4015  0496 c60000        	ld	a,_NodeState
4016  0499 a501          	bcp	a,#1
4017  049b 2712          	jreq	L1212
4018                     ; 657 				CanBusState=CAN_RUNNING;
4020  049d 35010000      	mov	_CanBusState,#1
4021  04a1 200c          	jra	L1212
4022  04a3               L1012:
4023                     ; 660 		case CAN_WAITSLEEP:
4023                     ; 661 			CanSleep();
4025  04a3 8d730173      	callf	f_CanSleep
4027                     ; 662 			CanBusSleep();
4029  04a7 72165014      	bset	_GPIOE,#3
4030                     ; 663 			CanBusState=CAN_SLEEP;	
4033  04ab 35030000      	mov	_CanBusState,#3
4034                     ; 664 			break;
4036  04af               L1212:
4037                     ; 676 }
4040  04af 87            	retf
4052                     	xdef	f_CANGetEmptyMegBox
4053                     	xdef	f_CanMsgTransmit
4054                     	xdef	f_Can_Main
4055                     	xdef	f_CanFlagAnalyse
4056                     	xdef	f_SendToCan
4057                     	xdef	f_CanIllumLevel
4058                     	xdef	f_ISR_Can_Rx
4059                     	xdef	f_ISR_Can_Tx
4060                     	xdef	f_Can_Store_Rcvd_Msg
4061                     	xdef	f_CanInterruptRestore
4062                     	xdef	f_CanInterruptDisable
4063                     	xdef	f_CanWakeUp
4064                     	xdef	f_Can_Wakeup_Enable
4065                     	xdef	f_CanSleep
4066                     	xdef	f_CanInit
4067                     	xref	_can_msg_id32
4068                     	xref	_CanTxRxBuffer
4069                     	xref	_CanBusState
4070                     	xref	_NodeState
4071                     	xref	_CanPage
4072                     	xref.b	c_x
4091                     	xref	d_jltab
4092                     	xref	d_ltor
4093                     	xref	d_lgadc
4094                     	xref	d_lglsh
4095                     	end
