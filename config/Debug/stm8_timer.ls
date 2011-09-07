   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2348                     ; 2 void TIM1Init(void)
2348                     ; 3 {
2350                     	switch	.text
2351  0000               _TIM1Init:
2355                     ; 4     CLK.PCKENR1 |=CLK_PCKENR1_TIM1; // 开启TIM1时钟，stm8 的外设时钟可控
2357  0000 721e50c7      	bset	_CLK+7,#7
2358                     ; 5     TIM1.PSCRH =0x00; // 必须先写高位 H, DIV8 外部晶振 8mhz 
2360  0004 725f5260      	clr	_TIM1+16
2361                     ; 6     TIM1.PSCRL =0x07; // 再写低位 L
2363  0008 35075261      	mov	_TIM1+17,#7
2364                     ; 7     TIM1.ARRH =0x00; // 必须先写高位 H, 自动预装值50000
2366  000c 725f5262      	clr	_TIM1+18
2367                     ; 8     TIM1.ARRL =0x20; // 再写低位 L
2369  0010 35205263      	mov	_TIM1+19,#32
2370                     ; 10     TIM1.CCMR1 =(TIM1.CCMR1 & 0x8c)|0x40; //OC1配置为PWM输出
2372  0014 c65258        	ld	a,_TIM1+8
2373  0017 a48c          	and	a,#140
2374  0019 aa40          	or	a,#64
2375  001b c75258        	ld	_TIM1+8,a
2376                     ; 11     TIM1.CCMR2 =(TIM1.CCMR2 & 0x8c)|0x60; //OC2配置为PWM输出
2378  001e c65259        	ld	a,_TIM1+9
2379  0021 a48c          	and	a,#140
2380  0023 aa60          	or	a,#96
2381  0025 c75259        	ld	_TIM1+9,a
2382                     ; 12     TIM1.CCMR3 =(TIM1.CCMR3 & 0x8c)|0x60; //OC3配置为PWM输出
2384  0028 c6525a        	ld	a,_TIM1+10
2385  002b a48c          	and	a,#140
2386  002d aa60          	or	a,#96
2387  002f c7525a        	ld	_TIM1+10,a
2388                     ; 13     TIM1.CCMR4 =(TIM1.CCMR4 & 0x8c)|0x60; //OC4配置为PWM输出
2390  0032 c6525b        	ld	a,_TIM1+11
2391  0035 a48c          	and	a,#140
2392  0037 aa60          	or	a,#96
2393  0039 c7525b        	ld	_TIM1+11,a
2394                     ; 16     TIM1.OISR =TIM1_OISR_RESET_VALUE; //OC1 OC1N,OC2 OC2N,OC3 OC3N,IdleState==0
2396  003c 725f526f      	clr	_TIM1+31
2397                     ; 17     TIM1.CCR1H =0x00; // OC1,OC1N duty cycle
2399  0040 725f5265      	clr	_TIM1+21
2400                     ; 18     TIM1.CCR1L =0x08;
2402  0044 35085266      	mov	_TIM1+22,#8
2403                     ; 19     TIM1.CCR2H =0x00; // OC2,OC2N duty cycle
2405  0048 725f5267      	clr	_TIM1+23
2406                     ; 20     TIM1.CCR2L =0x10;
2408  004c 35105268      	mov	_TIM1+24,#16
2409                     ; 21     TIM1.CCR3H =0x00; // OC3,OC3N duty cycle
2411  0050 725f5269      	clr	_TIM1+25
2412                     ; 22     TIM1.CCR3L =0x18;
2414  0054 3518526a      	mov	_TIM1+26,#24
2415                     ; 23     TIM1.CCR4H =0x00; // OC3,OC3N duty cycle
2417  0058 725f526b      	clr	_TIM1+27
2418                     ; 24     TIM1.CCR4L =0x1f;
2420  005c 351f526c      	mov	_TIM1+28,#31
2421                     ; 25     TIM1.DTR =0x1f; //DeadTime==4us
2423  0060 351f526e      	mov	_TIM1+30,#31
2424                     ; 26     TIM1.BKR |=TIM1_BKR_MOE; //MOE==1
2426  0064 721e526d      	bset	_TIM1+29,#7
2427                     ; 31     TIM1.IER |=TIM1_IER_COMIE; //允许中断
2429  0068 721a5254      	bset	_TIM1+4,#5
2430                     ; 32     TIM1.CR2 |=TIM1_CR2_COMS|TIM1_CR2_CCPC; 
2432  006c c65251        	ld	a,_TIM1+1
2433  006f aa05          	or	a,#5
2434  0071 c75251        	ld	_TIM1+1,a
2435                     ; 33     TIM1.CR1 |=TIM1_CR1_CEN; // 开启定时器
2437  0074 72105250      	bset	_TIM1,#0
2438                     ; 34 }
2441  0078 81            	ret
2466                     ; 36 void TIM2Init(void)
2466                     ; 37 {
2467                     	switch	.text
2468  0079               _TIM2Init:
2472                     ; 38     CLK.PCKENR1 |=CLK_PCKENR1_TIM2; // 开启TIM2时钟，stm8 的外设时钟可控
2474  0079 721a50c7      	bset	_CLK+7,#5
2475                     ; 39     TIM2.PSCR |=0x03; //DIV 2^15 外部晶振 8mhz 除以 2^15 实现单位时间为 1us
2477  007d c6530c        	ld	a,_TIM2+12
2478  0080 aa03          	or	a,#3
2479  0082 c7530c        	ld	_TIM2+12,a
2480                     ; 40     TIM2.ARRH =0x01; // 必须先写高位 H
2482  0085 3501530d      	mov	_TIM2+13,#1
2483                     ; 41     TIM2.ARRL =0x00; // 再写低位 L
2485  0089 725f530e      	clr	_TIM2+14
2486                     ; 42     TIM2.CCMR1 =TIM2_CCMR1_CCxS_IC_TI1|TIM2_CCMR_ICxF_8; // 8个Fmaster去抖时间
2488  008d 35315305      	mov	_TIM2+5,#49
2489                     ; 43     TIM2.CCMR2 =TIM2_CCMR2_CCxS_IC_TI2|TIM2_CCMR_ICxF_8;
2491  0091 35315306      	mov	_TIM2+6,#49
2492                     ; 44     TIM2.CCMR3 =TIM2_CCMR3_CCxS_IC_TI3|TIM2_CCMR_ICxF_8;
2494  0095 35315307      	mov	_TIM2+7,#49
2495                     ; 45     TIM2.CCER1 =TIM2_CCER1_CC1E|TIM2_CCER1_CC2E; //捕获通道使能
2497  0099 35115308      	mov	_TIM2+8,#17
2498                     ; 46     TIM2.CCER2 =TIM2_CCER2_CC3E;
2500  009d 35015309      	mov	_TIM2+9,#1
2501                     ; 47     TIM2.IER =TIM2_IER_CC1IE|TIM2_IER_CC2IE|TIM2_IER_CC3IE; // 允许中断
2503  00a1 350e5301      	mov	_TIM2+1,#14
2504                     ; 48     TIM2.CR1 |=TIM2_CR1_CEN; // 开启定时器
2506  00a5 72105300      	bset	_TIM2,#0
2507                     ; 49 }
2510  00a9 81            	ret
2535                     ; 51 void TIM3Init(void)
2535                     ; 52 {
2536                     	switch	.text
2537  00aa               _TIM3Init:
2541                     ; 53     CLK.PCKENR1 |=CLK_PCKENR1_TIM3; // 开启TIM3时钟，stm8 的外设时钟可控
2543  00aa 721c50c7      	bset	_CLK+7,#6
2544                     ; 54     TIM3.PSCR |=0x0f; //DIV 2^15 外部晶振 8mhz 除以 2^15 实现单位时间为 4096us
2546  00ae c6532a        	ld	a,_TIM3+10
2547  00b1 aa0f          	or	a,#15
2548  00b3 c7532a        	ld	_TIM3+10,a
2549                     ; 55     TIM3.ARRH =0x00; // 必须先写高位 H
2551  00b6 725f532b      	clr	_TIM3+11
2552                     ; 56     TIM3.ARRL =0x80; // 再写低位 L
2554  00ba 3580532c      	mov	_TIM3+12,#128
2555                     ; 57     TIM3.IER |=TIM3_IER_UIE; // 允许中断
2557  00be 72105321      	bset	_TIM3+1,#0
2558                     ; 58     TIM3.CR1 |=TIM3_CR1_CEN; // 开启定时器
2560  00c2 72105320      	bset	_TIM3,#0
2561                     ; 59 }
2564  00c6 81            	ret
2589                     ; 61 void TIM4Init(void)
2589                     ; 62 {
2590                     	switch	.text
2591  00c7               _TIM4Init:
2595                     ; 63     CLK.PCKENR1 |=CLK_PCKENR1_TIM4; // 开启TIM4时钟，stm8 的外设时钟可控
2597  00c7 721850c7      	bset	_CLK+7,#4
2598                     ; 64     TIM4.PSCR =7; //DIV 2^7 外部晶振 8mhz 除以 2^7 实现单位时间为 16us
2600  00cb 35075345      	mov	_TIM4+5,#7
2601                     ; 65     TIM4.ARR =249; //timer period = 1/(8MHz/128)*(249+1) =4 ms
2603  00cf 35f95346      	mov	_TIM4+6,#249
2604                     ; 66     TIM4.CNTR=6; //counter=256-6=250
2606  00d3 35065344      	mov	_TIM4+4,#6
2607                     ; 67     TIM4.SR1 =0;
2609  00d7 725f5342      	clr	_TIM4+2
2610                     ; 68     TIM4.IER |=TIM4_IER_UIE; // 允许中断
2612  00db 72105341      	bset	_TIM4+1,#0
2613                     ; 69     TIM4.CR1 |=TIM4_CR1_CEN; // 开启定时器
2615  00df 72105340      	bset	_TIM4,#0
2616                     ; 70 }
2619  00e3 81            	ret
2643                     ; 72 void TimerInit(void)
2643                     ; 73 {
2644                     	switch	.text
2645  00e4               _TimerInit:
2649                     ; 77     TIM4Init();
2651  00e4 ade1          	call	_TIM4Init
2653                     ; 78 }
2656  00e6 81            	ret
2659                     	bsct
2660  0000               L5341_CounterTime:
2661  0000 00            	dc.b	0
2696                     ; 80 void ISR_TIM4_UPD_OVF(void)
2696                     ; 81 {
2697                     	switch	.text
2698  00e7               _ISR_TIM4_UPD_OVF:
2700  00e7 5212          	subw	sp,#18
2701       00000012      OFST:	set	18
2704                     ; 83 	TIM4.SR1 &=(~TIM4_SR1_UIF); //清更新事件标志
2706  00e9 72115342      	bres	_TIM4+2,#0
2707                     ; 84     FLAGMAIN_4MS=1;
2709  00ed 72120000      	bset	_FlagMain,#1
2710                     ; 85     CounterTime++;
2712  00f1 3c00          	inc	L5341_CounterTime
2713                     ; 86     if(24==CounterTime|49==CounterTime|74==CounterTime|99==CounterTime
2713                     ; 87     |124==CounterTime|149==CounterTime|174==CounterTime|199==CounterTime
2713                     ; 88     |224==CounterTime|249==CounterTime)
2715  00f3 b600          	ld	a,L5341_CounterTime
2716  00f5 a1e0          	cp	a,#224
2717  00f7 2605          	jrne	L02
2718  00f9 ae0001        	ldw	x,#1
2719  00fc 2001          	jra	L22
2720  00fe               L02:
2721  00fe 5f            	clrw	x
2722  00ff               L22:
2723  00ff 1f0f          	ldw	(OFST-3,sp),x
2724  0101 b600          	ld	a,L5341_CounterTime
2725  0103 a1c7          	cp	a,#199
2726  0105 2605          	jrne	L42
2727  0107 ae0001        	ldw	x,#1
2728  010a 2001          	jra	L62
2729  010c               L42:
2730  010c 5f            	clrw	x
2731  010d               L62:
2732  010d 1f0d          	ldw	(OFST-5,sp),x
2733  010f b600          	ld	a,L5341_CounterTime
2734  0111 a1ae          	cp	a,#174
2735  0113 2605          	jrne	L03
2736  0115 ae0001        	ldw	x,#1
2737  0118 2001          	jra	L23
2738  011a               L03:
2739  011a 5f            	clrw	x
2740  011b               L23:
2741  011b 1f0b          	ldw	(OFST-7,sp),x
2742  011d b600          	ld	a,L5341_CounterTime
2743  011f a195          	cp	a,#149
2744  0121 2605          	jrne	L43
2745  0123 ae0001        	ldw	x,#1
2746  0126 2001          	jra	L63
2747  0128               L43:
2748  0128 5f            	clrw	x
2749  0129               L63:
2750  0129 1f09          	ldw	(OFST-9,sp),x
2751  012b b600          	ld	a,L5341_CounterTime
2752  012d a17c          	cp	a,#124
2753  012f 2605          	jrne	L04
2754  0131 ae0001        	ldw	x,#1
2755  0134 2001          	jra	L24
2756  0136               L04:
2757  0136 5f            	clrw	x
2758  0137               L24:
2759  0137 1f07          	ldw	(OFST-11,sp),x
2760  0139 b600          	ld	a,L5341_CounterTime
2761  013b a163          	cp	a,#99
2762  013d 2605          	jrne	L44
2763  013f ae0001        	ldw	x,#1
2764  0142 2001          	jra	L64
2765  0144               L44:
2766  0144 5f            	clrw	x
2767  0145               L64:
2768  0145 1f05          	ldw	(OFST-13,sp),x
2769  0147 b600          	ld	a,L5341_CounterTime
2770  0149 a14a          	cp	a,#74
2771  014b 2605          	jrne	L05
2772  014d ae0001        	ldw	x,#1
2773  0150 2001          	jra	L25
2774  0152               L05:
2775  0152 5f            	clrw	x
2776  0153               L25:
2777  0153 1f03          	ldw	(OFST-15,sp),x
2778  0155 b600          	ld	a,L5341_CounterTime
2779  0157 a131          	cp	a,#49
2780  0159 2605          	jrne	L45
2781  015b ae0001        	ldw	x,#1
2782  015e 2001          	jra	L65
2783  0160               L45:
2784  0160 5f            	clrw	x
2785  0161               L65:
2786  0161 1f01          	ldw	(OFST-17,sp),x
2787  0163 b600          	ld	a,L5341_CounterTime
2788  0165 a118          	cp	a,#24
2789  0167 2605          	jrne	L06
2790  0169 ae0001        	ldw	x,#1
2791  016c 2001          	jra	L26
2792  016e               L06:
2793  016e 5f            	clrw	x
2794  016f               L26:
2795  016f 01            	rrwa	x,a
2796  0170 1a02          	or	a,(OFST-16,sp)
2797  0172 01            	rrwa	x,a
2798  0173 1a01          	or	a,(OFST-17,sp)
2799  0175 01            	rrwa	x,a
2800  0176 01            	rrwa	x,a
2801  0177 1a04          	or	a,(OFST-14,sp)
2802  0179 01            	rrwa	x,a
2803  017a 1a03          	or	a,(OFST-15,sp)
2804  017c 01            	rrwa	x,a
2805  017d 01            	rrwa	x,a
2806  017e 1a06          	or	a,(OFST-12,sp)
2807  0180 01            	rrwa	x,a
2808  0181 1a05          	or	a,(OFST-13,sp)
2809  0183 01            	rrwa	x,a
2810  0184 01            	rrwa	x,a
2811  0185 1a08          	or	a,(OFST-10,sp)
2812  0187 01            	rrwa	x,a
2813  0188 1a07          	or	a,(OFST-11,sp)
2814  018a 01            	rrwa	x,a
2815  018b 01            	rrwa	x,a
2816  018c 1a0a          	or	a,(OFST-8,sp)
2817  018e 01            	rrwa	x,a
2818  018f 1a09          	or	a,(OFST-9,sp)
2819  0191 01            	rrwa	x,a
2820  0192 01            	rrwa	x,a
2821  0193 1a0c          	or	a,(OFST-6,sp)
2822  0195 01            	rrwa	x,a
2823  0196 1a0b          	or	a,(OFST-7,sp)
2824  0198 01            	rrwa	x,a
2825  0199 01            	rrwa	x,a
2826  019a 1a0e          	or	a,(OFST-4,sp)
2827  019c 01            	rrwa	x,a
2828  019d 1a0d          	or	a,(OFST-5,sp)
2829  019f 01            	rrwa	x,a
2830  01a0 01            	rrwa	x,a
2831  01a1 1a10          	or	a,(OFST-2,sp)
2832  01a3 01            	rrwa	x,a
2833  01a4 1a0f          	or	a,(OFST-3,sp)
2834  01a6 01            	rrwa	x,a
2835  01a7 1f11          	ldw	(OFST-1,sp),x
2836  01a9 b600          	ld	a,L5341_CounterTime
2837  01ab a1f9          	cp	a,#249
2838  01ad 2605          	jrne	L46
2839  01af ae0001        	ldw	x,#1
2840  01b2 2001          	jra	L66
2841  01b4               L46:
2842  01b4 5f            	clrw	x
2843  01b5               L66:
2844  01b5 1f0f          	ldw	(OFST-3,sp),x
2845  01b7 1e11          	ldw	x,(OFST-1,sp)
2846  01b9 01            	rrwa	x,a
2847  01ba 1a10          	or	a,(OFST-2,sp)
2848  01bc 01            	rrwa	x,a
2849  01bd 1a0f          	or	a,(OFST-3,sp)
2850  01bf 01            	rrwa	x,a
2851  01c0 a30000        	cpw	x,#0
2852  01c3 2704          	jreq	L5541
2853                     ; 90         FLAGMAIN_100MS=1;
2855  01c5 72140000      	bset	_FlagMain,#2
2856  01c9               L5541:
2857                     ; 92     if(250<=CounterTime)
2859  01c9 b600          	ld	a,L5341_CounterTime
2860  01cb a1fa          	cp	a,#250
2861  01cd 2506          	jrult	L7541
2862                     ; 94         FLAGMAIN_1S=1;
2864  01cf 72160000      	bset	_FlagMain,#3
2865                     ; 95         CounterTime=0;
2867  01d3 3f00          	clr	L5341_CounterTime
2868  01d5               L7541:
2869                     ; 98     if(0!=BeepTimer)
2871  01d5 3d00          	tnz	_BeepTimer
2872  01d7 2702          	jreq	L1641
2873                     ; 99         BeepTimer--;
2875  01d9 3a00          	dec	_BeepTimer
2876  01db               L1641:
2877                     ; 101 }
2880  01db 5b12          	addw	sp,#18
2881  01dd 81            	ret
2894                     	xdef	_TIM4Init
2895                     	xdef	_TIM3Init
2896                     	xdef	_TIM2Init
2897                     	xdef	_TIM1Init
2898                     	xref.b	_FlagMain
2899                     	xdef	_ISR_TIM4_UPD_OVF
2900                     	xdef	_TimerInit
2901                     	xref.b	_BeepTimer
2920                     	end
