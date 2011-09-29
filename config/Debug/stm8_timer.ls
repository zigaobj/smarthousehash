   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2481                     ; 2 void TIM1Init(void)
2481                     ; 3 {
2482                     	switch	.text
2483  0000               f_TIM1Init:
2487                     ; 4     CLK.PCKENR1 |=CLK_PCKENR1_TIM1; // 开启TIM1时钟，stm8 的外设时钟可控
2489  0000 721e50c7      	bset	_CLK+7,#7
2490                     ; 5     TIM1.PSCRH =0x00; // 必须先写高位 H, DIV8 外部晶振 8mhz 
2492  0004 725f5260      	clr	_TIM1+16
2493                     ; 6     TIM1.PSCRL =0x07; // 再写低位 L
2495  0008 35075261      	mov	_TIM1+17,#7
2496                     ; 7     TIM1.ARRH =0x00; // 必须先写高位 H, 自动预装值50000
2498  000c 725f5262      	clr	_TIM1+18
2499                     ; 8     TIM1.ARRL =0x20; // 再写低位 L
2501  0010 35205263      	mov	_TIM1+19,#32
2502                     ; 10     TIM1.CCMR1 =(TIM1.CCMR1 & 0x8c)|0x40; //OC1配置为PWM输出
2504  0014 c65258        	ld	a,_TIM1+8
2505  0017 a48c          	and	a,#140
2506  0019 aa40          	or	a,#64
2507  001b c75258        	ld	_TIM1+8,a
2508                     ; 11     TIM1.CCMR2 =(TIM1.CCMR2 & 0x8c)|0x60; //OC2配置为PWM输出
2510  001e c65259        	ld	a,_TIM1+9
2511  0021 a48c          	and	a,#140
2512  0023 aa60          	or	a,#96
2513  0025 c75259        	ld	_TIM1+9,a
2514                     ; 12     TIM1.CCMR3 =(TIM1.CCMR3 & 0x8c)|0x60; //OC3配置为PWM输出
2516  0028 c6525a        	ld	a,_TIM1+10
2517  002b a48c          	and	a,#140
2518  002d aa60          	or	a,#96
2519  002f c7525a        	ld	_TIM1+10,a
2520                     ; 13     TIM1.CCMR4 =(TIM1.CCMR4 & 0x8c)|0x60; //OC4配置为PWM输出
2522  0032 c6525b        	ld	a,_TIM1+11
2523  0035 a48c          	and	a,#140
2524  0037 aa60          	or	a,#96
2525  0039 c7525b        	ld	_TIM1+11,a
2526                     ; 16     TIM1.OISR =TIM1_OISR_RESET_VALUE; //OC1 OC1N,OC2 OC2N,OC3 OC3N,IdleState==0
2528  003c 725f526f      	clr	_TIM1+31
2529                     ; 17     TIM1.CCR1H =0x00; // OC1,OC1N duty cycle
2531  0040 725f5265      	clr	_TIM1+21
2532                     ; 18     TIM1.CCR1L =0x08;
2534  0044 35085266      	mov	_TIM1+22,#8
2535                     ; 19     TIM1.CCR2H =0x00; // OC2,OC2N duty cycle
2537  0048 725f5267      	clr	_TIM1+23
2538                     ; 20     TIM1.CCR2L =0x10;
2540  004c 35105268      	mov	_TIM1+24,#16
2541                     ; 21     TIM1.CCR3H =0x00; // OC3,OC3N duty cycle
2543  0050 725f5269      	clr	_TIM1+25
2544                     ; 22     TIM1.CCR3L =0x18;
2546  0054 3518526a      	mov	_TIM1+26,#24
2547                     ; 23     TIM1.CCR4H =0x00; // OC3,OC3N duty cycle
2549  0058 725f526b      	clr	_TIM1+27
2550                     ; 24     TIM1.CCR4L =0x1f;
2552  005c 351f526c      	mov	_TIM1+28,#31
2553                     ; 25     TIM1.DTR =0x1f; //DeadTime==4us
2555  0060 351f526e      	mov	_TIM1+30,#31
2556                     ; 26     TIM1.BKR |=TIM1_BKR_MOE; //MOE==1
2558  0064 721e526d      	bset	_TIM1+29,#7
2559                     ; 31     TIM1.IER |=TIM1_IER_COMIE; //允许中断
2561  0068 721a5254      	bset	_TIM1+4,#5
2562                     ; 32     TIM1.CR2 |=TIM1_CR2_COMS|TIM1_CR2_CCPC; 
2564  006c c65251        	ld	a,_TIM1+1
2565  006f aa05          	or	a,#5
2566  0071 c75251        	ld	_TIM1+1,a
2567                     ; 33     TIM1.CR1 |=TIM1_CR1_CEN; // 开启定时器
2569  0074 72105250      	bset	_TIM1,#0
2570                     ; 34 }
2573  0078 87            	retf
2597                     ; 36 void TIM2Init(void)
2597                     ; 37 {
2598                     	switch	.text
2599  0079               f_TIM2Init:
2603                     ; 38     CLK.PCKENR1 |=CLK_PCKENR1_TIM2; // 开启TIM2时钟，stm8 的外设时钟可控
2605  0079 721a50c7      	bset	_CLK+7,#5
2606                     ; 39     TIM2.PSCR |=0x03; //DIV 2^15 外部晶振 8mhz 除以 2^15 实现单位时间为 1us
2608  007d c6530c        	ld	a,_TIM2+12
2609  0080 aa03          	or	a,#3
2610  0082 c7530c        	ld	_TIM2+12,a
2611                     ; 40     TIM2.ARRH =0x01; // 必须先写高位 H
2613  0085 3501530d      	mov	_TIM2+13,#1
2614                     ; 41     TIM2.ARRL =0x00; // 再写低位 L
2616  0089 725f530e      	clr	_TIM2+14
2617                     ; 42     TIM2.CCMR1 =TIM2_CCMR1_CCxS_IC_TI1|TIM2_CCMR_ICxF_8; // 8个Fmaster去抖时间
2619  008d 35315305      	mov	_TIM2+5,#49
2620                     ; 43     TIM2.CCMR2 =TIM2_CCMR2_CCxS_IC_TI2|TIM2_CCMR_ICxF_8;
2622  0091 35315306      	mov	_TIM2+6,#49
2623                     ; 44     TIM2.CCMR3 =TIM2_CCMR3_CCxS_IC_TI3|TIM2_CCMR_ICxF_8;
2625  0095 35315307      	mov	_TIM2+7,#49
2626                     ; 45     TIM2.CCER1 =TIM2_CCER1_CC1E|TIM2_CCER1_CC2E; //捕获通道使能
2628  0099 35115308      	mov	_TIM2+8,#17
2629                     ; 46     TIM2.CCER2 =TIM2_CCER2_CC3E;
2631  009d 35015309      	mov	_TIM2+9,#1
2632                     ; 47     TIM2.IER =TIM2_IER_CC1IE|TIM2_IER_CC2IE|TIM2_IER_CC3IE; // 允许中断
2634  00a1 350e5301      	mov	_TIM2+1,#14
2635                     ; 48     TIM2.CR1 |=TIM2_CR1_CEN; // 开启定时器
2637  00a5 72105300      	bset	_TIM2,#0
2638                     ; 49 }
2641  00a9 87            	retf
2665                     ; 51 void TIM3Init(void)
2665                     ; 52 {
2666                     	switch	.text
2667  00aa               f_TIM3Init:
2671                     ; 53     CLK.PCKENR1 |=CLK_PCKENR1_TIM3; // 开启TIM3时钟，stm8 的外设时钟可控
2673  00aa 721c50c7      	bset	_CLK+7,#6
2674                     ; 54     TIM3.PSCR |=0x0f; //DIV 2^15 外部晶振 8mhz 除以 2^15 实现单位时间为 4096us
2676  00ae c6532a        	ld	a,_TIM3+10
2677  00b1 aa0f          	or	a,#15
2678  00b3 c7532a        	ld	_TIM3+10,a
2679                     ; 55     TIM3.ARRH =0x00; // 必须先写高位 H
2681  00b6 725f532b      	clr	_TIM3+11
2682                     ; 56     TIM3.ARRL =0x80; // 再写低位 L
2684  00ba 3580532c      	mov	_TIM3+12,#128
2685                     ; 57     TIM3.IER |=TIM3_IER_UIE; // 允许中断
2687  00be 72105321      	bset	_TIM3+1,#0
2688                     ; 58     TIM3.CR1 |=TIM3_CR1_CEN; // 开启定时器
2690  00c2 72105320      	bset	_TIM3,#0
2691                     ; 59 }
2694  00c6 87            	retf
2718                     ; 61 void TIM4Init(void)
2718                     ; 62 {
2719                     	switch	.text
2720  00c7               f_TIM4Init:
2724                     ; 63     CLK.PCKENR1 |=CLK_PCKENR1_TIM4; // 开启TIM4时钟，stm8 的外设时钟可控
2726  00c7 721850c7      	bset	_CLK+7,#4
2727                     ; 64     TIM4.PSCR =7; //DIV 2^7 外部晶振 8mhz 除以 2^7 实现单位时间为 16us
2729  00cb 35075345      	mov	_TIM4+5,#7
2730                     ; 65     TIM4.ARR =249; //timer period = 1/(8MHz/128)*(249+1) =4 ms
2732  00cf 35f95346      	mov	_TIM4+6,#249
2733                     ; 66     TIM4.CNTR=6; //counter=256-6=250
2735  00d3 35065344      	mov	_TIM4+4,#6
2736                     ; 67     TIM4.SR1 =0;
2738  00d7 725f5342      	clr	_TIM4+2
2739                     ; 68     TIM4.IER |=TIM4_IER_UIE; // 允许中断
2741  00db 72105341      	bset	_TIM4+1,#0
2742                     ; 69     TIM4.CR1 |=TIM4_CR1_CEN; // 开启定时器
2744  00df 72105340      	bset	_TIM4,#0
2745                     ; 70 }
2748  00e3 87            	retf
2771                     ; 72 void TimerInit(void)
2771                     ; 73 {
2772                     	switch	.text
2773  00e4               f_TimerInit:
2777                     ; 77     TIM4Init();
2779  00e4 8dc700c7      	callf	f_TIM4Init
2781                     ; 78 }
2784  00e8 87            	retf
2786                     	switch	.data
2787  0000               L3251_CounterTime:
2788  0000 00            	dc.b	0
2823                     ; 80 void ISR_TIM4_UPD_OVF(void)
2823                     ; 81 {
2824                     	switch	.text
2825  00e9               f_ISR_TIM4_UPD_OVF:
2827  00e9 5212          	subw	sp,#18
2828       00000012      OFST:	set	18
2831                     ; 83 	TIM4.SR1 &=(~TIM4_SR1_UIF); //清更新事件标志
2833  00eb 72115342      	bres	_TIM4+2,#0
2834                     ; 84     FLAGMAIN_4MS=1;
2836  00ef 72120000      	bset	_FlagMain,#1
2837                     ; 85     CounterTime++;
2839  00f3 725c0000      	inc	L3251_CounterTime
2840                     ; 86     if(24==CounterTime|49==CounterTime|74==CounterTime|99==CounterTime
2840                     ; 87     |124==CounterTime|149==CounterTime|174==CounterTime|199==CounterTime
2840                     ; 88     |224==CounterTime|249==CounterTime)
2842  00f7 c60000        	ld	a,L3251_CounterTime
2843  00fa a1e0          	cp	a,#224
2844  00fc 2605          	jrne	L02
2845  00fe ae0001        	ldw	x,#1
2846  0101 2001          	jra	L22
2847  0103               L02:
2848  0103 5f            	clrw	x
2849  0104               L22:
2850  0104 1f0f          	ldw	(OFST-3,sp),x
2851  0106 c60000        	ld	a,L3251_CounterTime
2852  0109 a1c7          	cp	a,#199
2853  010b 2605          	jrne	L42
2854  010d ae0001        	ldw	x,#1
2855  0110 2001          	jra	L62
2856  0112               L42:
2857  0112 5f            	clrw	x
2858  0113               L62:
2859  0113 1f0d          	ldw	(OFST-5,sp),x
2860  0115 c60000        	ld	a,L3251_CounterTime
2861  0118 a1ae          	cp	a,#174
2862  011a 2605          	jrne	L03
2863  011c ae0001        	ldw	x,#1
2864  011f 2001          	jra	L23
2865  0121               L03:
2866  0121 5f            	clrw	x
2867  0122               L23:
2868  0122 1f0b          	ldw	(OFST-7,sp),x
2869  0124 c60000        	ld	a,L3251_CounterTime
2870  0127 a195          	cp	a,#149
2871  0129 2605          	jrne	L43
2872  012b ae0001        	ldw	x,#1
2873  012e 2001          	jra	L63
2874  0130               L43:
2875  0130 5f            	clrw	x
2876  0131               L63:
2877  0131 1f09          	ldw	(OFST-9,sp),x
2878  0133 c60000        	ld	a,L3251_CounterTime
2879  0136 a17c          	cp	a,#124
2880  0138 2605          	jrne	L04
2881  013a ae0001        	ldw	x,#1
2882  013d 2001          	jra	L24
2883  013f               L04:
2884  013f 5f            	clrw	x
2885  0140               L24:
2886  0140 1f07          	ldw	(OFST-11,sp),x
2887  0142 c60000        	ld	a,L3251_CounterTime
2888  0145 a163          	cp	a,#99
2889  0147 2605          	jrne	L44
2890  0149 ae0001        	ldw	x,#1
2891  014c 2001          	jra	L64
2892  014e               L44:
2893  014e 5f            	clrw	x
2894  014f               L64:
2895  014f 1f05          	ldw	(OFST-13,sp),x
2896  0151 c60000        	ld	a,L3251_CounterTime
2897  0154 a14a          	cp	a,#74
2898  0156 2605          	jrne	L05
2899  0158 ae0001        	ldw	x,#1
2900  015b 2001          	jra	L25
2901  015d               L05:
2902  015d 5f            	clrw	x
2903  015e               L25:
2904  015e 1f03          	ldw	(OFST-15,sp),x
2905  0160 c60000        	ld	a,L3251_CounterTime
2906  0163 a131          	cp	a,#49
2907  0165 2605          	jrne	L45
2908  0167 ae0001        	ldw	x,#1
2909  016a 2001          	jra	L65
2910  016c               L45:
2911  016c 5f            	clrw	x
2912  016d               L65:
2913  016d 1f01          	ldw	(OFST-17,sp),x
2914  016f c60000        	ld	a,L3251_CounterTime
2915  0172 a118          	cp	a,#24
2916  0174 2605          	jrne	L06
2917  0176 ae0001        	ldw	x,#1
2918  0179 2001          	jra	L26
2919  017b               L06:
2920  017b 5f            	clrw	x
2921  017c               L26:
2922  017c 01            	rrwa	x,a
2923  017d 1a02          	or	a,(OFST-16,sp)
2924  017f 01            	rrwa	x,a
2925  0180 1a01          	or	a,(OFST-17,sp)
2926  0182 01            	rrwa	x,a
2927  0183 01            	rrwa	x,a
2928  0184 1a04          	or	a,(OFST-14,sp)
2929  0186 01            	rrwa	x,a
2930  0187 1a03          	or	a,(OFST-15,sp)
2931  0189 01            	rrwa	x,a
2932  018a 01            	rrwa	x,a
2933  018b 1a06          	or	a,(OFST-12,sp)
2934  018d 01            	rrwa	x,a
2935  018e 1a05          	or	a,(OFST-13,sp)
2936  0190 01            	rrwa	x,a
2937  0191 01            	rrwa	x,a
2938  0192 1a08          	or	a,(OFST-10,sp)
2939  0194 01            	rrwa	x,a
2940  0195 1a07          	or	a,(OFST-11,sp)
2941  0197 01            	rrwa	x,a
2942  0198 01            	rrwa	x,a
2943  0199 1a0a          	or	a,(OFST-8,sp)
2944  019b 01            	rrwa	x,a
2945  019c 1a09          	or	a,(OFST-9,sp)
2946  019e 01            	rrwa	x,a
2947  019f 01            	rrwa	x,a
2948  01a0 1a0c          	or	a,(OFST-6,sp)
2949  01a2 01            	rrwa	x,a
2950  01a3 1a0b          	or	a,(OFST-7,sp)
2951  01a5 01            	rrwa	x,a
2952  01a6 01            	rrwa	x,a
2953  01a7 1a0e          	or	a,(OFST-4,sp)
2954  01a9 01            	rrwa	x,a
2955  01aa 1a0d          	or	a,(OFST-5,sp)
2956  01ac 01            	rrwa	x,a
2957  01ad 01            	rrwa	x,a
2958  01ae 1a10          	or	a,(OFST-2,sp)
2959  01b0 01            	rrwa	x,a
2960  01b1 1a0f          	or	a,(OFST-3,sp)
2961  01b3 01            	rrwa	x,a
2962  01b4 1f11          	ldw	(OFST-1,sp),x
2963  01b6 c60000        	ld	a,L3251_CounterTime
2964  01b9 a1f9          	cp	a,#249
2965  01bb 2605          	jrne	L46
2966  01bd ae0001        	ldw	x,#1
2967  01c0 2001          	jra	L66
2968  01c2               L46:
2969  01c2 5f            	clrw	x
2970  01c3               L66:
2971  01c3 1f0f          	ldw	(OFST-3,sp),x
2972  01c5 1e11          	ldw	x,(OFST-1,sp)
2973  01c7 01            	rrwa	x,a
2974  01c8 1a10          	or	a,(OFST-2,sp)
2975  01ca 01            	rrwa	x,a
2976  01cb 1a0f          	or	a,(OFST-3,sp)
2977  01cd 01            	rrwa	x,a
2978  01ce a30000        	cpw	x,#0
2979  01d1 270e          	jreq	L1451
2980                     ; 90         FLAGMAIN_100MS=1;
2982  01d3 72140000      	bset	_FlagMain,#2
2983                     ; 91         if(CanProtocol1sTimer>0)
2985  01d7 725d0000      	tnz	_CanProtocol1sTimer
2986  01db 2704          	jreq	L1451
2987                     ; 92             CanProtocol1sTimer--;
2989  01dd 725a0000      	dec	_CanProtocol1sTimer
2990  01e1               L1451:
2991                     ; 94     if(250<=CounterTime)
2993  01e1 c60000        	ld	a,L3251_CounterTime
2994  01e4 a1fa          	cp	a,#250
2995  01e6 2508          	jrult	L5451
2996                     ; 96         FLAGMAIN_1S=1;
2998  01e8 72160000      	bset	_FlagMain,#3
2999                     ; 97         CounterTime=0;
3001  01ec 725f0000      	clr	L3251_CounterTime
3002  01f0               L5451:
3003                     ; 100     if(0!=BeepTimer)
3005  01f0 725d0000      	tnz	_BeepTimer
3006  01f4 2704          	jreq	L7451
3007                     ; 101         BeepTimer--;
3009  01f6 725a0000      	dec	_BeepTimer
3010  01fa               L7451:
3011                     ; 102     DebugWord[0]++;
3013  01fa ae0000        	ldw	x,#_DebugWord
3014  01fd a601          	ld	a,#1
3015  01ff 8d000000      	callf	d_lgadc
3017                     ; 103     DebugWord[1]=DebugWord[0];
3019  0203 ce0002        	ldw	x,_DebugWord+2
3020  0206 cf0006        	ldw	_DebugWord+6,x
3021  0209 ce0000        	ldw	x,_DebugWord
3022  020c cf0004        	ldw	_DebugWord+4,x
3023                     ; 105 }
3026  020f 5b12          	addw	sp,#18
3027  0211 87            	retf
3039                     	xdef	f_TIM4Init
3040                     	xdef	f_TIM3Init
3041                     	xdef	f_TIM2Init
3042                     	xdef	f_TIM1Init
3043                     	xref	_DebugWord
3044                     	xref	_FlagMain
3045                     	xref	_CanProtocol1sTimer
3046                     	xdef	f_ISR_TIM4_UPD_OVF
3047                     	xdef	f_TimerInit
3048                     	xref	_BeepTimer
3067                     	xref	d_lgadc
3068                     	end
