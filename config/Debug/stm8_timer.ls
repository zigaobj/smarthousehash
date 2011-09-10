   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
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
2689                     ; 80 void ISR_TIM4_UPD_OVF(void)
2689                     ; 81 {
2690                     	switch	.text
2691  00e9               f_ISR_TIM4_UPD_OVF:
2693  00e9 5212          	subw	sp,#18
2694       00000012      OFST:	set	18
2697                     ; 83 	TIM4.SR1 &=(~TIM4_SR1_UIF); //清更新事件标志
2699  00eb 72115342      	bres	_TIM4+2,#0
2700                     ; 84     FLAGMAIN_4MS=1;
2702  00ef 72120000      	bset	_FlagMain,#1
2703                     ; 85     CounterTime++;
2705  00f3 725c0000      	inc	L5341_CounterTime
2706                     ; 86     if(24==CounterTime|49==CounterTime|74==CounterTime|99==CounterTime
2706                     ; 87     |124==CounterTime|149==CounterTime|174==CounterTime|199==CounterTime
2706                     ; 88     |224==CounterTime|249==CounterTime)
2708  00f7 c60000        	ld	a,L5341_CounterTime
2709  00fa a1e0          	cp	a,#224
2710  00fc 2605          	jrne	L02
2711  00fe ae0001        	ldw	x,#1
2712  0101 2001          	jra	L22
2713  0103               L02:
2714  0103 5f            	clrw	x
2715  0104               L22:
2716  0104 1f0f          	ldw	(OFST-3,sp),x
2717  0106 c60000        	ld	a,L5341_CounterTime
2718  0109 a1c7          	cp	a,#199
2719  010b 2605          	jrne	L42
2720  010d ae0001        	ldw	x,#1
2721  0110 2001          	jra	L62
2722  0112               L42:
2723  0112 5f            	clrw	x
2724  0113               L62:
2725  0113 1f0d          	ldw	(OFST-5,sp),x
2726  0115 c60000        	ld	a,L5341_CounterTime
2727  0118 a1ae          	cp	a,#174
2728  011a 2605          	jrne	L03
2729  011c ae0001        	ldw	x,#1
2730  011f 2001          	jra	L23
2731  0121               L03:
2732  0121 5f            	clrw	x
2733  0122               L23:
2734  0122 1f0b          	ldw	(OFST-7,sp),x
2735  0124 c60000        	ld	a,L5341_CounterTime
2736  0127 a195          	cp	a,#149
2737  0129 2605          	jrne	L43
2738  012b ae0001        	ldw	x,#1
2739  012e 2001          	jra	L63
2740  0130               L43:
2741  0130 5f            	clrw	x
2742  0131               L63:
2743  0131 1f09          	ldw	(OFST-9,sp),x
2744  0133 c60000        	ld	a,L5341_CounterTime
2745  0136 a17c          	cp	a,#124
2746  0138 2605          	jrne	L04
2747  013a ae0001        	ldw	x,#1
2748  013d 2001          	jra	L24
2749  013f               L04:
2750  013f 5f            	clrw	x
2751  0140               L24:
2752  0140 1f07          	ldw	(OFST-11,sp),x
2753  0142 c60000        	ld	a,L5341_CounterTime
2754  0145 a163          	cp	a,#99
2755  0147 2605          	jrne	L44
2756  0149 ae0001        	ldw	x,#1
2757  014c 2001          	jra	L64
2758  014e               L44:
2759  014e 5f            	clrw	x
2760  014f               L64:
2761  014f 1f05          	ldw	(OFST-13,sp),x
2762  0151 c60000        	ld	a,L5341_CounterTime
2763  0154 a14a          	cp	a,#74
2764  0156 2605          	jrne	L05
2765  0158 ae0001        	ldw	x,#1
2766  015b 2001          	jra	L25
2767  015d               L05:
2768  015d 5f            	clrw	x
2769  015e               L25:
2770  015e 1f03          	ldw	(OFST-15,sp),x
2771  0160 c60000        	ld	a,L5341_CounterTime
2772  0163 a131          	cp	a,#49
2773  0165 2605          	jrne	L45
2774  0167 ae0001        	ldw	x,#1
2775  016a 2001          	jra	L65
2776  016c               L45:
2777  016c 5f            	clrw	x
2778  016d               L65:
2779  016d 1f01          	ldw	(OFST-17,sp),x
2780  016f c60000        	ld	a,L5341_CounterTime
2781  0172 a118          	cp	a,#24
2782  0174 2605          	jrne	L06
2783  0176 ae0001        	ldw	x,#1
2784  0179 2001          	jra	L26
2785  017b               L06:
2786  017b 5f            	clrw	x
2787  017c               L26:
2788  017c 01            	rrwa	x,a
2789  017d 1a02          	or	a,(OFST-16,sp)
2790  017f 01            	rrwa	x,a
2791  0180 1a01          	or	a,(OFST-17,sp)
2792  0182 01            	rrwa	x,a
2793  0183 01            	rrwa	x,a
2794  0184 1a04          	or	a,(OFST-14,sp)
2795  0186 01            	rrwa	x,a
2796  0187 1a03          	or	a,(OFST-15,sp)
2797  0189 01            	rrwa	x,a
2798  018a 01            	rrwa	x,a
2799  018b 1a06          	or	a,(OFST-12,sp)
2800  018d 01            	rrwa	x,a
2801  018e 1a05          	or	a,(OFST-13,sp)
2802  0190 01            	rrwa	x,a
2803  0191 01            	rrwa	x,a
2804  0192 1a08          	or	a,(OFST-10,sp)
2805  0194 01            	rrwa	x,a
2806  0195 1a07          	or	a,(OFST-11,sp)
2807  0197 01            	rrwa	x,a
2808  0198 01            	rrwa	x,a
2809  0199 1a0a          	or	a,(OFST-8,sp)
2810  019b 01            	rrwa	x,a
2811  019c 1a09          	or	a,(OFST-9,sp)
2812  019e 01            	rrwa	x,a
2813  019f 01            	rrwa	x,a
2814  01a0 1a0c          	or	a,(OFST-6,sp)
2815  01a2 01            	rrwa	x,a
2816  01a3 1a0b          	or	a,(OFST-7,sp)
2817  01a5 01            	rrwa	x,a
2818  01a6 01            	rrwa	x,a
2819  01a7 1a0e          	or	a,(OFST-4,sp)
2820  01a9 01            	rrwa	x,a
2821  01aa 1a0d          	or	a,(OFST-5,sp)
2822  01ac 01            	rrwa	x,a
2823  01ad 01            	rrwa	x,a
2824  01ae 1a10          	or	a,(OFST-2,sp)
2825  01b0 01            	rrwa	x,a
2826  01b1 1a0f          	or	a,(OFST-3,sp)
2827  01b3 01            	rrwa	x,a
2828  01b4 1f11          	ldw	(OFST-1,sp),x
2829  01b6 c60000        	ld	a,L5341_CounterTime
2830  01b9 a1f9          	cp	a,#249
2831  01bb 2605          	jrne	L46
2832  01bd ae0001        	ldw	x,#1
2833  01c0 2001          	jra	L66
2834  01c2               L46:
2835  01c2 5f            	clrw	x
2836  01c3               L66:
2837  01c3 1f0f          	ldw	(OFST-3,sp),x
2838  01c5 1e11          	ldw	x,(OFST-1,sp)
2839  01c7 01            	rrwa	x,a
2840  01c8 1a10          	or	a,(OFST-2,sp)
2841  01ca 01            	rrwa	x,a
2842  01cb 1a0f          	or	a,(OFST-3,sp)
2843  01cd 01            	rrwa	x,a
2844  01ce a30000        	cpw	x,#0
2845  01d1 2704          	jreq	L3541
2846                     ; 90         FLAGMAIN_100MS=1;
2848  01d3 72140000      	bset	_FlagMain,#2
2849  01d7               L3541:
2850                     ; 92     if(250<=CounterTime)
2852  01d7 c60000        	ld	a,L5341_CounterTime
2853  01da a1fa          	cp	a,#250
2854  01dc 2508          	jrult	L5541
2855                     ; 94         FLAGMAIN_1S=1;
2857  01de 72160000      	bset	_FlagMain,#3
2858                     ; 95         CounterTime=0;
2860  01e2 725f0000      	clr	L5341_CounterTime
2861  01e6               L5541:
2862                     ; 98     if(0!=BeepTimer)
2864  01e6 725d0000      	tnz	_BeepTimer
2865  01ea 2704          	jreq	L7541
2866                     ; 99         BeepTimer--;
2868  01ec 725a0000      	dec	_BeepTimer
2869  01f0               L7541:
2870                     ; 100     DebugWord[0]++;
2872  01f0 ae0000        	ldw	x,#_DebugWord
2873  01f3 a601          	ld	a,#1
2874  01f5 8d000000      	callf	d_lgadc
2876                     ; 101     DebugWord[1]=DebugWord[0];
2878  01f9 ce0002        	ldw	x,_DebugWord+2
2879  01fc cf0006        	ldw	_DebugWord+6,x
2880  01ff ce0000        	ldw	x,_DebugWord
2881  0202 cf0004        	ldw	_DebugWord+4,x
2882                     ; 103 }
2885  0205 5b12          	addw	sp,#18
2886  0207 87            	retf
2898                     	xdef	f_TIM4Init
2899                     	xdef	f_TIM3Init
2900                     	xdef	f_TIM2Init
2901                     	xdef	f_TIM1Init
2902                     	xref	_DebugWord
2903                     	xref	_FlagMain
2904                     	xdef	f_ISR_TIM4_UPD_OVF
2905                     	xdef	f_TimerInit
2906                     	xref	_BeepTimer
2925                     	xref	d_lgadc
2926                     	end
