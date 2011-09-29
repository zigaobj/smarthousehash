   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2492                     ; 19 void CanInit(u8 CAN_MasterCtrlReg)
2492                     ; 20 {
2493                     	switch	.text
2494  0000               f_CanInit:
2496  0000 88            	push	a
2497       00000000      OFST:	set	0
2500                     ; 21     CLK.PCKENR2|=CLK_PCKENR2_CAN; // 开启CAN时钟，stm8 的外设时钟可控
2502  0001 721e50ca      	bset	_CLK+10,#7
2503                     ; 23     CAN.PSR =CAN_PS_TXMB0;
2505  0005 725f5427      	clr	_CAN+7
2506                     ; 24     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;
2508  0009 72125428      	bset	_CAN+8,#1
2509                     ; 26     CAN.PSR =CAN_PS_TXMB1;
2511  000d 35015427      	mov	_CAN+7,#1
2512                     ; 27     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;
2514  0011 72125428      	bset	_CAN+8,#1
2515                     ; 29     CAN.PSR =CAN_PS_TXMB2;
2517  0015 35055427      	mov	_CAN+7,#5
2518                     ; 30     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;
2520  0019 72125428      	bset	_CAN+8,#1
2521                     ; 32     CAN.MCR |=CAN_MCR_INRQ; // Request initialisation
2523  001d 72105420      	bset	_CAN,#0
2525  0021 2001          	jra	L1741
2526  0023               L7641:
2527                     ; 35         _asm("nop");
2530  0023 9d            nop
2532  0024               L1741:
2533                     ; 33     while(!(CAN.MSR &CAN_MSR_INAK)) // Wait until acknowledged
2535  0024 c65421        	ld	a,_CAN+1
2536  0027 a501          	bcp	a,#1
2537  0029 27f8          	jreq	L7641
2538                     ; 40     CAN.TSR |=CAN_TSR_RQCP0 |CAN_TSR_RQCP1 |CAN_TSR_RQCP2;
2540  002b c65422        	ld	a,_CAN+2
2541  002e aa07          	or	a,#7
2542  0030 c75422        	ld	_CAN+2,a
2544  0033 2004          	jra	L7741
2545  0035               L5741:
2546                     ; 45         CAN.RFR =CAN_RFR_RFOM; //释放一级FIFO
2548  0035 35205424      	mov	_CAN+4,#32
2549  0039               L7741:
2550                     ; 43     while(CAN.RFR &CAN_RFR_FMP)
2552  0039 c65424        	ld	a,_CAN+4
2553  003c a503          	bcp	a,#3
2554  003e 26f5          	jrne	L5741
2555                     ; 49     CAN.RFR |=CAN_RFR_FOVR; 
2557  0040 72185424      	bset	_CAN+4,#4
2558                     ; 52 	CAN.MSR =CAN_MSR_WKUI;
2560  0044 35085421      	mov	_CAN+1,#8
2561                     ; 55 	CAN.MCR |= CAN_MasterCtrlReg;
2563  0048 c65420        	ld	a,_CAN
2564  004b 1a01          	or	a,(OFST+1,sp)
2565  004d c75420        	ld	_CAN,a
2566                     ; 59 	CAN.PSR =CAN_PS_CTRL;	
2568  0050 35065427      	mov	_CAN+7,#6
2569                     ; 60 	CAN_PAGE_FCR1 = 0x00;
2571  0054 725f5432      	clr	_CAN+18
2572                     ; 61 	CAN_PAGE_FCR2 = 0x00;
2574  0058 725f5433      	clr	_CAN+19
2575                     ; 62 	CAN_PAGE_FCR3 = 0x00;
2577  005c 725f5434      	clr	_CAN+20
2578                     ; 65 	CAN_PAGE_FCR1 = CAN_FCR1_FILTER0_SCALE_1_32BIT;
2580  0060 35065432      	mov	_CAN+18,#6
2581                     ; 80 	CAN_PAGE_FMR1 = 0x00;	/* Filter 0, 1, 2, 3 Low/High Register in Mask mode */
2583  0064 725f5430      	clr	_CAN+16
2584                     ; 81 	CAN_PAGE_FMR2 = 0x00;	/* Filter 4, 5 Low/High Register in Mask mode */
2586  0068 725f5431      	clr	_CAN+17
2587                     ; 103 	CAN.PSR = CAN_PS_FILTER01;
2589  006c 35025427      	mov	_CAN+7,#2
2590                     ; 105 	CAN_PAGE_FLR1 = 0x00;
2592  0070 725f5428      	clr	_CAN+8
2593                     ; 106 	CAN_PAGE_FLR2 = 0x00;
2595  0074 725f5429      	clr	_CAN+9
2596                     ; 107 	CAN_PAGE_FLR3 = 0x00;
2598  0078 725f542a      	clr	_CAN+10
2599                     ; 108 	CAN_PAGE_FLR4 = 0x00;
2601  007c 725f542b      	clr	_CAN+11
2602                     ; 109 	CAN_PAGE_FLR5 = 0x00;
2604  0080 725f542c      	clr	_CAN+12
2605                     ; 110 	CAN_PAGE_FLR6 = 0x00;
2607  0084 725f542d      	clr	_CAN+13
2608                     ; 111 	CAN_PAGE_FLR7 = 0x00;
2610  0088 725f542e      	clr	_CAN+14
2611                     ; 112 	CAN_PAGE_FLR8 = 0x00;
2613  008c 725f542f      	clr	_CAN+15
2614                     ; 114 	CAN_PAGE_FHR1 = 0x00;
2616  0090 725f5430      	clr	_CAN+16
2617                     ; 115 	CAN_PAGE_FHR2 = 0x00;
2619  0094 725f5431      	clr	_CAN+17
2620                     ; 116 	CAN_PAGE_FHR3 = 0x00;
2622  0098 725f5432      	clr	_CAN+18
2623                     ; 117 	CAN_PAGE_FHR4 = 0x00;
2625  009c 725f5433      	clr	_CAN+19
2626                     ; 118 	CAN_PAGE_FHR5 = 0x00;
2628  00a0 725f5434      	clr	_CAN+20
2629                     ; 119 	CAN_PAGE_FHR6 = 0x00;
2631  00a4 725f5435      	clr	_CAN+21
2632                     ; 120 	CAN_PAGE_FHR7 = 0x00;
2634  00a8 725f5436      	clr	_CAN+22
2635                     ; 121 	CAN_PAGE_FHR8 = 0x00;
2637  00ac 725f5437      	clr	_CAN+23
2638                     ; 124 	CAN.PSR = CAN_PS_FILTER23;
2640  00b0 35035427      	mov	_CAN+7,#3
2641                     ; 126 	CAN_PAGE_FLR1 = 0x00;
2643  00b4 725f5428      	clr	_CAN+8
2644                     ; 127 	CAN_PAGE_FLR2 = 0x00;
2646  00b8 725f5429      	clr	_CAN+9
2647                     ; 128 	CAN_PAGE_FLR3 = 0x00;
2649  00bc 725f542a      	clr	_CAN+10
2650                     ; 129 	CAN_PAGE_FLR4 = 0x00;
2652  00c0 725f542b      	clr	_CAN+11
2653                     ; 130 	CAN_PAGE_FLR5 = 0x00;
2655  00c4 725f542c      	clr	_CAN+12
2656                     ; 131 	CAN_PAGE_FLR6 = 0x00;
2658  00c8 725f542d      	clr	_CAN+13
2659                     ; 132 	CAN_PAGE_FLR7 = 0x00;
2661  00cc 725f542e      	clr	_CAN+14
2662                     ; 133 	CAN_PAGE_FLR8 = 0x00;
2664  00d0 725f542f      	clr	_CAN+15
2665                     ; 135 	CAN_PAGE_FHR1 = 0x00;
2667  00d4 725f5430      	clr	_CAN+16
2668                     ; 136 	CAN_PAGE_FHR2 = 0x00;
2670  00d8 725f5431      	clr	_CAN+17
2671                     ; 137 	CAN_PAGE_FHR3 = 0x00;
2673  00dc 725f5432      	clr	_CAN+18
2674                     ; 138 	CAN_PAGE_FHR4 = 0x00;
2676  00e0 725f5433      	clr	_CAN+19
2677                     ; 139 	CAN_PAGE_FHR5 = 0x00;
2679  00e4 725f5434      	clr	_CAN+20
2680                     ; 140 	CAN_PAGE_FHR6 = 0x00;
2682  00e8 725f5435      	clr	_CAN+21
2683                     ; 141 	CAN_PAGE_FHR7 = 0x00;
2685  00ec 725f5436      	clr	_CAN+22
2686                     ; 142 	CAN_PAGE_FHR8 = 0x00;
2688  00f0 725f5437      	clr	_CAN+23
2689                     ; 145 	CAN.PSR = CAN_PS_FILTER45;
2691  00f4 35045427      	mov	_CAN+7,#4
2692                     ; 147 	CAN_PAGE_FLR1 = 0xff;
2694  00f8 35ff5428      	mov	_CAN+8,#255
2695                     ; 148 	CAN_PAGE_FLR2 = 0xff;
2697  00fc 35ff5429      	mov	_CAN+9,#255
2698                     ; 149 	CAN_PAGE_FLR3 = 0xff;
2700  0100 35ff542a      	mov	_CAN+10,#255
2701                     ; 150 	CAN_PAGE_FLR4 = 0xff;
2703  0104 35ff542b      	mov	_CAN+11,#255
2704                     ; 151 	CAN_PAGE_FLR5 = 0xff;
2706  0108 35ff542c      	mov	_CAN+12,#255
2707                     ; 152 	CAN_PAGE_FLR6 = 0xff;
2709  010c 35ff542d      	mov	_CAN+13,#255
2710                     ; 153 	CAN_PAGE_FLR7 = 0xff;
2712  0110 35ff542e      	mov	_CAN+14,#255
2713                     ; 154 	CAN_PAGE_FLR8 = 0xff;
2715  0114 35ff542f      	mov	_CAN+15,#255
2716                     ; 156 	CAN_PAGE_FHR1 = 0xff;
2718  0118 35ff5430      	mov	_CAN+16,#255
2719                     ; 157 	CAN_PAGE_FHR2 = 0xff;
2721  011c 35ff5431      	mov	_CAN+17,#255
2722                     ; 158 	CAN_PAGE_FHR3 = 0xff;
2724  0120 35ff5432      	mov	_CAN+18,#255
2725                     ; 159 	CAN_PAGE_FHR4 = 0xff;
2727  0124 35ff5433      	mov	_CAN+19,#255
2728                     ; 160 	CAN_PAGE_FHR5 = 0xff;
2730  0128 35ff5434      	mov	_CAN+20,#255
2731                     ; 161 	CAN_PAGE_FHR6 = 0xff;
2733  012c 35ff5435      	mov	_CAN+21,#255
2734                     ; 162 	CAN_PAGE_FHR7 = 0xff;
2736  0130 35ff5436      	mov	_CAN+22,#255
2737                     ; 163 	CAN_PAGE_FHR8 = 0xff;
2739  0134 35ff5437      	mov	_CAN+23,#255
2740                     ; 166 	CAN.PSR = CAN_PS_CTRL;	
2742  0138 35065427      	mov	_CAN+7,#6
2743                     ; 167 	CAN_PAGE_FCR1 |= CAN_FCR1_FILTER0_ACTIVE;	/* Filter 0 active */
2745  013c 72105432      	bset	_CAN+18,#0
2746                     ; 175 	CAN.PSR =CAN_PS_CTRL;
2748  0140 35065427      	mov	_CAN+7,#6
2749                     ; 176 	CAN_PAGE_BTR1 =(CAN_PAGE_BTR1_BRP&(CAN_PAGE_BTR1_BRP_RESET_VALUE-1))
2749                     ; 177 	              |(CAN_PAGE_BTR1_SJW&((CAN_PAGE_BTR1_SJW_RESET_VALUE-1)<<6));		// see can.h for modification of
2751  0144 359d542c      	mov	_CAN+12,#157
2752                     ; 178 	CAN_PAGE_BTR2 =(CAN_PAGE_BTR2_BS1&(CAN_PAGE_BTR2_BS1_RESET_VALUE-1)) 	        // bit timing parameters.
2752                     ; 179 	              |(CAN_PAGE_BTR2_BS2&((CAN_PAGE_BTR2_BS2_RESET_VALUE-1)<<4))
2752                     ; 180 	               |CAN_PAGE_BTR2_CLKS;
2754  0148 35a3542d      	mov	_CAN+13,#163
2755                     ; 185 	CAN.DGR |= CAN_DGR_TXM2E;	/* enable 3th Tx mailboxe */ 
2757  014c 72185426      	bset	_CAN+6,#4
2758                     ; 187 	CAN.MCR &= ~CAN_MCR_INRQ;	/* Leave the Init mode */
2760  0150 72115420      	bres	_CAN,#0
2762  0154 2001          	jra	L5051
2763  0156               L3051:
2764                     ; 190 		_asm("nop");
2767  0156 9d            nop
2769  0157               L5051:
2770                     ; 188 	while ((CAN.MSR &CAN_MSR_INAK))	/* Wait until acknowledged */ 
2772  0157 c65421        	ld	a,_CAN+1
2773  015a a501          	bcp	a,#1
2774  015c 26f8          	jrne	L3051
2775                     ; 193 }
2778  015e 84            	pop	a
2779  015f 87            	retf
2803                     ; 202 void Can_Wakeup_Enable(void)
2803                     ; 203 {
2804                     	switch	.text
2805  0160               f_Can_Wakeup_Enable:
2809                     ; 204 	CanSavePg();
2811  0160 5554270000    	mov	_CanPage,_CAN+7
2812                     ; 206 	CAN.IER = CAN_IER_WKUIE | /* Wake-up Interrupt */
2812                     ; 207 			  CAN_IER_FOVIE | /* FIFO overrun Interrupt */
2812                     ; 208 			  CAN_IER_FFIE  | /* FIFO Full Interrupt */
2812                     ; 209 			  CAN_IER_FMPIE | /* FIFO Message Pending Interrupt */
2812                     ; 210 			  CAN_IER_TMEIE;  /* Transmit Mailbox Empty Interrupt */
2814  0165 358f5425      	mov	_CAN+5,#143
2815                     ; 212 	CAN.PSR = CAN_PS_CTRL;
2817  0169 35065427      	mov	_CAN+7,#6
2818                     ; 213 	CAN_PAGE_EIER = CAN_PAGE_EIER_ERRIE|	/* Error Interrupt */
2818                     ; 214 				    CAN_PAGE_EIER_LECIE|	/* Last Error Code Interrupt */
2818                     ; 215 				    CAN_PAGE_EIER_BOFIE|	/* Bus-Off Interrupt */
2818                     ; 216 				    CAN_PAGE_EIER_EPVIE|	/* Error Passive Interrupt */
2818                     ; 217 				    CAN_PAGE_EIER_EWGIE;	/* Error Warning Interrupt */
2820  016d 35975429      	mov	_CAN+9,#151
2821                     ; 219 	CanRestorePg();
2823  0171 5500005427    	mov	_CAN+7,_CanPage
2824                     ; 220 }
2827  0176 87            	retf
2852                     ; 229 void CanSleep(void)
2852                     ; 230 {
2853                     	switch	.text
2854  0177               f_CanSleep:
2858                     ; 231     CanInit(CAN_MCR_AWUM);
2860  0177 a620          	ld	a,#32
2861  0179 8d000000      	callf	f_CanInit
2863                     ; 232     Can_Wakeup_Enable();
2865  017d 8d600160      	callf	f_Can_Wakeup_Enable
2868  0181 2004          	jra	L3351
2869  0183               L1351:
2870                     ; 238         CAN.MCR |= CAN_MCR_SLEEP;		
2872  0183 72125420      	bset	_CAN,#1
2873  0187               L3351:
2874                     ; 235     while(!(CAN.MSR &CAN_MSR_SLAK))
2876  0187 c65421        	ld	a,_CAN+1
2877  018a a502          	bcp	a,#2
2878  018c 27f5          	jreq	L1351
2879                     ; 240 }
2882  018e 87            	retf
2907                     ; 249 void CanWakeUp(void)
2907                     ; 250 {
2908                     	switch	.text
2909  018f               f_CanWakeUp:
2913                     ; 251 	CanBusWakeup();
2915  018f 72175014      	bres	_GPIOE,#3
2916                     ; 254 	CAN.MCR &= ~CAN_MCR_SLEEP;	
2919  0193 72135420      	bres	_CAN,#1
2921  0197 2001          	jra	L1551
2922  0199               L7451:
2923                     ; 259         _asm("nop");
2926  0199 9d            nop
2928  019a               L1551:
2929                     ; 257 	while(CAN.MSR & CAN_MSR_SLAK)
2931  019a c65421        	ld	a,_CAN+1
2932  019d a502          	bcp	a,#2
2933  019f 26f8          	jrne	L7451
2934                     ; 261 }
2937  01a1 87            	retf
3033                     ; 276 BoolT CanMsgTransmit(CanMsgTypeDef *pCanMsg)
3033                     ; 277 {
3034                     	switch	.text
3035  01a2               f_CanMsgTransmit:
3037  01a2 89            	pushw	x
3038  01a3 88            	push	a
3039       00000001      OFST:	set	1
3042                     ; 280 	if(CAN.TPR & CAN_TPR_TME0)			/* Mailbox 1 empty ? */
3044  01a4 c65423        	ld	a,_CAN+3
3045  01a7 a504          	bcp	a,#4
3046  01a9 270a          	jreq	L3261
3047                     ; 282 		CAN.PSR = CAN_PS_TXMB0;
3049  01ab 725f5427      	clr	_CAN+7
3050                     ; 283 		MailboxNumber = 1;
3052  01af a601          	ld	a,#1
3053  01b1 6b01          	ld	(OFST+0,sp),a
3055  01b3 2020          	jra	L5261
3056  01b5               L3261:
3057                     ; 285 	else if(CAN.TPR & CAN_TPR_TME1)	/* Mailbox 2 empty ? */
3059  01b5 c65423        	ld	a,_CAN+3
3060  01b8 a508          	bcp	a,#8
3061  01ba 270a          	jreq	L7261
3062                     ; 287 		CAN.PSR = CAN_PS_TXMB1;
3064  01bc 35015427      	mov	_CAN+7,#1
3065                     ; 288 		MailboxNumber = 2;		
3067  01c0 a602          	ld	a,#2
3068  01c2 6b01          	ld	(OFST+0,sp),a
3070  01c4 200f          	jra	L5261
3071  01c6               L7261:
3072                     ; 290 	else if(CAN.TPR & CAN_TPR_TME2)	/* Mailbox 3 empty ? */
3074  01c6 c65423        	ld	a,_CAN+3
3075  01c9 a510          	bcp	a,#16
3076  01cb 2768          	jreq	L3361
3077                     ; 292 		CAN.PSR = CAN_PS_TXMB2;
3079  01cd 35055427      	mov	_CAN+7,#5
3080                     ; 293 		MailboxNumber = 3;		
3082  01d1 a603          	ld	a,#3
3083  01d3 6b01          	ld	(OFST+0,sp),a
3085  01d5               L5261:
3086                     ; 302     CAN_PAGE_MDLCR = pCanMsg->dlc;
3088  01d5 1e02          	ldw	x,(OFST+1,sp)
3089  01d7 e604          	ld	a,(4,x)
3090  01d9 c75429        	ld	_CAN+9,a
3091                     ; 304     *((u32*)&CAN_PAGE_MIDR1)=pCanMsg->id;
3093  01dc 1e02          	ldw	x,(OFST+1,sp)
3094  01de e603          	ld	a,(3,x)
3095  01e0 c7542d        	ld	_CAN+13,a
3096  01e3 e602          	ld	a,(2,x)
3097  01e5 c7542c        	ld	_CAN+12,a
3098  01e8 e601          	ld	a,(1,x)
3099  01ea c7542b        	ld	_CAN+11,a
3100  01ed f6            	ld	a,(x)
3101  01ee c7542a        	ld	_CAN+10,a
3102                     ; 305     CAN_PAGE_MIDR1|= CAN_ID_EXT;
3104  01f1 721c542a      	bset	_CAN+10,#6
3105                     ; 307     CAN_PAGE_MDAR1 =pCanMsg->data[0];
3107  01f5 1e02          	ldw	x,(OFST+1,sp)
3108  01f7 e605          	ld	a,(5,x)
3109  01f9 c7542e        	ld	_CAN+14,a
3110                     ; 308     CAN_PAGE_MDAR2 =pCanMsg->data[1];
3112  01fc 1e02          	ldw	x,(OFST+1,sp)
3113  01fe e606          	ld	a,(6,x)
3114  0200 c7542f        	ld	_CAN+15,a
3115                     ; 309     CAN_PAGE_MDAR3 =pCanMsg->data[2];
3117  0203 1e02          	ldw	x,(OFST+1,sp)
3118  0205 e607          	ld	a,(7,x)
3119  0207 c75430        	ld	_CAN+16,a
3120                     ; 310     CAN_PAGE_MDAR4 =pCanMsg->data[3];
3122  020a 1e02          	ldw	x,(OFST+1,sp)
3123  020c e608          	ld	a,(8,x)
3124  020e c75431        	ld	_CAN+17,a
3125                     ; 311     CAN_PAGE_MDAR5 =pCanMsg->data[4];
3127  0211 1e02          	ldw	x,(OFST+1,sp)
3128  0213 e609          	ld	a,(9,x)
3129  0215 c75432        	ld	_CAN+18,a
3130                     ; 312     CAN_PAGE_MDAR6 =pCanMsg->data[5];
3132  0218 1e02          	ldw	x,(OFST+1,sp)
3133  021a e60a          	ld	a,(10,x)
3134  021c c75433        	ld	_CAN+19,a
3135                     ; 313     CAN_PAGE_MDAR7 =pCanMsg->data[6];
3137  021f 1e02          	ldw	x,(OFST+1,sp)
3138  0221 e60b          	ld	a,(11,x)
3139  0223 c75434        	ld	_CAN+20,a
3140                     ; 314     CAN_PAGE_MDAR8 =pCanMsg->data[7];
3142  0226 1e02          	ldw	x,(OFST+1,sp)
3143  0228 e60c          	ld	a,(12,x)
3144  022a c75435        	ld	_CAN+21,a
3145                     ; 316     CAN_PAGE_MCSR |=CAN_PAGE_MCSR_TXRQ;
3147  022d 72105428      	bset	_CAN+8,#0
3148                     ; 317 	return(TRUE);
3150  0231 a601          	ld	a,#1
3152  0233 2001          	jra	L61
3153  0235               L3361:
3154                     ; 297 		return (FALSE);
3156  0235 4f            	clr	a
3158  0236               L61:
3160  0236 5b03          	addw	sp,#3
3161  0238 87            	retf
3186                     ; 327 void CanInterruptDisable(void)
3186                     ; 328 {
3187                     	switch	.text
3188  0239               f_CanInterruptDisable:
3192                     ; 329 	CanSavePg();
3194  0239 5554270000    	mov	_CanPage,_CAN+7
3195                     ; 331 	CAN.IER = 0x00; 
3197  023e 725f5425      	clr	_CAN+5
3198                     ; 332 	CAN.PSR = CAN_PS_CTRL;         
3200  0242 35065427      	mov	_CAN+7,#6
3201                     ; 333 	CAN_PAGE_EIER = 0x00;
3203  0246 725f5429      	clr	_CAN+9
3204                     ; 335 	CanRestorePg();
3206  024a 5500005427    	mov	_CAN+7,_CanPage
3207                     ; 336 }
3210  024f 87            	retf
3235                     ; 345 void CanInterruptRestore (void)
3235                     ; 346 {
3236                     	switch	.text
3237  0250               f_CanInterruptRestore:
3241                     ; 347 	CanSavePg();
3243  0250 5554270000    	mov	_CanPage,_CAN+7
3244                     ; 349 	CAN.IER = 	//CAN_IER_WKUIE |	/* Wake-up Interrupt */
3244                     ; 350 				CAN_IER_FOVIE /* FIFO overrun Interrupt */
3244                     ; 351 				|CAN_IER_FFIE /* FIFO Full Interrupt */
3244                     ; 352 				|CAN_IER_FMPIE /* FIFO Message Pending Interrupt */
3244                     ; 353 				//|CAN_IER_TMEIE	/* Transmit Mailbox Empty Interrupt */
3244                     ; 354                 ;
3246  0255 350e5425      	mov	_CAN+5,#14
3247                     ; 355 	CAN.PSR = CAN_PS_CTRL;
3249  0259 35065427      	mov	_CAN+7,#6
3250                     ; 356 	CAN_PAGE_EIER = CAN_PAGE_EIER_ERRIE|    /* Error Interrupt */
3250                     ; 357 				    CAN_PAGE_EIER_LECIE|        /* Last Error Code Interrupt */
3250                     ; 358 				    CAN_PAGE_EIER_BOFIE|        /* Bus-Off Interrupt */
3250                     ; 359 				    CAN_PAGE_EIER_EPVIE|        /* Error Passive Interrupt */
3250                     ; 360 				    CAN_PAGE_EIER_EWGIE;        /* Error Warning Interrupt */
3252  025d 35975429      	mov	_CAN+9,#151
3253                     ; 362 	CanRestorePg();
3255  0261 5500005427    	mov	_CAN+7,_CanPage
3256                     ; 363 }
3259  0266 87            	retf
3304                     ; 366 void Can_Store_Rcvd_Msg(void)	//中断服务程序中执行
3304                     ; 367 {
3305                     	switch	.text
3306  0267               f_Can_Store_Rcvd_Msg:
3308  0267 5203          	subw	sp,#3
3309       00000003      OFST:	set	3
3312                     ; 369 	u8 *u8p =&CAN_PAGE_MDAR1;
3314  0269 ae542e        	ldw	x,#_CAN+14
3315  026c 1f01          	ldw	(OFST-2,sp),x
3316                     ; 370 	CLEAR_WATCHDOG;
3318  026e 357f50d1      	mov	_WWDG,#127
3319                     ; 371 	CAN.PSR = CAN_PS_FIFO; //进入接收数据FIFO页面
3322  0272 35075427      	mov	_CAN+7,#7
3323                     ; 372     CanTxRxBuffer.id =CAN_PAGE_MIDR1&0x1F;
3325  0276 c6542a        	ld	a,_CAN+10
3326  0279 a41f          	and	a,#31
3327  027b c70003        	ld	_CanTxRxBuffer+3,a
3328  027e 4f            	clr	a
3329  027f c70002        	ld	_CanTxRxBuffer+2,a
3330  0282 c70001        	ld	_CanTxRxBuffer+1,a
3331  0285 c70000        	ld	_CanTxRxBuffer,a
3332                     ; 373     CanTxRxBuffer.id <<=8; //移位计算更优
3334  0288 ae0000        	ldw	x,#_CanTxRxBuffer
3335  028b a608          	ld	a,#8
3336  028d 8d000000      	callf	d_lglsh
3338                     ; 374     CanTxRxBuffer.id +=CAN_PAGE_MIDR2;
3340  0291 c6542b        	ld	a,_CAN+11
3341  0294 ae0000        	ldw	x,#_CanTxRxBuffer
3342  0297 88            	push	a
3343  0298 8d000000      	callf	d_lgadc
3345  029c 84            	pop	a
3346                     ; 375     CanTxRxBuffer.id <<=8;
3348  029d ae0000        	ldw	x,#_CanTxRxBuffer
3349  02a0 a608          	ld	a,#8
3350  02a2 8d000000      	callf	d_lglsh
3352                     ; 376     CanTxRxBuffer.id +=CAN_PAGE_MIDR3;
3354  02a6 c6542c        	ld	a,_CAN+12
3355  02a9 ae0000        	ldw	x,#_CanTxRxBuffer
3356  02ac 88            	push	a
3357  02ad 8d000000      	callf	d_lgadc
3359  02b1 84            	pop	a
3360                     ; 377     CanTxRxBuffer.id <<=8;
3362  02b2 ae0000        	ldw	x,#_CanTxRxBuffer
3363  02b5 a608          	ld	a,#8
3364  02b7 8d000000      	callf	d_lglsh
3366                     ; 378     CanTxRxBuffer.id +=CAN_PAGE_MIDR4;
3368  02bb c6542d        	ld	a,_CAN+13
3369  02be ae0000        	ldw	x,#_CanTxRxBuffer
3370  02c1 88            	push	a
3371  02c2 8d000000      	callf	d_lgadc
3373  02c6 84            	pop	a
3374                     ; 379 	CanTxRxBuffer.dlc= CAN_PAGE_MDLCR; //此帧长度(字节数)
3376  02c7 5554290004    	mov	_CanTxRxBuffer+4,_CAN+9
3377                     ; 380 	for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
3379  02cc 0f03          	clr	(OFST+0,sp)
3381  02ce 2017          	jra	L3071
3382  02d0               L7761:
3383                     ; 382 		CanTxRxBuffer.data[idx]=u8p[idx];
3385  02d0 7b03          	ld	a,(OFST+0,sp)
3386  02d2 5f            	clrw	x
3387  02d3 97            	ld	xl,a
3388  02d4 89            	pushw	x
3389  02d5 7b03          	ld	a,(OFST+0,sp)
3390  02d7 97            	ld	xl,a
3391  02d8 7b04          	ld	a,(OFST+1,sp)
3392  02da 1b05          	add	a,(OFST+2,sp)
3393  02dc 2401          	jrnc	L62
3394  02de 5c            	incw	x
3395  02df               L62:
3396  02df 02            	rlwa	x,a
3397  02e0 f6            	ld	a,(x)
3398  02e1 85            	popw	x
3399  02e2 d70005        	ld	(_CanTxRxBuffer+5,x),a
3400                     ; 380 	for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
3402  02e5 0c03          	inc	(OFST+0,sp)
3403  02e7               L3071:
3406  02e7 c60004        	ld	a,_CanTxRxBuffer+4
3407  02ea 1103          	cp	a,(OFST+0,sp)
3408  02ec 22e2          	jrugt	L7761
3409                     ; 384     CanMsgAnalyze(&CanTxRxBuffer);
3411  02ee ae0000        	ldw	x,#_CanTxRxBuffer
3412  02f1 8d5b035b      	callf	L5531f_CanMsgAnalyze
3414                     ; 385 }
3417  02f5 5b03          	addw	sp,#3
3418  02f7 87            	retf
3451                     ; 395 void ISR_Can_Tx(void)
3451                     ; 396 {
3452                     	switch	.text
3453  02f8               f_ISR_Can_Tx:
3455  02f8 88            	push	a
3456       00000001      OFST:	set	1
3459                     ; 398     CanSavePg();
3461  02f9 5554270000    	mov	_CanPage,_CAN+7
3462                     ; 400     CAN.PSR =CAN_PS_CTRL;
3464  02fe 35065427      	mov	_CAN+7,#6
3465                     ; 401     if(CAN_PAGE_ESR)
3467  0302 725d5428      	tnz	_CAN+8
3468  0306 2714          	jreq	L3271
3469                     ; 403         ErrorCode=CAN_PAGE_ESR;
3471  0308 c65428        	ld	a,_CAN+8
3472  030b 6b01          	ld	(OFST+0,sp),a
3473                     ; 404         if((CAN_PAGE_ESR&CAN_PAGE_ESR_LEC)!=0)
3475  030d c65428        	ld	a,_CAN+8
3476  0310 a570          	bcp	a,#112
3477  0312 2704          	jreq	L5271
3478                     ; 406             CAN_PAGE_ESR =0;//|=CAN_PAGE_ESR_LEC;
3480  0314 725f5428      	clr	_CAN+8
3481  0318               L5271:
3482                     ; 408         CAN.MSR |=CAN_MSR_ERRI;
3484  0318 72145421      	bset	_CAN+1,#2
3485  031c               L3271:
3486                     ; 410     CanRestorePg();
3488  031c 5500005427    	mov	_CAN+7,_CanPage
3489                     ; 411 }
3492  0321 84            	pop	a
3493  0322 87            	retf
3518                     ; 422 void ISR_Can_Rx(void)
3518                     ; 423 {
3519                     	switch	.text
3520  0323               f_ISR_Can_Rx:
3524                     ; 424 	CanSavePg();   
3526  0323 5554270000    	mov	_CanPage,_CAN+7
3527                     ; 426 	if (CAN.RFR & CAN_RFR_FOVR)
3529  0328 c65424        	ld	a,_CAN+4
3530  032b a510          	bcp	a,#16
3531  032d 2706          	jreq	L7371
3532                     ; 428 		CAN.RFR |= CAN_RFR_FOVR;		/* clear the FIFO Overrun (FOVR) bit */
3534  032f 72185424      	bset	_CAN+4,#4
3536  0333 2019          	jra	L7471
3537  0335               L7371:
3538                     ; 430 	else if (CAN.RFR & CAN_RFR_FULL)
3540  0335 c65424        	ld	a,_CAN+4
3541  0338 a508          	bcp	a,#8
3542  033a 2712          	jreq	L7471
3543                     ; 432 		CAN.RFR |= CAN_RFR_FULL;		/* clear the FIFO full (FULL) bit */      
3545  033c 72165424      	bset	_CAN+4,#3
3546  0340 200c          	jra	L7471
3547  0342               L5471:
3548                     ; 436         Can_Store_Rcvd_Msg();
3550  0342 8d670267      	callf	f_Can_Store_Rcvd_Msg
3552                     ; 437         CAN.RFR |= CAN_RFR_RFOM; // Release mailbox
3554  0346 721a5424      	bset	_CAN+4,#5
3555                     ; 438 		CAN.RFR |= CAN_RFR_RFOM; //此语句要用2句,原因还没搞明白
3557  034a 721a5424      	bset	_CAN+4,#5
3558  034e               L7471:
3559                     ; 434 	while (CAN.RFR & CAN_RFR_FMP)	/* Check until FMP != 0 */
3561  034e c65424        	ld	a,_CAN+4
3562  0351 a503          	bcp	a,#3
3563  0353 26ed          	jrne	L5471
3564                     ; 440 	CanRestorePg();
3566  0355 5500005427    	mov	_CAN+7,_CanPage
3567                     ; 441 }
3570  035a 87            	retf
3636                     .const:	section	.text
3637  0000               L24:
3638  0000 04020000      	dc.l	67239936
3639  0004               L1302:
3640  0004 0004          	dc.w	4
3641  0006 00000000      	dc.l	0
3642  000a 05f2          	dc.w	L3671
3643  000c 04010000      	dc.l	67174400
3644  0010 038c          	dc.w	L7571
3645  0012 04030000      	dc.l	67305472
3646  0016 037d          	dc.w	L3571
3647  0018 04040000      	dc.l	67371008
3648  001c 0381          	dc.w	L5571
3649  001e 060a          	dc.w	L3302
3650                     ; 452 static void CanMsgAnalyze(CanMsgTypeDef *pCanMsg)
3650                     ; 453 {
3651                     	scross	off
3652                     	switch	.text
3653  035b               L5531f_CanMsgAnalyze:
3655  035b 89            	pushw	x
3656  035c 5212          	subw	sp,#18
3657       00000012      OFST:	set	18
3660                     ; 455     u32 u32CanId=pCanMsg->id & 0xFFFF0000;
3662  035e 8d000000      	callf	d_ltor
3664  0362 3f03          	clr	c_lreg+3
3665  0364 3f02          	clr	c_lreg+2
3666  0366 96            	ldw	x,sp
3667  0367 1c0001        	addw	x,#OFST-17
3668  036a 8d000000      	callf	d_rtol
3670                     ; 458     switch(u32CanId)
3672  036e 96            	ldw	x,sp
3673  036f 1c0001        	addw	x,#OFST-17
3674  0372 8d000000      	callf	d_ltor
3677  0376 ae0004        	ldw	x,#L1302
3678  0379 8d000000      	callf	d_jltab
3679  037d               L3571:
3680                     ; 465             break;
3682  037d ac0a060a      	jpf	L3302
3683  0381               L5571:
3684                     ; 470             LED=pCanMsg->data[0];
3686  0381 1e13          	ldw	x,(OFST+1,sp)
3687  0383 e605          	ld	a,(5,x)
3688  0385 c7500a        	ld	_GPIOC,a
3689                     ; 473             break;
3691  0388 ac0a060a      	jpf	L3302
3692  038c               L7571:
3693                     ; 478             for(i=0;i<NODEIDLIST_MAX_NUM;i++)
3695  038c 0f12          	clr	(OFST+0,sp)
3696  038e               L5302:
3697                     ; 480                 if(eep_NodeIdList[i].address[0]==pCanMsg->data[0]
3697                     ; 481                  &&eep_NodeIdList[i].address[1]==pCanMsg->data[1]
3697                     ; 482                  &&eep_NodeIdList[i].address[2]==pCanMsg->data[2]
3697                     ; 483                  &&eep_NodeIdList[i].address[3]==pCanMsg->data[3]
3697                     ; 484                  &&eep_NodeIdList[i].address[4]==pCanMsg->data[4]
3697                     ; 485                  &&eep_NodeIdList[i].address[5]==pCanMsg->data[5]
3697                     ; 486                  &&eep_NodeIdList[i].address[6]==pCanMsg->data[6]
3697                     ; 487                  &&eep_NodeIdList[i].address[7]==pCanMsg->data[7]
3697                     ; 488                 )
3699  038e 7b12          	ld	a,(OFST+0,sp)
3700  0390 97            	ld	xl,a
3701  0391 a60a          	ld	a,#10
3702  0393 42            	mul	x,a
3703  0394 d64102        	ld	a,(_eep_NodeIdList+2,x)
3704  0397 1e13          	ldw	x,(OFST+1,sp)
3705  0399 e105          	cp	a,(5,x)
3706  039b 2669          	jrne	L3402
3708  039d 7b12          	ld	a,(OFST+0,sp)
3709  039f 97            	ld	xl,a
3710  03a0 a60a          	ld	a,#10
3711  03a2 42            	mul	x,a
3712  03a3 d64103        	ld	a,(_eep_NodeIdList+3,x)
3713  03a6 1e13          	ldw	x,(OFST+1,sp)
3714  03a8 e106          	cp	a,(6,x)
3715  03aa 265a          	jrne	L3402
3717  03ac 7b12          	ld	a,(OFST+0,sp)
3718  03ae 97            	ld	xl,a
3719  03af a60a          	ld	a,#10
3720  03b1 42            	mul	x,a
3721  03b2 d64104        	ld	a,(_eep_NodeIdList+4,x)
3722  03b5 1e13          	ldw	x,(OFST+1,sp)
3723  03b7 e107          	cp	a,(7,x)
3724  03b9 264b          	jrne	L3402
3726  03bb 7b12          	ld	a,(OFST+0,sp)
3727  03bd 97            	ld	xl,a
3728  03be a60a          	ld	a,#10
3729  03c0 42            	mul	x,a
3730  03c1 d64105        	ld	a,(_eep_NodeIdList+5,x)
3731  03c4 1e13          	ldw	x,(OFST+1,sp)
3732  03c6 e108          	cp	a,(8,x)
3733  03c8 263c          	jrne	L3402
3735  03ca 7b12          	ld	a,(OFST+0,sp)
3736  03cc 97            	ld	xl,a
3737  03cd a60a          	ld	a,#10
3738  03cf 42            	mul	x,a
3739  03d0 d64106        	ld	a,(_eep_NodeIdList+6,x)
3740  03d3 1e13          	ldw	x,(OFST+1,sp)
3741  03d5 e109          	cp	a,(9,x)
3742  03d7 262d          	jrne	L3402
3744  03d9 7b12          	ld	a,(OFST+0,sp)
3745  03db 97            	ld	xl,a
3746  03dc a60a          	ld	a,#10
3747  03de 42            	mul	x,a
3748  03df d64107        	ld	a,(_eep_NodeIdList+7,x)
3749  03e2 1e13          	ldw	x,(OFST+1,sp)
3750  03e4 e10a          	cp	a,(10,x)
3751  03e6 261e          	jrne	L3402
3753  03e8 7b12          	ld	a,(OFST+0,sp)
3754  03ea 97            	ld	xl,a
3755  03eb a60a          	ld	a,#10
3756  03ed 42            	mul	x,a
3757  03ee d64108        	ld	a,(_eep_NodeIdList+8,x)
3758  03f1 1e13          	ldw	x,(OFST+1,sp)
3759  03f3 e10b          	cp	a,(11,x)
3760  03f5 260f          	jrne	L3402
3762  03f7 7b12          	ld	a,(OFST+0,sp)
3763  03f9 97            	ld	xl,a
3764  03fa a60a          	ld	a,#10
3765  03fc 42            	mul	x,a
3766  03fd d64109        	ld	a,(_eep_NodeIdList+9,x)
3767  0400 1e13          	ldw	x,(OFST+1,sp)
3768  0402 e10c          	cp	a,(12,x)
3769  0404 2708          	jreq	L1402
3770                     ; 490                     break;
3772  0406               L3402:
3773                     ; 478             for(i=0;i<NODEIDLIST_MAX_NUM;i++)
3775  0406 0c12          	inc	(OFST+0,sp)
3778  0408 7b12          	ld	a,(OFST+0,sp)
3779  040a a119          	cp	a,#25
3780  040c 2580          	jrult	L5302
3781  040e               L1402:
3782                     ; 493             if(NODEIDLIST_MAX_NUM==i)
3784  040e 7b12          	ld	a,(OFST+0,sp)
3785  0410 a119          	cp	a,#25
3786  0412 2703          	jreq	L64
3787  0414 cc04ed        	jp	L5402
3788  0417               L64:
3789                     ; 495                 for(i=0;i<NODEIDLIST_MAX_NUM;i++)
3791  0417 0f12          	clr	(OFST+0,sp)
3792  0419               L7402:
3793                     ; 497                     if(0==eep_NodeIdList[i].nodeid.F_valid)
3795  0419 7b12          	ld	a,(OFST+0,sp)
3796  041b 97            	ld	xl,a
3797  041c a60a          	ld	a,#10
3798  041e 42            	mul	x,a
3799  041f d64101        	ld	a,(_eep_NodeIdList+1,x)
3800  0422 a501          	bcp	a,#1
3801  0424 2703          	jreq	L05
3802  0426 cc04d1        	jp	L5502
3803  0429               L05:
3804                     ; 499                         eep_NodeIdList[i].nodeid.F_valid=1;
3806  0429 7b12          	ld	a,(OFST+0,sp)
3807  042b 97            	ld	xl,a
3808  042c a60a          	ld	a,#10
3809  042e 42            	mul	x,a
3810  042f d64101        	ld	a,(_eep_NodeIdList+1,x)
3811  0432 aa01          	or	a,#1
3812  0434 d74101        	ld	(_eep_NodeIdList+1,x),a
3813                     ; 500                         eep_NodeIdList[i].nodeid.id=i+1;
3815  0437 7b12          	ld	a,(OFST+0,sp)
3816  0439 97            	ld	xl,a
3817  043a a60a          	ld	a,#10
3818  043c 42            	mul	x,a
3819  043d 89            	pushw	x
3820  043e a600          	ld	a,#0
3821  0440 97            	ld	xl,a
3822  0441 a601          	ld	a,#1
3823  0443 1b14          	add	a,(OFST+2,sp)
3824  0445 2401          	jrnc	L63
3825  0447 5c            	incw	x
3826  0448               L63:
3827  0448 9085          	popw	y
3828  044a 48            	sll	a
3829  044b 59            	rlcw	x
3830  044c 90d84101      	xor	a,	(_eep_NodeIdList+1,y)
3831  0450 a4fe          	and	a,#254
3832  0452 90d84101      	xor	a,	(_eep_NodeIdList+1,y)
3833  0456 90d74101      	ld		(_eep_NodeIdList+1,y),a
3834  045a 9f            	ld	a,xl
3835  045b 90d74100      	ld	(_eep_NodeIdList,y),a
3836                     ; 501                         eep_NodeIdList[i].address[0]=pCanMsg->data[0];
3838  045f 7b12          	ld	a,(OFST+0,sp)
3839  0461 97            	ld	xl,a
3840  0462 a60a          	ld	a,#10
3841  0464 42            	mul	x,a
3842  0465 1613          	ldw	y,(OFST+1,sp)
3843  0467 90e605        	ld	a,(5,y)
3844  046a d74102        	ld	(_eep_NodeIdList+2,x),a
3845                     ; 502                         eep_NodeIdList[i].address[1]=pCanMsg->data[1];
3847  046d 7b12          	ld	a,(OFST+0,sp)
3848  046f 97            	ld	xl,a
3849  0470 a60a          	ld	a,#10
3850  0472 42            	mul	x,a
3851  0473 1613          	ldw	y,(OFST+1,sp)
3852  0475 90e606        	ld	a,(6,y)
3853  0478 d74103        	ld	(_eep_NodeIdList+3,x),a
3854                     ; 503                         eep_NodeIdList[i].address[2]=pCanMsg->data[2];
3856  047b 7b12          	ld	a,(OFST+0,sp)
3857  047d 97            	ld	xl,a
3858  047e a60a          	ld	a,#10
3859  0480 42            	mul	x,a
3860  0481 1613          	ldw	y,(OFST+1,sp)
3861  0483 90e607        	ld	a,(7,y)
3862  0486 d74104        	ld	(_eep_NodeIdList+4,x),a
3863                     ; 504                         eep_NodeIdList[i].address[3]=pCanMsg->data[3];
3865  0489 7b12          	ld	a,(OFST+0,sp)
3866  048b 97            	ld	xl,a
3867  048c a60a          	ld	a,#10
3868  048e 42            	mul	x,a
3869  048f 1613          	ldw	y,(OFST+1,sp)
3870  0491 90e608        	ld	a,(8,y)
3871  0494 d74105        	ld	(_eep_NodeIdList+5,x),a
3872                     ; 505                         eep_NodeIdList[i].address[4]=pCanMsg->data[4];
3874  0497 7b12          	ld	a,(OFST+0,sp)
3875  0499 97            	ld	xl,a
3876  049a a60a          	ld	a,#10
3877  049c 42            	mul	x,a
3878  049d 1613          	ldw	y,(OFST+1,sp)
3879  049f 90e609        	ld	a,(9,y)
3880  04a2 d74106        	ld	(_eep_NodeIdList+6,x),a
3881                     ; 506                         eep_NodeIdList[i].address[5]=pCanMsg->data[5];
3883  04a5 7b12          	ld	a,(OFST+0,sp)
3884  04a7 97            	ld	xl,a
3885  04a8 a60a          	ld	a,#10
3886  04aa 42            	mul	x,a
3887  04ab 1613          	ldw	y,(OFST+1,sp)
3888  04ad 90e60a        	ld	a,(10,y)
3889  04b0 d74107        	ld	(_eep_NodeIdList+7,x),a
3890                     ; 507                         eep_NodeIdList[i].address[6]=pCanMsg->data[6];
3892  04b3 7b12          	ld	a,(OFST+0,sp)
3893  04b5 97            	ld	xl,a
3894  04b6 a60a          	ld	a,#10
3895  04b8 42            	mul	x,a
3896  04b9 1613          	ldw	y,(OFST+1,sp)
3897  04bb 90e60b        	ld	a,(11,y)
3898  04be d74108        	ld	(_eep_NodeIdList+8,x),a
3899                     ; 508                         eep_NodeIdList[i].address[7]=pCanMsg->data[7];
3901  04c1 7b12          	ld	a,(OFST+0,sp)
3902  04c3 97            	ld	xl,a
3903  04c4 a60a          	ld	a,#10
3904  04c6 42            	mul	x,a
3905  04c7 1613          	ldw	y,(OFST+1,sp)
3906  04c9 90e60c        	ld	a,(12,y)
3907  04cc d74109        	ld	(_eep_NodeIdList+9,x),a
3908                     ; 509                         break;
3910  04cf 200b          	jra	L3502
3911  04d1               L5502:
3912                     ; 495                 for(i=0;i<NODEIDLIST_MAX_NUM;i++)
3914  04d1 0c12          	inc	(OFST+0,sp)
3917  04d3 7b12          	ld	a,(OFST+0,sp)
3918  04d5 a119          	cp	a,#25
3919  04d7 2403          	jruge	L25
3920  04d9 cc0419        	jp	L7402
3921  04dc               L25:
3922  04dc               L3502:
3923                     ; 512                 if(NODEIDLIST_MAX_NUM==i)
3925  04dc 7b12          	ld	a,(OFST+0,sp)
3926  04de a119          	cp	a,#25
3927  04e0 2603          	jrne	L45
3928  04e2 cc060e        	jp	L44
3929  04e5               L45:
3930                     ; 514                     return;
3932                     ; 516                 NodeIdListNodeNum++;
3934  04e5 725c41fa      	inc	_NodeIdListNodeNum
3936  04e9 ac930593      	jpf	L1602
3937  04ed               L5402:
3938                     ; 520                 eep_NodeIdList[i].nodeid.F_valid=1;
3940  04ed 7b12          	ld	a,(OFST+0,sp)
3941  04ef 97            	ld	xl,a
3942  04f0 a60a          	ld	a,#10
3943  04f2 42            	mul	x,a
3944  04f3 d64101        	ld	a,(_eep_NodeIdList+1,x)
3945  04f6 aa01          	or	a,#1
3946  04f8 d74101        	ld	(_eep_NodeIdList+1,x),a
3947                     ; 521                 eep_NodeIdList[i].nodeid.id=i+1;
3949  04fb 7b12          	ld	a,(OFST+0,sp)
3950  04fd 97            	ld	xl,a
3951  04fe a60a          	ld	a,#10
3952  0500 42            	mul	x,a
3953  0501 89            	pushw	x
3954  0502 a600          	ld	a,#0
3955  0504 97            	ld	xl,a
3956  0505 a601          	ld	a,#1
3957  0507 1b14          	add	a,(OFST+2,sp)
3958  0509 2401          	jrnc	L04
3959  050b 5c            	incw	x
3960  050c               L04:
3961  050c 9085          	popw	y
3962  050e 48            	sll	a
3963  050f 59            	rlcw	x
3964  0510 90d84101      	xor	a,	(_eep_NodeIdList+1,y)
3965  0514 a4fe          	and	a,#254
3966  0516 90d84101      	xor	a,	(_eep_NodeIdList+1,y)
3967  051a 90d74101      	ld		(_eep_NodeIdList+1,y),a
3968  051e 9f            	ld	a,xl
3969  051f 90d74100      	ld	(_eep_NodeIdList,y),a
3970                     ; 522                 eep_NodeIdList[i].address[0]=pCanMsg->data[0];
3972  0523 7b12          	ld	a,(OFST+0,sp)
3973  0525 97            	ld	xl,a
3974  0526 a60a          	ld	a,#10
3975  0528 42            	mul	x,a
3976  0529 1613          	ldw	y,(OFST+1,sp)
3977  052b 90e605        	ld	a,(5,y)
3978  052e d74102        	ld	(_eep_NodeIdList+2,x),a
3979                     ; 523                 eep_NodeIdList[i].address[1]=pCanMsg->data[1];
3981  0531 7b12          	ld	a,(OFST+0,sp)
3982  0533 97            	ld	xl,a
3983  0534 a60a          	ld	a,#10
3984  0536 42            	mul	x,a
3985  0537 1613          	ldw	y,(OFST+1,sp)
3986  0539 90e606        	ld	a,(6,y)
3987  053c d74103        	ld	(_eep_NodeIdList+3,x),a
3988                     ; 524                 eep_NodeIdList[i].address[2]=pCanMsg->data[2];
3990  053f 7b12          	ld	a,(OFST+0,sp)
3991  0541 97            	ld	xl,a
3992  0542 a60a          	ld	a,#10
3993  0544 42            	mul	x,a
3994  0545 1613          	ldw	y,(OFST+1,sp)
3995  0547 90e607        	ld	a,(7,y)
3996  054a d74104        	ld	(_eep_NodeIdList+4,x),a
3997                     ; 525                 eep_NodeIdList[i].address[3]=pCanMsg->data[3];
3999  054d 7b12          	ld	a,(OFST+0,sp)
4000  054f 97            	ld	xl,a
4001  0550 a60a          	ld	a,#10
4002  0552 42            	mul	x,a
4003  0553 1613          	ldw	y,(OFST+1,sp)
4004  0555 90e608        	ld	a,(8,y)
4005  0558 d74105        	ld	(_eep_NodeIdList+5,x),a
4006                     ; 526                 eep_NodeIdList[i].address[4]=pCanMsg->data[4];
4008  055b 7b12          	ld	a,(OFST+0,sp)
4009  055d 97            	ld	xl,a
4010  055e a60a          	ld	a,#10
4011  0560 42            	mul	x,a
4012  0561 1613          	ldw	y,(OFST+1,sp)
4013  0563 90e609        	ld	a,(9,y)
4014  0566 d74106        	ld	(_eep_NodeIdList+6,x),a
4015                     ; 527                 eep_NodeIdList[i].address[5]=pCanMsg->data[5];
4017  0569 7b12          	ld	a,(OFST+0,sp)
4018  056b 97            	ld	xl,a
4019  056c a60a          	ld	a,#10
4020  056e 42            	mul	x,a
4021  056f 1613          	ldw	y,(OFST+1,sp)
4022  0571 90e60a        	ld	a,(10,y)
4023  0574 d74107        	ld	(_eep_NodeIdList+7,x),a
4024                     ; 528                 eep_NodeIdList[i].address[6]=pCanMsg->data[6];
4026  0577 7b12          	ld	a,(OFST+0,sp)
4027  0579 97            	ld	xl,a
4028  057a a60a          	ld	a,#10
4029  057c 42            	mul	x,a
4030  057d 1613          	ldw	y,(OFST+1,sp)
4031  057f 90e60b        	ld	a,(11,y)
4032  0582 d74108        	ld	(_eep_NodeIdList+8,x),a
4033                     ; 529                 eep_NodeIdList[i].address[7]=pCanMsg->data[7];
4035  0585 7b12          	ld	a,(OFST+0,sp)
4036  0587 97            	ld	xl,a
4037  0588 a60a          	ld	a,#10
4038  058a 42            	mul	x,a
4039  058b 1613          	ldw	y,(OFST+1,sp)
4040  058d 90e60c        	ld	a,(12,y)
4041  0590 d74109        	ld	(_eep_NodeIdList+9,x),a
4042  0593               L1602:
4043                     ; 531             CanBuffer.data[0]=pCanMsg->data[0];
4045  0593 1e13          	ldw	x,(OFST+1,sp)
4046  0595 e605          	ld	a,(5,x)
4047  0597 6b0a          	ld	(OFST-8,sp),a
4048                     ; 532             CanBuffer.data[1]=pCanMsg->data[1];
4050  0599 1e13          	ldw	x,(OFST+1,sp)
4051  059b e606          	ld	a,(6,x)
4052  059d 6b0b          	ld	(OFST-7,sp),a
4053                     ; 533             CanBuffer.data[2]=pCanMsg->data[2];
4055  059f 1e13          	ldw	x,(OFST+1,sp)
4056  05a1 e607          	ld	a,(7,x)
4057  05a3 6b0c          	ld	(OFST-6,sp),a
4058                     ; 534             CanBuffer.data[3]=pCanMsg->data[3];
4060  05a5 1e13          	ldw	x,(OFST+1,sp)
4061  05a7 e608          	ld	a,(8,x)
4062  05a9 6b0d          	ld	(OFST-5,sp),a
4063                     ; 535             CanBuffer.data[4]=pCanMsg->data[4];
4065  05ab 1e13          	ldw	x,(OFST+1,sp)
4066  05ad e609          	ld	a,(9,x)
4067  05af 6b0e          	ld	(OFST-4,sp),a
4068                     ; 536             CanBuffer.data[5]=pCanMsg->data[5];
4070  05b1 1e13          	ldw	x,(OFST+1,sp)
4071  05b3 e60a          	ld	a,(10,x)
4072  05b5 6b0f          	ld	(OFST-3,sp),a
4073                     ; 537             CanBuffer.data[6]=pCanMsg->data[6];
4075  05b7 1e13          	ldw	x,(OFST+1,sp)
4076  05b9 e60b          	ld	a,(11,x)
4077  05bb 6b10          	ld	(OFST-2,sp),a
4078                     ; 538             CanBuffer.data[7]=pCanMsg->data[7];
4080  05bd 1e13          	ldw	x,(OFST+1,sp)
4081  05bf e60c          	ld	a,(12,x)
4082  05c1 6b11          	ld	(OFST-1,sp),a
4083                     ; 539             CanBuffer.id =CANID_NODEREGISTER_SUCCESS+eep_NodeIdList[i].nodeid.id;
4085  05c3 7b12          	ld	a,(OFST+0,sp)
4086  05c5 97            	ld	xl,a
4087  05c6 a60a          	ld	a,#10
4088  05c8 42            	mul	x,a
4089  05c9 de4100        	ldw	x,(_eep_NodeIdList,x)
4090  05cc 54            	srlw	x
4091  05cd 01            	rrwa	x,a
4092  05ce 02            	rlwa	x,a
4093  05cf 8d000000      	callf	d_uitolx
4095  05d3 ae0000        	ldw	x,#L24
4096  05d6 8d000000      	callf	d_ladd
4098  05da 96            	ldw	x,sp
4099  05db 1c0005        	addw	x,#OFST-13
4100  05de 8d000000      	callf	d_rtol
4102                     ; 540             CanBuffer.dlc =8;
4104  05e2 a608          	ld	a,#8
4105  05e4 6b09          	ld	(OFST-9,sp),a
4106                     ; 541             SendToCan(&CanBuffer);
4108  05e6 96            	ldw	x,sp
4109  05e7 1c0005        	addw	x,#OFST-13
4110  05ea 8d3c063c      	callf	f_SendToCan
4112                     ; 543             break;
4114  05ee 201a          	jra	L3302
4115  05f0               L1671:
4116                     ; 544         case CANID_NODEREGISTER_SUCCESS:
4116                     ; 545 #if HASH_MODEL==HS_0002S
4116                     ; 546             if(UniqueID[0]==pCanMsg->data[0]&&UniqueID[1]==pCanMsg->data[1]
4116                     ; 547              &&UniqueID[2]==pCanMsg->data[2]&&UniqueID[3]==pCanMsg->data[3]
4116                     ; 548              &&UniqueID[4]==pCanMsg->data[4]&&UniqueID[5]==pCanMsg->data[5]
4116                     ; 549              &&UniqueID[6]==pCanMsg->data[6]&&UniqueID[7]==pCanMsg->data[7]
4116                     ; 550             )
4116                     ; 551             {
4116                     ; 552                 NODE_REGISTER_FLAG=1;
4116                     ; 553                 eep_NodeId=pCanMsg->id & 0x0000FFFF;
4116                     ; 554             }
4116                     ; 555 #endif
4116                     ; 556             break;
4118  05f0 2018          	jra	L3302
4119  05f2               L3671:
4120                     ; 560             switch(pCanMsg->data[0])
4122  05f2 1e13          	ldw	x,(OFST+1,sp)
4123  05f4 e605          	ld	a,(5,x)
4125                     ; 590                     break;
4126  05f6 4a            	dec	a
4127  05f7 2711          	jreq	L3302
4128  05f9 4a            	dec	a
4129  05fa 270e          	jreq	L3302
4130  05fc a07e          	sub	a,#126
4131  05fe 270a          	jreq	L3302
4132  0600 4a            	dec	a
4133  0601 2707          	jreq	L3302
4134  0603 4a            	dec	a
4135  0604 2604          	jrne	L3302
4136                     ; 584                     CanProtocolState=CANPROTOCOL_INITIAL;
4138  0606 725f0000      	clr	_CanProtocolState
4139                     ; 585                     break;
4141  060a               L5602:
4142  060a               L3302:
4143                     ; 595     CanFlagAnalyse();
4145  060a 8d110611      	callf	f_CanFlagAnalyse
4147                     ; 596 }
4148  060e               L44:
4151  060e 5b14          	addw	sp,#20
4152  0610 87            	retf
4175                     ; 607 void CanFlagAnalyse(void)
4175                     ; 608 {
4177                     	switch	.text
4178  0611               f_CanFlagAnalyse:
4182                     ; 609 }
4185  0611 87            	retf
4209                     ; 619 BoolT CANGetEmptyMegBox(void)
4209                     ; 620 {
4210                     	switch	.text
4211  0612               f_CANGetEmptyMegBox:
4215                     ; 621     if(CAN.TPR &CAN_TPR_TME0)
4217  0612 c65423        	ld	a,_CAN+3
4218  0615 a504          	bcp	a,#4
4219  0617 2706          	jreq	L7012
4220                     ; 623         CAN.PSR =CAN_PS_TXMB0;
4222  0619 725f5427      	clr	_CAN+7
4224  061d 2018          	jra	L1112
4225  061f               L7012:
4226                     ; 625     else if(CAN.TPR &CAN_TPR_TME1)
4228  061f c65423        	ld	a,_CAN+3
4229  0622 a508          	bcp	a,#8
4230  0624 2706          	jreq	L3112
4231                     ; 627         CAN.PSR =CAN_PS_TXMB1;
4233  0626 35015427      	mov	_CAN+7,#1
4235  062a 200b          	jra	L1112
4236  062c               L3112:
4237                     ; 629     else if(CAN.TPR &CAN_TPR_TME2)
4239  062c c65423        	ld	a,_CAN+3
4240  062f a510          	bcp	a,#16
4241  0631 2707          	jreq	L7112
4242                     ; 631         CAN.PSR =CAN_PS_TXMB2;
4244  0633 35055427      	mov	_CAN+7,#5
4246  0637               L1112:
4247                     ; 637     return TRUE;
4249  0637 a601          	ld	a,#1
4252  0639 87            	retf
4253  063a               L7112:
4254                     ; 635         return FALSE;
4256  063a 4f            	clr	a
4259  063b 87            	retf
4296                     ; 648 void SendToCan(CanMsgTypeDef *pCanMsg)
4296                     ; 649 {
4297                     	switch	.text
4298  063c               f_SendToCan:
4302                     ; 650     CanMsgTransmit(pCanMsg);
4304  063c 8da201a2      	callf	f_CanMsgTransmit
4306                     ; 651 }
4309  0640 87            	retf
4351                     ; 661 void SendSwitchState(u8 Switch)
4351                     ; 662 {
4352                     	switch	.text
4353  0641               f_SendSwitchState:
4355  0641 88            	push	a
4356  0642 520d          	subw	sp,#13
4357       0000000d      OFST:	set	13
4360                     ; 664     CanBuffer.id =CANID_SWITCHSTATE;
4362  0644 ae0000        	ldw	x,#0
4363  0647 1f03          	ldw	(OFST-10,sp),x
4364  0649 ae0404        	ldw	x,#1028
4365  064c 1f01          	ldw	(OFST-12,sp),x
4366                     ; 665     CanBuffer.dlc =1;
4368  064e a601          	ld	a,#1
4369  0650 6b05          	ld	(OFST-8,sp),a
4370                     ; 666     CanBuffer.data[0]=Switch;
4372  0652 7b0e          	ld	a,(OFST+1,sp)
4373  0654 6b06          	ld	(OFST-7,sp),a
4374                     ; 667     SendToCan(&CanBuffer);
4376  0656 96            	ldw	x,sp
4377  0657 1c0001        	addw	x,#OFST-12
4378  065a 8d3c063c      	callf	f_SendToCan
4380                     ; 668 }
4383  065e 5b0e          	addw	sp,#14
4384  0660 87            	retf
4426                     ; 678 void SendBraodcast(u8 Broadcast)
4426                     ; 679 {
4427                     	switch	.text
4428  0661               f_SendBraodcast:
4430  0661 88            	push	a
4431  0662 520d          	subw	sp,#13
4432       0000000d      OFST:	set	13
4435                     ; 681     CanBuffer.id =CANID_BROADCAST;
4437  0664 ae0000        	ldw	x,#0
4438  0667 1f03          	ldw	(OFST-10,sp),x
4439  0669 ae0403        	ldw	x,#1027
4440  066c 1f01          	ldw	(OFST-12,sp),x
4441                     ; 682     CanBuffer.dlc =1;
4443  066e a601          	ld	a,#1
4444  0670 6b05          	ld	(OFST-8,sp),a
4445                     ; 683     CanBuffer.data[0]=Broadcast;
4447  0672 7b0e          	ld	a,(OFST+1,sp)
4448  0674 6b06          	ld	(OFST-7,sp),a
4449                     ; 684     SendToCan(&CanBuffer);
4451  0676 96            	ldw	x,sp
4452  0677 1c0001        	addw	x,#OFST-12
4453  067a 8d3c063c      	callf	f_SendToCan
4455                     ; 685 }
4458  067e 5b0e          	addw	sp,#14
4459  0680 87            	retf
4490                     ; 695 void Can_Main(void)
4490                     ; 696 {
4491                     	switch	.text
4492  0681               f_Can_Main:
4496                     ; 697 	switch(CanBusState)
4498  0681 c60000        	ld	a,_CanBusState
4500                     ; 733 			CLEAR_WWDG;			
4501  0684 4d            	tnz	a
4502  0685 271a          	jreq	L3022
4503  0687 4a            	dec	a
4504  0688 272f          	jreq	L5022
4505  068a 4a            	dec	a
4506  068b 2736          	jreq	L7022
4507  068d 4a            	dec	a
4508  068e 2739          	jreq	L1122
4509  0690 4a            	dec	a
4510  0691 2742          	jreq	L1322
4511  0693               L5122:
4512                     ; 732 			BEGIN_WWDG;			
4514  0693 357f50d2      	mov	_WWDG+1,#127
4517  0697 35ff50d1      	mov	_WWDG,#255
4518                     ; 733 			CLEAR_WWDG;			
4521  069b 357f50d1      	mov	_WWDG,#127
4522  069f               L3322:
4524  069f 20fe          	jra	L3322
4525  06a1               L3022:
4526                     ; 701 			CanWakeUp();
4528  06a1 8d8f018f      	callf	f_CanWakeUp
4530                     ; 702 			CanInit(CAN_MCR_ABOM | CAN_MCR_AWUM |CAN_MCR_NART);
4532  06a5 a670          	ld	a,#112
4533  06a7 8d000000      	callf	f_CanInit
4535                     ; 703 			CanInterruptRestore();
4537  06ab 8d500250      	callf	f_CanInterruptRestore
4539                     ; 704 			CanBusWakeup();
4541  06af 72175014      	bres	_GPIOE,#3
4542                     ; 705 			CanBusState=CAN_WAIT;
4545  06b3 35010000      	mov	_CanBusState,#1
4546                     ; 706 			break;
4548  06b7 201c          	jra	L1322
4549  06b9               L5022:
4550                     ; 710 			CanProtocolState=CANPROTOCOL_INITIAL;
4552  06b9 725f0000      	clr	_CanProtocolState
4553                     ; 711 	        CanBusState=CAN_RUNNING;
4555  06bd 35020000      	mov	_CanBusState,#2
4556                     ; 712 		    break;
4558  06c1 2012          	jra	L1322
4559  06c3               L7022:
4560                     ; 716 		    MainCanProtocol();
4562  06c3 8d000000      	callf	f_MainCanProtocol
4564                     ; 717 			break;
4566  06c7 200c          	jra	L1322
4567  06c9               L1122:
4568                     ; 721 			CanSleep();
4570  06c9 8d770177      	callf	f_CanSleep
4572                     ; 722 			CanBusSleep();
4574  06cd 72165014      	bset	_GPIOE,#3
4575                     ; 723 			CanBusState=CAN_SLEEP;	
4578  06d1 35040000      	mov	_CanBusState,#4
4579                     ; 724 			break;
4581  06d5               L1322:
4582                     ; 741 }
4585  06d5 87            	retf
4597                     	xdef	f_CANGetEmptyMegBox
4598                     	xdef	f_CanMsgTransmit
4599                     	xdef	f_Can_Main
4600                     	xdef	f_CanFlagAnalyse
4601                     	xdef	f_SendBraodcast
4602                     	xdef	f_SendSwitchState
4603                     	xdef	f_SendToCan
4604                     	xdef	f_ISR_Can_Rx
4605                     	xdef	f_ISR_Can_Tx
4606                     	xdef	f_Can_Store_Rcvd_Msg
4607                     	xdef	f_CanInterruptRestore
4608                     	xdef	f_CanInterruptDisable
4609                     	xdef	f_CanWakeUp
4610                     	xdef	f_Can_Wakeup_Enable
4611                     	xdef	f_CanSleep
4612                     	xdef	f_CanInit
4613                     	xref	_CanTxRxBuffer
4614                     	xref	_CanBusState
4615                     	xref	_CanPage
4616                     	xref	f_MainCanProtocol
4617                     	xref	_CanProtocolState
4618                     	xref.b	c_lreg
4619                     	xref.b	c_x
4638                     	xref	d_jltab
4639                     	xref	d_ladd
4640                     	xref	d_uitolx
4641                     	xref	d_rtol
4642                     	xref	d_ltor
4643                     	xref	d_lgadc
4644                     	xref	d_lglsh
4645                     	end
