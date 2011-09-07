   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2361                     ; 18 void CanInit(u8 CAN_MasterCtrlReg)
2361                     ; 19 {
2363                     	switch	.text
2364  0000               _CanInit:
2366  0000 88            	push	a
2367       00000000      OFST:	set	0
2370                     ; 20     CLK.PCKENR2|=CLK_PCKENR2_CAN; // 开启CAN时钟，stm8 的外设时钟可控
2372  0001 721e50ca      	bset	_CLK+10,#7
2373                     ; 22     CAN.PSR =CAN_PS_TXMB0;
2375  0005 725f5427      	clr	_CAN+7
2376                     ; 23     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;
2378  0009 72125428      	bset	_CAN+8,#1
2379                     ; 25     CAN.PSR =CAN_PS_TXMB1;
2381  000d 35015427      	mov	_CAN+7,#1
2382                     ; 26     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;
2384  0011 72125428      	bset	_CAN+8,#1
2385                     ; 28     CAN.PSR =CAN_PS_TXMB2;
2387  0015 35055427      	mov	_CAN+7,#5
2388                     ; 29     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;
2390  0019 72125428      	bset	_CAN+8,#1
2391                     ; 31     CAN.MCR |=CAN_MCR_INRQ; // Request initialisation
2393  001d 72105420      	bset	_CAN,#0
2395  0021 2001          	jra	L5041
2396  0023               L3041:
2397                     ; 34         _asm("nop");
2400  0023 9d            nop
2402  0024               L5041:
2403                     ; 32     while(!(CAN.MSR &CAN_MSR_INAK)) // Wait until acknowledged
2405  0024 c65421        	ld	a,_CAN+1
2406  0027 a501          	bcp	a,#1
2407  0029 27f8          	jreq	L3041
2408                     ; 39     CAN.TSR |=CAN_TSR_RQCP0 |CAN_TSR_RQCP1 |CAN_TSR_RQCP2;
2410  002b c65422        	ld	a,_CAN+2
2411  002e aa07          	or	a,#7
2412  0030 c75422        	ld	_CAN+2,a
2414  0033 2004          	jra	L3141
2415  0035               L1141:
2416                     ; 44         CAN.RFR =CAN_RFR_RFOM; //释放一级FIFO
2418  0035 35205424      	mov	_CAN+4,#32
2419  0039               L3141:
2420                     ; 42     while(CAN.RFR &CAN_RFR_FMP)
2422  0039 c65424        	ld	a,_CAN+4
2423  003c a503          	bcp	a,#3
2424  003e 26f5          	jrne	L1141
2425                     ; 48     CAN.RFR |=CAN_RFR_FOVR; 
2427  0040 72185424      	bset	_CAN+4,#4
2428                     ; 51 	CAN.MSR =CAN_MSR_WKUI;
2430  0044 35085421      	mov	_CAN+1,#8
2431                     ; 54 	CAN.MCR |= CAN_MasterCtrlReg;
2433  0048 c65420        	ld	a,_CAN
2434  004b 1a01          	or	a,(OFST+1,sp)
2435  004d c75420        	ld	_CAN,a
2436                     ; 58 	CAN.PSR =CAN_PS_CTRL;	
2438  0050 35065427      	mov	_CAN+7,#6
2439                     ; 59 	CAN_PAGE_FCR1 = 0x00;
2441  0054 725f5432      	clr	_CAN+18
2442                     ; 60 	CAN_PAGE_FCR2 = 0x00;
2444  0058 725f5433      	clr	_CAN+19
2445                     ; 61 	CAN_PAGE_FCR3 = 0x00;
2447  005c 725f5434      	clr	_CAN+20
2448                     ; 79 	CAN_PAGE_FMR1 = 0x00;	/* Filter 0, 1, 2, 3 Low/High Register in Mask mode */
2450  0060 725f5430      	clr	_CAN+16
2451                     ; 80 	CAN_PAGE_FMR2 = 0x00;	/* Filter 4, 5 Low/High Register in Mask mode */
2453  0064 725f5431      	clr	_CAN+17
2454                     ; 102 	CAN.PSR = CAN_PS_FILTER01;
2456  0068 35025427      	mov	_CAN+7,#2
2457                     ; 104 	CAN_PAGE_FLR1 = 0x00;
2459  006c 725f5428      	clr	_CAN+8
2460                     ; 105 	CAN_PAGE_FLR2 = 0x80; //mask first bit
2462  0070 35805429      	mov	_CAN+9,#128
2463                     ; 106 	CAN_PAGE_FLR3 = 0x00;
2465  0074 725f542a      	clr	_CAN+10
2466                     ; 107 	CAN_PAGE_FLR4 = 0x08; //mask 5th bit
2468  0078 3508542b      	mov	_CAN+11,#8
2469                     ; 108 	CAN_PAGE_FLR5 = 0x00;
2471  007c 725f542c      	clr	_CAN+12
2472                     ; 109 	CAN_PAGE_FLR6 = 0x40; //mask second bit
2474  0080 3540542d      	mov	_CAN+13,#64
2475                     ; 110 	CAN_PAGE_FLR7 = 0x00;
2477  0084 725f542e      	clr	_CAN+14
2478                     ; 111 	CAN_PAGE_FLR8 = 0x00; //All Pass
2480  0088 725f542f      	clr	_CAN+15
2481                     ; 113 	CAN_PAGE_FHR1 = 0x00;
2483  008c 725f5430      	clr	_CAN+16
2484                     ; 114 	CAN_PAGE_FHR2 = 0x00;
2486  0090 725f5431      	clr	_CAN+17
2487                     ; 115 	CAN_PAGE_FHR3 = 0x00;
2489  0094 725f5432      	clr	_CAN+18
2490                     ; 116 	CAN_PAGE_FHR4 = 0x00;
2492  0098 725f5433      	clr	_CAN+19
2493                     ; 117 	CAN_PAGE_FHR5 = 0x00;
2495  009c 725f5434      	clr	_CAN+20
2496                     ; 118 	CAN_PAGE_FHR6 = 0x00;
2498  00a0 725f5435      	clr	_CAN+21
2499                     ; 119 	CAN_PAGE_FHR7 = 0x00;
2501  00a4 725f5436      	clr	_CAN+22
2502                     ; 120 	CAN_PAGE_FHR8 = 0x00;
2504  00a8 725f5437      	clr	_CAN+23
2505                     ; 123 	CAN.PSR = CAN_PS_FILTER23;
2507  00ac 35035427      	mov	_CAN+7,#3
2508                     ; 125 	CAN_PAGE_FLR1 = 0x00;
2510  00b0 725f5428      	clr	_CAN+8
2511                     ; 126 	CAN_PAGE_FLR2 = 0x00;
2513  00b4 725f5429      	clr	_CAN+9
2514                     ; 127 	CAN_PAGE_FLR3 = 0x00;
2516  00b8 725f542a      	clr	_CAN+10
2517                     ; 128 	CAN_PAGE_FLR4 = 0x00;
2519  00bc 725f542b      	clr	_CAN+11
2520                     ; 129 	CAN_PAGE_FLR5 = 0x00;
2522  00c0 725f542c      	clr	_CAN+12
2523                     ; 130 	CAN_PAGE_FLR6 = 0x00;
2525  00c4 725f542d      	clr	_CAN+13
2526                     ; 131 	CAN_PAGE_FLR7 = 0x00;
2528  00c8 725f542e      	clr	_CAN+14
2529                     ; 132 	CAN_PAGE_FLR8 = 0x00;
2531  00cc 725f542f      	clr	_CAN+15
2532                     ; 134 	CAN_PAGE_FHR1 = 0x00;
2534  00d0 725f5430      	clr	_CAN+16
2535                     ; 135 	CAN_PAGE_FHR2 = 0x00;
2537  00d4 725f5431      	clr	_CAN+17
2538                     ; 136 	CAN_PAGE_FHR3 = 0x00;
2540  00d8 725f5432      	clr	_CAN+18
2541                     ; 137 	CAN_PAGE_FHR4 = 0x00;
2543  00dc 725f5433      	clr	_CAN+19
2544                     ; 138 	CAN_PAGE_FHR5 = 0x00;
2546  00e0 725f5434      	clr	_CAN+20
2547                     ; 139 	CAN_PAGE_FHR6 = 0x00;
2549  00e4 725f5435      	clr	_CAN+21
2550                     ; 140 	CAN_PAGE_FHR7 = 0x00;
2552  00e8 725f5436      	clr	_CAN+22
2553                     ; 141 	CAN_PAGE_FHR8 = 0x00;
2555  00ec 725f5437      	clr	_CAN+23
2556                     ; 144 	CAN.PSR = CAN_PS_FILTER45;
2558  00f0 35045427      	mov	_CAN+7,#4
2559                     ; 146 	CAN_PAGE_FLR1 = 0xff;
2561  00f4 35ff5428      	mov	_CAN+8,#255
2562                     ; 147 	CAN_PAGE_FLR2 = 0xff;
2564  00f8 35ff5429      	mov	_CAN+9,#255
2565                     ; 148 	CAN_PAGE_FLR3 = 0xff;
2567  00fc 35ff542a      	mov	_CAN+10,#255
2568                     ; 149 	CAN_PAGE_FLR4 = 0xff;
2570  0100 35ff542b      	mov	_CAN+11,#255
2571                     ; 150 	CAN_PAGE_FLR5 = 0xff;
2573  0104 35ff542c      	mov	_CAN+12,#255
2574                     ; 151 	CAN_PAGE_FLR6 = 0xff;
2576  0108 35ff542d      	mov	_CAN+13,#255
2577                     ; 152 	CAN_PAGE_FLR7 = 0xff;
2579  010c 35ff542e      	mov	_CAN+14,#255
2580                     ; 153 	CAN_PAGE_FLR8 = 0xff;
2582  0110 35ff542f      	mov	_CAN+15,#255
2583                     ; 155 	CAN_PAGE_FHR1 = 0xff;
2585  0114 35ff5430      	mov	_CAN+16,#255
2586                     ; 156 	CAN_PAGE_FHR2 = 0xff;
2588  0118 35ff5431      	mov	_CAN+17,#255
2589                     ; 157 	CAN_PAGE_FHR3 = 0xff;
2591  011c 35ff5432      	mov	_CAN+18,#255
2592                     ; 158 	CAN_PAGE_FHR4 = 0xff;
2594  0120 35ff5433      	mov	_CAN+19,#255
2595                     ; 159 	CAN_PAGE_FHR5 = 0xff;
2597  0124 35ff5434      	mov	_CAN+20,#255
2598                     ; 160 	CAN_PAGE_FHR6 = 0xff;
2600  0128 35ff5435      	mov	_CAN+21,#255
2601                     ; 161 	CAN_PAGE_FHR7 = 0xff;
2603  012c 35ff5436      	mov	_CAN+22,#255
2604                     ; 162 	CAN_PAGE_FHR8 = 0xff;
2606  0130 35ff5437      	mov	_CAN+23,#255
2607                     ; 165 	CAN.PSR = CAN_PS_CTRL;	
2609  0134 35065427      	mov	_CAN+7,#6
2610                     ; 166 	CAN_PAGE_FCR1 |= CAN_FCR1_FILTER0_ACTIVE;	/* Filter 0 active */
2612  0138 72105432      	bset	_CAN+18,#0
2613                     ; 174 	CAN.PSR =CAN_PS_CTRL;
2615  013c 35065427      	mov	_CAN+7,#6
2616                     ; 175 	CAN_PAGE_BTR1 =(CAN_PAGE_BTR1_BRP&(CAN_PAGE_BTR1_BRP_RESET_VALUE-1))
2616                     ; 176 	              |(CAN_PAGE_BTR1_SJW&((CAN_PAGE_BTR1_SJW_RESET_VALUE-1)<<6));		// see can.h for modification of
2618  0140 359d542c      	mov	_CAN+12,#157
2619                     ; 177 	CAN_PAGE_BTR2 =(CAN_PAGE_BTR2_BS1&(CAN_PAGE_BTR2_BS1_RESET_VALUE-1)) 	        // bit timing parameters.
2619                     ; 178 	              |(CAN_PAGE_BTR2_BS2&((CAN_PAGE_BTR2_BS2_RESET_VALUE-1)<<4))
2619                     ; 179 	               |CAN_PAGE_BTR2_CLKS;
2621  0144 35a3542d      	mov	_CAN+13,#163
2622                     ; 184 	CAN.DGR |= CAN_DGR_TXM2E;	/* enable 3th Tx mailboxe */ 
2624  0148 72185426      	bset	_CAN+6,#4
2625                     ; 186 	CAN.MCR &= ~CAN_MCR_INRQ;	/* Leave the Init mode */
2627  014c 72115420      	bres	_CAN,#0
2629  0150 2001          	jra	L1241
2630  0152               L7141:
2631                     ; 189 		_asm("nop");
2634  0152 9d            nop
2636  0153               L1241:
2637                     ; 187 	while ((CAN.MSR &CAN_MSR_INAK))	/* Wait until acknowledged */ 
2639  0153 c65421        	ld	a,_CAN+1
2640  0156 a501          	bcp	a,#1
2641  0158 26f8          	jrne	L7141
2642                     ; 192 }
2645  015a 84            	pop	a
2646  015b 81            	ret
2671                     ; 201 void Can_Wakeup_Enable(void)
2671                     ; 202 {
2672                     	switch	.text
2673  015c               _Can_Wakeup_Enable:
2677                     ; 203 	CanSavePg();
2679  015c 5554270000    	mov	_CanPage,_CAN+7
2680                     ; 205 	CAN.IER = CAN_IER_WKUIE | /* Wake-up Interrupt */
2680                     ; 206 			  CAN_IER_FOVIE | /* FIFO overrun Interrupt */
2680                     ; 207 			  CAN_IER_FFIE  | /* FIFO Full Interrupt */
2680                     ; 208 			  CAN_IER_FMPIE | /* FIFO Message Pending Interrupt */
2680                     ; 209 			  CAN_IER_TMEIE;  /* Transmit Mailbox Empty Interrupt */
2682  0161 358f5425      	mov	_CAN+5,#143
2683                     ; 211 	CAN.PSR = CAN_PS_CTRL;
2685  0165 35065427      	mov	_CAN+7,#6
2686                     ; 212 	CAN_PAGE_EIER = CAN_PAGE_EIER_ERRIE|	/* Error Interrupt */
2686                     ; 213 				    CAN_PAGE_EIER_LECIE|	/* Last Error Code Interrupt */
2686                     ; 214 				    CAN_PAGE_EIER_BOFIE|	/* Bus-Off Interrupt */
2686                     ; 215 				    CAN_PAGE_EIER_EPVIE|	/* Error Passive Interrupt */
2686                     ; 216 				    CAN_PAGE_EIER_EWGIE;	/* Error Warning Interrupt */
2688  0169 35975429      	mov	_CAN+9,#151
2689                     ; 218 	CanRestorePg();
2691  016d 5500005427    	mov	_CAN+7,_CanPage
2692                     ; 219 }
2695  0172 81            	ret
2721                     ; 228 void CanSleep(void)
2721                     ; 229 {
2722                     	switch	.text
2723  0173               _CanSleep:
2727                     ; 230     CanInit(CAN_MCR_AWUM);
2729  0173 a620          	ld	a,#32
2730  0175 cd0000        	call	_CanInit
2732                     ; 231     Can_Wakeup_Enable();
2734  0178 ade2          	call	_Can_Wakeup_Enable
2737  017a 2004          	jra	L7441
2738  017c               L5441:
2739                     ; 237         CAN.MCR |= CAN_MCR_SLEEP;		
2741  017c 72125420      	bset	_CAN,#1
2742  0180               L7441:
2743                     ; 234     while(!(CAN.MSR &CAN_MSR_SLAK))
2745  0180 c65421        	ld	a,_CAN+1
2746  0183 a502          	bcp	a,#2
2747  0185 27f5          	jreq	L5441
2748                     ; 239 }
2751  0187 81            	ret
2777                     ; 248 void CanWakeUp(void)
2777                     ; 249 {
2778                     	switch	.text
2779  0188               _CanWakeUp:
2783                     ; 250 	CanBusWakeup();
2785  0188 72175014      	bres	_GPIOE,#3
2786                     ; 253 	CAN.MCR &= ~CAN_MCR_SLEEP;	
2789  018c 72135420      	bres	_CAN,#1
2791  0190 2001          	jra	L5641
2792  0192               L3641:
2793                     ; 258         _asm("nop");
2796  0192 9d            nop
2798  0193               L5641:
2799                     ; 256 	while(CAN.MSR & CAN_MSR_SLAK)
2801  0193 c65421        	ld	a,_CAN+1
2802  0196 a502          	bcp	a,#2
2803  0198 26f8          	jrne	L3641
2804                     ; 260 }
2807  019a 81            	ret
2906                     ; 275 BoolT CanMsgTransmit(CanMsgTypeDef *pCanMsg)
2906                     ; 276 {
2907                     	switch	.text
2908  019b               _CanMsgTransmit:
2910  019b 89            	pushw	x
2911  019c 88            	push	a
2912       00000001      OFST:	set	1
2915                     ; 279 	if(CAN.TPR & CAN_TPR_TME0)			/* Mailbox 1 empty ? */
2917  019d c65423        	ld	a,_CAN+3
2918  01a0 a504          	bcp	a,#4
2919  01a2 270a          	jreq	L1451
2920                     ; 281 		CAN.PSR = CAN_PS_TXMB0;
2922  01a4 725f5427      	clr	_CAN+7
2923                     ; 282 		MailboxNumber = 1;
2925  01a8 a601          	ld	a,#1
2926  01aa 6b01          	ld	(OFST+0,sp),a
2928  01ac 2020          	jra	L3451
2929  01ae               L1451:
2930                     ; 284 	else if(CAN.TPR & CAN_TPR_TME1)	/* Mailbox 2 empty ? */
2932  01ae c65423        	ld	a,_CAN+3
2933  01b1 a508          	bcp	a,#8
2934  01b3 270a          	jreq	L5451
2935                     ; 286 		CAN.PSR = CAN_PS_TXMB1;
2937  01b5 35015427      	mov	_CAN+7,#1
2938                     ; 287 		MailboxNumber = 2;		
2940  01b9 a602          	ld	a,#2
2941  01bb 6b01          	ld	(OFST+0,sp),a
2943  01bd 200f          	jra	L3451
2944  01bf               L5451:
2945                     ; 289 	else if(CAN.TPR & CAN_TPR_TME2)	/* Mailbox 3 empty ? */
2947  01bf c65423        	ld	a,_CAN+3
2948  01c2 a510          	bcp	a,#16
2949  01c4 2749          	jreq	L1551
2950                     ; 291 		CAN.PSR = CAN_PS_TXMB2;
2952  01c6 35055427      	mov	_CAN+7,#5
2953                     ; 292 		MailboxNumber = 3;		
2955  01ca a603          	ld	a,#3
2956  01cc 6b01          	ld	(OFST+0,sp),a
2958  01ce               L3451:
2959                     ; 301     CAN_PAGE_MDLCR = 4;
2961  01ce 35045429      	mov	_CAN+9,#4
2962                     ; 303     *((u32*)&CAN_PAGE_MIDR1)=pCanMsg->id;
2964  01d2 1e02          	ldw	x,(OFST+1,sp)
2965  01d4 e603          	ld	a,(3,x)
2966  01d6 c7542d        	ld	_CAN+13,a
2967  01d9 e602          	ld	a,(2,x)
2968  01db c7542c        	ld	_CAN+12,a
2969  01de e601          	ld	a,(1,x)
2970  01e0 c7542b        	ld	_CAN+11,a
2971  01e3 f6            	ld	a,(x)
2972  01e4 c7542a        	ld	_CAN+10,a
2973                     ; 304     CAN_PAGE_MIDR1|= CAN_ID_EXT;
2975  01e7 721c542a      	bset	_CAN+10,#6
2976                     ; 310     CAN_PAGE_MDAR1 =0x51;
2978  01eb 3551542e      	mov	_CAN+14,#81
2979                     ; 311     CAN_PAGE_MDAR2 =0x52;
2981  01ef 3552542f      	mov	_CAN+15,#82
2982                     ; 312     CAN_PAGE_MDAR3 =0x53;
2984  01f3 35535430      	mov	_CAN+16,#83
2985                     ; 313     CAN_PAGE_MDAR4 =0x54;
2987  01f7 35545431      	mov	_CAN+17,#84
2988                     ; 314     CAN_PAGE_MDAR5 =0x55;
2990  01fb 35555432      	mov	_CAN+18,#85
2991                     ; 315     CAN_PAGE_MDAR6 =0x56;
2993  01ff 35565433      	mov	_CAN+19,#86
2994                     ; 316     CAN_PAGE_MDAR7 =0x57;
2996  0203 35575434      	mov	_CAN+20,#87
2997                     ; 317     CAN_PAGE_MDAR8 =0x58;
2999  0207 35585435      	mov	_CAN+21,#88
3000                     ; 320 	return(TRUE);
3002  020b a601          	ld	a,#1
3004  020d 2001          	jra	L61
3005  020f               L1551:
3006                     ; 296 		return (FALSE);
3008  020f 4f            	clr	a
3010  0210               L61:
3012  0210 5b03          	addw	sp,#3
3013  0212 81            	ret
3039                     ; 330 void CanInterruptDisable(void)
3039                     ; 331 {
3040                     	switch	.text
3041  0213               _CanInterruptDisable:
3045                     ; 332 	CanSavePg();
3047  0213 5554270000    	mov	_CanPage,_CAN+7
3048                     ; 334 	CAN.IER = 0x00; 
3050  0218 725f5425      	clr	_CAN+5
3051                     ; 335 	CAN.PSR = CAN_PS_CTRL;         
3053  021c 35065427      	mov	_CAN+7,#6
3054                     ; 336 	CAN_PAGE_EIER = 0x00;
3056  0220 725f5429      	clr	_CAN+9
3057                     ; 338 	CanRestorePg();
3059  0224 5500005427    	mov	_CAN+7,_CanPage
3060                     ; 339 }
3063  0229 81            	ret
3089                     ; 348 void CanInterruptRestore (void)
3089                     ; 349 {
3090                     	switch	.text
3091  022a               _CanInterruptRestore:
3095                     ; 350 	CanSavePg();
3097  022a 5554270000    	mov	_CanPage,_CAN+7
3098                     ; 352 	CAN.IER = 	//CAN_IER_WKUIE |	/* Wake-up Interrupt */
3098                     ; 353 				CAN_IER_FOVIE | /* FIFO overrun Interrupt */
3098                     ; 354 				CAN_IER_FFIE  |	/* FIFO Full Interrupt */
3098                     ; 355 				CAN_IER_FMPIE;// |	/* FIFO Message Pending Interrupt */
3100  022f 350e5425      	mov	_CAN+5,#14
3101                     ; 358 	CAN.PSR = CAN_PS_CTRL;
3103  0233 35065427      	mov	_CAN+7,#6
3104                     ; 359 	CAN_PAGE_EIER = CAN_PAGE_EIER_ERRIE|    /* Error Interrupt */
3104                     ; 360 				    CAN_PAGE_EIER_LECIE|        /* Last Error Code Interrupt */
3104                     ; 361 				    CAN_PAGE_EIER_BOFIE|        /* Bus-Off Interrupt */
3104                     ; 362 				    CAN_PAGE_EIER_EPVIE|        /* Error Passive Interrupt */
3104                     ; 363 				    CAN_PAGE_EIER_EWGIE;        /* Error Warning Interrupt */
3106  0237 35975429      	mov	_CAN+9,#151
3107                     ; 365 	CanRestorePg();
3109  023b 5500005427    	mov	_CAN+7,_CanPage
3110                     ; 366 }
3113  0240 81            	ret
3161                     .const:	section	.text
3162  0000               L3261:
3163  0000 0003          	dc.w	3
3164  0002 10242040      	dc.l	270803008
3165  0006 02a3          	dc.w	L5751
3166  0008 1029c080      	dc.l	271171712
3167  000c 02a3          	dc.w	L5751
3168  000e 10466677      	dc.l	273049207
3169  0012 02a3          	dc.w	L5751
3170  0014 02da          	dc.w	L5261
3171                     ; 369 void Can_Store_Rcvd_Msg(void)	//中断服务程序中执行
3171                     ; 370 {
3172                     	switch	.text
3173  0241               _Can_Store_Rcvd_Msg:
3175  0241 5203          	subw	sp,#3
3176       00000003      OFST:	set	3
3179                     ; 372 	u8 *u8p =&CAN_PAGE_MDAR1;
3181  0243 ae542e        	ldw	x,#_CAN+14
3182  0246 1f01          	ldw	(OFST-2,sp),x
3183                     ; 374 	CAN.PSR = CAN_PS_FIFO; //进入接收数据FIFO页面
3185  0248 35075427      	mov	_CAN+7,#7
3186                     ; 375     CanTxRxBuffer.id =CAN_PAGE_MIDR1&0x1F;
3188  024c c6542a        	ld	a,_CAN+10
3189  024f a41f          	and	a,#31
3190  0251 c70003        	ld	_CanTxRxBuffer+3,a
3191  0254 4f            	clr	a
3192  0255 c70002        	ld	_CanTxRxBuffer+2,a
3193  0258 c70001        	ld	_CanTxRxBuffer+1,a
3194  025b c70000        	ld	_CanTxRxBuffer,a
3195                     ; 376     CanTxRxBuffer.id <<=8; //移位计算更优
3197  025e ae0000        	ldw	x,#_CanTxRxBuffer
3198  0261 a608          	ld	a,#8
3199  0263 cd0000        	call	c_lglsh
3201                     ; 377     CanTxRxBuffer.id +=CAN_PAGE_MIDR2;
3203  0266 c6542b        	ld	a,_CAN+11
3204  0269 ae0000        	ldw	x,#_CanTxRxBuffer
3205  026c 88            	push	a
3206  026d cd0000        	call	c_lgadc
3208  0270 84            	pop	a
3209                     ; 378     CanTxRxBuffer.id <<=8;
3211  0271 ae0000        	ldw	x,#_CanTxRxBuffer
3212  0274 a608          	ld	a,#8
3213  0276 cd0000        	call	c_lglsh
3215                     ; 379     CanTxRxBuffer.id +=CAN_PAGE_MIDR3;
3217  0279 c6542c        	ld	a,_CAN+12
3218  027c ae0000        	ldw	x,#_CanTxRxBuffer
3219  027f 88            	push	a
3220  0280 cd0000        	call	c_lgadc
3222  0283 84            	pop	a
3223                     ; 380     CanTxRxBuffer.id <<=8;
3225  0284 ae0000        	ldw	x,#_CanTxRxBuffer
3226  0287 a608          	ld	a,#8
3227  0289 cd0000        	call	c_lglsh
3229                     ; 381     CanTxRxBuffer.id +=CAN_PAGE_MIDR4;
3231  028c c6542d        	ld	a,_CAN+13
3232  028f ae0000        	ldw	x,#_CanTxRxBuffer
3233  0292 88            	push	a
3234  0293 cd0000        	call	c_lgadc
3236  0296 84            	pop	a
3237                     ; 383     switch(CanTxRxBuffer.id)
3239  0297 ae0000        	ldw	x,#_CanTxRxBuffer
3240  029a cd0000        	call	c_ltor
3243  029d ae0000        	ldw	x,#L3261
3244  02a0 cd0000        	call	c_jltab
3245  02a3               L5751:
3246                     ; 389     		CanTxRxBuffer.id = can_msg_id32; //保存ID
3248  02a3 be02          	ldw	x,_can_msg_id32+2
3249  02a5 cf0002        	ldw	_CanTxRxBuffer+2,x
3250  02a8 be00          	ldw	x,_can_msg_id32
3251  02aa cf0000        	ldw	_CanTxRxBuffer,x
3252                     ; 390     		CanTxRxBuffer.dlc= CAN_PAGE_MDLCR; //此帧长度(字节数)
3254  02ad 5554290004    	mov	_CanTxRxBuffer+4,_CAN+9
3255                     ; 391 			for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
3257  02b2 0f03          	clr	(OFST+0,sp)
3259  02b4 2017          	jra	L3361
3260  02b6               L7261:
3261                     ; 393 				CanTxRxBuffer.data[idx]=u8p[idx];
3263  02b6 7b03          	ld	a,(OFST+0,sp)
3264  02b8 5f            	clrw	x
3265  02b9 97            	ld	xl,a
3266  02ba 89            	pushw	x
3267  02bb 7b03          	ld	a,(OFST+0,sp)
3268  02bd 97            	ld	xl,a
3269  02be 7b04          	ld	a,(OFST+1,sp)
3270  02c0 1b05          	add	a,(OFST+2,sp)
3271  02c2 2401          	jrnc	L62
3272  02c4 5c            	incw	x
3273  02c5               L62:
3274  02c5 02            	rlwa	x,a
3275  02c6 f6            	ld	a,(x)
3276  02c7 85            	popw	x
3277  02c8 d70005        	ld	(_CanTxRxBuffer+5,x),a
3278                     ; 391 			for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
3280  02cb 0c03          	inc	(OFST+0,sp)
3281  02cd               L3361:
3284  02cd c60004        	ld	a,_CanTxRxBuffer+4
3285  02d0 1103          	cp	a,(OFST+0,sp)
3286  02d2 22e2          	jrugt	L7261
3287                     ; 395             CanMsgAnalyze(&CanTxRxBuffer);
3289  02d4 ae0000        	ldw	x,#_CanTxRxBuffer
3290  02d7 cd037f        	call	L5531_CanMsgAnalyze
3292                     ; 396             break;
3294  02da               L7751:
3295                     ; 398         default:
3295                     ; 399     		break;
3297  02da               L5261:
3298                     ; 401 }
3301  02da 5b03          	addw	sp,#3
3302  02dc 81            	ret
3338                     ; 411 void ISR_Can_Tx(void)
3338                     ; 412 {
3339                     	switch	.text
3340  02dd               _ISR_Can_Tx:
3342  02dd 88            	push	a
3343       00000001      OFST:	set	1
3346                     ; 414     CanSavePg();
3348  02de 5554270000    	mov	_CanPage,_CAN+7
3349                     ; 416     CAN.PSR =CAN_PS_CTRL;
3351  02e3 35065427      	mov	_CAN+7,#6
3352                     ; 417     if(CAN_PAGE_ESR)
3354  02e7 725d5428      	tnz	_CAN+8
3355  02eb 2714          	jreq	L5561
3356                     ; 419         ErrorCode=CAN_PAGE_ESR;
3358  02ed c65428        	ld	a,_CAN+8
3359  02f0 6b01          	ld	(OFST+0,sp),a
3360                     ; 420         if((CAN_PAGE_ESR&CAN_PAGE_ESR_LEC)!=0)
3362  02f2 c65428        	ld	a,_CAN+8
3363  02f5 a570          	bcp	a,#112
3364  02f7 2704          	jreq	L7561
3365                     ; 422             CAN_PAGE_ESR =0;//|=CAN_PAGE_ESR_LEC;
3367  02f9 725f5428      	clr	_CAN+8
3368  02fd               L7561:
3369                     ; 424         CAN.MSR |=CAN_MSR_ERRI;
3371  02fd 72145421      	bset	_CAN+1,#2
3372  0301               L5561:
3373                     ; 426     CanRestorePg();
3375  0301 5500005427    	mov	_CAN+7,_CanPage
3376                     ; 427 }
3379  0306 84            	pop	a
3380  0307 81            	ret
3406                     ; 438 void ISR_Can_Rx(void)
3406                     ; 439 {
3407                     	switch	.text
3408  0308               _ISR_Can_Rx:
3412                     ; 440 	CanSavePg();   
3414  0308 5554270000    	mov	_CanPage,_CAN+7
3415                     ; 442 	if (CAN.RFR & CAN_RFR_FOVR)
3417  030d c65424        	ld	a,_CAN+4
3418  0310 a510          	bcp	a,#16
3419  0312 2706          	jreq	L1761
3420                     ; 444 		CAN.RFR |= CAN_RFR_FOVR;		/* clear the FIFO Overrun (FOVR) bit */
3422  0314 72185424      	bset	_CAN+4,#4
3424  0318 2018          	jra	L1071
3425  031a               L1761:
3426                     ; 446 	else if (CAN.RFR & CAN_RFR_FULL)
3428  031a c65424        	ld	a,_CAN+4
3429  031d a508          	bcp	a,#8
3430  031f 2711          	jreq	L1071
3431                     ; 448 		CAN.RFR |= CAN_RFR_FULL;		/* clear the FIFO full (FULL) bit */      
3433  0321 72165424      	bset	_CAN+4,#3
3434  0325 200b          	jra	L1071
3435  0327               L7761:
3436                     ; 452         Can_Store_Rcvd_Msg();
3438  0327 cd0241        	call	_Can_Store_Rcvd_Msg
3440                     ; 453         CAN.RFR |= CAN_RFR_RFOM; // Release mailbox
3442  032a 721a5424      	bset	_CAN+4,#5
3443                     ; 454 		CAN.RFR |= CAN_RFR_RFOM; //此语句要用2句,原因还没搞明白
3445  032e 721a5424      	bset	_CAN+4,#5
3446  0332               L1071:
3447                     ; 450 	while (CAN.RFR & CAN_RFR_FMP)	/* Check until FMP != 0 */
3449  0332 c65424        	ld	a,_CAN+4
3450  0335 a503          	bcp	a,#3
3451  0337 26ee          	jrne	L7761
3452                     ; 456 	CanRestorePg();
3454  0339 5500005427    	mov	_CAN+7,_CanPage
3455                     ; 457 }
3458  033e 81            	ret
3492                     ; 467 u8 CanIllumLevel(u8 Byte)
3492                     ; 468 {
3493                     	switch	.text
3494  033f               _CanIllumLevel:
3496  033f 88            	push	a
3497       00000000      OFST:	set	0
3500                     ; 469     switch(Byte)
3503                     ; 492             break;
3504  0340 4d            	tnz	a
3505  0341 2717          	jreq	L5071
3506  0343 a00b          	sub	a,#11
3507  0345 271d          	jreq	L1171
3508  0347 4a            	dec	a
3509  0348 2716          	jreq	L7071
3510  034a a0ee          	sub	a,#238
3511  034c 271c          	jreq	L3171
3512  034e               L5171:
3513                     ; 483         default:
3513                     ; 484             if(Byte&0x0F)
3515  034e 7b01          	ld	a,(OFST+1,sp)
3516  0350 a50f          	bcp	a,#15
3517  0352 271c          	jreq	L1471
3518                     ; 486                 Byte=0xFF;
3520  0354 a6ff          	ld	a,#255
3521  0356 6b01          	ld	(OFST+1,sp),a
3523  0358 2020          	jra	L7371
3524  035a               L5071:
3525                     ; 471         case PARA_ILL_OFF:
3525                     ; 472             Byte=0x7F;
3527  035a a67f          	ld	a,#127
3528  035c 6b01          	ld	(OFST+1,sp),a
3529                     ; 473             break;
3531  035e 201a          	jra	L7371
3532  0360               L7071:
3533                     ; 474         case PARA_ILL_LV0:
3533                     ; 475             Byte=0; //背光0级亮度
3535  0360 0f01          	clr	(OFST+1,sp)
3536                     ; 476             break;
3538  0362 2016          	jra	L7371
3539  0364               L1171:
3540                     ; 477         case PARA_ILL_LV1:
3540                     ; 478             Byte=1; //背光1级亮度
3542  0364 a601          	ld	a,#1
3543  0366 6b01          	ld	(OFST+1,sp),a
3544                     ; 479             break;
3546  0368 2010          	jra	L7371
3547  036a               L3171:
3548                     ; 480         case PARA_ILL_LV17:
3548                     ; 481             Byte=17; //背光17级亮度
3550  036a a611          	ld	a,#17
3551  036c 6b01          	ld	(OFST+1,sp),a
3552                     ; 482             break;
3554  036e 200a          	jra	L7371
3555  0370               L1471:
3556                     ; 490                 Byte=((Byte>>4)&0x0F)+1;
3558  0370 7b01          	ld	a,(OFST+1,sp)
3559  0372 4e            	swap	a
3560  0373 a40f          	and	a,#15
3561  0375 a40f          	and	a,#15
3562  0377 4c            	inc	a
3563  0378 6b01          	ld	(OFST+1,sp),a
3564  037a               L7371:
3565                     ; 494     return(Byte);
3567  037a 7b01          	ld	a,(OFST+1,sp)
3570  037c 5b01          	addw	sp,#1
3571  037e 81            	ret
3631                     	switch	.const
3632  0016               L3002:
3633  0016 0003          	dc.w	3
3634  0018 10242040      	dc.l	270803008
3635  001c 038e          	dc.w	L5471
3636  001e 1029c080      	dc.l	271171712
3637  0022 03e0          	dc.w	L1571
3638  0024 10466677      	dc.l	273049207
3639  0028 03a2          	dc.w	L7471
3640  002a 03e4          	dc.w	L5002
3641                     ; 506 static void CanMsgAnalyze(CanMsgTypeDef *pCanMsg)
3641                     ; 507 {
3642                     	switch	.text
3643  037f               L5531_CanMsgAnalyze:
3645  037f 89            	pushw	x
3646  0380 89            	pushw	x
3647       00000002      OFST:	set	2
3650                     ; 510     BoolT FlagCANDataOK=TRUE;
3652  0381 a601          	ld	a,#1
3653  0383 6b01          	ld	(OFST-1,sp),a
3654                     ; 512     switch(pCanMsg->id)
3656  0385 cd0000        	call	c_ltor
3659  0388 ae0016        	ldw	x,#L3002
3660  038b cd0000        	call	c_jltab
3661  038e               L5471:
3662                     ; 516             if(0x4A==pCanMsg->data[0])
3664  038e 1e03          	ldw	x,(OFST+1,sp)
3665  0390 e605          	ld	a,(5,x)
3666  0392 a14a          	cp	a,#74
3667  0394 2606          	jrne	L7002
3668                     ; 518                 CAR_ACC_FLAG=1;
3670  0396 72100000      	bset	_NodeState,#0
3672  039a 2048          	jra	L5002
3673  039c               L7002:
3674                     ; 522                 CAR_ACC_FLAG=0;
3676  039c 72110000      	bres	_NodeState,#0
3677  03a0 2042          	jra	L5002
3678  03a2               L7471:
3679                     ; 528             u8Temp=CanIllumLevel(pCanMsg->data[0]);
3681  03a2 1e03          	ldw	x,(OFST+1,sp)
3682  03a4 e605          	ld	a,(5,x)
3683  03a6 ad97          	call	_CanIllumLevel
3685  03a8 6b02          	ld	(OFST+0,sp),a
3686                     ; 529             if(0xFF!=u8Temp)
3688  03aa 7b02          	ld	a,(OFST+0,sp)
3689  03ac a1ff          	cp	a,#255
3690  03ae 2734          	jreq	L5002
3691                     ; 531                 if(0x7F==u8Temp)
3693  03b0 7b02          	ld	a,(OFST+0,sp)
3694  03b2 a17f          	cp	a,#127
3695  03b4 2612          	jrne	L5102
3696                     ; 533                     if(NodeState.IllumeLevel==u8Temp)
3698  03b6 b603          	ld	a,_NodeState+3
3699  03b8 1102          	cp	a,(OFST+0,sp)
3700  03ba 2602          	jrne	L7102
3701                     ; 535                         FlagCANDataOK=FALSE; //重复的数据,不需发给主机
3703  03bc 0f01          	clr	(OFST-1,sp)
3704  03be               L7102:
3705                     ; 537                     CAR_ILLUME_FLAG =0;
3707  03be 72130000      	bres	_NodeState,#1
3708                     ; 538                     NodeState.IllumeLevel=u8Temp;
3710  03c2 7b02          	ld	a,(OFST+0,sp)
3711  03c4 b703          	ld	_NodeState+3,a
3713  03c6 2010          	jra	L1202
3714  03c8               L5102:
3715                     ; 542                     if(NodeState.IllumeLevel==u8Temp)
3717  03c8 b603          	ld	a,_NodeState+3
3718  03ca 1102          	cp	a,(OFST+0,sp)
3719  03cc 2602          	jrne	L3202
3720                     ; 544                         FlagCANDataOK=FALSE; //重复的数据,不需发给主机
3722  03ce 0f01          	clr	(OFST-1,sp)
3723  03d0               L3202:
3724                     ; 546                     CAR_ILLUME_FLAG =1;
3726  03d0 72120000      	bset	_NodeState,#1
3727                     ; 547                     NodeState.IllumeLevel=u8Temp;
3729  03d4 7b02          	ld	a,(OFST+0,sp)
3730  03d6 b703          	ld	_NodeState+3,a
3731  03d8               L1202:
3732                     ; 549                 if(TRUE==FlagCANDataOK)
3734  03d8 7b01          	ld	a,(OFST-1,sp)
3735  03da a101          	cp	a,#1
3736  03dc 2606          	jrne	L5002
3737  03de 2004          	jra	L5002
3738  03e0               L1571:
3739                     ; 560             SendToCan(pCanMsg);
3741  03e0 1e03          	ldw	x,(OFST+1,sp)
3742  03e2 ad40          	call	_SendToCan
3744                     ; 561             break;
3746  03e4               L5002:
3747                     ; 564     CanFlagAnalyse();
3749  03e4 ad03          	call	_CanFlagAnalyse
3751                     ; 565 }
3754  03e6 5b04          	addw	sp,#4
3755  03e8 81            	ret
3780                     ; 576 void CanFlagAnalyse(void)
3780                     ; 577 {
3781                     	switch	.text
3782  03e9               _CanFlagAnalyse:
3786                     ; 578 	if(CAR_ACC_FLAG)
3788  03e9 b600          	ld	a,_NodeState
3789  03eb a501          	bcp	a,#1
3790  03ed 2706          	jreq	L7302
3791                     ; 580 		ACC_CTRL=1 ;      
3793  03ef 72145023      	bset	_GPIOH,#2
3795  03f3 2004          	jra	L1402
3796  03f5               L7302:
3797                     ; 584 		ACC_CTRL=0;   
3799  03f5 72155023      	bres	_GPIOH,#2
3800  03f9               L1402:
3801                     ; 586 }
3804  03f9 81            	ret
3829                     ; 596 BoolT CANGetEmptyMegBox(void)
3829                     ; 597 {
3830                     	switch	.text
3831  03fa               _CANGetEmptyMegBox:
3835                     ; 598     if(CAN.TPR &CAN_TPR_TME0)
3837  03fa c65423        	ld	a,_CAN+3
3838  03fd a504          	bcp	a,#4
3839  03ff 2706          	jreq	L3502
3840                     ; 600         CAN.PSR =CAN_PS_TXMB0;
3842  0401 725f5427      	clr	_CAN+7
3844  0405 2018          	jra	L5502
3845  0407               L3502:
3846                     ; 602     else if(CAN.TPR &CAN_TPR_TME1)
3848  0407 c65423        	ld	a,_CAN+3
3849  040a a508          	bcp	a,#8
3850  040c 2706          	jreq	L7502
3851                     ; 604         CAN.PSR =CAN_PS_TXMB1;
3853  040e 35015427      	mov	_CAN+7,#1
3855  0412 200b          	jra	L5502
3856  0414               L7502:
3857                     ; 606     else if(CAN.TPR &CAN_TPR_TME2)
3859  0414 c65423        	ld	a,_CAN+3
3860  0417 a510          	bcp	a,#16
3861  0419 2707          	jreq	L3602
3862                     ; 608         CAN.PSR =CAN_PS_TXMB2;
3864  041b 35055427      	mov	_CAN+7,#5
3866  041f               L5502:
3867                     ; 614     return TRUE;
3869  041f a601          	ld	a,#1
3872  0421 81            	ret
3873  0422               L3602:
3874                     ; 612         return FALSE;
3876  0422 4f            	clr	a
3879  0423 81            	ret
3917                     ; 625 void SendToCan(CanMsgTypeDef *pCanMsg)
3917                     ; 626 {
3918                     	switch	.text
3919  0424               _SendToCan:
3923                     ; 627     CanMsgTransmit(pCanMsg);
3925  0424 cd019b        	call	_CanMsgTransmit
3927                     ; 628 }
3930  0427 81            	ret
3963                     ; 638 void Can_Main(void)
3963                     ; 639 {
3964                     	switch	.text
3965  0428               _Can_Main:
3969                     ; 640 	switch(CanBusState)
3971  0428 b600          	ld	a,_CanBusState
3973                     ; 669 			CLEAR_WWDG;			
3974  042a 4d            	tnz	a
3975  042b 271a          	jreq	L7012
3976  042d 4a            	dec	a
3977  042e 272c          	jreq	L1112
3978  0430 4a            	dec	a
3979  0431 274c          	jreq	L5112
3980  0433 4a            	dec	a
3981  0434 2754          	jreq	L5312
3982  0436 4a            	dec	a
3983  0437 273a          	jreq	L3112
3984  0439               L1212:
3985                     ; 668 			BEGIN_WWDG;			
3987  0439 357f50d2      	mov	_WWDG+1,#127
3990  043d 35ff50d1      	mov	_WWDG,#255
3991                     ; 669 			CLEAR_WWDG;			
3994  0441 357f50d1      	mov	_WWDG,#127
3995  0445               L1412:
3997  0445 20fe          	jra	L1412
3998  0447               L7012:
3999                     ; 642 		case CAN_INITIAL:
3999                     ; 643 			CanWakeUp();                                                                      
4001  0447 cd0188        	call	_CanWakeUp
4003                     ; 644 			CanInit(CAN_MCR_ABOM | CAN_MCR_AWUM |CAN_MCR_NART);
4005  044a a670          	ld	a,#112
4006  044c cd0000        	call	_CanInit
4008                     ; 645 			CanInterruptRestore();
4010  044f cd022a        	call	_CanInterruptRestore
4012                     ; 646 			CanBusWakeup();
4014  0452 72175014      	bres	_GPIOE,#3
4015                     ; 647 			CanBusState=CAN_RUNNING;
4018  0456 35010000      	mov	_CanBusState,#1
4019                     ; 648 			break;
4021  045a 202e          	jra	L5312
4022  045c               L1112:
4023                     ; 649 		case CAN_RUNNING:
4023                     ; 650 		    CanTxRxBuffer.id=CANID_SWITCHSTATE;
4025  045c aec080        	ldw	x,#49280
4026  045f cf0002        	ldw	_CanTxRxBuffer+2,x
4027  0462 ae1029        	ldw	x,#4137
4028  0465 cf0000        	ldw	_CanTxRxBuffer,x
4029                     ; 651 		    CanTxRxBuffer.dlc=8;
4031  0468 35080004      	mov	_CanTxRxBuffer+4,#8
4032                     ; 652             SendToCan(&CanTxRxBuffer);
4034  046c ae0000        	ldw	x,#_CanTxRxBuffer
4035  046f adb3          	call	_SendToCan
4037                     ; 653 			break;
4039  0471 2017          	jra	L5312
4040  0473               L3112:
4041                     ; 654 		case CAN_ACCOFF:
4041                     ; 655 			if(CAR_ACC_FLAG==1)
4043  0473 b600          	ld	a,_NodeState
4044  0475 a501          	bcp	a,#1
4045  0477 2711          	jreq	L5312
4046                     ; 657 				CanBusState=CAN_RUNNING;
4048  0479 35010000      	mov	_CanBusState,#1
4049  047d 200b          	jra	L5312
4050  047f               L5112:
4051                     ; 660 		case CAN_WAITSLEEP:
4051                     ; 661 			CanSleep();
4053  047f cd0173        	call	_CanSleep
4055                     ; 662 			CanBusSleep();
4057  0482 72165014      	bset	_GPIOE,#3
4058                     ; 663 			CanBusState=CAN_SLEEP;	
4061  0486 35030000      	mov	_CanBusState,#3
4062                     ; 664 			break;
4064  048a               L5312:
4065                     ; 676 }
4068  048a 81            	ret
4081                     	xdef	_CANGetEmptyMegBox
4082                     	xdef	_CanMsgTransmit
4083                     	xdef	_Can_Main
4084                     	xdef	_CanFlagAnalyse
4085                     	xdef	_SendToCan
4086                     	xdef	_CanIllumLevel
4087                     	xdef	_ISR_Can_Rx
4088                     	xdef	_ISR_Can_Tx
4089                     	xdef	_Can_Store_Rcvd_Msg
4090                     	xdef	_CanInterruptRestore
4091                     	xdef	_CanInterruptDisable
4092                     	xdef	_CanWakeUp
4093                     	xdef	_Can_Wakeup_Enable
4094                     	xdef	_CanSleep
4095                     	xdef	_CanInit
4096                     	xref.b	_can_msg_id32
4097                     	xref	_CanTxRxBuffer
4098                     	xref.b	_CanBusState
4099                     	xref.b	_NodeState
4100                     	xref.b	_CanPage
4101                     	xref.b	c_x
4120                     	xref	c_jltab
4121                     	xref	c_ltor
4122                     	xref	c_lgadc
4123                     	xref	c_lglsh
4124                     	end
