   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.3 - 19 Nov 2007
2359                     ; 19 void CanInit(u8 CAN_MasterCtrlReg)
2359                     ; 20 {
2360                     	switch	.text
2361  0000               f_CanInit:
2363  0000 88            	push	a
2364       00000000      OFST:	set	0
2367                     ; 21     CLK.PCKENR2|=CLK_PCKENR2_CAN; // 开启CAN时钟，stm8 的外设时钟可控
2369  0001 721e50ca      	bset	_CLK+10,#7
2370                     ; 23     CAN.PSR =CAN_PS_TXMB0;
2372  0005 725f5427      	clr	_CAN+7
2373                     ; 24     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;
2375  0009 72125428      	bset	_CAN+8,#1
2376                     ; 26     CAN.PSR =CAN_PS_TXMB1;
2378  000d 35015427      	mov	_CAN+7,#1
2379                     ; 27     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;
2381  0011 72125428      	bset	_CAN+8,#1
2382                     ; 29     CAN.PSR =CAN_PS_TXMB2;
2384  0015 35055427      	mov	_CAN+7,#5
2385                     ; 30     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;
2387  0019 72125428      	bset	_CAN+8,#1
2388                     ; 32     CAN.MCR |=CAN_MCR_INRQ; // Request initialisation
2390  001d 72105420      	bset	_CAN,#0
2392  0021 2001          	jra	L3041
2393  0023               L1041:
2394                     ; 35         _asm("nop");
2397  0023 9d            nop
2399  0024               L3041:
2400                     ; 33     while(!(CAN.MSR &CAN_MSR_INAK)) // Wait until acknowledged
2402  0024 c65421        	ld	a,_CAN+1
2403  0027 a501          	bcp	a,#1
2404  0029 27f8          	jreq	L1041
2405                     ; 40     CAN.TSR |=CAN_TSR_RQCP0 |CAN_TSR_RQCP1 |CAN_TSR_RQCP2;
2407  002b c65422        	ld	a,_CAN+2
2408  002e aa07          	or	a,#7
2409  0030 c75422        	ld	_CAN+2,a
2411  0033 2004          	jra	L1141
2412  0035               L7041:
2413                     ; 45         CAN.RFR =CAN_RFR_RFOM; //释放一级FIFO
2415  0035 35205424      	mov	_CAN+4,#32
2416  0039               L1141:
2417                     ; 43     while(CAN.RFR &CAN_RFR_FMP)
2419  0039 c65424        	ld	a,_CAN+4
2420  003c a503          	bcp	a,#3
2421  003e 26f5          	jrne	L7041
2422                     ; 49     CAN.RFR |=CAN_RFR_FOVR; 
2424  0040 72185424      	bset	_CAN+4,#4
2425                     ; 52 	CAN.MSR =CAN_MSR_WKUI;
2427  0044 35085421      	mov	_CAN+1,#8
2428                     ; 55 	CAN.MCR |= CAN_MasterCtrlReg;
2430  0048 c65420        	ld	a,_CAN
2431  004b 1a01          	or	a,(OFST+1,sp)
2432  004d c75420        	ld	_CAN,a
2433                     ; 59 	CAN.PSR =CAN_PS_CTRL;	
2435  0050 35065427      	mov	_CAN+7,#6
2436                     ; 60 	CAN_PAGE_FCR1 = 0x00;
2438  0054 725f5432      	clr	_CAN+18
2439                     ; 61 	CAN_PAGE_FCR2 = 0x00;
2441  0058 725f5433      	clr	_CAN+19
2442                     ; 62 	CAN_PAGE_FCR3 = 0x00;
2444  005c 725f5434      	clr	_CAN+20
2445                     ; 65 	CAN_PAGE_FCR1 = CAN_FCR1_FILTER0_SCALE_1_32BIT;
2447  0060 35065432      	mov	_CAN+18,#6
2448                     ; 80 	CAN_PAGE_FMR1 = 0x00;	/* Filter 0, 1, 2, 3 Low/High Register in Mask mode */
2450  0064 725f5430      	clr	_CAN+16
2451                     ; 81 	CAN_PAGE_FMR2 = 0x00;	/* Filter 4, 5 Low/High Register in Mask mode */
2453  0068 725f5431      	clr	_CAN+17
2454                     ; 103 	CAN.PSR = CAN_PS_FILTER01;
2456  006c 35025427      	mov	_CAN+7,#2
2457                     ; 105 	CAN_PAGE_FLR1 = 0x00;
2459  0070 725f5428      	clr	_CAN+8
2460                     ; 106 	CAN_PAGE_FLR2 = 0x00;
2462  0074 725f5429      	clr	_CAN+9
2463                     ; 107 	CAN_PAGE_FLR3 = 0x00;
2465  0078 725f542a      	clr	_CAN+10
2466                     ; 108 	CAN_PAGE_FLR4 = 0x00;
2468  007c 725f542b      	clr	_CAN+11
2469                     ; 109 	CAN_PAGE_FLR5 = 0x00;
2471  0080 725f542c      	clr	_CAN+12
2472                     ; 110 	CAN_PAGE_FLR6 = 0x00;
2474  0084 725f542d      	clr	_CAN+13
2475                     ; 111 	CAN_PAGE_FLR7 = 0x00;
2477  0088 725f542e      	clr	_CAN+14
2478                     ; 112 	CAN_PAGE_FLR8 = 0x00;
2480  008c 725f542f      	clr	_CAN+15
2481                     ; 114 	CAN_PAGE_FHR1 = 0x00;
2483  0090 725f5430      	clr	_CAN+16
2484                     ; 115 	CAN_PAGE_FHR2 = 0x00;
2486  0094 725f5431      	clr	_CAN+17
2487                     ; 116 	CAN_PAGE_FHR3 = 0x00;
2489  0098 725f5432      	clr	_CAN+18
2490                     ; 117 	CAN_PAGE_FHR4 = 0x00;
2492  009c 725f5433      	clr	_CAN+19
2493                     ; 118 	CAN_PAGE_FHR5 = 0x00;
2495  00a0 725f5434      	clr	_CAN+20
2496                     ; 119 	CAN_PAGE_FHR6 = 0x00;
2498  00a4 725f5435      	clr	_CAN+21
2499                     ; 120 	CAN_PAGE_FHR7 = 0x00;
2501  00a8 725f5436      	clr	_CAN+22
2502                     ; 121 	CAN_PAGE_FHR8 = 0x00;
2504  00ac 725f5437      	clr	_CAN+23
2505                     ; 124 	CAN.PSR = CAN_PS_FILTER23;
2507  00b0 35035427      	mov	_CAN+7,#3
2508                     ; 126 	CAN_PAGE_FLR1 = 0x00;
2510  00b4 725f5428      	clr	_CAN+8
2511                     ; 127 	CAN_PAGE_FLR2 = 0x00;
2513  00b8 725f5429      	clr	_CAN+9
2514                     ; 128 	CAN_PAGE_FLR3 = 0x00;
2516  00bc 725f542a      	clr	_CAN+10
2517                     ; 129 	CAN_PAGE_FLR4 = 0x00;
2519  00c0 725f542b      	clr	_CAN+11
2520                     ; 130 	CAN_PAGE_FLR5 = 0x00;
2522  00c4 725f542c      	clr	_CAN+12
2523                     ; 131 	CAN_PAGE_FLR6 = 0x00;
2525  00c8 725f542d      	clr	_CAN+13
2526                     ; 132 	CAN_PAGE_FLR7 = 0x00;
2528  00cc 725f542e      	clr	_CAN+14
2529                     ; 133 	CAN_PAGE_FLR8 = 0x00;
2531  00d0 725f542f      	clr	_CAN+15
2532                     ; 135 	CAN_PAGE_FHR1 = 0x00;
2534  00d4 725f5430      	clr	_CAN+16
2535                     ; 136 	CAN_PAGE_FHR2 = 0x00;
2537  00d8 725f5431      	clr	_CAN+17
2538                     ; 137 	CAN_PAGE_FHR3 = 0x00;
2540  00dc 725f5432      	clr	_CAN+18
2541                     ; 138 	CAN_PAGE_FHR4 = 0x00;
2543  00e0 725f5433      	clr	_CAN+19
2544                     ; 139 	CAN_PAGE_FHR5 = 0x00;
2546  00e4 725f5434      	clr	_CAN+20
2547                     ; 140 	CAN_PAGE_FHR6 = 0x00;
2549  00e8 725f5435      	clr	_CAN+21
2550                     ; 141 	CAN_PAGE_FHR7 = 0x00;
2552  00ec 725f5436      	clr	_CAN+22
2553                     ; 142 	CAN_PAGE_FHR8 = 0x00;
2555  00f0 725f5437      	clr	_CAN+23
2556                     ; 145 	CAN.PSR = CAN_PS_FILTER45;
2558  00f4 35045427      	mov	_CAN+7,#4
2559                     ; 147 	CAN_PAGE_FLR1 = 0xff;
2561  00f8 35ff5428      	mov	_CAN+8,#255
2562                     ; 148 	CAN_PAGE_FLR2 = 0xff;
2564  00fc 35ff5429      	mov	_CAN+9,#255
2565                     ; 149 	CAN_PAGE_FLR3 = 0xff;
2567  0100 35ff542a      	mov	_CAN+10,#255
2568                     ; 150 	CAN_PAGE_FLR4 = 0xff;
2570  0104 35ff542b      	mov	_CAN+11,#255
2571                     ; 151 	CAN_PAGE_FLR5 = 0xff;
2573  0108 35ff542c      	mov	_CAN+12,#255
2574                     ; 152 	CAN_PAGE_FLR6 = 0xff;
2576  010c 35ff542d      	mov	_CAN+13,#255
2577                     ; 153 	CAN_PAGE_FLR7 = 0xff;
2579  0110 35ff542e      	mov	_CAN+14,#255
2580                     ; 154 	CAN_PAGE_FLR8 = 0xff;
2582  0114 35ff542f      	mov	_CAN+15,#255
2583                     ; 156 	CAN_PAGE_FHR1 = 0xff;
2585  0118 35ff5430      	mov	_CAN+16,#255
2586                     ; 157 	CAN_PAGE_FHR2 = 0xff;
2588  011c 35ff5431      	mov	_CAN+17,#255
2589                     ; 158 	CAN_PAGE_FHR3 = 0xff;
2591  0120 35ff5432      	mov	_CAN+18,#255
2592                     ; 159 	CAN_PAGE_FHR4 = 0xff;
2594  0124 35ff5433      	mov	_CAN+19,#255
2595                     ; 160 	CAN_PAGE_FHR5 = 0xff;
2597  0128 35ff5434      	mov	_CAN+20,#255
2598                     ; 161 	CAN_PAGE_FHR6 = 0xff;
2600  012c 35ff5435      	mov	_CAN+21,#255
2601                     ; 162 	CAN_PAGE_FHR7 = 0xff;
2603  0130 35ff5436      	mov	_CAN+22,#255
2604                     ; 163 	CAN_PAGE_FHR8 = 0xff;
2606  0134 35ff5437      	mov	_CAN+23,#255
2607                     ; 166 	CAN.PSR = CAN_PS_CTRL;	
2609  0138 35065427      	mov	_CAN+7,#6
2610                     ; 167 	CAN_PAGE_FCR1 |= CAN_FCR1_FILTER0_ACTIVE;	/* Filter 0 active */
2612  013c 72105432      	bset	_CAN+18,#0
2613                     ; 175 	CAN.PSR =CAN_PS_CTRL;
2615  0140 35065427      	mov	_CAN+7,#6
2616                     ; 176 	CAN_PAGE_BTR1 =(CAN_PAGE_BTR1_BRP&(CAN_PAGE_BTR1_BRP_RESET_VALUE-1))
2616                     ; 177 	              |(CAN_PAGE_BTR1_SJW&((CAN_PAGE_BTR1_SJW_RESET_VALUE-1)<<6));		// see can.h for modification of
2618  0144 359d542c      	mov	_CAN+12,#157
2619                     ; 178 	CAN_PAGE_BTR2 =(CAN_PAGE_BTR2_BS1&(CAN_PAGE_BTR2_BS1_RESET_VALUE-1)) 	        // bit timing parameters.
2619                     ; 179 	              |(CAN_PAGE_BTR2_BS2&((CAN_PAGE_BTR2_BS2_RESET_VALUE-1)<<4))
2619                     ; 180 	               |CAN_PAGE_BTR2_CLKS;
2621  0148 35a3542d      	mov	_CAN+13,#163
2622                     ; 185 	CAN.DGR |= CAN_DGR_TXM2E;	/* enable 3th Tx mailboxe */ 
2624  014c 72185426      	bset	_CAN+6,#4
2625                     ; 187 	CAN.MCR &= ~CAN_MCR_INRQ;	/* Leave the Init mode */
2627  0150 72115420      	bres	_CAN,#0
2629  0154 2001          	jra	L7141
2630  0156               L5141:
2631                     ; 190 		_asm("nop");
2634  0156 9d            nop
2636  0157               L7141:
2637                     ; 188 	while ((CAN.MSR &CAN_MSR_INAK))	/* Wait until acknowledged */ 
2639  0157 c65421        	ld	a,_CAN+1
2640  015a a501          	bcp	a,#1
2641  015c 26f8          	jrne	L5141
2642                     ; 193 }
2645  015e 84            	pop	a
2646  015f 87            	retf
2670                     ; 202 void Can_Wakeup_Enable(void)
2670                     ; 203 {
2671                     	switch	.text
2672  0160               f_Can_Wakeup_Enable:
2676                     ; 204 	CanSavePg();
2678  0160 5554270000    	mov	_CanPage,_CAN+7
2679                     ; 206 	CAN.IER = CAN_IER_WKUIE | /* Wake-up Interrupt */
2679                     ; 207 			  CAN_IER_FOVIE | /* FIFO overrun Interrupt */
2679                     ; 208 			  CAN_IER_FFIE  | /* FIFO Full Interrupt */
2679                     ; 209 			  CAN_IER_FMPIE | /* FIFO Message Pending Interrupt */
2679                     ; 210 			  CAN_IER_TMEIE;  /* Transmit Mailbox Empty Interrupt */
2681  0165 358f5425      	mov	_CAN+5,#143
2682                     ; 212 	CAN.PSR = CAN_PS_CTRL;
2684  0169 35065427      	mov	_CAN+7,#6
2685                     ; 213 	CAN_PAGE_EIER = CAN_PAGE_EIER_ERRIE|	/* Error Interrupt */
2685                     ; 214 				    CAN_PAGE_EIER_LECIE|	/* Last Error Code Interrupt */
2685                     ; 215 				    CAN_PAGE_EIER_BOFIE|	/* Bus-Off Interrupt */
2685                     ; 216 				    CAN_PAGE_EIER_EPVIE|	/* Error Passive Interrupt */
2685                     ; 217 				    CAN_PAGE_EIER_EWGIE;	/* Error Warning Interrupt */
2687  016d 35975429      	mov	_CAN+9,#151
2688                     ; 219 	CanRestorePg();
2690  0171 5500005427    	mov	_CAN+7,_CanPage
2691                     ; 220 }
2694  0176 87            	retf
2719                     ; 229 void CanSleep(void)
2719                     ; 230 {
2720                     	switch	.text
2721  0177               f_CanSleep:
2725                     ; 231     CanInit(CAN_MCR_AWUM);
2727  0177 a620          	ld	a,#32
2728  0179 8d000000      	callf	f_CanInit
2730                     ; 232     Can_Wakeup_Enable();
2732  017d 8d600160      	callf	f_Can_Wakeup_Enable
2735  0181 2004          	jra	L5441
2736  0183               L3441:
2737                     ; 238         CAN.MCR |= CAN_MCR_SLEEP;		
2739  0183 72125420      	bset	_CAN,#1
2740  0187               L5441:
2741                     ; 235     while(!(CAN.MSR &CAN_MSR_SLAK))
2743  0187 c65421        	ld	a,_CAN+1
2744  018a a502          	bcp	a,#2
2745  018c 27f5          	jreq	L3441
2746                     ; 240 }
2749  018e 87            	retf
2774                     ; 249 void CanWakeUp(void)
2774                     ; 250 {
2775                     	switch	.text
2776  018f               f_CanWakeUp:
2780                     ; 251 	CanBusWakeup();
2782  018f 72175014      	bres	_GPIOE,#3
2783                     ; 254 	CAN.MCR &= ~CAN_MCR_SLEEP;	
2786  0193 72135420      	bres	_CAN,#1
2788  0197 2001          	jra	L3641
2789  0199               L1641:
2790                     ; 259         _asm("nop");
2793  0199 9d            nop
2795  019a               L3641:
2796                     ; 257 	while(CAN.MSR & CAN_MSR_SLAK)
2798  019a c65421        	ld	a,_CAN+1
2799  019d a502          	bcp	a,#2
2800  019f 26f8          	jrne	L1641
2801                     ; 261 }
2804  01a1 87            	retf
2900                     ; 276 BoolT CanMsgTransmit(CanMsgTypeDef *pCanMsg)
2900                     ; 277 {
2901                     	switch	.text
2902  01a2               f_CanMsgTransmit:
2904  01a2 89            	pushw	x
2905  01a3 88            	push	a
2906       00000001      OFST:	set	1
2909                     ; 280 	if(CAN.TPR & CAN_TPR_TME0)			/* Mailbox 1 empty ? */
2911  01a4 c65423        	ld	a,_CAN+3
2912  01a7 a504          	bcp	a,#4
2913  01a9 270a          	jreq	L5351
2914                     ; 282 		CAN.PSR = CAN_PS_TXMB0;
2916  01ab 725f5427      	clr	_CAN+7
2917                     ; 283 		MailboxNumber = 1;
2919  01af a601          	ld	a,#1
2920  01b1 6b01          	ld	(OFST+0,sp),a
2922  01b3 2020          	jra	L7351
2923  01b5               L5351:
2924                     ; 285 	else if(CAN.TPR & CAN_TPR_TME1)	/* Mailbox 2 empty ? */
2926  01b5 c65423        	ld	a,_CAN+3
2927  01b8 a508          	bcp	a,#8
2928  01ba 270a          	jreq	L1451
2929                     ; 287 		CAN.PSR = CAN_PS_TXMB1;
2931  01bc 35015427      	mov	_CAN+7,#1
2932                     ; 288 		MailboxNumber = 2;		
2934  01c0 a602          	ld	a,#2
2935  01c2 6b01          	ld	(OFST+0,sp),a
2937  01c4 200f          	jra	L7351
2938  01c6               L1451:
2939                     ; 290 	else if(CAN.TPR & CAN_TPR_TME2)	/* Mailbox 3 empty ? */
2941  01c6 c65423        	ld	a,_CAN+3
2942  01c9 a510          	bcp	a,#16
2943  01cb 2768          	jreq	L5451
2944                     ; 292 		CAN.PSR = CAN_PS_TXMB2;
2946  01cd 35055427      	mov	_CAN+7,#5
2947                     ; 293 		MailboxNumber = 3;		
2949  01d1 a603          	ld	a,#3
2950  01d3 6b01          	ld	(OFST+0,sp),a
2952  01d5               L7351:
2953                     ; 302     CAN_PAGE_MDLCR = pCanMsg->dlc;
2955  01d5 1e02          	ldw	x,(OFST+1,sp)
2956  01d7 e604          	ld	a,(4,x)
2957  01d9 c75429        	ld	_CAN+9,a
2958                     ; 304     *((u32*)&CAN_PAGE_MIDR1)=pCanMsg->id;
2960  01dc 1e02          	ldw	x,(OFST+1,sp)
2961  01de e603          	ld	a,(3,x)
2962  01e0 c7542d        	ld	_CAN+13,a
2963  01e3 e602          	ld	a,(2,x)
2964  01e5 c7542c        	ld	_CAN+12,a
2965  01e8 e601          	ld	a,(1,x)
2966  01ea c7542b        	ld	_CAN+11,a
2967  01ed f6            	ld	a,(x)
2968  01ee c7542a        	ld	_CAN+10,a
2969                     ; 305     CAN_PAGE_MIDR1|= CAN_ID_EXT;
2971  01f1 721c542a      	bset	_CAN+10,#6
2972                     ; 307     CAN_PAGE_MDAR1 =pCanMsg->data[0];
2974  01f5 1e02          	ldw	x,(OFST+1,sp)
2975  01f7 e605          	ld	a,(5,x)
2976  01f9 c7542e        	ld	_CAN+14,a
2977                     ; 308     CAN_PAGE_MDAR2 =pCanMsg->data[1];
2979  01fc 1e02          	ldw	x,(OFST+1,sp)
2980  01fe e606          	ld	a,(6,x)
2981  0200 c7542f        	ld	_CAN+15,a
2982                     ; 309     CAN_PAGE_MDAR3 =pCanMsg->data[2];
2984  0203 1e02          	ldw	x,(OFST+1,sp)
2985  0205 e607          	ld	a,(7,x)
2986  0207 c75430        	ld	_CAN+16,a
2987                     ; 310     CAN_PAGE_MDAR4 =pCanMsg->data[3];
2989  020a 1e02          	ldw	x,(OFST+1,sp)
2990  020c e608          	ld	a,(8,x)
2991  020e c75431        	ld	_CAN+17,a
2992                     ; 311     CAN_PAGE_MDAR5 =pCanMsg->data[4];
2994  0211 1e02          	ldw	x,(OFST+1,sp)
2995  0213 e609          	ld	a,(9,x)
2996  0215 c75432        	ld	_CAN+18,a
2997                     ; 312     CAN_PAGE_MDAR6 =pCanMsg->data[5];
2999  0218 1e02          	ldw	x,(OFST+1,sp)
3000  021a e60a          	ld	a,(10,x)
3001  021c c75433        	ld	_CAN+19,a
3002                     ; 313     CAN_PAGE_MDAR7 =pCanMsg->data[6];
3004  021f 1e02          	ldw	x,(OFST+1,sp)
3005  0221 e60b          	ld	a,(11,x)
3006  0223 c75434        	ld	_CAN+20,a
3007                     ; 314     CAN_PAGE_MDAR8 =pCanMsg->data[7];
3009  0226 1e02          	ldw	x,(OFST+1,sp)
3010  0228 e60c          	ld	a,(12,x)
3011  022a c75435        	ld	_CAN+21,a
3012                     ; 316     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_TXRQ;
3014  022d 72105428      	bset	_CAN+8,#0
3015                     ; 317 	return(TRUE);
3017  0231 a601          	ld	a,#1
3019  0233 2001          	jra	L61
3020  0235               L5451:
3021                     ; 297 		return (FALSE);
3023  0235 4f            	clr	a
3025  0236               L61:
3027  0236 5b03          	addw	sp,#3
3028  0238 87            	retf
3053                     ; 327 void CanInterruptDisable(void)
3053                     ; 328 {
3054                     	switch	.text
3055  0239               f_CanInterruptDisable:
3059                     ; 329 	CanSavePg();
3061  0239 5554270000    	mov	_CanPage,_CAN+7
3062                     ; 331 	CAN.IER = 0x00; 
3064  023e 725f5425      	clr	_CAN+5
3065                     ; 332 	CAN.PSR = CAN_PS_CTRL;         
3067  0242 35065427      	mov	_CAN+7,#6
3068                     ; 333 	CAN_PAGE_EIER = 0x00;
3070  0246 725f5429      	clr	_CAN+9
3071                     ; 335 	CanRestorePg();
3073  024a 5500005427    	mov	_CAN+7,_CanPage
3074                     ; 336 }
3077  024f 87            	retf
3102                     ; 345 void CanInterruptRestore (void)
3102                     ; 346 {
3103                     	switch	.text
3104  0250               f_CanInterruptRestore:
3108                     ; 347 	CanSavePg();
3110  0250 5554270000    	mov	_CanPage,_CAN+7
3111                     ; 349 	CAN.IER = 	//CAN_IER_WKUIE |	/* Wake-up Interrupt */
3111                     ; 350 				CAN_IER_FOVIE /* FIFO overrun Interrupt */
3111                     ; 351 				|CAN_IER_FFIE /* FIFO Full Interrupt */
3111                     ; 352 				|CAN_IER_FMPIE /* FIFO Message Pending Interrupt */
3111                     ; 353 				//|CAN_IER_TMEIE	/* Transmit Mailbox Empty Interrupt */
3111                     ; 354                 ;
3113  0255 350e5425      	mov	_CAN+5,#14
3114                     ; 355 	CAN.PSR = CAN_PS_CTRL;
3116  0259 35065427      	mov	_CAN+7,#6
3117                     ; 356 	CAN_PAGE_EIER = CAN_PAGE_EIER_ERRIE|    /* Error Interrupt */
3117                     ; 357 				    CAN_PAGE_EIER_LECIE|        /* Last Error Code Interrupt */
3117                     ; 358 				    CAN_PAGE_EIER_BOFIE|        /* Bus-Off Interrupt */
3117                     ; 359 				    CAN_PAGE_EIER_EPVIE|        /* Error Passive Interrupt */
3117                     ; 360 				    CAN_PAGE_EIER_EWGIE;        /* Error Warning Interrupt */
3119  025d 35975429      	mov	_CAN+9,#151
3120                     ; 362 	CanRestorePg();
3122  0261 5500005427    	mov	_CAN+7,_CanPage
3123                     ; 363 }
3126  0266 87            	retf
3170                     .const:	section	.text
3171  0000               L5161:
3172  0000 0003          	dc.w	3
3173  0002 10242040      	dc.l	270803008
3174  0006 02d1          	dc.w	L1751
3175  0008 1029c080      	dc.l	271171712
3176  000c 02d1          	dc.w	L1751
3177  000e 10445701      	dc.l	272914177
3178  0012 02d1          	dc.w	L1751
3179  0014 02ff          	dc.w	L7161
3180                     ; 366 void Can_Store_Rcvd_Msg(void)	//中断服务程序中执行
3180                     ; 367 {
3181                     	switch	.text
3182  0267               f_Can_Store_Rcvd_Msg:
3184  0267 5203          	subw	sp,#3
3185       00000003      OFST:	set	3
3188                     ; 369 	u8 *u8p =&CAN_PAGE_MDAR1;
3190  0269 ae542e        	ldw	x,#_CAN+14
3191  026c 1f01          	ldw	(OFST-2,sp),x
3192                     ; 371 	CAN.PSR = CAN_PS_FIFO; //进入接收数据FIFO页面
3194  026e 35075427      	mov	_CAN+7,#7
3195                     ; 372     CanTxRxBuffer.id =CAN_PAGE_MIDR1&0x1F;
3197  0272 c6542a        	ld	a,_CAN+10
3198  0275 a41f          	and	a,#31
3199  0277 c70003        	ld	_CanTxRxBuffer+3,a
3200  027a 4f            	clr	a
3201  027b c70002        	ld	_CanTxRxBuffer+2,a
3202  027e c70001        	ld	_CanTxRxBuffer+1,a
3203  0281 c70000        	ld	_CanTxRxBuffer,a
3204                     ; 373     CanTxRxBuffer.id <<=8; //移位计算更优
3206  0284 ae0000        	ldw	x,#_CanTxRxBuffer
3207  0287 a608          	ld	a,#8
3208  0289 8d000000      	callf	d_lglsh
3210                     ; 374     CanTxRxBuffer.id +=CAN_PAGE_MIDR2;
3212  028d c6542b        	ld	a,_CAN+11
3213  0290 ae0000        	ldw	x,#_CanTxRxBuffer
3214  0293 88            	push	a
3215  0294 8d000000      	callf	d_lgadc
3217  0298 84            	pop	a
3218                     ; 375     CanTxRxBuffer.id <<=8;
3220  0299 ae0000        	ldw	x,#_CanTxRxBuffer
3221  029c a608          	ld	a,#8
3222  029e 8d000000      	callf	d_lglsh
3224                     ; 376     CanTxRxBuffer.id +=CAN_PAGE_MIDR3;
3226  02a2 c6542c        	ld	a,_CAN+12
3227  02a5 ae0000        	ldw	x,#_CanTxRxBuffer
3228  02a8 88            	push	a
3229  02a9 8d000000      	callf	d_lgadc
3231  02ad 84            	pop	a
3232                     ; 377     CanTxRxBuffer.id <<=8;
3234  02ae ae0000        	ldw	x,#_CanTxRxBuffer
3235  02b1 a608          	ld	a,#8
3236  02b3 8d000000      	callf	d_lglsh
3238                     ; 378     CanTxRxBuffer.id +=CAN_PAGE_MIDR4;
3240  02b7 c6542d        	ld	a,_CAN+13
3241  02ba ae0000        	ldw	x,#_CanTxRxBuffer
3242  02bd 88            	push	a
3243  02be 8d000000      	callf	d_lgadc
3245  02c2 84            	pop	a
3246                     ; 380     switch(CanTxRxBuffer.id)
3248  02c3 ae0000        	ldw	x,#_CanTxRxBuffer
3249  02c6 8d000000      	callf	d_ltor
3252  02ca ae0000        	ldw	x,#L5161
3253  02cd 8d000000      	callf	d_jltab
3254  02d1               L1751:
3255                     ; 386     		CanTxRxBuffer.dlc= CAN_PAGE_MDLCR; //此帧长度(字节数)
3257  02d1 5554290004    	mov	_CanTxRxBuffer+4,_CAN+9
3258                     ; 387 			for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
3260  02d6 0f03          	clr	(OFST+0,sp)
3262  02d8 2017          	jra	L5261
3263  02da               L1261:
3264                     ; 389 				CanTxRxBuffer.data[idx]=u8p[idx];
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
3281                     ; 387 			for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
3283  02ef 0c03          	inc	(OFST+0,sp)
3284  02f1               L5261:
3287  02f1 c60004        	ld	a,_CanTxRxBuffer+4
3288  02f4 1103          	cp	a,(OFST+0,sp)
3289  02f6 22e2          	jrugt	L1261
3290                     ; 391             CanMsgAnalyze(&CanTxRxBuffer);
3292  02f8 ae0000        	ldw	x,#_CanTxRxBuffer
3293  02fb 8d650365      	callf	L5531f_CanMsgAnalyze
3295                     ; 392             break;
3297  02ff               L3751:
3298                     ; 394         default:
3298                     ; 395     		break;
3300  02ff               L7161:
3301                     ; 397 }
3304  02ff 5b03          	addw	sp,#3
3305  0301 87            	retf
3338                     ; 407 void ISR_Can_Tx(void)
3338                     ; 408 {
3339                     	switch	.text
3340  0302               f_ISR_Can_Tx:
3342  0302 88            	push	a
3343       00000001      OFST:	set	1
3346                     ; 410     CanSavePg();
3348  0303 5554270000    	mov	_CanPage,_CAN+7
3349                     ; 412     CAN.PSR =CAN_PS_CTRL;
3351  0308 35065427      	mov	_CAN+7,#6
3352                     ; 413     if(CAN_PAGE_ESR)
3354  030c 725d5428      	tnz	_CAN+8
3355  0310 2714          	jreq	L5461
3356                     ; 415         ErrorCode=CAN_PAGE_ESR;
3358  0312 c65428        	ld	a,_CAN+8
3359  0315 6b01          	ld	(OFST+0,sp),a
3360                     ; 416         if((CAN_PAGE_ESR&CAN_PAGE_ESR_LEC)!=0)
3362  0317 c65428        	ld	a,_CAN+8
3363  031a a570          	bcp	a,#112
3364  031c 2704          	jreq	L7461
3365                     ; 418             CAN_PAGE_ESR =0;//|=CAN_PAGE_ESR_LEC;
3367  031e 725f5428      	clr	_CAN+8
3368  0322               L7461:
3369                     ; 420         CAN.MSR |=CAN_MSR_ERRI;
3371  0322 72145421      	bset	_CAN+1,#2
3372  0326               L5461:
3373                     ; 422     CanRestorePg();
3375  0326 5500005427    	mov	_CAN+7,_CanPage
3376                     ; 423 }
3379  032b 84            	pop	a
3380  032c 87            	retf
3405                     ; 434 void ISR_Can_Rx(void)
3405                     ; 435 {
3406                     	switch	.text
3407  032d               f_ISR_Can_Rx:
3411                     ; 436 	CanSavePg();   
3413  032d 5554270000    	mov	_CanPage,_CAN+7
3414                     ; 438 	if (CAN.RFR & CAN_RFR_FOVR)
3416  0332 c65424        	ld	a,_CAN+4
3417  0335 a510          	bcp	a,#16
3418  0337 2706          	jreq	L1661
3419                     ; 440 		CAN.RFR |= CAN_RFR_FOVR;		/* clear the FIFO Overrun (FOVR) bit */
3421  0339 72185424      	bset	_CAN+4,#4
3423  033d 2019          	jra	L1761
3424  033f               L1661:
3425                     ; 442 	else if (CAN.RFR & CAN_RFR_FULL)
3427  033f c65424        	ld	a,_CAN+4
3428  0342 a508          	bcp	a,#8
3429  0344 2712          	jreq	L1761
3430                     ; 444 		CAN.RFR |= CAN_RFR_FULL;		/* clear the FIFO full (FULL) bit */      
3432  0346 72165424      	bset	_CAN+4,#3
3433  034a 200c          	jra	L1761
3434  034c               L7661:
3435                     ; 448         Can_Store_Rcvd_Msg();
3437  034c 8d670267      	callf	f_Can_Store_Rcvd_Msg
3439                     ; 449         CAN.RFR |= CAN_RFR_RFOM; // Release mailbox
3441  0350 721a5424      	bset	_CAN+4,#5
3442                     ; 450 		CAN.RFR |= CAN_RFR_RFOM; //此语句要用2句,原因还没搞明白
3444  0354 721a5424      	bset	_CAN+4,#5
3445  0358               L1761:
3446                     ; 446 	while (CAN.RFR & CAN_RFR_FMP)	/* Check until FMP != 0 */
3448  0358 c65424        	ld	a,_CAN+4
3449  035b a503          	bcp	a,#3
3450  035d 26ed          	jrne	L7661
3451                     ; 452 	CanRestorePg();
3453  035f 5500005427    	mov	_CAN+7,_CanPage
3454                     ; 453 }
3457  0364 87            	retf
3516                     	switch	.const
3517  0016               L3371:
3518  0016 0003          	dc.w	3
3519  0018 10242040      	dc.l	270803008
3520  001c 0377          	dc.w	L5761
3521  001e 1029c080      	dc.l	271171712
3522  0022 0379          	dc.w	L7761
3523  0024 10445701      	dc.l	272914177
3524  0028 0382          	dc.w	L1071
3525  002a 03c8          	dc.w	L5371
3526                     ; 464 static void CanMsgAnalyze(CanMsgTypeDef *pCanMsg)
3526                     ; 465 {
3527                     	switch	.text
3528  0365               L5531f_CanMsgAnalyze:
3530  0365 89            	pushw	x
3531  0366 520e          	subw	sp,#14
3532       0000000e      OFST:	set	14
3535                     ; 468     BoolT FlagCANDataOK=TRUE;
3537  0368 a601          	ld	a,#1
3538  036a 6b01          	ld	(OFST-13,sp),a
3539                     ; 471     switch(pCanMsg->id)
3541  036c 8d000000      	callf	d_ltor
3544  0370 ae0016        	ldw	x,#L3371
3545  0373 8d000000      	callf	d_jltab
3546  0377               L5761:
3547                     ; 478             break;
3549  0377 204f          	jra	L5371
3550  0379               L7761:
3551                     ; 483             LED=pCanMsg->data[0];
3553  0379 1e0f          	ldw	x,(OFST+1,sp)
3554  037b e605          	ld	a,(5,x)
3555  037d c7500a        	ld	_GPIOC,a
3556                     ; 486             break;
3558  0380 2046          	jra	L5371
3559  0382               L1071:
3560                     ; 491             CanBuffer.data[0]=pCanMsg->data[0];
3562  0382 1e0f          	ldw	x,(OFST+1,sp)
3563  0384 e605          	ld	a,(5,x)
3564  0386 6b07          	ld	(OFST-7,sp),a
3565                     ; 492             CanBuffer.data[1]=pCanMsg->data[1];
3567  0388 1e0f          	ldw	x,(OFST+1,sp)
3568  038a e606          	ld	a,(6,x)
3569  038c 6b08          	ld	(OFST-6,sp),a
3570                     ; 493             CanBuffer.data[2]=pCanMsg->data[2];
3572  038e 1e0f          	ldw	x,(OFST+1,sp)
3573  0390 e607          	ld	a,(7,x)
3574  0392 6b09          	ld	(OFST-5,sp),a
3575                     ; 494             CanBuffer.data[3]=pCanMsg->data[3];
3577  0394 1e0f          	ldw	x,(OFST+1,sp)
3578  0396 e608          	ld	a,(8,x)
3579  0398 6b0a          	ld	(OFST-4,sp),a
3580                     ; 495             CanBuffer.data[4]=pCanMsg->data[4];
3582  039a 1e0f          	ldw	x,(OFST+1,sp)
3583  039c e609          	ld	a,(9,x)
3584  039e 6b0b          	ld	(OFST-3,sp),a
3585                     ; 496             CanBuffer.data[5]=pCanMsg->data[5];
3587  03a0 1e0f          	ldw	x,(OFST+1,sp)
3588  03a2 e60a          	ld	a,(10,x)
3589  03a4 6b0c          	ld	(OFST-2,sp),a
3590                     ; 497             CanBuffer.data[6]=pCanMsg->data[6];
3592  03a6 1e0f          	ldw	x,(OFST+1,sp)
3593  03a8 e60b          	ld	a,(11,x)
3594  03aa 6b0d          	ld	(OFST-1,sp),a
3595                     ; 498             CanBuffer.data[7]=pCanMsg->data[7];
3597  03ac 1e0f          	ldw	x,(OFST+1,sp)
3598  03ae e60c          	ld	a,(12,x)
3599  03b0 6b0e          	ld	(OFST+0,sp),a
3600                     ; 499             CanBuffer.id =CANID_NODEREGISTER;
3602  03b2 ae5701        	ldw	x,#22273
3603  03b5 1f04          	ldw	(OFST-10,sp),x
3604  03b7 ae1044        	ldw	x,#4164
3605  03ba 1f02          	ldw	(OFST-12,sp),x
3606                     ; 500             CanBuffer.dlc =8;
3608  03bc a608          	ld	a,#8
3609  03be 6b06          	ld	(OFST-8,sp),a
3610                     ; 501             SendToCan(&CanBuffer);
3612  03c0 96            	ldw	x,sp
3613  03c1 1c0002        	addw	x,#OFST-12
3614  03c4 8dfa03fa      	callf	f_SendToCan
3616                     ; 512             break;
3618  03c8               L5371:
3619                     ; 515     CanFlagAnalyse();
3621  03c8 8dcf03cf      	callf	f_CanFlagAnalyse
3623                     ; 516 }
3626  03cc 5b10          	addw	sp,#16
3627  03ce 87            	retf
3649                     ; 527 void CanFlagAnalyse(void)
3649                     ; 528 {
3650                     	switch	.text
3651  03cf               f_CanFlagAnalyse:
3655                     ; 529 }
3658  03cf 87            	retf
3682                     ; 539 BoolT CANGetEmptyMegBox(void)
3682                     ; 540 {
3683                     	switch	.text
3684  03d0               f_CANGetEmptyMegBox:
3688                     ; 541     if(CAN.TPR &CAN_TPR_TME0)
3690  03d0 c65423        	ld	a,_CAN+3
3691  03d3 a504          	bcp	a,#4
3692  03d5 2706          	jreq	L7571
3693                     ; 543         CAN.PSR =CAN_PS_TXMB0;
3695  03d7 725f5427      	clr	_CAN+7
3697  03db 2018          	jra	L1671
3698  03dd               L7571:
3699                     ; 545     else if(CAN.TPR &CAN_TPR_TME1)
3701  03dd c65423        	ld	a,_CAN+3
3702  03e0 a508          	bcp	a,#8
3703  03e2 2706          	jreq	L3671
3704                     ; 547         CAN.PSR =CAN_PS_TXMB1;
3706  03e4 35015427      	mov	_CAN+7,#1
3708  03e8 200b          	jra	L1671
3709  03ea               L3671:
3710                     ; 549     else if(CAN.TPR &CAN_TPR_TME2)
3712  03ea c65423        	ld	a,_CAN+3
3713  03ed a510          	bcp	a,#16
3714  03ef 2707          	jreq	L7671
3715                     ; 551         CAN.PSR =CAN_PS_TXMB2;
3717  03f1 35055427      	mov	_CAN+7,#5
3719  03f5               L1671:
3720                     ; 557     return TRUE;
3722  03f5 a601          	ld	a,#1
3725  03f7 87            	retf
3726  03f8               L7671:
3727                     ; 555         return FALSE;
3729  03f8 4f            	clr	a
3732  03f9 87            	retf
3769                     ; 568 void SendToCan(CanMsgTypeDef *pCanMsg)
3769                     ; 569 {
3770                     	switch	.text
3771  03fa               f_SendToCan:
3775                     ; 570     CanMsgTransmit(pCanMsg);
3777  03fa 8da201a2      	callf	f_CanMsgTransmit
3779                     ; 571 }
3782  03fe 87            	retf
3818                     ; 581 void NodeRegister(void)
3818                     ; 582 {
3819                     	switch	.text
3820  03ff               f_NodeRegister:
3822  03ff 520d          	subw	sp,#13
3823       0000000d      OFST:	set	13
3826                     ; 584     CanBuffer.id =CANID_NODEREGISTER;
3828  0401 ae5701        	ldw	x,#22273
3829  0404 1f03          	ldw	(OFST-10,sp),x
3830  0406 ae1044        	ldw	x,#4164
3831  0409 1f01          	ldw	(OFST-12,sp),x
3832                     ; 585     CanBuffer.dlc =8;
3834  040b a608          	ld	a,#8
3835  040d 6b05          	ld	(OFST-8,sp),a
3836                     ; 586     CanBuffer.data[0]=UniqueID[0];
3838  040f 72c60000      	ld	a,[_UniqueID.w]
3839  0413 6b06          	ld	(OFST-7,sp),a
3840                     ; 587     CanBuffer.data[1]=UniqueID[1];
3842  0415 ce0000        	ldw	x,_UniqueID
3843  0418 e601          	ld	a,(1,x)
3844  041a 6b07          	ld	(OFST-6,sp),a
3845                     ; 588     CanBuffer.data[2]=UniqueID[2];
3847  041c ce0000        	ldw	x,_UniqueID
3848  041f e602          	ld	a,(2,x)
3849  0421 6b08          	ld	(OFST-5,sp),a
3850                     ; 589     CanBuffer.data[3]=UniqueID[3];
3852  0423 ce0000        	ldw	x,_UniqueID
3853  0426 e603          	ld	a,(3,x)
3854  0428 6b09          	ld	(OFST-4,sp),a
3855                     ; 590     CanBuffer.data[4]=UniqueID[4];
3857  042a ce0000        	ldw	x,_UniqueID
3858  042d e604          	ld	a,(4,x)
3859  042f 6b0a          	ld	(OFST-3,sp),a
3860                     ; 591     CanBuffer.data[5]=UniqueID[5];
3862  0431 ce0000        	ldw	x,_UniqueID
3863  0434 e605          	ld	a,(5,x)
3864  0436 6b0b          	ld	(OFST-2,sp),a
3865                     ; 592     CanBuffer.data[6]=UniqueID[6];
3867  0438 ce0000        	ldw	x,_UniqueID
3868  043b e606          	ld	a,(6,x)
3869  043d 6b0c          	ld	(OFST-1,sp),a
3870                     ; 593     CanBuffer.data[7]=UniqueID[7];
3872  043f ce0000        	ldw	x,_UniqueID
3873  0442 e607          	ld	a,(7,x)
3874  0444 6b0d          	ld	(OFST+0,sp),a
3875                     ; 594     SendToCan(&CanBuffer);
3877  0446 96            	ldw	x,sp
3878  0447 1c0001        	addw	x,#OFST-12
3879  044a 8dfa03fa      	callf	f_SendToCan
3881                     ; 595 }
3884  044e 5b0d          	addw	sp,#13
3885  0450 87            	retf
3927                     ; 605 void SendSwitchState(u8 Switch)
3927                     ; 606 {
3928                     	switch	.text
3929  0451               f_SendSwitchState:
3931  0451 88            	push	a
3932  0452 520d          	subw	sp,#13
3933       0000000d      OFST:	set	13
3936                     ; 608     CanBuffer.id =CANID_SWITCHSTATE;
3938  0454 aec080        	ldw	x,#49280
3939  0457 1f03          	ldw	(OFST-10,sp),x
3940  0459 ae1029        	ldw	x,#4137
3941  045c 1f01          	ldw	(OFST-12,sp),x
3942                     ; 609     CanBuffer.dlc =1;
3944  045e a601          	ld	a,#1
3945  0460 6b05          	ld	(OFST-8,sp),a
3946                     ; 610     CanBuffer.data[0]=Switch;
3948  0462 7b0e          	ld	a,(OFST+1,sp)
3949  0464 6b06          	ld	(OFST-7,sp),a
3950                     ; 611     SendToCan(&CanBuffer);
3952  0466 96            	ldw	x,sp
3953  0467 1c0001        	addw	x,#OFST-12
3954  046a 8dfa03fa      	callf	f_SendToCan
3956                     ; 612 }
3959  046e 5b0e          	addw	sp,#14
3960  0470 87            	retf
4002                     ; 622 void SendBraodcast(u8 Broadcast)
4002                     ; 623 {
4003                     	switch	.text
4004  0471               f_SendBraodcast:
4006  0471 88            	push	a
4007  0472 520d          	subw	sp,#13
4008       0000000d      OFST:	set	13
4011                     ; 625     CanBuffer.id =CANID_BROADCAST;
4013  0474 ae2040        	ldw	x,#8256
4014  0477 1f03          	ldw	(OFST-10,sp),x
4015  0479 ae1024        	ldw	x,#4132
4016  047c 1f01          	ldw	(OFST-12,sp),x
4017                     ; 626     CanBuffer.dlc =1;
4019  047e a601          	ld	a,#1
4020  0480 6b05          	ld	(OFST-8,sp),a
4021                     ; 627     CanBuffer.data[0]=Broadcast;
4023  0482 7b0e          	ld	a,(OFST+1,sp)
4024  0484 6b06          	ld	(OFST-7,sp),a
4025                     ; 628     SendToCan(&CanBuffer);
4027  0486 96            	ldw	x,sp
4028  0487 1c0001        	addw	x,#OFST-12
4029  048a 8dfa03fa      	callf	f_SendToCan
4031                     ; 629 }
4034  048e 5b0e          	addw	sp,#14
4035  0490 87            	retf
4064                     ; 639 void Can_Main(void)
4064                     ; 640 {
4065                     	switch	.text
4066  0491               f_Can_Main:
4070                     ; 641 	switch(CanBusState)
4072  0491 c60000        	ld	a,_CanBusState
4074                     ; 677 			CLEAR_WWDG;			
4075  0494 4d            	tnz	a
4076  0495 271d          	jreq	L1702
4077  0497 4a            	dec	a
4078  0498 2732          	jreq	L3702
4079  049a 4a            	dec	a
4080  049b 2747          	jreq	L1212
4081  049d 4a            	dec	a
4082  049e 2738          	jreq	L1012
4083  04a0 4a            	dec	a
4084  04a1 2741          	jreq	L1212
4085  04a3 4a            	dec	a
4086  04a4 272c          	jreq	L7702
4087  04a6               L5012:
4088                     ; 676 			BEGIN_WWDG;			
4090  04a6 357f50d2      	mov	_WWDG+1,#127
4093  04aa 35ff50d1      	mov	_WWDG,#255
4094                     ; 677 			CLEAR_WWDG;			
4097  04ae 357f50d1      	mov	_WWDG,#127
4098  04b2               L3212:
4100  04b2 20fe          	jra	L3212
4101  04b4               L1702:
4102                     ; 643 		case CAN_INITIAL:
4102                     ; 644 			CanWakeUp();
4104  04b4 8d8f018f      	callf	f_CanWakeUp
4106                     ; 645 			CanInit(CAN_MCR_ABOM | CAN_MCR_AWUM |CAN_MCR_NART);
4108  04b8 a670          	ld	a,#112
4109  04ba 8d000000      	callf	f_CanInit
4111                     ; 646 			CanInterruptRestore();
4113  04be 8d500250      	callf	f_CanInterruptRestore
4115                     ; 647 			CanBusWakeup();
4117  04c2 72175014      	bres	_GPIOE,#3
4118                     ; 648 			CanBusState=CAN_WAIT;
4121  04c6 35010000      	mov	_CanBusState,#1
4122                     ; 649 			break;
4124  04ca 2018          	jra	L1212
4125  04cc               L3702:
4126                     ; 659 		        CanBusState=CAN_RUNNING;
4128  04cc 35020000      	mov	_CanBusState,#2
4129                     ; 661 		    break;
4131  04d0 2012          	jra	L1212
4132  04d2               L7702:
4133                     ; 665 		case CAN_ACCOFF:
4133                     ; 666 			CanBusState=CAN_RUNNING;
4135  04d2 35020000      	mov	_CanBusState,#2
4136                     ; 667 			break;
4138  04d6 200c          	jra	L1212
4139  04d8               L1012:
4140                     ; 668 		case CAN_WAITSLEEP:
4140                     ; 669 			CanSleep();
4142  04d8 8d770177      	callf	f_CanSleep
4144                     ; 670 			CanBusSleep();
4146  04dc 72165014      	bset	_GPIOE,#3
4147                     ; 671 			CanBusState=CAN_SLEEP;	
4150  04e0 35040000      	mov	_CanBusState,#4
4151                     ; 672 			break;
4153  04e4               L1212:
4154                     ; 684 }
4157  04e4 87            	retf
4169                     	xdef	f_CANGetEmptyMegBox
4170                     	xdef	f_CanMsgTransmit
4171                     	xdef	f_Can_Main
4172                     	xdef	f_CanFlagAnalyse
4173                     	xdef	f_SendBraodcast
4174                     	xdef	f_SendSwitchState
4175                     	xdef	f_NodeRegister
4176                     	xdef	f_SendToCan
4177                     	xdef	f_ISR_Can_Rx
4178                     	xdef	f_ISR_Can_Tx
4179                     	xdef	f_Can_Store_Rcvd_Msg
4180                     	xdef	f_CanInterruptRestore
4181                     	xdef	f_CanInterruptDisable
4182                     	xdef	f_CanWakeUp
4183                     	xdef	f_Can_Wakeup_Enable
4184                     	xdef	f_CanSleep
4185                     	xdef	f_CanInit
4186                     	xref	_CanTxRxBuffer
4187                     	xref	_CanBusState
4188                     	xref	_CanPage
4189                     	xref	_UniqueID
4190                     	xref.b	c_x
4209                     	xref	d_jltab
4210                     	xref	d_ltor
4211                     	xref	d_lgadc
4212                     	xref	d_lglsh
4213                     	end
