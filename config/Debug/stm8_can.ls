   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2319                     .const:	section	.text
2320  0000               _UniqueID_Temp:
2321  0000 51            	dc.b	81
2322  0001 02            	dc.b	2
2323  0002 03            	dc.b	3
2324  0003 04            	dc.b	4
2325  0004 05            	dc.b	5
2326  0005 06            	dc.b	6
2327  0006 07            	dc.b	7
2328  0007 08            	dc.b	8
2370                     ; 19 void CanInit(u8 CAN_MasterCtrlReg)
2370                     ; 20 {
2371                     	switch	.text
2372  0000               f_CanInit:
2374  0000 88            	push	a
2375       00000000      OFST:	set	0
2378                     ; 21     CLK.PCKENR2|=CLK_PCKENR2_CAN; // 开启CAN时钟，stm8 的外设时钟可控
2380  0001 721e50ca      	bset	_CLK+10,#7
2381                     ; 23     CAN.PSR =CAN_PS_TXMB0;
2383  0005 725f5427      	clr	_CAN+7
2384                     ; 24     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;
2386  0009 72125428      	bset	_CAN+8,#1
2387                     ; 26     CAN.PSR =CAN_PS_TXMB1;
2389  000d 35015427      	mov	_CAN+7,#1
2390                     ; 27     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;
2392  0011 72125428      	bset	_CAN+8,#1
2393                     ; 29     CAN.PSR =CAN_PS_TXMB2;
2395  0015 35055427      	mov	_CAN+7,#5
2396                     ; 30     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;
2398  0019 72125428      	bset	_CAN+8,#1
2399                     ; 32     CAN.MCR |=CAN_MCR_INRQ; // Request initialisation
2401  001d 72105420      	bset	_CAN,#0
2403  0021 2001          	jra	L3041
2404  0023               L1041:
2405                     ; 35         _asm("nop");
2408  0023 9d            nop
2410  0024               L3041:
2411                     ; 33     while(!(CAN.MSR &CAN_MSR_INAK)) // Wait until acknowledged
2413  0024 c65421        	ld	a,_CAN+1
2414  0027 a501          	bcp	a,#1
2415  0029 27f8          	jreq	L1041
2416                     ; 40     CAN.TSR |=CAN_TSR_RQCP0 |CAN_TSR_RQCP1 |CAN_TSR_RQCP2;
2418  002b c65422        	ld	a,_CAN+2
2419  002e aa07          	or	a,#7
2420  0030 c75422        	ld	_CAN+2,a
2422  0033 2004          	jra	L1141
2423  0035               L7041:
2424                     ; 45         CAN.RFR =CAN_RFR_RFOM; //释放一级FIFO
2426  0035 35205424      	mov	_CAN+4,#32
2427  0039               L1141:
2428                     ; 43     while(CAN.RFR &CAN_RFR_FMP)
2430  0039 c65424        	ld	a,_CAN+4
2431  003c a503          	bcp	a,#3
2432  003e 26f5          	jrne	L7041
2433                     ; 49     CAN.RFR |=CAN_RFR_FOVR; 
2435  0040 72185424      	bset	_CAN+4,#4
2436                     ; 52 	CAN.MSR =CAN_MSR_WKUI;
2438  0044 35085421      	mov	_CAN+1,#8
2439                     ; 55 	CAN.MCR |= CAN_MasterCtrlReg;
2441  0048 c65420        	ld	a,_CAN
2442  004b 1a01          	or	a,(OFST+1,sp)
2443  004d c75420        	ld	_CAN,a
2444                     ; 59 	CAN.PSR =CAN_PS_CTRL;	
2446  0050 35065427      	mov	_CAN+7,#6
2447                     ; 60 	CAN_PAGE_FCR1 = 0x00;
2449  0054 725f5432      	clr	_CAN+18
2450                     ; 61 	CAN_PAGE_FCR2 = 0x00;
2452  0058 725f5433      	clr	_CAN+19
2453                     ; 62 	CAN_PAGE_FCR3 = 0x00;
2455  005c 725f5434      	clr	_CAN+20
2456                     ; 65 	CAN_PAGE_FCR1 = CAN_FCR1_FILTER0_SCALE_1_32BIT;
2458  0060 35065432      	mov	_CAN+18,#6
2459                     ; 80 	CAN_PAGE_FMR1 = 0x00;	/* Filter 0, 1, 2, 3 Low/High Register in Mask mode */
2461  0064 725f5430      	clr	_CAN+16
2462                     ; 81 	CAN_PAGE_FMR2 = 0x00;	/* Filter 4, 5 Low/High Register in Mask mode */
2464  0068 725f5431      	clr	_CAN+17
2465                     ; 103 	CAN.PSR = CAN_PS_FILTER01;
2467  006c 35025427      	mov	_CAN+7,#2
2468                     ; 105 	CAN_PAGE_FLR1 = 0x00;
2470  0070 725f5428      	clr	_CAN+8
2471                     ; 106 	CAN_PAGE_FLR2 = 0x00;
2473  0074 725f5429      	clr	_CAN+9
2474                     ; 107 	CAN_PAGE_FLR3 = 0x00;
2476  0078 725f542a      	clr	_CAN+10
2477                     ; 108 	CAN_PAGE_FLR4 = 0x00;
2479  007c 725f542b      	clr	_CAN+11
2480                     ; 109 	CAN_PAGE_FLR5 = 0x00;
2482  0080 725f542c      	clr	_CAN+12
2483                     ; 110 	CAN_PAGE_FLR6 = 0x00;
2485  0084 725f542d      	clr	_CAN+13
2486                     ; 111 	CAN_PAGE_FLR7 = 0x00;
2488  0088 725f542e      	clr	_CAN+14
2489                     ; 112 	CAN_PAGE_FLR8 = 0x00;
2491  008c 725f542f      	clr	_CAN+15
2492                     ; 114 	CAN_PAGE_FHR1 = 0x00;
2494  0090 725f5430      	clr	_CAN+16
2495                     ; 115 	CAN_PAGE_FHR2 = 0x00;
2497  0094 725f5431      	clr	_CAN+17
2498                     ; 116 	CAN_PAGE_FHR3 = 0x00;
2500  0098 725f5432      	clr	_CAN+18
2501                     ; 117 	CAN_PAGE_FHR4 = 0x00;
2503  009c 725f5433      	clr	_CAN+19
2504                     ; 118 	CAN_PAGE_FHR5 = 0x00;
2506  00a0 725f5434      	clr	_CAN+20
2507                     ; 119 	CAN_PAGE_FHR6 = 0x00;
2509  00a4 725f5435      	clr	_CAN+21
2510                     ; 120 	CAN_PAGE_FHR7 = 0x00;
2512  00a8 725f5436      	clr	_CAN+22
2513                     ; 121 	CAN_PAGE_FHR8 = 0x00;
2515  00ac 725f5437      	clr	_CAN+23
2516                     ; 124 	CAN.PSR = CAN_PS_FILTER23;
2518  00b0 35035427      	mov	_CAN+7,#3
2519                     ; 126 	CAN_PAGE_FLR1 = 0x00;
2521  00b4 725f5428      	clr	_CAN+8
2522                     ; 127 	CAN_PAGE_FLR2 = 0x00;
2524  00b8 725f5429      	clr	_CAN+9
2525                     ; 128 	CAN_PAGE_FLR3 = 0x00;
2527  00bc 725f542a      	clr	_CAN+10
2528                     ; 129 	CAN_PAGE_FLR4 = 0x00;
2530  00c0 725f542b      	clr	_CAN+11
2531                     ; 130 	CAN_PAGE_FLR5 = 0x00;
2533  00c4 725f542c      	clr	_CAN+12
2534                     ; 131 	CAN_PAGE_FLR6 = 0x00;
2536  00c8 725f542d      	clr	_CAN+13
2537                     ; 132 	CAN_PAGE_FLR7 = 0x00;
2539  00cc 725f542e      	clr	_CAN+14
2540                     ; 133 	CAN_PAGE_FLR8 = 0x00;
2542  00d0 725f542f      	clr	_CAN+15
2543                     ; 135 	CAN_PAGE_FHR1 = 0x00;
2545  00d4 725f5430      	clr	_CAN+16
2546                     ; 136 	CAN_PAGE_FHR2 = 0x00;
2548  00d8 725f5431      	clr	_CAN+17
2549                     ; 137 	CAN_PAGE_FHR3 = 0x00;
2551  00dc 725f5432      	clr	_CAN+18
2552                     ; 138 	CAN_PAGE_FHR4 = 0x00;
2554  00e0 725f5433      	clr	_CAN+19
2555                     ; 139 	CAN_PAGE_FHR5 = 0x00;
2557  00e4 725f5434      	clr	_CAN+20
2558                     ; 140 	CAN_PAGE_FHR6 = 0x00;
2560  00e8 725f5435      	clr	_CAN+21
2561                     ; 141 	CAN_PAGE_FHR7 = 0x00;
2563  00ec 725f5436      	clr	_CAN+22
2564                     ; 142 	CAN_PAGE_FHR8 = 0x00;
2566  00f0 725f5437      	clr	_CAN+23
2567                     ; 145 	CAN.PSR = CAN_PS_FILTER45;
2569  00f4 35045427      	mov	_CAN+7,#4
2570                     ; 147 	CAN_PAGE_FLR1 = 0xff;
2572  00f8 35ff5428      	mov	_CAN+8,#255
2573                     ; 148 	CAN_PAGE_FLR2 = 0xff;
2575  00fc 35ff5429      	mov	_CAN+9,#255
2576                     ; 149 	CAN_PAGE_FLR3 = 0xff;
2578  0100 35ff542a      	mov	_CAN+10,#255
2579                     ; 150 	CAN_PAGE_FLR4 = 0xff;
2581  0104 35ff542b      	mov	_CAN+11,#255
2582                     ; 151 	CAN_PAGE_FLR5 = 0xff;
2584  0108 35ff542c      	mov	_CAN+12,#255
2585                     ; 152 	CAN_PAGE_FLR6 = 0xff;
2587  010c 35ff542d      	mov	_CAN+13,#255
2588                     ; 153 	CAN_PAGE_FLR7 = 0xff;
2590  0110 35ff542e      	mov	_CAN+14,#255
2591                     ; 154 	CAN_PAGE_FLR8 = 0xff;
2593  0114 35ff542f      	mov	_CAN+15,#255
2594                     ; 156 	CAN_PAGE_FHR1 = 0xff;
2596  0118 35ff5430      	mov	_CAN+16,#255
2597                     ; 157 	CAN_PAGE_FHR2 = 0xff;
2599  011c 35ff5431      	mov	_CAN+17,#255
2600                     ; 158 	CAN_PAGE_FHR3 = 0xff;
2602  0120 35ff5432      	mov	_CAN+18,#255
2603                     ; 159 	CAN_PAGE_FHR4 = 0xff;
2605  0124 35ff5433      	mov	_CAN+19,#255
2606                     ; 160 	CAN_PAGE_FHR5 = 0xff;
2608  0128 35ff5434      	mov	_CAN+20,#255
2609                     ; 161 	CAN_PAGE_FHR6 = 0xff;
2611  012c 35ff5435      	mov	_CAN+21,#255
2612                     ; 162 	CAN_PAGE_FHR7 = 0xff;
2614  0130 35ff5436      	mov	_CAN+22,#255
2615                     ; 163 	CAN_PAGE_FHR8 = 0xff;
2617  0134 35ff5437      	mov	_CAN+23,#255
2618                     ; 166 	CAN.PSR = CAN_PS_CTRL;	
2620  0138 35065427      	mov	_CAN+7,#6
2621                     ; 167 	CAN_PAGE_FCR1 |= CAN_FCR1_FILTER0_ACTIVE;	/* Filter 0 active */
2623  013c 72105432      	bset	_CAN+18,#0
2624                     ; 175 	CAN.PSR =CAN_PS_CTRL;
2626  0140 35065427      	mov	_CAN+7,#6
2627                     ; 176 	CAN_PAGE_BTR1 =(CAN_PAGE_BTR1_BRP&(CAN_PAGE_BTR1_BRP_RESET_VALUE-1))
2627                     ; 177 	              |(CAN_PAGE_BTR1_SJW&((CAN_PAGE_BTR1_SJW_RESET_VALUE-1)<<6));		// see can.h for modification of
2629  0144 359d542c      	mov	_CAN+12,#157
2630                     ; 178 	CAN_PAGE_BTR2 =(CAN_PAGE_BTR2_BS1&(CAN_PAGE_BTR2_BS1_RESET_VALUE-1)) 	        // bit timing parameters.
2630                     ; 179 	              |(CAN_PAGE_BTR2_BS2&((CAN_PAGE_BTR2_BS2_RESET_VALUE-1)<<4))
2630                     ; 180 	               |CAN_PAGE_BTR2_CLKS;
2632  0148 35a3542d      	mov	_CAN+13,#163
2633                     ; 185 	CAN.DGR |= CAN_DGR_TXM2E;	/* enable 3th Tx mailboxe */ 
2635  014c 72185426      	bset	_CAN+6,#4
2636                     ; 187 	CAN.MCR &= ~CAN_MCR_INRQ;	/* Leave the Init mode */
2638  0150 72115420      	bres	_CAN,#0
2640  0154 2001          	jra	L7141
2641  0156               L5141:
2642                     ; 190 		_asm("nop");
2645  0156 9d            nop
2647  0157               L7141:
2648                     ; 188 	while ((CAN.MSR &CAN_MSR_INAK))	/* Wait until acknowledged */ 
2650  0157 c65421        	ld	a,_CAN+1
2651  015a a501          	bcp	a,#1
2652  015c 26f8          	jrne	L5141
2653                     ; 193 }
2656  015e 84            	pop	a
2657  015f 87            	retf
2681                     ; 202 void Can_Wakeup_Enable(void)
2681                     ; 203 {
2682                     	switch	.text
2683  0160               f_Can_Wakeup_Enable:
2687                     ; 204 	CanSavePg();
2689  0160 5554270000    	mov	_CanPage,_CAN+7
2690                     ; 206 	CAN.IER = CAN_IER_WKUIE | /* Wake-up Interrupt */
2690                     ; 207 			  CAN_IER_FOVIE | /* FIFO overrun Interrupt */
2690                     ; 208 			  CAN_IER_FFIE  | /* FIFO Full Interrupt */
2690                     ; 209 			  CAN_IER_FMPIE | /* FIFO Message Pending Interrupt */
2690                     ; 210 			  CAN_IER_TMEIE;  /* Transmit Mailbox Empty Interrupt */
2692  0165 358f5425      	mov	_CAN+5,#143
2693                     ; 212 	CAN.PSR = CAN_PS_CTRL;
2695  0169 35065427      	mov	_CAN+7,#6
2696                     ; 213 	CAN_PAGE_EIER = CAN_PAGE_EIER_ERRIE|	/* Error Interrupt */
2696                     ; 214 				    CAN_PAGE_EIER_LECIE|	/* Last Error Code Interrupt */
2696                     ; 215 				    CAN_PAGE_EIER_BOFIE|	/* Bus-Off Interrupt */
2696                     ; 216 				    CAN_PAGE_EIER_EPVIE|	/* Error Passive Interrupt */
2696                     ; 217 				    CAN_PAGE_EIER_EWGIE;	/* Error Warning Interrupt */
2698  016d 35975429      	mov	_CAN+9,#151
2699                     ; 219 	CanRestorePg();
2701  0171 5500005427    	mov	_CAN+7,_CanPage
2702                     ; 220 }
2705  0176 87            	retf
2730                     ; 229 void CanSleep(void)
2730                     ; 230 {
2731                     	switch	.text
2732  0177               f_CanSleep:
2736                     ; 231     CanInit(CAN_MCR_AWUM);
2738  0177 a620          	ld	a,#32
2739  0179 8d000000      	callf	f_CanInit
2741                     ; 232     Can_Wakeup_Enable();
2743  017d 8d600160      	callf	f_Can_Wakeup_Enable
2746  0181 2004          	jra	L5441
2747  0183               L3441:
2748                     ; 238         CAN.MCR |= CAN_MCR_SLEEP;		
2750  0183 72125420      	bset	_CAN,#1
2751  0187               L5441:
2752                     ; 235     while(!(CAN.MSR &CAN_MSR_SLAK))
2754  0187 c65421        	ld	a,_CAN+1
2755  018a a502          	bcp	a,#2
2756  018c 27f5          	jreq	L3441
2757                     ; 240 }
2760  018e 87            	retf
2785                     ; 249 void CanWakeUp(void)
2785                     ; 250 {
2786                     	switch	.text
2787  018f               f_CanWakeUp:
2791                     ; 251 	CanBusWakeup();
2793  018f 72175014      	bres	_GPIOE,#3
2794                     ; 254 	CAN.MCR &= ~CAN_MCR_SLEEP;	
2797  0193 72135420      	bres	_CAN,#1
2799  0197 2001          	jra	L3641
2800  0199               L1641:
2801                     ; 259         _asm("nop");
2804  0199 9d            nop
2806  019a               L3641:
2807                     ; 257 	while(CAN.MSR & CAN_MSR_SLAK)
2809  019a c65421        	ld	a,_CAN+1
2810  019d a502          	bcp	a,#2
2811  019f 26f8          	jrne	L1641
2812                     ; 261 }
2815  01a1 87            	retf
2911                     ; 276 BoolT CanMsgTransmit(CanMsgTypeDef *pCanMsg)
2911                     ; 277 {
2912                     	switch	.text
2913  01a2               f_CanMsgTransmit:
2915  01a2 89            	pushw	x
2916  01a3 88            	push	a
2917       00000001      OFST:	set	1
2920                     ; 280 	if(CAN.TPR & CAN_TPR_TME0)			/* Mailbox 1 empty ? */
2922  01a4 c65423        	ld	a,_CAN+3
2923  01a7 a504          	bcp	a,#4
2924  01a9 270a          	jreq	L5351
2925                     ; 282 		CAN.PSR = CAN_PS_TXMB0;
2927  01ab 725f5427      	clr	_CAN+7
2928                     ; 283 		MailboxNumber = 1;
2930  01af a601          	ld	a,#1
2931  01b1 6b01          	ld	(OFST+0,sp),a
2933  01b3 2020          	jra	L7351
2934  01b5               L5351:
2935                     ; 285 	else if(CAN.TPR & CAN_TPR_TME1)	/* Mailbox 2 empty ? */
2937  01b5 c65423        	ld	a,_CAN+3
2938  01b8 a508          	bcp	a,#8
2939  01ba 270a          	jreq	L1451
2940                     ; 287 		CAN.PSR = CAN_PS_TXMB1;
2942  01bc 35015427      	mov	_CAN+7,#1
2943                     ; 288 		MailboxNumber = 2;		
2945  01c0 a602          	ld	a,#2
2946  01c2 6b01          	ld	(OFST+0,sp),a
2948  01c4 200f          	jra	L7351
2949  01c6               L1451:
2950                     ; 290 	else if(CAN.TPR & CAN_TPR_TME2)	/* Mailbox 3 empty ? */
2952  01c6 c65423        	ld	a,_CAN+3
2953  01c9 a510          	bcp	a,#16
2954  01cb 2768          	jreq	L5451
2955                     ; 292 		CAN.PSR = CAN_PS_TXMB2;
2957  01cd 35055427      	mov	_CAN+7,#5
2958                     ; 293 		MailboxNumber = 3;		
2960  01d1 a603          	ld	a,#3
2961  01d3 6b01          	ld	(OFST+0,sp),a
2963  01d5               L7351:
2964                     ; 302     CAN_PAGE_MDLCR = pCanMsg->dlc;
2966  01d5 1e02          	ldw	x,(OFST+1,sp)
2967  01d7 e604          	ld	a,(4,x)
2968  01d9 c75429        	ld	_CAN+9,a
2969                     ; 304     *((u32*)&CAN_PAGE_MIDR1)=pCanMsg->id;
2971  01dc 1e02          	ldw	x,(OFST+1,sp)
2972  01de e603          	ld	a,(3,x)
2973  01e0 c7542d        	ld	_CAN+13,a
2974  01e3 e602          	ld	a,(2,x)
2975  01e5 c7542c        	ld	_CAN+12,a
2976  01e8 e601          	ld	a,(1,x)
2977  01ea c7542b        	ld	_CAN+11,a
2978  01ed f6            	ld	a,(x)
2979  01ee c7542a        	ld	_CAN+10,a
2980                     ; 305     CAN_PAGE_MIDR1|= CAN_ID_EXT;
2982  01f1 721c542a      	bset	_CAN+10,#6
2983                     ; 307     CAN_PAGE_MDAR1 =pCanMsg->data[0];
2985  01f5 1e02          	ldw	x,(OFST+1,sp)
2986  01f7 e605          	ld	a,(5,x)
2987  01f9 c7542e        	ld	_CAN+14,a
2988                     ; 308     CAN_PAGE_MDAR2 =pCanMsg->data[1];
2990  01fc 1e02          	ldw	x,(OFST+1,sp)
2991  01fe e606          	ld	a,(6,x)
2992  0200 c7542f        	ld	_CAN+15,a
2993                     ; 309     CAN_PAGE_MDAR3 =pCanMsg->data[2];
2995  0203 1e02          	ldw	x,(OFST+1,sp)
2996  0205 e607          	ld	a,(7,x)
2997  0207 c75430        	ld	_CAN+16,a
2998                     ; 310     CAN_PAGE_MDAR4 =pCanMsg->data[3];
3000  020a 1e02          	ldw	x,(OFST+1,sp)
3001  020c e608          	ld	a,(8,x)
3002  020e c75431        	ld	_CAN+17,a
3003                     ; 311     CAN_PAGE_MDAR5 =pCanMsg->data[4];
3005  0211 1e02          	ldw	x,(OFST+1,sp)
3006  0213 e609          	ld	a,(9,x)
3007  0215 c75432        	ld	_CAN+18,a
3008                     ; 312     CAN_PAGE_MDAR6 =pCanMsg->data[5];
3010  0218 1e02          	ldw	x,(OFST+1,sp)
3011  021a e60a          	ld	a,(10,x)
3012  021c c75433        	ld	_CAN+19,a
3013                     ; 313     CAN_PAGE_MDAR7 =pCanMsg->data[6];
3015  021f 1e02          	ldw	x,(OFST+1,sp)
3016  0221 e60b          	ld	a,(11,x)
3017  0223 c75434        	ld	_CAN+20,a
3018                     ; 314     CAN_PAGE_MDAR8 =pCanMsg->data[7];
3020  0226 1e02          	ldw	x,(OFST+1,sp)
3021  0228 e60c          	ld	a,(12,x)
3022  022a c75435        	ld	_CAN+21,a
3023                     ; 316     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_TXRQ;
3025  022d 72105428      	bset	_CAN+8,#0
3026                     ; 317 	return(TRUE);
3028  0231 a601          	ld	a,#1
3030  0233 2001          	jra	L61
3031  0235               L5451:
3032                     ; 297 		return (FALSE);
3034  0235 4f            	clr	a
3036  0236               L61:
3038  0236 5b03          	addw	sp,#3
3039  0238 87            	retf
3064                     ; 327 void CanInterruptDisable(void)
3064                     ; 328 {
3065                     	switch	.text
3066  0239               f_CanInterruptDisable:
3070                     ; 329 	CanSavePg();
3072  0239 5554270000    	mov	_CanPage,_CAN+7
3073                     ; 331 	CAN.IER = 0x00; 
3075  023e 725f5425      	clr	_CAN+5
3076                     ; 332 	CAN.PSR = CAN_PS_CTRL;         
3078  0242 35065427      	mov	_CAN+7,#6
3079                     ; 333 	CAN_PAGE_EIER = 0x00;
3081  0246 725f5429      	clr	_CAN+9
3082                     ; 335 	CanRestorePg();
3084  024a 5500005427    	mov	_CAN+7,_CanPage
3085                     ; 336 }
3088  024f 87            	retf
3113                     ; 345 void CanInterruptRestore (void)
3113                     ; 346 {
3114                     	switch	.text
3115  0250               f_CanInterruptRestore:
3119                     ; 347 	CanSavePg();
3121  0250 5554270000    	mov	_CanPage,_CAN+7
3122                     ; 349 	CAN.IER = 	//CAN_IER_WKUIE |	/* Wake-up Interrupt */
3122                     ; 350 				CAN_IER_FOVIE /* FIFO overrun Interrupt */
3122                     ; 351 				|CAN_IER_FFIE /* FIFO Full Interrupt */
3122                     ; 352 				|CAN_IER_FMPIE /* FIFO Message Pending Interrupt */
3122                     ; 353 				//|CAN_IER_TMEIE	/* Transmit Mailbox Empty Interrupt */
3122                     ; 354                 ;
3124  0255 350e5425      	mov	_CAN+5,#14
3125                     ; 355 	CAN.PSR = CAN_PS_CTRL;
3127  0259 35065427      	mov	_CAN+7,#6
3128                     ; 356 	CAN_PAGE_EIER = CAN_PAGE_EIER_ERRIE|    /* Error Interrupt */
3128                     ; 357 				    CAN_PAGE_EIER_LECIE|        /* Last Error Code Interrupt */
3128                     ; 358 				    CAN_PAGE_EIER_BOFIE|        /* Bus-Off Interrupt */
3128                     ; 359 				    CAN_PAGE_EIER_EPVIE|        /* Error Passive Interrupt */
3128                     ; 360 				    CAN_PAGE_EIER_EWGIE;        /* Error Warning Interrupt */
3130  025d 35975429      	mov	_CAN+9,#151
3131                     ; 362 	CanRestorePg();
3133  0261 5500005427    	mov	_CAN+7,_CanPage
3134                     ; 363 }
3137  0266 87            	retf
3181                     	switch	.const
3182  0008               L5161:
3183  0008 0003          	dc.w	3
3184  000a 10242040      	dc.l	270803008
3185  000e 02d1          	dc.w	L1751
3186  0010 1029c080      	dc.l	271171712
3187  0014 02d1          	dc.w	L1751
3188  0016 10445701      	dc.l	272914177
3189  001a 02d1          	dc.w	L1751
3190  001c 02ff          	dc.w	L7161
3191                     ; 366 void Can_Store_Rcvd_Msg(void)	//中断服务程序中执行
3191                     ; 367 {
3192                     	scross	off
3193                     	switch	.text
3194  0267               f_Can_Store_Rcvd_Msg:
3196  0267 5203          	subw	sp,#3
3197       00000003      OFST:	set	3
3200                     ; 369 	u8 *u8p =&CAN_PAGE_MDAR1;
3202  0269 ae542e        	ldw	x,#_CAN+14
3203  026c 1f01          	ldw	(OFST-2,sp),x
3204                     ; 371 	CAN.PSR = CAN_PS_FIFO; //进入接收数据FIFO页面
3206  026e 35075427      	mov	_CAN+7,#7
3207                     ; 372     CanTxRxBuffer.id =CAN_PAGE_MIDR1&0x1F;
3209  0272 c6542a        	ld	a,_CAN+10
3210  0275 a41f          	and	a,#31
3211  0277 c70003        	ld	_CanTxRxBuffer+3,a
3212  027a 4f            	clr	a
3213  027b c70002        	ld	_CanTxRxBuffer+2,a
3214  027e c70001        	ld	_CanTxRxBuffer+1,a
3215  0281 c70000        	ld	_CanTxRxBuffer,a
3216                     ; 373     CanTxRxBuffer.id <<=8; //移位计算更优
3218  0284 ae0000        	ldw	x,#_CanTxRxBuffer
3219  0287 a608          	ld	a,#8
3220  0289 8d000000      	callf	d_lglsh
3222                     ; 374     CanTxRxBuffer.id +=CAN_PAGE_MIDR2;
3224  028d c6542b        	ld	a,_CAN+11
3225  0290 ae0000        	ldw	x,#_CanTxRxBuffer
3226  0293 88            	push	a
3227  0294 8d000000      	callf	d_lgadc
3229  0298 84            	pop	a
3230                     ; 375     CanTxRxBuffer.id <<=8;
3232  0299 ae0000        	ldw	x,#_CanTxRxBuffer
3233  029c a608          	ld	a,#8
3234  029e 8d000000      	callf	d_lglsh
3236                     ; 376     CanTxRxBuffer.id +=CAN_PAGE_MIDR3;
3238  02a2 c6542c        	ld	a,_CAN+12
3239  02a5 ae0000        	ldw	x,#_CanTxRxBuffer
3240  02a8 88            	push	a
3241  02a9 8d000000      	callf	d_lgadc
3243  02ad 84            	pop	a
3244                     ; 377     CanTxRxBuffer.id <<=8;
3246  02ae ae0000        	ldw	x,#_CanTxRxBuffer
3247  02b1 a608          	ld	a,#8
3248  02b3 8d000000      	callf	d_lglsh
3250                     ; 378     CanTxRxBuffer.id +=CAN_PAGE_MIDR4;
3252  02b7 c6542d        	ld	a,_CAN+13
3253  02ba ae0000        	ldw	x,#_CanTxRxBuffer
3254  02bd 88            	push	a
3255  02be 8d000000      	callf	d_lgadc
3257  02c2 84            	pop	a
3258                     ; 380     switch(CanTxRxBuffer.id)
3260  02c3 ae0000        	ldw	x,#_CanTxRxBuffer
3261  02c6 8d000000      	callf	d_ltor
3264  02ca ae0008        	ldw	x,#L5161
3265  02cd 8d000000      	callf	d_jltab
3266  02d1               L1751:
3267                     ; 386     		CanTxRxBuffer.dlc= CAN_PAGE_MDLCR; //此帧长度(字节数)
3269  02d1 5554290004    	mov	_CanTxRxBuffer+4,_CAN+9
3270                     ; 387 			for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
3272  02d6 0f03          	clr	(OFST+0,sp)
3274  02d8 2017          	jra	L5261
3275  02da               L1261:
3276                     ; 389 				CanTxRxBuffer.data[idx]=u8p[idx];
3278  02da 7b03          	ld	a,(OFST+0,sp)
3279  02dc 5f            	clrw	x
3280  02dd 97            	ld	xl,a
3281  02de 89            	pushw	x
3282  02df 7b03          	ld	a,(OFST+0,sp)
3283  02e1 97            	ld	xl,a
3284  02e2 7b04          	ld	a,(OFST+1,sp)
3285  02e4 1b05          	add	a,(OFST+2,sp)
3286  02e6 2401          	jrnc	L62
3287  02e8 5c            	incw	x
3288  02e9               L62:
3289  02e9 02            	rlwa	x,a
3290  02ea f6            	ld	a,(x)
3291  02eb 85            	popw	x
3292  02ec d70005        	ld	(_CanTxRxBuffer+5,x),a
3293                     ; 387 			for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
3295  02ef 0c03          	inc	(OFST+0,sp)
3296  02f1               L5261:
3299  02f1 c60004        	ld	a,_CanTxRxBuffer+4
3300  02f4 1103          	cp	a,(OFST+0,sp)
3301  02f6 22e2          	jrugt	L1261
3302                     ; 391             CanMsgAnalyze(&CanTxRxBuffer);
3304  02f8 ae0000        	ldw	x,#_CanTxRxBuffer
3305  02fb 8da503a5      	callf	L5531f_CanMsgAnalyze
3307                     ; 392             break;
3309  02ff               L3751:
3310                     ; 394         default:
3310                     ; 395     		break;
3312  02ff               L7161:
3313                     ; 397 }
3316  02ff 5b03          	addw	sp,#3
3317  0301 87            	retf
3351                     ; 407 void ISR_Can_Tx(void)
3351                     ; 408 {
3353                     	switch	.text
3354  0302               f_ISR_Can_Tx:
3356  0302 88            	push	a
3357       00000001      OFST:	set	1
3360                     ; 410     CanSavePg();
3362  0303 5554270000    	mov	_CanPage,_CAN+7
3363                     ; 412     CAN.PSR =CAN_PS_CTRL;
3365  0308 35065427      	mov	_CAN+7,#6
3366                     ; 413     if(CAN_PAGE_ESR)
3368  030c 725d5428      	tnz	_CAN+8
3369  0310 2714          	jreq	L5461
3370                     ; 415         ErrorCode=CAN_PAGE_ESR;
3372  0312 c65428        	ld	a,_CAN+8
3373  0315 6b01          	ld	(OFST+0,sp),a
3374                     ; 416         if((CAN_PAGE_ESR&CAN_PAGE_ESR_LEC)!=0)
3376  0317 c65428        	ld	a,_CAN+8
3377  031a a570          	bcp	a,#112
3378  031c 2704          	jreq	L7461
3379                     ; 418             CAN_PAGE_ESR =0;//|=CAN_PAGE_ESR_LEC;
3381  031e 725f5428      	clr	_CAN+8
3382  0322               L7461:
3383                     ; 420         CAN.MSR |=CAN_MSR_ERRI;
3385  0322 72145421      	bset	_CAN+1,#2
3386  0326               L5461:
3387                     ; 422     CanRestorePg();
3389  0326 5500005427    	mov	_CAN+7,_CanPage
3390                     ; 423 }
3393  032b 84            	pop	a
3394  032c 87            	retf
3419                     ; 434 void ISR_Can_Rx(void)
3419                     ; 435 {
3420                     	switch	.text
3421  032d               f_ISR_Can_Rx:
3425                     ; 436 	CanSavePg();   
3427  032d 5554270000    	mov	_CanPage,_CAN+7
3428                     ; 438 	if (CAN.RFR & CAN_RFR_FOVR)
3430  0332 c65424        	ld	a,_CAN+4
3431  0335 a510          	bcp	a,#16
3432  0337 2706          	jreq	L1661
3433                     ; 440 		CAN.RFR |= CAN_RFR_FOVR;		/* clear the FIFO Overrun (FOVR) bit */
3435  0339 72185424      	bset	_CAN+4,#4
3437  033d 2019          	jra	L1761
3438  033f               L1661:
3439                     ; 442 	else if (CAN.RFR & CAN_RFR_FULL)
3441  033f c65424        	ld	a,_CAN+4
3442  0342 a508          	bcp	a,#8
3443  0344 2712          	jreq	L1761
3444                     ; 444 		CAN.RFR |= CAN_RFR_FULL;		/* clear the FIFO full (FULL) bit */      
3446  0346 72165424      	bset	_CAN+4,#3
3447  034a 200c          	jra	L1761
3448  034c               L7661:
3449                     ; 448         Can_Store_Rcvd_Msg();
3451  034c 8d670267      	callf	f_Can_Store_Rcvd_Msg
3453                     ; 449         CAN.RFR |= CAN_RFR_RFOM; // Release mailbox
3455  0350 721a5424      	bset	_CAN+4,#5
3456                     ; 450 		CAN.RFR |= CAN_RFR_RFOM; //此语句要用2句,原因还没搞明白
3458  0354 721a5424      	bset	_CAN+4,#5
3459  0358               L1761:
3460                     ; 446 	while (CAN.RFR & CAN_RFR_FMP)	/* Check until FMP != 0 */
3462  0358 c65424        	ld	a,_CAN+4
3463  035b a503          	bcp	a,#3
3464  035d 26ed          	jrne	L7661
3465                     ; 452 	CanRestorePg();
3467  035f 5500005427    	mov	_CAN+7,_CanPage
3468                     ; 453 }
3471  0364 87            	retf
3502                     ; 463 u8 CanIllumLevel(u8 Byte)
3502                     ; 464 {
3503                     	switch	.text
3504  0365               f_CanIllumLevel:
3506  0365 88            	push	a
3507       00000000      OFST:	set	0
3510                     ; 465     switch(Byte)
3513                     ; 488             break;
3514  0366 4d            	tnz	a
3515  0367 2717          	jreq	L5761
3516  0369 a00b          	sub	a,#11
3517  036b 271d          	jreq	L1071
3518  036d 4a            	dec	a
3519  036e 2716          	jreq	L7761
3520  0370 a0ee          	sub	a,#238
3521  0372 271c          	jreq	L3071
3522  0374               L5071:
3523                     ; 479         default:
3523                     ; 480             if(Byte&0x0F)
3525  0374 7b01          	ld	a,(OFST+1,sp)
3526  0376 a50f          	bcp	a,#15
3527  0378 271c          	jreq	L7271
3528                     ; 482                 Byte=0xFF;
3530  037a a6ff          	ld	a,#255
3531  037c 6b01          	ld	(OFST+1,sp),a
3533  037e 2020          	jra	L5271
3534  0380               L5761:
3535                     ; 467         case PARA_ILL_OFF:
3535                     ; 468             Byte=0x7F;
3537  0380 a67f          	ld	a,#127
3538  0382 6b01          	ld	(OFST+1,sp),a
3539                     ; 469             break;
3541  0384 201a          	jra	L5271
3542  0386               L7761:
3543                     ; 470         case PARA_ILL_LV0:
3543                     ; 471             Byte=0; //背光0级亮度
3545  0386 0f01          	clr	(OFST+1,sp)
3546                     ; 472             break;
3548  0388 2016          	jra	L5271
3549  038a               L1071:
3550                     ; 473         case PARA_ILL_LV1:
3550                     ; 474             Byte=1; //背光1级亮度
3552  038a a601          	ld	a,#1
3553  038c 6b01          	ld	(OFST+1,sp),a
3554                     ; 475             break;
3556  038e 2010          	jra	L5271
3557  0390               L3071:
3558                     ; 476         case PARA_ILL_LV17:
3558                     ; 477             Byte=17; //背光17级亮度
3560  0390 a611          	ld	a,#17
3561  0392 6b01          	ld	(OFST+1,sp),a
3562                     ; 478             break;
3564  0394 200a          	jra	L5271
3565  0396               L7271:
3566                     ; 486                 Byte=((Byte>>4)&0x0F)+1;
3568  0396 7b01          	ld	a,(OFST+1,sp)
3569  0398 4e            	swap	a
3570  0399 a40f          	and	a,#15
3571  039b a40f          	and	a,#15
3572  039d 4c            	inc	a
3573  039e 6b01          	ld	(OFST+1,sp),a
3574  03a0               L5271:
3575                     ; 490     return(Byte);
3577  03a0 7b01          	ld	a,(OFST+1,sp)
3580  03a2 5b01          	addw	sp,#1
3581  03a4 87            	retf
3630                     	switch	.const
3631  001e               L5671:
3632  001e 0003          	dc.w	3
3633  0020 10242040      	dc.l	270803008
3634  0024 03b6          	dc.w	L3371
3635  0026 1029c080      	dc.l	271171712
3636  002a 03c4          	dc.w	L5371
3637  002c 10445701      	dc.l	272914177
3638  0030 03c6          	dc.w	L7371
3639  0032 040a          	dc.w	L7671
3640                     ; 502 static void CanMsgAnalyze(CanMsgTypeDef *pCanMsg)
3640                     ; 503 {
3641                     	scross	off
3642                     	switch	.text
3643  03a5               L5531f_CanMsgAnalyze:
3645  03a5 89            	pushw	x
3646  03a6 88            	push	a
3647       00000001      OFST:	set	1
3650                     ; 506     BoolT FlagCANDataOK=TRUE;
3652  03a7 a601          	ld	a,#1
3653  03a9 6b01          	ld	(OFST+0,sp),a
3654                     ; 509     switch(pCanMsg->id)
3656  03ab 8d000000      	callf	d_ltor
3659  03af ae001e        	ldw	x,#L5671
3660  03b2 8d000000      	callf	d_jltab
3661  03b6               L3371:
3662                     ; 513             if(0x4A==pCanMsg->data[0])
3664  03b6 1e02          	ldw	x,(OFST+1,sp)
3665  03b8 e605          	ld	a,(5,x)
3666  03ba a14a          	cp	a,#74
3667  03bc 264c          	jrne	L7671
3668                     ; 515                 NODE_ACC_FLAG=1;
3670  03be 72100000      	bset	_NodeState,#0
3671  03c2 2046          	jra	L7671
3672  03c4               L5371:
3673                     ; 525             break;
3675  03c4 2044          	jra	L7671
3676  03c6               L7371:
3677                     ; 542             if(UniqueID_Temp[0]==pCanMsg->data[0]&&UniqueID_Temp[1]==pCanMsg->data[1]
3677                     ; 543              &&UniqueID_Temp[2]==pCanMsg->data[2]&&UniqueID_Temp[3]==pCanMsg->data[3]
3677                     ; 544              &&UniqueID_Temp[4]==pCanMsg->data[4]&&UniqueID_Temp[5]==pCanMsg->data[5]
3677                     ; 545              &&UniqueID_Temp[6]==pCanMsg->data[6]&&UniqueID_Temp[7]==pCanMsg->data[7]
3677                     ; 546             )
3679  03c6 1e02          	ldw	x,(OFST+1,sp)
3680  03c8 e605          	ld	a,(5,x)
3681  03ca a151          	cp	a,#81
3682  03cc 263c          	jrne	L7671
3684  03ce 1e02          	ldw	x,(OFST+1,sp)
3685  03d0 e606          	ld	a,(6,x)
3686  03d2 a102          	cp	a,#2
3687  03d4 2634          	jrne	L7671
3689  03d6 1e02          	ldw	x,(OFST+1,sp)
3690  03d8 e607          	ld	a,(7,x)
3691  03da a103          	cp	a,#3
3692  03dc 262c          	jrne	L7671
3694  03de 1e02          	ldw	x,(OFST+1,sp)
3695  03e0 e608          	ld	a,(8,x)
3696  03e2 a104          	cp	a,#4
3697  03e4 2624          	jrne	L7671
3699  03e6 1e02          	ldw	x,(OFST+1,sp)
3700  03e8 e609          	ld	a,(9,x)
3701  03ea a105          	cp	a,#5
3702  03ec 261c          	jrne	L7671
3704  03ee 1e02          	ldw	x,(OFST+1,sp)
3705  03f0 e60a          	ld	a,(10,x)
3706  03f2 a106          	cp	a,#6
3707  03f4 2614          	jrne	L7671
3709  03f6 1e02          	ldw	x,(OFST+1,sp)
3710  03f8 e60b          	ld	a,(11,x)
3711  03fa a107          	cp	a,#7
3712  03fc 260c          	jrne	L7671
3714  03fe 1e02          	ldw	x,(OFST+1,sp)
3715  0400 e60c          	ld	a,(12,x)
3716  0402 a108          	cp	a,#8
3717  0404 2604          	jrne	L7671
3718                     ; 548                 NODE_REGISTER_FLAG=1;
3720  0406 72120000      	bset	_NodeState,#1
3721  040a               L7671:
3722                     ; 554     CanFlagAnalyse();
3724  040a 8d110411      	callf	f_CanFlagAnalyse
3726                     ; 555 }
3729  040e 5b03          	addw	sp,#3
3730  0410 87            	retf
3755                     ; 566 void CanFlagAnalyse(void)
3755                     ; 567 {
3757                     	switch	.text
3758  0411               f_CanFlagAnalyse:
3762                     ; 568 	if(NODE_ACC_FLAG)
3764  0411 c60000        	ld	a,_NodeState
3765  0414 a501          	bcp	a,#1
3766  0416 2706          	jreq	L5002
3767                     ; 570 		ACC_CTRL=1 ;      
3769  0418 72145023      	bset	_GPIOH,#2
3771  041c 2004          	jra	L7002
3772  041e               L5002:
3773                     ; 574 		ACC_CTRL=0;   
3775  041e 72155023      	bres	_GPIOH,#2
3776  0422               L7002:
3777                     ; 576 }
3780  0422 87            	retf
3804                     ; 586 BoolT CANGetEmptyMegBox(void)
3804                     ; 587 {
3805                     	switch	.text
3806  0423               f_CANGetEmptyMegBox:
3810                     ; 588     if(CAN.TPR &CAN_TPR_TME0)
3812  0423 c65423        	ld	a,_CAN+3
3813  0426 a504          	bcp	a,#4
3814  0428 2706          	jreq	L1202
3815                     ; 590         CAN.PSR =CAN_PS_TXMB0;
3817  042a 725f5427      	clr	_CAN+7
3819  042e 2018          	jra	L3202
3820  0430               L1202:
3821                     ; 592     else if(CAN.TPR &CAN_TPR_TME1)
3823  0430 c65423        	ld	a,_CAN+3
3824  0433 a508          	bcp	a,#8
3825  0435 2706          	jreq	L5202
3826                     ; 594         CAN.PSR =CAN_PS_TXMB1;
3828  0437 35015427      	mov	_CAN+7,#1
3830  043b 200b          	jra	L3202
3831  043d               L5202:
3832                     ; 596     else if(CAN.TPR &CAN_TPR_TME2)
3834  043d c65423        	ld	a,_CAN+3
3835  0440 a510          	bcp	a,#16
3836  0442 2707          	jreq	L1302
3837                     ; 598         CAN.PSR =CAN_PS_TXMB2;
3839  0444 35055427      	mov	_CAN+7,#5
3841  0448               L3202:
3842                     ; 604     return TRUE;
3844  0448 a601          	ld	a,#1
3847  044a 87            	retf
3848  044b               L1302:
3849                     ; 602         return FALSE;
3851  044b 4f            	clr	a
3854  044c 87            	retf
3891                     ; 615 void SendToCan(CanMsgTypeDef *pCanMsg)
3891                     ; 616 {
3892                     	switch	.text
3893  044d               f_SendToCan:
3897                     ; 617     CanMsgTransmit(pCanMsg);
3899  044d 8da201a2      	callf	f_CanMsgTransmit
3901                     ; 618 }
3904  0451 87            	retf
3940                     ; 628 void NodeRegister(void)
3940                     ; 629 {
3941                     	switch	.text
3942  0452               f_NodeRegister:
3944  0452 520d          	subw	sp,#13
3945       0000000d      OFST:	set	13
3948                     ; 631     CanBuffer.id =CANID_NODEREGISTER;
3950  0454 ae5701        	ldw	x,#22273
3951  0457 1f03          	ldw	(OFST-10,sp),x
3952  0459 ae1044        	ldw	x,#4164
3953  045c 1f01          	ldw	(OFST-12,sp),x
3954                     ; 632     CanBuffer.dlc =8;
3956  045e a608          	ld	a,#8
3957  0460 6b05          	ld	(OFST-8,sp),a
3958                     ; 633     CanBuffer.data[0]=UniqueID_Temp[0];
3960  0462 a651          	ld	a,#81
3961  0464 6b06          	ld	(OFST-7,sp),a
3962                     ; 634     CanBuffer.data[1]=UniqueID_Temp[1];
3964  0466 a602          	ld	a,#2
3965  0468 6b07          	ld	(OFST-6,sp),a
3966                     ; 635     CanBuffer.data[2]=UniqueID_Temp[2];
3968  046a a603          	ld	a,#3
3969  046c 6b08          	ld	(OFST-5,sp),a
3970                     ; 636     CanBuffer.data[3]=UniqueID_Temp[3];
3972  046e a604          	ld	a,#4
3973  0470 6b09          	ld	(OFST-4,sp),a
3974                     ; 637     CanBuffer.data[4]=UniqueID_Temp[4];
3976  0472 a605          	ld	a,#5
3977  0474 6b0a          	ld	(OFST-3,sp),a
3978                     ; 638     CanBuffer.data[5]=UniqueID_Temp[5];
3980  0476 a606          	ld	a,#6
3981  0478 6b0b          	ld	(OFST-2,sp),a
3982                     ; 639     CanBuffer.data[6]=UniqueID_Temp[6];
3984  047a a607          	ld	a,#7
3985  047c 6b0c          	ld	(OFST-1,sp),a
3986                     ; 640     CanBuffer.data[7]=UniqueID_Temp[7];
3988  047e a608          	ld	a,#8
3989  0480 6b0d          	ld	(OFST+0,sp),a
3990                     ; 641     SendToCan(&CanBuffer);
3992  0482 96            	ldw	x,sp
3993  0483 1c0001        	addw	x,#OFST-12
3994  0486 8d4d044d      	callf	f_SendToCan
3996                     ; 642 }
3999  048a 5b0d          	addw	sp,#13
4000  048c 87            	retf
4042                     ; 652 void SendSwitchState(u8 Switch)
4042                     ; 653 {
4043                     	switch	.text
4044  048d               f_SendSwitchState:
4046  048d 88            	push	a
4047  048e 520d          	subw	sp,#13
4048       0000000d      OFST:	set	13
4051                     ; 655     CanBuffer.id =CANID_SWITCHSTATE;
4053  0490 aec080        	ldw	x,#49280
4054  0493 1f03          	ldw	(OFST-10,sp),x
4055  0495 ae1029        	ldw	x,#4137
4056  0498 1f01          	ldw	(OFST-12,sp),x
4057                     ; 656     CanBuffer.dlc =1;
4059  049a a601          	ld	a,#1
4060  049c 6b05          	ld	(OFST-8,sp),a
4061                     ; 657     CanBuffer.data[0]=Switch;
4063  049e 7b0e          	ld	a,(OFST+1,sp)
4064  04a0 6b06          	ld	(OFST-7,sp),a
4065                     ; 658     SendToCan(&CanBuffer);
4067  04a2 96            	ldw	x,sp
4068  04a3 1c0001        	addw	x,#OFST-12
4069  04a6 8d4d044d      	callf	f_SendToCan
4071                     ; 659 }
4074  04aa 5b0e          	addw	sp,#14
4075  04ac 87            	retf
4106                     ; 670 void Can_Main(void)
4106                     ; 671 {
4107                     	switch	.text
4108  04ad               f_Can_Main:
4112                     ; 672 	switch(CanBusState)
4114  04ad c60000        	ld	a,_CanBusState
4116                     ; 711 			CLEAR_WWDG;			
4117  04b0 4d            	tnz	a
4118  04b1 271d          	jreq	L3112
4119  04b3 4a            	dec	a
4120  04b4 2732          	jreq	L5112
4121  04b6 4a            	dec	a
4122  04b7 275b          	jreq	L3412
4123  04b9 4a            	dec	a
4124  04ba 274c          	jreq	L3212
4125  04bc 4a            	dec	a
4126  04bd 2755          	jreq	L3412
4127  04bf 4a            	dec	a
4128  04c0 2739          	jreq	L1212
4129  04c2               L7212:
4130                     ; 710 			BEGIN_WWDG;			
4132  04c2 357f50d2      	mov	_WWDG+1,#127
4135  04c6 35ff50d1      	mov	_WWDG,#255
4136                     ; 711 			CLEAR_WWDG;			
4139  04ca 357f50d1      	mov	_WWDG,#127
4140  04ce               L3512:
4142  04ce 20fe          	jra	L3512
4143  04d0               L3112:
4144                     ; 674 		case CAN_INITIAL:
4144                     ; 675 			CanWakeUp();
4146  04d0 8d8f018f      	callf	f_CanWakeUp
4148                     ; 676 			CanInit(CAN_MCR_ABOM | CAN_MCR_AWUM |CAN_MCR_NART);
4150  04d4 a670          	ld	a,#112
4151  04d6 8d000000      	callf	f_CanInit
4153                     ; 677 			CanInterruptRestore();
4155  04da 8d500250      	callf	f_CanInterruptRestore
4157                     ; 678 			CanBusWakeup();
4159  04de 72175014      	bres	_GPIOE,#3
4160                     ; 679 			CanBusState=CAN_WAIT;
4163  04e2 35010000      	mov	_CanBusState,#1
4164                     ; 680 			break;
4166  04e6 202c          	jra	L3412
4167  04e8               L5112:
4168                     ; 681 		case CAN_WAIT:
4168                     ; 682 #if HASH_MODEL==HS_0002S
4168                     ; 683 		    if(0==NODE_REGISTER_FLAG)
4170  04e8 c60000        	ld	a,_NodeState
4171  04eb a502          	bcp	a,#2
4172  04ed 2606          	jrne	L5412
4173                     ; 685     		    NodeRegister();
4175  04ef 8d520452      	callf	f_NodeRegister
4178  04f3 201f          	jra	L3412
4179  04f5               L5412:
4180                     ; 690 		        CanBusState=CAN_RUNNING;
4182  04f5 35020000      	mov	_CanBusState,#2
4183  04f9 2019          	jra	L3412
4184  04fb               L1212:
4185                     ; 696 		case CAN_ACCOFF:
4185                     ; 697 			if(NODE_ACC_FLAG==1)
4187  04fb c60000        	ld	a,_NodeState
4188  04fe a501          	bcp	a,#1
4189  0500 2712          	jreq	L3412
4190                     ; 699 				CanBusState=CAN_RUNNING;
4192  0502 35020000      	mov	_CanBusState,#2
4193  0506 200c          	jra	L3412
4194  0508               L3212:
4195                     ; 702 		case CAN_WAITSLEEP:
4195                     ; 703 			CanSleep();
4197  0508 8d770177      	callf	f_CanSleep
4199                     ; 704 			CanBusSleep();
4201  050c 72165014      	bset	_GPIOE,#3
4202                     ; 705 			CanBusState=CAN_SLEEP;	
4205  0510 35040000      	mov	_CanBusState,#4
4206                     ; 706 			break;
4208  0514               L3412:
4209                     ; 718 }
4212  0514 87            	retf
4236                     	xdef	f_CANGetEmptyMegBox
4237                     	xdef	f_CanMsgTransmit
4238                     	xdef	_UniqueID_Temp
4239                     	xdef	f_Can_Main
4240                     	xdef	f_CanFlagAnalyse
4241                     	xdef	f_SendSwitchState
4242                     	xdef	f_NodeRegister
4243                     	xdef	f_SendToCan
4244                     	xdef	f_CanIllumLevel
4245                     	xdef	f_ISR_Can_Rx
4246                     	xdef	f_ISR_Can_Tx
4247                     	xdef	f_Can_Store_Rcvd_Msg
4248                     	xdef	f_CanInterruptRestore
4249                     	xdef	f_CanInterruptDisable
4250                     	xdef	f_CanWakeUp
4251                     	xdef	f_Can_Wakeup_Enable
4252                     	xdef	f_CanSleep
4253                     	xdef	f_CanInit
4254                     	xref	_CanTxRxBuffer
4255                     	xref	_CanBusState
4256                     	xref	_NodeState
4257                     	xref	_CanPage
4258                     	xref.b	c_x
4277                     	xref	d_jltab
4278                     	xref	d_ltor
4279                     	xref	d_lgadc
4280                     	xref	d_lglsh
4281                     	end
