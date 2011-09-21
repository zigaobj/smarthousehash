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
3170                     ; 366 void Can_Store_Rcvd_Msg(void)	//中断服务程序中执行
3170                     ; 367 {
3171                     	switch	.text
3172  0267               f_Can_Store_Rcvd_Msg:
3174  0267 5203          	subw	sp,#3
3175       00000003      OFST:	set	3
3178                     ; 369 	u8 *u8p =&CAN_PAGE_MDAR1;
3180  0269 ae542e        	ldw	x,#_CAN+14
3181  026c 1f01          	ldw	(OFST-2,sp),x
3182                     ; 371 	CAN.PSR = CAN_PS_FIFO; //进入接收数据FIFO页面
3184  026e 35075427      	mov	_CAN+7,#7
3185                     ; 372     CanTxRxBuffer.id =CAN_PAGE_MIDR1&0x1F;
3187  0272 c6542a        	ld	a,_CAN+10
3188  0275 a41f          	and	a,#31
3189  0277 c70003        	ld	_CanTxRxBuffer+3,a
3190  027a 4f            	clr	a
3191  027b c70002        	ld	_CanTxRxBuffer+2,a
3192  027e c70001        	ld	_CanTxRxBuffer+1,a
3193  0281 c70000        	ld	_CanTxRxBuffer,a
3194                     ; 373     CanTxRxBuffer.id <<=8; //移位计算更优
3196  0284 ae0000        	ldw	x,#_CanTxRxBuffer
3197  0287 a608          	ld	a,#8
3198  0289 8d000000      	callf	d_lglsh
3200                     ; 374     CanTxRxBuffer.id +=CAN_PAGE_MIDR2;
3202  028d c6542b        	ld	a,_CAN+11
3203  0290 ae0000        	ldw	x,#_CanTxRxBuffer
3204  0293 88            	push	a
3205  0294 8d000000      	callf	d_lgadc
3207  0298 84            	pop	a
3208                     ; 375     CanTxRxBuffer.id <<=8;
3210  0299 ae0000        	ldw	x,#_CanTxRxBuffer
3211  029c a608          	ld	a,#8
3212  029e 8d000000      	callf	d_lglsh
3214                     ; 376     CanTxRxBuffer.id +=CAN_PAGE_MIDR3;
3216  02a2 c6542c        	ld	a,_CAN+12
3217  02a5 ae0000        	ldw	x,#_CanTxRxBuffer
3218  02a8 88            	push	a
3219  02a9 8d000000      	callf	d_lgadc
3221  02ad 84            	pop	a
3222                     ; 377     CanTxRxBuffer.id <<=8;
3224  02ae ae0000        	ldw	x,#_CanTxRxBuffer
3225  02b1 a608          	ld	a,#8
3226  02b3 8d000000      	callf	d_lglsh
3228                     ; 378     CanTxRxBuffer.id +=CAN_PAGE_MIDR4;
3230  02b7 c6542d        	ld	a,_CAN+13
3231  02ba ae0000        	ldw	x,#_CanTxRxBuffer
3232  02bd 88            	push	a
3233  02be 8d000000      	callf	d_lgadc
3235  02c2 84            	pop	a
3236                     ; 379 	CanTxRxBuffer.dlc= CAN_PAGE_MDLCR; //此帧长度(字节数)
3238  02c3 5554290004    	mov	_CanTxRxBuffer+4,_CAN+9
3239                     ; 380 	for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
3241  02c8 0f03          	clr	(OFST+0,sp)
3243  02ca 2017          	jra	L5161
3244  02cc               L1161:
3245                     ; 382 		CanTxRxBuffer.data[idx]=u8p[idx];
3247  02cc 7b03          	ld	a,(OFST+0,sp)
3248  02ce 5f            	clrw	x
3249  02cf 97            	ld	xl,a
3250  02d0 89            	pushw	x
3251  02d1 7b03          	ld	a,(OFST+0,sp)
3252  02d3 97            	ld	xl,a
3253  02d4 7b04          	ld	a,(OFST+1,sp)
3254  02d6 1b05          	add	a,(OFST+2,sp)
3255  02d8 2401          	jrnc	L62
3256  02da 5c            	incw	x
3257  02db               L62:
3258  02db 02            	rlwa	x,a
3259  02dc f6            	ld	a,(x)
3260  02dd 85            	popw	x
3261  02de d70005        	ld	(_CanTxRxBuffer+5,x),a
3262                     ; 380 	for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
3264  02e1 0c03          	inc	(OFST+0,sp)
3265  02e3               L5161:
3268  02e3 c60004        	ld	a,_CanTxRxBuffer+4
3269  02e6 1103          	cp	a,(OFST+0,sp)
3270  02e8 22e2          	jrugt	L1161
3271                     ; 384     CanMsgAnalyze(&CanTxRxBuffer);
3273  02ea ae0000        	ldw	x,#_CanTxRxBuffer
3274  02ed 8d570357      	callf	L5531f_CanMsgAnalyze
3276                     ; 385 }
3279  02f1 5b03          	addw	sp,#3
3280  02f3 87            	retf
3313                     ; 395 void ISR_Can_Tx(void)
3313                     ; 396 {
3314                     	switch	.text
3315  02f4               f_ISR_Can_Tx:
3317  02f4 88            	push	a
3318       00000001      OFST:	set	1
3321                     ; 398     CanSavePg();
3323  02f5 5554270000    	mov	_CanPage,_CAN+7
3324                     ; 400     CAN.PSR =CAN_PS_CTRL;
3326  02fa 35065427      	mov	_CAN+7,#6
3327                     ; 401     if(CAN_PAGE_ESR)
3329  02fe 725d5428      	tnz	_CAN+8
3330  0302 2714          	jreq	L5361
3331                     ; 403         ErrorCode=CAN_PAGE_ESR;
3333  0304 c65428        	ld	a,_CAN+8
3334  0307 6b01          	ld	(OFST+0,sp),a
3335                     ; 404         if((CAN_PAGE_ESR&CAN_PAGE_ESR_LEC)!=0)
3337  0309 c65428        	ld	a,_CAN+8
3338  030c a570          	bcp	a,#112
3339  030e 2704          	jreq	L7361
3340                     ; 406             CAN_PAGE_ESR =0;//|=CAN_PAGE_ESR_LEC;
3342  0310 725f5428      	clr	_CAN+8
3343  0314               L7361:
3344                     ; 408         CAN.MSR |=CAN_MSR_ERRI;
3346  0314 72145421      	bset	_CAN+1,#2
3347  0318               L5361:
3348                     ; 410     CanRestorePg();
3350  0318 5500005427    	mov	_CAN+7,_CanPage
3351                     ; 411 }
3354  031d 84            	pop	a
3355  031e 87            	retf
3380                     ; 422 void ISR_Can_Rx(void)
3380                     ; 423 {
3381                     	switch	.text
3382  031f               f_ISR_Can_Rx:
3386                     ; 424 	CanSavePg();   
3388  031f 5554270000    	mov	_CanPage,_CAN+7
3389                     ; 426 	if (CAN.RFR & CAN_RFR_FOVR)
3391  0324 c65424        	ld	a,_CAN+4
3392  0327 a510          	bcp	a,#16
3393  0329 2706          	jreq	L1561
3394                     ; 428 		CAN.RFR |= CAN_RFR_FOVR;		/* clear the FIFO Overrun (FOVR) bit */
3396  032b 72185424      	bset	_CAN+4,#4
3398  032f 2019          	jra	L1661
3399  0331               L1561:
3400                     ; 430 	else if (CAN.RFR & CAN_RFR_FULL)
3402  0331 c65424        	ld	a,_CAN+4
3403  0334 a508          	bcp	a,#8
3404  0336 2712          	jreq	L1661
3405                     ; 432 		CAN.RFR |= CAN_RFR_FULL;		/* clear the FIFO full (FULL) bit */      
3407  0338 72165424      	bset	_CAN+4,#3
3408  033c 200c          	jra	L1661
3409  033e               L7561:
3410                     ; 436         Can_Store_Rcvd_Msg();
3412  033e 8d670267      	callf	f_Can_Store_Rcvd_Msg
3414                     ; 437         CAN.RFR |= CAN_RFR_RFOM; // Release mailbox
3416  0342 721a5424      	bset	_CAN+4,#5
3417                     ; 438 		CAN.RFR |= CAN_RFR_RFOM; //此语句要用2句,原因还没搞明白
3419  0346 721a5424      	bset	_CAN+4,#5
3420  034a               L1661:
3421                     ; 434 	while (CAN.RFR & CAN_RFR_FMP)	/* Check until FMP != 0 */
3423  034a c65424        	ld	a,_CAN+4
3424  034d a503          	bcp	a,#3
3425  034f 26ed          	jrne	L7561
3426                     ; 440 	CanRestorePg();
3428  0351 5500005427    	mov	_CAN+7,_CanPage
3429                     ; 441 }
3432  0356 87            	retf
3482                     .const:	section	.text
3483  0000               L7171:
3484  0000 0003          	dc.w	3
3485  0002 04010000      	dc.l	67174400
3486  0006 0373          	dc.w	L1761
3487  0008 04020000      	dc.l	67239936
3488  000c 0368          	dc.w	L5661
3489  000e 04030000      	dc.l	67305472
3490  0012 0371          	dc.w	L7661
3491  0014 03ce          	dc.w	L1271
3492                     ; 452 static void CanMsgAnalyze(CanMsgTypeDef *pCanMsg)
3492                     ; 453 {
3493                     	switch	.text
3494  0357               L5531f_CanMsgAnalyze:
3496  0357 89            	pushw	x
3497  0358 88            	push	a
3498       00000001      OFST:	set	1
3501                     ; 456     BoolT FlagCANDataOK=TRUE;
3503  0359 a601          	ld	a,#1
3504  035b 6b01          	ld	(OFST+0,sp),a
3505                     ; 459     switch(pCanMsg->id)
3507  035d 8d000000      	callf	d_ltor
3510  0361 ae0000        	ldw	x,#L7171
3511  0364 8d000000      	callf	d_jltab
3512  0368               L5661:
3513                     ; 464             LED=pCanMsg->data[0];
3515  0368 1e02          	ldw	x,(OFST+1,sp)
3516  036a e605          	ld	a,(5,x)
3517  036c c7500a        	ld	_GPIOC,a
3518                     ; 466             break;
3520  036f 205d          	jra	L1271
3521  0371               L7661:
3522                     ; 474             break;
3524  0371 205b          	jra	L1271
3525  0373               L1761:
3526                     ; 491             if(UniqueID[0]==pCanMsg->data[0]&&UniqueID[1]==pCanMsg->data[1]
3526                     ; 492              &&UniqueID[2]==pCanMsg->data[2]&&UniqueID[3]==pCanMsg->data[3]
3526                     ; 493              &&UniqueID[4]==pCanMsg->data[4]&&UniqueID[5]==pCanMsg->data[5]
3526                     ; 494              &&UniqueID[6]==pCanMsg->data[6]&&UniqueID[7]==pCanMsg->data[7]
3526                     ; 495             )
3528  0373 72c60000      	ld	a,[_UniqueID.w]
3529  0377 1e02          	ldw	x,(OFST+1,sp)
3530  0379 e105          	cp	a,(5,x)
3531  037b 2651          	jrne	L1271
3533  037d ce0000        	ldw	x,_UniqueID
3534  0380 e601          	ld	a,(1,x)
3535  0382 1e02          	ldw	x,(OFST+1,sp)
3536  0384 e106          	cp	a,(6,x)
3537  0386 2646          	jrne	L1271
3539  0388 ce0000        	ldw	x,_UniqueID
3540  038b e602          	ld	a,(2,x)
3541  038d 1e02          	ldw	x,(OFST+1,sp)
3542  038f e107          	cp	a,(7,x)
3543  0391 263b          	jrne	L1271
3545  0393 ce0000        	ldw	x,_UniqueID
3546  0396 e603          	ld	a,(3,x)
3547  0398 1e02          	ldw	x,(OFST+1,sp)
3548  039a e108          	cp	a,(8,x)
3549  039c 2630          	jrne	L1271
3551  039e ce0000        	ldw	x,_UniqueID
3552  03a1 e604          	ld	a,(4,x)
3553  03a3 1e02          	ldw	x,(OFST+1,sp)
3554  03a5 e109          	cp	a,(9,x)
3555  03a7 2625          	jrne	L1271
3557  03a9 ce0000        	ldw	x,_UniqueID
3558  03ac e605          	ld	a,(5,x)
3559  03ae 1e02          	ldw	x,(OFST+1,sp)
3560  03b0 e10a          	cp	a,(10,x)
3561  03b2 261a          	jrne	L1271
3563  03b4 ce0000        	ldw	x,_UniqueID
3564  03b7 e606          	ld	a,(6,x)
3565  03b9 1e02          	ldw	x,(OFST+1,sp)
3566  03bb e10b          	cp	a,(11,x)
3567  03bd 260f          	jrne	L1271
3569  03bf ce0000        	ldw	x,_UniqueID
3570  03c2 e607          	ld	a,(7,x)
3571  03c4 1e02          	ldw	x,(OFST+1,sp)
3572  03c6 e10c          	cp	a,(12,x)
3573  03c8 2604          	jrne	L1271
3574                     ; 497                 NODE_REGISTER_FLAG=1;
3576  03ca 72120000      	bset	_NodeState,#1
3577  03ce               L1271:
3578                     ; 503     CanFlagAnalyse();
3580  03ce 8dd503d5      	callf	f_CanFlagAnalyse
3582                     ; 504 }
3585  03d2 5b03          	addw	sp,#3
3586  03d4 87            	retf
3608                     ; 515 void CanFlagAnalyse(void)
3608                     ; 516 {
3609                     	switch	.text
3610  03d5               f_CanFlagAnalyse:
3614                     ; 517 }
3617  03d5 87            	retf
3641                     ; 527 BoolT CANGetEmptyMegBox(void)
3641                     ; 528 {
3642                     	switch	.text
3643  03d6               f_CANGetEmptyMegBox:
3647                     ; 529     if(CAN.TPR &CAN_TPR_TME0)
3649  03d6 c65423        	ld	a,_CAN+3
3650  03d9 a504          	bcp	a,#4
3651  03db 2706          	jreq	L5471
3652                     ; 531         CAN.PSR =CAN_PS_TXMB0;
3654  03dd 725f5427      	clr	_CAN+7
3656  03e1 2018          	jra	L7471
3657  03e3               L5471:
3658                     ; 533     else if(CAN.TPR &CAN_TPR_TME1)
3660  03e3 c65423        	ld	a,_CAN+3
3661  03e6 a508          	bcp	a,#8
3662  03e8 2706          	jreq	L1571
3663                     ; 535         CAN.PSR =CAN_PS_TXMB1;
3665  03ea 35015427      	mov	_CAN+7,#1
3667  03ee 200b          	jra	L7471
3668  03f0               L1571:
3669                     ; 537     else if(CAN.TPR &CAN_TPR_TME2)
3671  03f0 c65423        	ld	a,_CAN+3
3672  03f3 a510          	bcp	a,#16
3673  03f5 2707          	jreq	L5571
3674                     ; 539         CAN.PSR =CAN_PS_TXMB2;
3676  03f7 35055427      	mov	_CAN+7,#5
3678  03fb               L7471:
3679                     ; 545     return TRUE;
3681  03fb a601          	ld	a,#1
3684  03fd 87            	retf
3685  03fe               L5571:
3686                     ; 543         return FALSE;
3688  03fe 4f            	clr	a
3691  03ff 87            	retf
3728                     ; 556 void SendToCan(CanMsgTypeDef *pCanMsg)
3728                     ; 557 {
3729                     	switch	.text
3730  0400               f_SendToCan:
3734                     ; 558     CanMsgTransmit(pCanMsg);
3736  0400 8da201a2      	callf	f_CanMsgTransmit
3738                     ; 559 }
3741  0404 87            	retf
3777                     ; 569 void NodeRegister(void)
3777                     ; 570 {
3778                     	switch	.text
3779  0405               f_NodeRegister:
3781  0405 520d          	subw	sp,#13
3782       0000000d      OFST:	set	13
3785                     ; 572     CanBuffer.id =CANID_NODEREGISTER;
3787  0407 ae0000        	ldw	x,#0
3788  040a 1f03          	ldw	(OFST-10,sp),x
3789  040c ae0401        	ldw	x,#1025
3790  040f 1f01          	ldw	(OFST-12,sp),x
3791                     ; 573     CanBuffer.dlc =8;
3793  0411 a608          	ld	a,#8
3794  0413 6b05          	ld	(OFST-8,sp),a
3795                     ; 574     CanBuffer.data[0]=UniqueID[0];
3797  0415 72c60000      	ld	a,[_UniqueID.w]
3798  0419 6b06          	ld	(OFST-7,sp),a
3799                     ; 575     CanBuffer.data[1]=UniqueID[1];
3801  041b ce0000        	ldw	x,_UniqueID
3802  041e e601          	ld	a,(1,x)
3803  0420 6b07          	ld	(OFST-6,sp),a
3804                     ; 576     CanBuffer.data[2]=UniqueID[2];
3806  0422 ce0000        	ldw	x,_UniqueID
3807  0425 e602          	ld	a,(2,x)
3808  0427 6b08          	ld	(OFST-5,sp),a
3809                     ; 577     CanBuffer.data[3]=UniqueID[3];
3811  0429 ce0000        	ldw	x,_UniqueID
3812  042c e603          	ld	a,(3,x)
3813  042e 6b09          	ld	(OFST-4,sp),a
3814                     ; 578     CanBuffer.data[4]=UniqueID[4];
3816  0430 ce0000        	ldw	x,_UniqueID
3817  0433 e604          	ld	a,(4,x)
3818  0435 6b0a          	ld	(OFST-3,sp),a
3819                     ; 579     CanBuffer.data[5]=UniqueID[5];
3821  0437 ce0000        	ldw	x,_UniqueID
3822  043a e605          	ld	a,(5,x)
3823  043c 6b0b          	ld	(OFST-2,sp),a
3824                     ; 580     CanBuffer.data[6]=UniqueID[6];
3826  043e ce0000        	ldw	x,_UniqueID
3827  0441 e606          	ld	a,(6,x)
3828  0443 6b0c          	ld	(OFST-1,sp),a
3829                     ; 581     CanBuffer.data[7]=UniqueID[7];
3831  0445 ce0000        	ldw	x,_UniqueID
3832  0448 e607          	ld	a,(7,x)
3833  044a 6b0d          	ld	(OFST+0,sp),a
3834                     ; 582     SendToCan(&CanBuffer);
3836  044c 96            	ldw	x,sp
3837  044d 1c0001        	addw	x,#OFST-12
3838  0450 8d000400      	callf	f_SendToCan
3840                     ; 583 }
3843  0454 5b0d          	addw	sp,#13
3844  0456 87            	retf
3886                     ; 593 void SendSwitchState(u8 Switch)
3886                     ; 594 {
3887                     	switch	.text
3888  0457               f_SendSwitchState:
3890  0457 88            	push	a
3891  0458 520d          	subw	sp,#13
3892       0000000d      OFST:	set	13
3895                     ; 596     CanBuffer.id =CANID_SWITCHSTATE;
3897  045a ae0000        	ldw	x,#0
3898  045d 1f03          	ldw	(OFST-10,sp),x
3899  045f ae0403        	ldw	x,#1027
3900  0462 1f01          	ldw	(OFST-12,sp),x
3901                     ; 597     CanBuffer.dlc =1;
3903  0464 a601          	ld	a,#1
3904  0466 6b05          	ld	(OFST-8,sp),a
3905                     ; 598     CanBuffer.data[0]=Switch;
3907  0468 7b0e          	ld	a,(OFST+1,sp)
3908  046a 6b06          	ld	(OFST-7,sp),a
3909                     ; 599     SendToCan(&CanBuffer);
3911  046c 96            	ldw	x,sp
3912  046d 1c0001        	addw	x,#OFST-12
3913  0470 8d000400      	callf	f_SendToCan
3915                     ; 600 }
3918  0474 5b0e          	addw	sp,#14
3919  0476 87            	retf
3961                     ; 610 void SendBraodcast(u8 Broadcast)
3961                     ; 611 {
3962                     	switch	.text
3963  0477               f_SendBraodcast:
3965  0477 88            	push	a
3966  0478 520d          	subw	sp,#13
3967       0000000d      OFST:	set	13
3970                     ; 613     CanBuffer.id =CANID_BROADCAST;
3972  047a ae0000        	ldw	x,#0
3973  047d 1f03          	ldw	(OFST-10,sp),x
3974  047f ae0402        	ldw	x,#1026
3975  0482 1f01          	ldw	(OFST-12,sp),x
3976                     ; 614     CanBuffer.dlc =1;
3978  0484 a601          	ld	a,#1
3979  0486 6b05          	ld	(OFST-8,sp),a
3980                     ; 615     CanBuffer.data[0]=Broadcast;
3982  0488 7b0e          	ld	a,(OFST+1,sp)
3983  048a 6b06          	ld	(OFST-7,sp),a
3984                     ; 616     SendToCan(&CanBuffer);
3986  048c 96            	ldw	x,sp
3987  048d 1c0001        	addw	x,#OFST-12
3988  0490 8d000400      	callf	f_SendToCan
3990                     ; 617 }
3993  0494 5b0e          	addw	sp,#14
3994  0496 87            	retf
4025                     ; 627 void Can_Main(void)
4025                     ; 628 {
4026                     	switch	.text
4027  0497               f_Can_Main:
4031                     ; 629 	switch(CanBusState)
4033  0497 c60000        	ld	a,_CanBusState
4035                     ; 665 			CLEAR_WWDG;			
4036  049a 4d            	tnz	a
4037  049b 271d          	jreq	L7502
4038  049d 4a            	dec	a
4039  049e 2732          	jreq	L1602
4040  04a0 4a            	dec	a
4041  04a1 2754          	jreq	L7012
4042  04a3 4a            	dec	a
4043  04a4 2745          	jreq	L7602
4044  04a6 4a            	dec	a
4045  04a7 274e          	jreq	L7012
4046  04a9 4a            	dec	a
4047  04aa 2739          	jreq	L5602
4048  04ac               L3702:
4049                     ; 664 			BEGIN_WWDG;			
4051  04ac 357f50d2      	mov	_WWDG+1,#127
4054  04b0 35ff50d1      	mov	_WWDG,#255
4055                     ; 665 			CLEAR_WWDG;			
4058  04b4 357f50d1      	mov	_WWDG,#127
4059  04b8               L5112:
4061  04b8 20fe          	jra	L5112
4062  04ba               L7502:
4063                     ; 631 		case CAN_INITIAL:
4063                     ; 632 			CanWakeUp();
4065  04ba 8d8f018f      	callf	f_CanWakeUp
4067                     ; 633 			CanInit(CAN_MCR_ABOM | CAN_MCR_AWUM |CAN_MCR_NART);
4069  04be a670          	ld	a,#112
4070  04c0 8d000000      	callf	f_CanInit
4072                     ; 634 			CanInterruptRestore();
4074  04c4 8d500250      	callf	f_CanInterruptRestore
4076                     ; 635 			CanBusWakeup();
4078  04c8 72175014      	bres	_GPIOE,#3
4079                     ; 636 			CanBusState=CAN_WAIT;
4082  04cc 35010000      	mov	_CanBusState,#1
4083                     ; 637 			break;
4085  04d0 2025          	jra	L7012
4086  04d2               L1602:
4087                     ; 638 		case CAN_WAIT:
4087                     ; 639 #if HASH_MODEL==HS_0002S
4087                     ; 640 		    if(0==NODE_REGISTER_FLAG)
4089  04d2 c60000        	ld	a,_NodeState
4090  04d5 a502          	bcp	a,#2
4091  04d7 2606          	jrne	L1112
4092                     ; 642     		    NodeRegister();
4094  04d9 8d050405      	callf	f_NodeRegister
4097  04dd 2018          	jra	L7012
4098  04df               L1112:
4099                     ; 647 		        CanBusState=CAN_RUNNING;
4101  04df 35020000      	mov	_CanBusState,#2
4102  04e3 2012          	jra	L7012
4103  04e5               L5602:
4104                     ; 653 		case CAN_ACCOFF:
4104                     ; 654 			CanBusState=CAN_RUNNING;
4106  04e5 35020000      	mov	_CanBusState,#2
4107                     ; 655 			break;
4109  04e9 200c          	jra	L7012
4110  04eb               L7602:
4111                     ; 656 		case CAN_WAITSLEEP:
4111                     ; 657 			CanSleep();
4113  04eb 8d770177      	callf	f_CanSleep
4115                     ; 658 			CanBusSleep();
4117  04ef 72165014      	bset	_GPIOE,#3
4118                     ; 659 			CanBusState=CAN_SLEEP;	
4121  04f3 35040000      	mov	_CanBusState,#4
4122                     ; 660 			break;
4124  04f7               L7012:
4125                     ; 672 }
4128  04f7 87            	retf
4140                     	xdef	f_CANGetEmptyMegBox
4141                     	xdef	f_CanMsgTransmit
4142                     	xdef	f_Can_Main
4143                     	xdef	f_CanFlagAnalyse
4144                     	xdef	f_SendBraodcast
4145                     	xdef	f_SendSwitchState
4146                     	xdef	f_NodeRegister
4147                     	xdef	f_SendToCan
4148                     	xdef	f_ISR_Can_Rx
4149                     	xdef	f_ISR_Can_Tx
4150                     	xdef	f_Can_Store_Rcvd_Msg
4151                     	xdef	f_CanInterruptRestore
4152                     	xdef	f_CanInterruptDisable
4153                     	xdef	f_CanWakeUp
4154                     	xdef	f_Can_Wakeup_Enable
4155                     	xdef	f_CanSleep
4156                     	xdef	f_CanInit
4157                     	xref	_CanTxRxBuffer
4158                     	xref	_CanBusState
4159                     	xref	_NodeState
4160                     	xref	_CanPage
4161                     	xref	_UniqueID
4162                     	xref.b	c_x
4181                     	xref	d_jltab
4182                     	xref	d_ltor
4183                     	xref	d_lgadc
4184                     	xref	d_lglsh
4185                     	end
