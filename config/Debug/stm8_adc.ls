   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2348                     ; 2 void ADCInit(void) //设置单次转换
2348                     ; 3 {
2350                     	switch	.text
2351  0000               _ADCInit:
2355                     ; 4     CLK.PCKENR2 |=0x08; // 使能 adc 时钟
2357  0000 721650ca      	bset	_CLK+10,#3
2358                     ; 5     ADC.CSR =0x00; // 选择通道 0 禁止中断
2360  0004 725f5400      	clr	_ADC
2361                     ; 6     ADC.CR1 =0x00; // 使能 ADC,连续模式,2分频
2363  0008 725f5401      	clr	_ADC+1
2364                     ; 7     ADC.CR2 =0x08; // 数据右对齐， low 8BIT AT ADC_DRL;
2366  000c 35085402      	mov	_ADC+2,#8
2367                     ; 8 }
2370  0010 81            	ret
2425                     ; 10 u8 ADC_8BIT(u8 ch)
2425                     ; 11 {
2426                     	switch	.text
2427  0011               _ADC_8BIT:
2429  0011 5203          	subw	sp,#3
2430       00000003      OFST:	set	3
2433                     ; 14     ADC.CR2=0;
2435  0013 725f5402      	clr	_ADC+2
2436                     ; 15     ADC.CSR =ch &0x0F;
2438  0017 a40f          	and	a,#15
2439  0019 c75400        	ld	_ADC,a
2440                     ; 16     ADC.CR1 |=0x1; // 启动ADC
2442  001c 72105401      	bset	_ADC+1,#0
2443                     ; 17     _asm("nop");
2446  0020 9d            nop
2448                     ; 18     ADC.CR1 |=0x1; // 开始转换
2450  0021 72105401      	bset	_ADC+1,#0
2451                     ; 19     for(i=0;(i<100)&&((ADC.CSR &ADC_CSR_EOC)==0);i++)
2453  0025 0f03          	clr	(OFST+0,sp)
2455  0027 2008          	jra	L7241
2456  0029               L3241:
2457                     ; 20         Delay(1);
2459  0029 ae0001        	ldw	x,#1
2460  002c cd0000        	call	_Delay
2462                     ; 19     for(i=0;(i<100)&&((ADC.CSR &ADC_CSR_EOC)==0);i++)
2464  002f 0c03          	inc	(OFST+0,sp)
2465  0031               L7241:
2468  0031 7b03          	ld	a,(OFST+0,sp)
2469  0033 a164          	cp	a,#100
2470  0035 2407          	jruge	L3341
2472  0037 c65400        	ld	a,_ADC
2473  003a a580          	bcp	a,#128
2474  003c 27eb          	jreq	L3241
2475  003e               L3341:
2476                     ; 21     Adc = ADC.DRH; //READ DATA 因为是右对齐所以先读低位
2478  003e c65404        	ld	a,_ADC+4
2479  0041 5f            	clrw	x
2480  0042 97            	ld	xl,a
2481  0043 1f01          	ldw	(OFST-2,sp),x
2482                     ; 22     ADC.CR1 &=0xfe; // 关闭ADC
2484  0045 72115401      	bres	_ADC+1,#0
2485                     ; 23     return(Adc);
2487  0049 7b02          	ld	a,(OFST-1,sp)
2490  004b 5b03          	addw	sp,#3
2491  004d 81            	ret
2546                     ; 26 u16 ADC_10BIT(u8 ch)
2546                     ; 27 {
2547                     	switch	.text
2548  004e               _ADC_10BIT:
2550  004e 5205          	subw	sp,#5
2551       00000005      OFST:	set	5
2554                     ; 30     ADC.CR2 =0x08; // 数据右对齐， low 8BIT AT ADC_DRL;
2556  0050 35085402      	mov	_ADC+2,#8
2557                     ; 31     ADC.CSR =ch &0x0F;
2559  0054 a40f          	and	a,#15
2560  0056 c75400        	ld	_ADC,a
2561                     ; 32     ADC.CR1 |=0x1; // 启动ADC
2563  0059 72105401      	bset	_ADC+1,#0
2564                     ; 33     _asm("nop");
2567  005d 9d            nop
2569                     ; 34     ADC.CR1 |=0x1; // 开始转换
2571  005e 72105401      	bset	_ADC+1,#0
2572                     ; 35     for(i=0;(i<100)&&((ADC.CSR &ADC_CSR_EOC)==0);i++)
2574  0062 0f05          	clr	(OFST+0,sp)
2576  0064 2008          	jra	L7641
2577  0066               L3641:
2578                     ; 36         Delay(1);
2580  0066 ae0001        	ldw	x,#1
2581  0069 cd0000        	call	_Delay
2583                     ; 35     for(i=0;(i<100)&&((ADC.CSR &ADC_CSR_EOC)==0);i++)
2585  006c 0c05          	inc	(OFST+0,sp)
2586  006e               L7641:
2589  006e 7b05          	ld	a,(OFST+0,sp)
2590  0070 a164          	cp	a,#100
2591  0072 2407          	jruge	L3741
2593  0074 c65400        	ld	a,_ADC
2594  0077 a580          	bcp	a,#128
2595  0079 27eb          	jreq	L3641
2596  007b               L3741:
2597                     ; 37     Adc = ADC.DRH; //READ DATA 因为是右对齐所以先读低位
2599  007b c65404        	ld	a,_ADC+4
2600  007e 5f            	clrw	x
2601  007f 97            	ld	xl,a
2602  0080 1f03          	ldw	(OFST-2,sp),x
2603                     ; 38     Adc<<=8;
2605  0082 7b04          	ld	a,(OFST-1,sp)
2606  0084 6b03          	ld	(OFST-2,sp),a
2607  0086 0f04          	clr	(OFST-1,sp)
2608                     ; 39     Adc +=ADC.DRL;
2610  0088 c65405        	ld	a,_ADC+5
2611  008b 5f            	clrw	x
2612  008c 97            	ld	xl,a
2613  008d 1f01          	ldw	(OFST-4,sp),x
2614  008f 1e03          	ldw	x,(OFST-2,sp)
2615  0091 72fb01        	addw	x,(OFST-4,sp)
2616  0094 1f03          	ldw	(OFST-2,sp),x
2617                     ; 40     ADC.CR1 &=0xfe; // 关闭ADC
2619  0096 72115401      	bres	_ADC+1,#0
2620                     ; 41     return(Adc);
2622  009a 1e03          	ldw	x,(OFST-2,sp)
2625  009c 5b05          	addw	sp,#5
2626  009e 81            	ret
2629                     .const:	section	.text
2630  0000               _AD_Key_Tab:
2631  0000 00            	dc.b	0
2632  0001 01            	dc.b	1
2633  0002 00            	dc.b	0
2634  0003 17            	dc.b	23
2635  0004 02            	dc.b	2
2636  0005 00            	dc.b	0
2637  0006 3c            	dc.b	60
2638  0007 03            	dc.b	3
2639  0008 00            	dc.b	0
2640  0009 5c            	dc.b	92
2641  000a 04            	dc.b	4
2642  000b 00            	dc.b	0
2643  000c 72            	dc.b	114
2644  000d 05            	dc.b	5
2645  000e 00            	dc.b	0
2646  000f 91            	dc.b	145
2647  0010 06            	dc.b	6
2648  0011 00            	dc.b	0
2649  0012 a9            	dc.b	169
2650  0013 07            	dc.b	7
2651  0014 00            	dc.b	0
2652  0015 c0            	dc.b	192
2653  0016 08            	dc.b	8
2654  0017 00            	dc.b	0
2655  0018 d6            	dc.b	214
2656  0019 09            	dc.b	9
2657  001a 00            	dc.b	0
2658  001b ea            	dc.b	234
2659  001c 0a            	dc.b	10
2660  001d 00            	dc.b	0
2661  001e ff            	dc.b	255
2662  001f 00            	dc.b	0
2663  0020 00            	dc.b	0
2709                     ; 58 void Key_Scan_AD(void)
2709                     ; 59 {
2710                     	switch	.text
2711  009f               _Key_Scan_AD:
2713  009f 89            	pushw	x
2714       00000002      OFST:	set	2
2717                     ; 60     u8 index=0;			//当前扫描值
2719  00a0 7b02          	ld	a,(OFST+0,sp)
2720  00a2 97            	ld	xl,a
2721                     ; 61 	u8 ADC_Value=0;
2723  00a3 7b01          	ld	a,(OFST-1,sp)
2724  00a5 97            	ld	xl,a
2725                     ; 62 	ADC_Value=ADC_8BIT(ADC_KEY1);
2727  00a6 a609          	ld	a,#9
2728  00a8 cd0011        	call	_ADC_8BIT
2730  00ab 6b01          	ld	(OFST-1,sp),a
2731                     ; 63 	for(index=0;index<KEY_NUM;index++)
2733  00ad 0f02          	clr	(OFST+0,sp)
2734  00af               L3451:
2735                     ; 65 		if ( (ADC_Value >=((AD_Key_Tab[index][0]>8)?(AD_Key_Tab[index][0]-8):0))
2735                     ; 66 		 &&(ADC_Value <=(AD_Key_Tab[index][0]+8)) )
2737  00af 9c            	rvf
2738  00b0 7b02          	ld	a,(OFST+0,sp)
2739  00b2 97            	ld	xl,a
2740  00b3 a603          	ld	a,#3
2741  00b5 42            	mul	x,a
2742  00b6 d60000        	ld	a,(_AD_Key_Tab,x)
2743  00b9 a109          	cp	a,#9
2744  00bb 2510          	jrult	L41
2745  00bd 7b02          	ld	a,(OFST+0,sp)
2746  00bf 97            	ld	xl,a
2747  00c0 a603          	ld	a,#3
2748  00c2 42            	mul	x,a
2749  00c3 d60000        	ld	a,(_AD_Key_Tab,x)
2750  00c6 5f            	clrw	x
2751  00c7 97            	ld	xl,a
2752  00c8 1d0008        	subw	x,#8
2753  00cb 2001          	jra	L61
2754  00cd               L41:
2755  00cd 5f            	clrw	x
2756  00ce               L61:
2757  00ce 7b01          	ld	a,(OFST-1,sp)
2758  00d0 905f          	clrw	y
2759  00d2 9097          	ld	yl,a
2760  00d4 90bf01        	ldw	c_y+1,y
2761  00d7 b301          	cpw	x,c_y+1
2762  00d9 2c1c          	jrsgt	L1551
2764  00db 9c            	rvf
2765  00dc 7b02          	ld	a,(OFST+0,sp)
2766  00de 97            	ld	xl,a
2767  00df a603          	ld	a,#3
2768  00e1 42            	mul	x,a
2769  00e2 d60000        	ld	a,(_AD_Key_Tab,x)
2770  00e5 5f            	clrw	x
2771  00e6 97            	ld	xl,a
2772  00e7 1c0008        	addw	x,#8
2773  00ea 7b01          	ld	a,(OFST-1,sp)
2774  00ec 905f          	clrw	y
2775  00ee 9097          	ld	yl,a
2776  00f0 90bf01        	ldw	c_y+1,y
2777  00f3 b301          	cpw	x,c_y+1
2778  00f5 2e08          	jrsge	L7451
2779                     ; 68 			break;
2781  00f7               L1551:
2782                     ; 63 	for(index=0;index<KEY_NUM;index++)
2784  00f7 0c02          	inc	(OFST+0,sp)
2787  00f9 7b02          	ld	a,(OFST+0,sp)
2788  00fb a10a          	cp	a,#10
2789  00fd 25b0          	jrult	L3451
2790  00ff               L7451:
2791                     ; 71 	if(AD_Key_Tab[index][1]!=debug_adc)
2793  00ff 7b02          	ld	a,(OFST+0,sp)
2794  0101 97            	ld	xl,a
2795  0102 a603          	ld	a,#3
2796  0104 42            	mul	x,a
2797  0105 d60001        	ld	a,(_AD_Key_Tab+1,x)
2798  0108 5f            	clrw	x
2799  0109 97            	ld	xl,a
2800  010a b300          	cpw	x,_debug_adc
2801  010c 2779          	jreq	L3551
2802                     ; 73 	    debug_adc=AD_Key_Tab[index][1];
2804  010e 7b02          	ld	a,(OFST+0,sp)
2805  0110 97            	ld	xl,a
2806  0111 a603          	ld	a,#3
2807  0113 42            	mul	x,a
2808  0114 d60001        	ld	a,(_AD_Key_Tab+1,x)
2809  0117 5f            	clrw	x
2810  0118 97            	ld	xl,a
2811  0119 bf00          	ldw	_debug_adc,x
2812                     ; 74 	    switch(debug_adc)
2814  011b be00          	ldw	x,_debug_adc
2816                     ; 112 	            break;
2817  011d 5a            	decw	x
2818  011e 271d          	jreq	L5741
2819  0120 5a            	decw	x
2820  0121 2720          	jreq	L7741
2821  0123 5a            	decw	x
2822  0124 2721          	jreq	L1051
2823  0126 5a            	decw	x
2824  0127 2724          	jreq	L3051
2825  0129 5a            	decw	x
2826  012a 272b          	jreq	L5051
2827  012c 5a            	decw	x
2828  012d 2732          	jreq	L7051
2829  012f 5a            	decw	x
2830  0130 2737          	jreq	L1151
2831  0132 5a            	decw	x
2832  0133 273c          	jreq	L3151
2833  0135 5a            	decw	x
2834  0136 2741          	jreq	L5151
2835  0138 5a            	decw	x
2836  0139 2746          	jreq	L7151
2837  013b 204a          	jra	L3551
2838  013d               L5741:
2839                     ; 76 	        case UICC_0:
2839                     ; 77 	            BeepState=BEEP_ON;
2841  013d 35010000      	mov	_BeepState,#1
2842                     ; 78 	            break;
2844  0141 2044          	jra	L3551
2845  0143               L7741:
2846                     ; 79 	        case UICC_1:
2846                     ; 80 	            BeepState=BEEP_OFF;
2848  0143 3f00          	clr	_BeepState
2849                     ; 81 	            break;
2851  0145 2040          	jra	L3551
2852  0147               L1051:
2853                     ; 82 	        case UICC_2:
2853                     ; 83 	            BeepState=BEEP_SHORTBREAK;
2855  0147 35030000      	mov	_BeepState,#3
2856                     ; 84 	            break;
2858  014b 203a          	jra	L3551
2859  014d               L3051:
2860                     ; 85 	        case UICC_3:
2860                     ; 86 	            LED_1=~LED_1;
2862  014d 9012500a      	bcpl	_GPIOC,#1
2863                     ; 87 	            BeepState=BEEP_MIDDLEBREAK;
2865  0151 35040000      	mov	_BeepState,#4
2866                     ; 88 	            break;
2868  0155 2030          	jra	L3551
2869  0157               L5051:
2870                     ; 89 	        case UICC_4:
2870                     ; 90 	            LED_2=~LED_2;
2872  0157 9014500a      	bcpl	_GPIOC,#2
2873                     ; 91 	            BeepState=BEEP_LONGBREAK;
2875  015b 35050000      	mov	_BeepState,#5
2876                     ; 92 	            break;
2878  015f 2026          	jra	L3551
2879  0161               L7051:
2880                     ; 93 	        case UICC_5:
2880                     ; 94 	            LED_3=~LED_3;
2882  0161 9016500a      	bcpl	_GPIOC,#3
2883                     ; 95 	            BeepState=BEEP_OFF;
2885  0165 3f00          	clr	_BeepState
2886                     ; 96 	            break;
2888  0167 201e          	jra	L3551
2889  0169               L1151:
2890                     ; 97 	        case UICC_6:
2890                     ; 98 	            LED_4=~LED_4;
2892  0169 9018500a      	bcpl	_GPIOC,#4
2893                     ; 99 	            BeepState=BEEP_OFF;
2895  016d 3f00          	clr	_BeepState
2896                     ; 100 	            break;
2898  016f 2016          	jra	L3551
2899  0171               L3151:
2900                     ; 101 	        case UICC_7:
2900                     ; 102 	            LED_5=~LED_5;
2902  0171 901a500a      	bcpl	_GPIOC,#5
2903                     ; 103 	            BeepState=BEEP_OFF;
2905  0175 3f00          	clr	_BeepState
2906                     ; 104 	            break;
2908  0177 200e          	jra	L3551
2909  0179               L5151:
2910                     ; 105 	        case UICC_8:
2910                     ; 106 	            LED_6=~LED_6;
2912  0179 901c500a      	bcpl	_GPIOC,#6
2913                     ; 107 	            BeepState=BEEP_OFF;
2915  017d 3f00          	clr	_BeepState
2916                     ; 108 	            break;
2918  017f 2006          	jra	L3551
2919  0181               L7151:
2920                     ; 109 	        case UICC_9:
2920                     ; 110 	            LED_7=~LED_7;
2922  0181 901e500a      	bcpl	_GPIOC,#7
2923                     ; 111 	            BeepState=BEEP_OFF;
2925  0185 3f00          	clr	_BeepState
2926                     ; 112 	            break;
2928  0187               L7551:
2929  0187               L3551:
2930                     ; 115 }
2933  0187 85            	popw	x
2934  0188 81            	ret
2960                     	xdef	_AD_Key_Tab
2961                     	xdef	_Key_Scan_AD
2962                     	xdef	_ADC_10BIT
2963                     	xdef	_ADC_8BIT
2964                     	xdef	_ADCInit
2965                     	xref.b	_debug_adc
2966                     	xref.b	_BeepState
2967                     	xref	_Delay
2968                     	xref.b	c_y
2987                     	end
