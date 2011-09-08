   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.3 - 19 Nov 2007
2348                     ; 2 void TIM1Init(void)
2348                     ; 3 {
2349                     	switch	.text
2350  0000               f_TIM1Init:
2354                     ; 4     CLK.PCKENR1 |=CLK_PCKENR1_TIM1; // 开启TIM1时钟，stm8 的外设时钟可控
2356  0000 721e50c7      	bset	_CLK+7,#7
2357                     ; 5     TIM1.PSCRH =0x00; // 必须先写高位 H, DIV8 外部晶振 8mhz 
2359  0004 725f5260      	clr	_TIM1+16
2360                     ; 6     TIM1.PSCRL =0x07; // 再写低位 L
2362  0008 35075261      	mov	_TIM1+17,#7
2363                     ; 7     TIM1.ARRH =0x00; // 必须先写高位 H, 自动预装值50000
2365  000c 725f5262      	clr	_TIM1+18
2366                     ; 8     TIM1.ARRL =0x20; // 再写低位 L
2368  0010 35205263      	mov	_TIM1+19,#32
2369                     ; 10     TIM1.CCMR1 =(TIM1.CCMR1 & 0x8c)|0x40; //OC1配置为PWM输出
2371  0014 c65258        	ld	a,_TIM1+8
2372  0017 a48c          	and	a,#140
2373  0019 aa40          	or	a,#64
2374  001b c75258        	ld	_TIM1+8,a
2375                     ; 11     TIM1.CCMR2 =(TIM1.CCMR2 & 0x8c)|0x60; //OC2配置为PWM输出
2377  001e c65259        	ld	a,_TIM1+9
2378  0021 a48c          	and	a,#140
2379  0023 aa60          	or	a,#96
2380  0025 c75259        	ld	_TIM1+9,a
2381                     ; 12     TIM1.CCMR3 =(TIM1.CCMR3 & 0x8c)|0x60; //OC3配置为PWM输出
2383  0028 c6525a        	ld	a,_TIM1+10
2384  002b a48c          	and	a,#140
2385  002d aa60          	or	a,#96
2386  002f c7525a        	ld	_TIM1+10,a
2387                     ; 13     TIM1.CCMR4 =(TIM1.CCMR4 & 0x8c)|0x60; //OC4配置为PWM输出
2389  0032 c6525b        	ld	a,_TIM1+11
2390  0035 a48c          	and	a,#140
2391  0037 aa60          	or	a,#96
2392  0039 c7525b        	ld	_TIM1+11,a
2393                     ; 16     TIM1.OISR =TIM1_OISR_RESET_VALUE; //OC1 OC1N,OC2 OC2N,OC3 OC3N,IdleState==0
2395  003c 725f526f      	clr	_TIM1+31
2396                     ; 17     TIM1.CCR1H =0x00; // OC1,OC1N duty cycle
2398  0040 725f5265      	clr	_TIM1+21
2399                     ; 18     TIM1.CCR1L =0x08;
2401  0044 35085266      	mov	_TIM1+22,#8
2402                     ; 19     TIM1.CCR2H =0x00; // OC2,OC2N duty cycle
2404  0048 725f5267      	clr	_TIM1+23
2405                     ; 20     TIM1.CCR2L =0x10;
2407  004c 35105268      	mov	_TIM1+24,#16
2408                     ; 21     TIM1.CCR3H =0x00; // OC3,OC3N duty cycle
2410  0050 725f5269      	clr	_TIM1+25
2411                     ; 22     TIM1.CCR3L =0x18;
2413  0054 3518526a      	mov	_TIM1+26,#24
2414                     ; 23     TIM1.CCR4H =0x00; // OC3,OC3N duty cycle
2416  0058 725f526b      	clr	_TIM1+27
2417                     ; 24     TIM1.CCR4L =0x1f;
2419  005c 351f526c      	mov	_TIM1+28,#31
2420                     ; 25     TIM1.DTR =0x1f; //DeadTime==4us
2422  0060 351f526e      	mov	_TIM1+30,#31
2423                     ; 26     TIM1.BKR |=TIM1_BKR_MOE; //MOE==1
2425  0064 721e526d      	bset	_TIM1+29,#7
2426                     ; 31     TIM1.IER |=TIM1_IER_COMIE; //允许中断
2428  0068 721a5254      	bset	_TIM1+4,#5
2429                     ; 32     TIM1.CR2 |=TIM1_CR2_COMS|TIM1_CR2_CCPC; 
2431  006c c65251        	ld	a,_TIM1+1
2432  006f aa05          	or	a,#5
2433  0071 c75251        	ld	_TIM1+1,a
2434                     ; 33     TIM1.CR1 |=TIM1_CR1_CEN; // 开启定时器
2436  0074 72105250      	bset	_TIM1,#0
2437                     ; 34 }
2440  0078 87            	retf
2464                     ; 36 void TIM2Init(void)
2464                     ; 37 {
2465                     	switch	.text
2466  0079               f_TIM2Init:
2470                     ; 38     CLK.PCKENR1 |=CLK_PCKENR1_TIM2; // 开启TIM2时钟，stm8 的外设时钟可控
2472  0079 721a50c7      	bset	_CLK+7,#5
2473                     ; 39     TIM2.PSCR |=0x03; //DIV 2^15 外部晶振 8mhz 除以 2^15 实现单位时间为 1us
2475  007d c6530c        	ld	a,_TIM2+12
2476  0080 aa03          	or	a,#3
2477  0082 c7530c        	ld	_TIM2+12,a
2478                     ; 40     TIM2.ARRH =0x01; // 必须先写高位 H
2480  0085 3501530d      	mov	_TIM2+13,#1
2481                     ; 41     TIM2.ARRL =0x00; // 再写低位 L
2483  0089 725f530e      	clr	_TIM2+14
2484                     ; 42     TIM2.CCMR1 =TIM2_CCMR1_CCxS_IC_TI1|TIM2_CCMR_ICxF_8; // 8个Fmaster去抖时间
2486  008d 35315305      	mov	_TIM2+5,#49
2487                     ; 43     TIM2.CCMR2 =TIM2_CCMR2_CCxS_IC_TI2|TIM2_CCMR_ICxF_8;
2489  0091 35315306      	mov	_TIM2+6,#49
2490                     ; 44     TIM2.CCMR3 =TIM2_CCMR3_CCxS_IC_TI3|TIM2_CCMR_ICxF_8;
2492  0095 35315307      	mov	_TIM2+7,#49
2493                     ; 45     TIM2.CCER1 =TIM2_CCER1_CC1E|TIM2_CCER1_CC2E; //捕获通道使能
2495  0099 35115308      	mov	_TIM2+8,#17
2496                     ; 46     TIM2.CCER2 =TIM2_CCER2_CC3E;
2498  009d 35015309      	mov	_TIM2+9,#1
2499                     ; 47     TIM2.IER =TIM2_IER_CC1IE|TIM2_IER_CC2IE|TIM2_IER_CC3IE; // 允许中断
2501  00a1 350e5301      	mov	_TIM2+1,#14
2502                     ; 48     TIM2.CR1 |=TIM2_CR1_CEN; // 开启定时器
2504  00a5 72105300      	bset	_TIM2,#0
2505                     ; 49 }
2508  00a9 87            	retf
2532                     ; 51 void TIM3Init(void)
2532                     ; 52 {
2533                     	switch	.text
2534  00aa               f_TIM3Init:
2538                     ; 53     CLK.PCKENR1 |=CLK_PCKENR1_TIM3; // 开启TIM3时钟，stm8 的外设时钟可控
2540  00aa 721c50c7      	bset	_CLK+7,#6
2541                     ; 54     TIM3.PSCR |=0x0f; //DIV 2^15 外部晶振 8mhz 除以 2^15 实现单位时间为 4096us
2543  00ae c6532a        	ld	a,_TIM3+10
2544  00b1 aa0f          	or	a,#15
2545  00b3 c7532a        	ld	_TIM3+10,a
2546                     ; 55     TIM3.ARRH =0x00; // 必须先写高位 H
2548  00b6 725f532b      	clr	_TIM3+11
2549                     ; 56     TIM3.ARRL =0x80; // 再写低位 L
2551  00ba 3580532c      	mov	_TIM3+12,#128
2552                     ; 57     TIM3.IER |=TIM3_IER_UIE; // 允许中断
2554  00be 72105321      	bset	_TIM3+1,#0
2555                     ; 58     TIM3.CR1 |=TIM3_CR1_CEN; // 开启定时器
2557  00c2 72105320      	bset	_TIM3,#0
2558                     ; 59 }
2561  00c6 87            	retf
2585                     ; 61 void TIM4Init(void)
2585                     ; 62 {
2586                     	switch	.text
2587  00c7               f_TIM4Init:
2591                     ; 63     CLK.PCKENR1 |=CLK_PCKENR1_TIM4; // 开启TIM4时钟，stm8 的外设时钟可控
2593  00c7 721850c7      	bset	_CLK+7,#4
2594                     ; 64     TIM4.PSCR =7; //DIV 2^7 外部晶振 8mhz 除以 2^7 实现单位时间为 16us
2596  00cb 35075345      	mov	_TIM4+5,#7
2597                     ; 65     TIM4.ARR =249; //timer period = 1/(8MHz/128)*(249+1) =4 ms
2599  00cf 35f95346      	mov	_TIM4+6,#249
2600                     ; 66     TIM4.CNTR=6; //counter=256-6=250
2602  00d3 35065344      	mov	_TIM4+4,#6
2603                     ; 67     TIM4.SR1 =0;
2605  00d7 725f5342      	clr	_TIM4+2
2606                     ; 68     TIM4.IER |=TIM4_IER_UIE; // 允许中断
2608  00db 72105341      	bset	_TIM4+1,#0
2609                     ; 69     TIM4.CR1 |=TIM4_CR1_CEN; // 开启定时器
2611  00df 72105340      	bset	_TIM4,#0
2612                     ; 70 }
2615  00e3 87            	retf
2638                     ; 72 void TimerInit(void)
2638                     ; 73 {
2639                     	switch	.text
2640  00e4               f_TimerInit:
2644                     ; 77     TIM4Init();
2646  00e4 8dc700c7      	callf	f_TIM4Init
2648                     ; 78 }
2651  00e8 87            	retf
2653                     	switch	.data
2654  0000               L5341_CounterTime:
2655  0000 00            	dc.b	0
2688                     ; 80 void ISR_TIM4_UPD_OVF(void)
2688                     ; 81 {
2689                     	switch	.text
2690  00e9               f_ISR_TIM4_UPD_OVF:
2692  00e9 5209          	subw	sp,#9
2693       00000009      OFST:	set	9
2696                     ; 83 	TIM4.SR1 &=(~TIM4_SR1_UIF); //清更新事件标志
2698  00eb 72115342      	bres	_TIM4+2,#0
2699                     ; 84     FLAGMAIN_4MS=1;
2701  00ef 72120000      	bset	_FlagMain,#1
2702                     ; 85     CounterTime++;
2704  00f3 725c0000      	inc	L5341_CounterTime
2705                     ; 86     if(24==CounterTime|49==CounterTime|74==CounterTime|99==CounterTime
2705                     ; 87     |124==CounterTime|149==CounterTime|174==CounterTime|199==CounterTime
2705                     ; 88     |224==CounterTime|249==CounterTime)
2707  00f7 c60000        	ld	a,L5341_CounterTime
2708  00fa a1e0          	cp	a,#224
2709  00fc 2604          	jrne	L02
2710  00fe a601          	ld	a,#1
2711  0100 2001          	jra	L22
2712  0102               L02:
2713  0102 4f            	clr	a
2714  0103               L22:
2715  0103 6b08          	ld	(OFST-1,sp),a
2716  0105 c60000        	ld	a,L5341_CounterTime
2717  0108 a1c7          	cp	a,#199
2718  010a 2604          	jrne	L42
2719  010c a601          	ld	a,#1
2720  010e 2001          	jra	L62
2721  0110               L42:
2722  0110 4f            	clr	a
2723  0111               L62:
2724  0111 6b07          	ld	(OFST-2,sp),a
2725  0113 c60000        	ld	a,L5341_CounterTime
2726  0116 a1ae          	cp	a,#174
2727  0118 2604          	jrne	L03
2728  011a a601          	ld	a,#1
2729  011c 2001          	jra	L23
2730  011e               L03:
2731  011e 4f            	clr	a
2732  011f               L23:
2733  011f 6b06          	ld	(OFST-3,sp),a
2734  0121 c60000        	ld	a,L5341_CounterTime
2735  0124 a195          	cp	a,#149
2736  0126 2604          	jrne	L43
2737  0128 a601          	ld	a,#1
2738  012a 2001          	jra	L63
2739  012c               L43:
2740  012c 4f            	clr	a
2741  012d               L63:
2742  012d 6b05          	ld	(OFST-4,sp),a
2743  012f c60000        	ld	a,L5341_CounterTime
2744  0132 a17c          	cp	a,#124
2745  0134 2604          	jrne	L04
2746  0136 a601          	ld	a,#1
2747  0138 2001          	jra	L24
2748  013a               L04:
2749  013a 4f            	clr	a
2750  013b               L24:
2751  013b 6b04          	ld	(OFST-5,sp),a
2752  013d c60000        	ld	a,L5341_CounterTime
2753  0140 a163          	cp	a,#99
2754  0142 2604          	jrne	L44
2755  0144 a601          	ld	a,#1
2756  0146 2001          	jra	L64
2757  0148               L44:
2758  0148 4f            	clr	a
2759  0149               L64:
2760  0149 6b03          	ld	(OFST-6,sp),a
2761  014b c60000        	ld	a,L5341_CounterTime
2762  014e a14a          	cp	a,#74
2763  0150 2604          	jrne	L05
2764  0152 a601          	ld	a,#1
2765  0154 2001          	jra	L25
2766  0156               L05:
2767  0156 4f            	clr	a
2768  0157               L25:
2769  0157 6b02          	ld	(OFST-7,sp),a
2770  0159 c60000        	ld	a,L5341_CounterTime
2771  015c a131          	cp	a,#49
2772  015e 2604          	jrne	L45
2773  0160 a601          	ld	a,#1
2774  0162 2001          	jra	L65
2775  0164               L45:
2776  0164 4f            	clr	a
2777  0165               L65:
2778  0165 6b01          	ld	(OFST-8,sp),a
2779  0167 c60000        	ld	a,L5341_CounterTime
2780  016a a118          	cp	a,#24
2781  016c 2604          	jrne	L06
2782  016e a601          	ld	a,#1
2783  0170 2001          	jra	L26
2784  0172               L06:
2785  0172 4f            	clr	a
2786  0173               L26:
2787  0173 1a01          	or	a,(OFST-8,sp)
2788  0175 1a02          	or	a,(OFST-7,sp)
2789  0177 1a03          	or	a,(OFST-6,sp)
2790  0179 1a04          	or	a,(OFST-5,sp)
2791  017b 1a05          	or	a,(OFST-4,sp)
2792  017d 1a06          	or	a,(OFST-3,sp)
2793  017f 1a07          	or	a,(OFST-2,sp)
2794  0181 1a08          	or	a,(OFST-1,sp)
2795  0183 6b09          	ld	(OFST+0,sp),a
2796  0185 c60000        	ld	a,L5341_CounterTime
2797  0188 a1f9          	cp	a,#249
2798  018a 2604          	jrne	L46
2799  018c a601          	ld	a,#1
2800  018e 2001          	jra	L66
2801  0190               L46:
2802  0190 4f            	clr	a
2803  0191               L66:
2804  0191 6b08          	ld	(OFST-1,sp),a
2805  0193 7b09          	ld	a,(OFST+0,sp)
2806  0195 1a08          	or	a,(OFST-1,sp)
2807  0197 2704          	jreq	L3541
2808                     ; 90         FLAGMAIN_100MS=1;
2810  0199 72140000      	bset	_FlagMain,#2
2811  019d               L3541:
2812                     ; 92     if(250<=CounterTime)
2814  019d c60000        	ld	a,L5341_CounterTime
2815  01a0 a1fa          	cp	a,#250
2816  01a2 2508          	jrult	L5541
2817                     ; 94         FLAGMAIN_1S=1;
2819  01a4 72160000      	bset	_FlagMain,#3
2820                     ; 95         CounterTime=0;
2822  01a8 725f0000      	clr	L5341_CounterTime
2823  01ac               L5541:
2824                     ; 98     if(0!=BeepTimer)
2826  01ac 725d0000      	tnz	_BeepTimer
2827  01b0 2704          	jreq	L7541
2828                     ; 99         BeepTimer--;
2830  01b2 725a0000      	dec	_BeepTimer
2831  01b6               L7541:
2832                     ; 101 }
2835  01b6 5b09          	addw	sp,#9
2836  01b8 87            	retf
2848                     	xdef	f_TIM4Init
2849                     	xdef	f_TIM3Init
2850                     	xdef	f_TIM2Init
2851                     	xdef	f_TIM1Init
2852                     	xref	_FlagMain
2853                     	xdef	f_ISR_TIM4_UPD_OVF
2854                     	xdef	f_TimerInit
2855                     	xref	_BeepTimer
2874                     	end
