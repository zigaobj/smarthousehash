   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2481                     ; 2 void ADCInit(void) //设置单次转换
2481                     ; 3 {
2482                     	switch	.text
2483  0000               f_ADCInit:
2487                     ; 4     CLK.PCKENR2 |=0x08; // 使能 adc 时钟
2489  0000 721650ca      	bset	_CLK+10,#3
2490                     ; 5     ADC.CSR =0x00; // 选择通道 0 禁止中断
2492  0004 725f5400      	clr	_ADC
2493                     ; 6     ADC.CR1 =0x00; // 使能 ADC,连续模式,2分频
2495  0008 725f5401      	clr	_ADC+1
2496                     ; 7     ADC.CR2 =0x08; // 数据右对齐， low 8BIT AT ADC_DRL;
2498  000c 35085402      	mov	_ADC+2,#8
2499                     ; 8 }
2502  0010 87            	retf
2550                     ; 10 u8 ADC_8BIT(u8 ch)
2550                     ; 11 {
2551                     	switch	.text
2552  0011               f_ADC_8BIT:
2554  0011 5203          	subw	sp,#3
2555       00000003      OFST:	set	3
2558                     ; 14     ADC.CR2=0;
2560  0013 725f5402      	clr	_ADC+2
2561                     ; 15     ADC.CSR =ch &0x0F;
2563  0017 a40f          	and	a,#15
2564  0019 c75400        	ld	_ADC,a
2565                     ; 16     ADC.CR1 |=0x1; // 启动ADC
2567  001c 72105401      	bset	_ADC+1,#0
2568                     ; 17     _asm("nop");
2571  0020 9d            nop
2573                     ; 18     ADC.CR1 |=0x1; // 开始转换
2575  0021 72105401      	bset	_ADC+1,#0
2576                     ; 19     for(i=0;(i<100)&&((ADC.CSR &ADC_CSR_EOC)==0);i++)
2578  0025 0f03          	clr	(OFST+0,sp)
2580  0027 2009          	jra	L7051
2581  0029               L3051:
2582                     ; 20         Delay(1);
2584  0029 ae0001        	ldw	x,#1
2585  002c 8d000000      	callf	f_Delay
2587                     ; 19     for(i=0;(i<100)&&((ADC.CSR &ADC_CSR_EOC)==0);i++)
2589  0030 0c03          	inc	(OFST+0,sp)
2590  0032               L7051:
2593  0032 7b03          	ld	a,(OFST+0,sp)
2594  0034 a164          	cp	a,#100
2595  0036 2407          	jruge	L3151
2597  0038 c65400        	ld	a,_ADC
2598  003b a580          	bcp	a,#128
2599  003d 27ea          	jreq	L3051
2600  003f               L3151:
2601                     ; 21     Adc = ADC.DRH; //READ DATA 因为是右对齐所以先读低位
2603  003f c65404        	ld	a,_ADC+4
2604  0042 5f            	clrw	x
2605  0043 97            	ld	xl,a
2606  0044 1f01          	ldw	(OFST-2,sp),x
2607                     ; 22     ADC.CR1 &=0xfe; // 关闭ADC
2609  0046 72115401      	bres	_ADC+1,#0
2610                     ; 23     return(Adc);
2612  004a 7b02          	ld	a,(OFST-1,sp)
2615  004c 5b03          	addw	sp,#3
2616  004e 87            	retf
2664                     ; 26 u16 ADC_10BIT(u8 ch)
2664                     ; 27 {
2665                     	switch	.text
2666  004f               f_ADC_10BIT:
2668  004f 5205          	subw	sp,#5
2669       00000005      OFST:	set	5
2672                     ; 30     ADC.CR2 =0x08; // 数据右对齐， low 8BIT AT ADC_DRL;
2674  0051 35085402      	mov	_ADC+2,#8
2675                     ; 31     ADC.CSR =ch &0x0F;
2677  0055 a40f          	and	a,#15
2678  0057 c75400        	ld	_ADC,a
2679                     ; 32     ADC.CR1 |=0x1; // 启动ADC
2681  005a 72105401      	bset	_ADC+1,#0
2682                     ; 33     _asm("nop");
2685  005e 9d            nop
2687                     ; 34     ADC.CR1 |=0x1; // 开始转换
2689  005f 72105401      	bset	_ADC+1,#0
2690                     ; 35     for(i=0;(i<100)&&((ADC.CSR &ADC_CSR_EOC)==0);i++)
2692  0063 0f05          	clr	(OFST+0,sp)
2694  0065 2009          	jra	L1451
2695  0067               L5351:
2696                     ; 36         Delay(1);
2698  0067 ae0001        	ldw	x,#1
2699  006a 8d000000      	callf	f_Delay
2701                     ; 35     for(i=0;(i<100)&&((ADC.CSR &ADC_CSR_EOC)==0);i++)
2703  006e 0c05          	inc	(OFST+0,sp)
2704  0070               L1451:
2707  0070 7b05          	ld	a,(OFST+0,sp)
2708  0072 a164          	cp	a,#100
2709  0074 2407          	jruge	L5451
2711  0076 c65400        	ld	a,_ADC
2712  0079 a580          	bcp	a,#128
2713  007b 27ea          	jreq	L5351
2714  007d               L5451:
2715                     ; 37     Adc = ADC.DRH; //READ DATA 因为是右对齐所以先读低位
2717  007d c65404        	ld	a,_ADC+4
2718  0080 5f            	clrw	x
2719  0081 97            	ld	xl,a
2720  0082 1f03          	ldw	(OFST-2,sp),x
2721                     ; 38     Adc<<=8;
2723  0084 7b04          	ld	a,(OFST-1,sp)
2724  0086 6b03          	ld	(OFST-2,sp),a
2725  0088 0f04          	clr	(OFST-1,sp)
2726                     ; 39     Adc +=ADC.DRL;
2728  008a c65405        	ld	a,_ADC+5
2729  008d 5f            	clrw	x
2730  008e 97            	ld	xl,a
2731  008f 1f01          	ldw	(OFST-4,sp),x
2732  0091 1e03          	ldw	x,(OFST-2,sp)
2733  0093 72fb01        	addw	x,(OFST-4,sp)
2734  0096 1f03          	ldw	(OFST-2,sp),x
2735                     ; 40     ADC.CR1 &=0xfe; // 关闭ADC
2737  0098 72115401      	bres	_ADC+1,#0
2738                     ; 41     return(Adc);
2740  009c 1e03          	ldw	x,(OFST-2,sp)
2743  009e 5b05          	addw	sp,#5
2744  00a0 87            	retf
2746                     .const:	section	.text
2747  0000               _AD_Key_Tab:
2748  0000 00            	dc.b	0
2749  0001 01            	dc.b	1
2750  0002 00            	dc.b	0
2751  0003 16            	dc.b	22
2752  0004 02            	dc.b	2
2753  0005 00            	dc.b	0
2754  0006 2d            	dc.b	45
2755  0007 03            	dc.b	3
2756  0008 00            	dc.b	0
2757  0009 50            	dc.b	80
2758  000a 04            	dc.b	4
2759  000b 00            	dc.b	0
2760  000c 6d            	dc.b	109
2761  000d 05            	dc.b	5
2762  000e 00            	dc.b	0
2763  000f 8e            	dc.b	142
2764  0010 06            	dc.b	6
2765  0011 00            	dc.b	0
2766  0012 a8            	dc.b	168
2767  0013 07            	dc.b	7
2768  0014 00            	dc.b	0
2769  0015 bf            	dc.b	191
2770  0016 08            	dc.b	8
2771  0017 00            	dc.b	0
2772  0018 d0            	dc.b	208
2773  0019 09            	dc.b	9
2774  001a 00            	dc.b	0
2775  001b e0            	dc.b	224
2776  001c 0a            	dc.b	10
2777  001d 00            	dc.b	0
2778  001e ff            	dc.b	255
2779  001f 00            	dc.b	0
2780  0020 00            	dc.b	0
2781                     	switch	.bss
2782  0000               L7451_Key_backup:
2783  0000 00            	ds.b	1
2833                     ; 72 void Key_Scan_AD(void)
2833                     ; 73 {
2834                     	switch	.text
2835  00a1               f_Key_Scan_AD:
2837  00a1 89            	pushw	x
2838       00000002      OFST:	set	2
2841                     ; 74     u8 index=0;			//当前扫描值
2843  00a2 7b02          	ld	a,(OFST+0,sp)
2844  00a4 97            	ld	xl,a
2845                     ; 75 	u8 ADC_Value=0;
2847  00a5 7b01          	ld	a,(OFST-1,sp)
2848  00a7 97            	ld	xl,a
2849                     ; 77 	ADC_Value=ADC_8BIT(ADC_KEY1);
2851  00a8 a609          	ld	a,#9
2852  00aa 8d110011      	callf	f_ADC_8BIT
2854  00ae 6b01          	ld	(OFST-1,sp),a
2855                     ; 78 	for(index=0;index<KEY_NUM;index++)
2857  00b0 0f02          	clr	(OFST+0,sp)
2858  00b2               L5161:
2859                     ; 80 		if ( (ADC_Value >=((AD_Key_Tab[index][0]>8)?(AD_Key_Tab[index][0]-8):0))
2859                     ; 81 		 &&(ADC_Value <=(AD_Key_Tab[index][0]+8)) )
2861  00b2 9c            	rvf
2862  00b3 7b02          	ld	a,(OFST+0,sp)
2863  00b5 97            	ld	xl,a
2864  00b6 a603          	ld	a,#3
2865  00b8 42            	mul	x,a
2866  00b9 d60000        	ld	a,(_AD_Key_Tab,x)
2867  00bc a109          	cp	a,#9
2868  00be 2510          	jrult	L41
2869  00c0 7b02          	ld	a,(OFST+0,sp)
2870  00c2 97            	ld	xl,a
2871  00c3 a603          	ld	a,#3
2872  00c5 42            	mul	x,a
2873  00c6 d60000        	ld	a,(_AD_Key_Tab,x)
2874  00c9 5f            	clrw	x
2875  00ca 97            	ld	xl,a
2876  00cb 1d0008        	subw	x,#8
2877  00ce 2001          	jra	L61
2878  00d0               L41:
2879  00d0 5f            	clrw	x
2880  00d1               L61:
2881  00d1 7b01          	ld	a,(OFST-1,sp)
2882  00d3 905f          	clrw	y
2883  00d5 9097          	ld	yl,a
2884  00d7 90bf01        	ldw	c_y+1,y
2885  00da b301          	cpw	x,c_y+1
2886  00dc 2c1c          	jrsgt	L3261
2888  00de 9c            	rvf
2889  00df 7b02          	ld	a,(OFST+0,sp)
2890  00e1 97            	ld	xl,a
2891  00e2 a603          	ld	a,#3
2892  00e4 42            	mul	x,a
2893  00e5 d60000        	ld	a,(_AD_Key_Tab,x)
2894  00e8 5f            	clrw	x
2895  00e9 97            	ld	xl,a
2896  00ea 1c0008        	addw	x,#8
2897  00ed 7b01          	ld	a,(OFST-1,sp)
2898  00ef 905f          	clrw	y
2899  00f1 9097          	ld	yl,a
2900  00f3 90bf01        	ldw	c_y+1,y
2901  00f6 b301          	cpw	x,c_y+1
2902  00f8 2e08          	jrsge	L1261
2903                     ; 83 			break;
2905  00fa               L3261:
2906                     ; 78 	for(index=0;index<KEY_NUM;index++)
2908  00fa 0c02          	inc	(OFST+0,sp)
2911  00fc 7b02          	ld	a,(OFST+0,sp)
2912  00fe a10a          	cp	a,#10
2913  0100 25b0          	jrult	L5161
2914  0102               L1261:
2915                     ; 86 	if(AD_Key_Tab[index][1]!=Key_backup)
2917  0102 7b02          	ld	a,(OFST+0,sp)
2918  0104 97            	ld	xl,a
2919  0105 a603          	ld	a,#3
2920  0107 42            	mul	x,a
2921  0108 d60001        	ld	a,(_AD_Key_Tab+1,x)
2922  010b c10000        	cp	a,L7451_Key_backup
2923  010e 2604          	jrne	L02
2924  0110 aca701a7      	jpf	L5261
2925  0114               L02:
2926                     ; 88 	    Key_backup=AD_Key_Tab[index][1];
2928  0114 7b02          	ld	a,(OFST+0,sp)
2929  0116 97            	ld	xl,a
2930  0117 a603          	ld	a,#3
2931  0119 42            	mul	x,a
2932  011a d60001        	ld	a,(_AD_Key_Tab+1,x)
2933  011d c70000        	ld	L7451_Key_backup,a
2934                     ; 89 	    switch(Key_backup)
2936  0120 c60000        	ld	a,L7451_Key_backup
2938                     ; 127 	            break;
2939  0123 4a            	dec	a
2940  0124 271d          	jreq	L1551
2941  0126 4a            	dec	a
2942  0127 2720          	jreq	L3551
2943  0129 4a            	dec	a
2944  012a 2723          	jreq	L5551
2945  012c 4a            	dec	a
2946  012d 2726          	jreq	L7551
2947  012f 4a            	dec	a
2948  0130 272d          	jreq	L1651
2949  0132 4a            	dec	a
2950  0133 2734          	jreq	L3651
2951  0135 4a            	dec	a
2952  0136 273b          	jreq	L5651
2953  0138 4a            	dec	a
2954  0139 2742          	jreq	L7651
2955  013b 4a            	dec	a
2956  013c 2749          	jreq	L1751
2957  013e 4a            	dec	a
2958  013f 2750          	jreq	L3751
2959  0141 2056          	jra	L1361
2960  0143               L1551:
2961                     ; 91 	        case UICC_0:
2961                     ; 92 	            BeepState=BEEP_ON;
2963  0143 35010000      	mov	_BeepState,#1
2964                     ; 93 	            break;
2966  0147 2050          	jra	L1361
2967  0149               L3551:
2968                     ; 94 	        case UICC_1:
2968                     ; 95 	            BeepState=BEEP_OFF;
2970  0149 725f0000      	clr	_BeepState
2971                     ; 96 	            break;
2973  014d 204a          	jra	L1361
2974  014f               L5551:
2975                     ; 97 	        case UICC_2:
2975                     ; 98 	            BeepState=BEEP_SHORTBREAK;
2977  014f 35030000      	mov	_BeepState,#3
2978                     ; 99 	            break;
2980  0153 2044          	jra	L1361
2981  0155               L7551:
2982                     ; 100 	        case UICC_3:
2982                     ; 101 	            LED_1=~LED_1;
2984  0155 9012500a      	bcpl	_GPIOC,#1
2985                     ; 102 	            BeepState=BEEP_MIDDLEBREAK;
2987  0159 35040000      	mov	_BeepState,#4
2988                     ; 103 	            break;
2990  015d 203a          	jra	L1361
2991  015f               L1651:
2992                     ; 104 	        case UICC_4:
2992                     ; 105 	            LED_2=~LED_2;
2994  015f 9014500a      	bcpl	_GPIOC,#2
2995                     ; 106 	            BeepState=BEEP_LONGBREAK;
2997  0163 35050000      	mov	_BeepState,#5
2998                     ; 107 	            break;
3000  0167 2030          	jra	L1361
3001  0169               L3651:
3002                     ; 108 	        case UICC_5:
3002                     ; 109 	            LED_3=~LED_3;
3004  0169 9016500a      	bcpl	_GPIOC,#3
3005                     ; 110 	            BeepState=BEEP_OFF;
3007  016d 725f0000      	clr	_BeepState
3008                     ; 111 	            break;
3010  0171 2026          	jra	L1361
3011  0173               L5651:
3012                     ; 112 	        case UICC_6:
3012                     ; 113 	            LED_4=~LED_4;
3014  0173 9018500a      	bcpl	_GPIOC,#4
3015                     ; 114 	            BeepState=BEEP_OFF;
3017  0177 725f0000      	clr	_BeepState
3018                     ; 115 	            break;
3020  017b 201c          	jra	L1361
3021  017d               L7651:
3022                     ; 116 	        case UICC_7:
3022                     ; 117 	            LED_5=~LED_5;
3024  017d 901a500a      	bcpl	_GPIOC,#5
3025                     ; 118 	            BeepState=BEEP_OFF;
3027  0181 725f0000      	clr	_BeepState
3028                     ; 119 	            break;
3030  0185 2012          	jra	L1361
3031  0187               L1751:
3032                     ; 120 	        case UICC_8:
3032                     ; 121 	            LED_6=~LED_6;
3034  0187 901c500a      	bcpl	_GPIOC,#6
3035                     ; 122 	            BeepState=BEEP_OFF;
3037  018b 725f0000      	clr	_BeepState
3038                     ; 123 	            break;
3040  018f 2008          	jra	L1361
3041  0191               L3751:
3042                     ; 124 	        case UICC_9:
3042                     ; 125 	            LED_7=~LED_7;
3044  0191 901e500a      	bcpl	_GPIOC,#7
3045                     ; 126 	            BeepState=BEEP_OFF;
3047  0195 725f0000      	clr	_BeepState
3048                     ; 127 	            break;
3050  0199               L1361:
3051                     ; 129         if(CANPROTOCOL_RUNNING==CanProtocolState)
3053  0199 c60000        	ld	a,_CanProtocolState
3054  019c a103          	cp	a,#3
3055  019e 2607          	jrne	L5261
3056                     ; 131     	    SendBraodcast(LED);
3058  01a0 c6500a        	ld	a,_GPIOC
3059  01a3 8d000000      	callf	f_SendBraodcast
3061  01a7               L5261:
3062                     ; 136 }
3065  01a7 85            	popw	x
3066  01a8 87            	retf
3091                     	xdef	_AD_Key_Tab
3092                     	xref	f_SendBraodcast
3093                     	xref	_CanProtocolState
3094                     	xdef	f_Key_Scan_AD
3095                     	xdef	f_ADC_10BIT
3096                     	xdef	f_ADC_8BIT
3097                     	xdef	f_ADCInit
3098                     	xref	_BeepState
3099                     	xref	f_Delay
3100                     	xref.b	c_y
3119                     	end
