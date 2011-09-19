   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.3 - 19 Nov 2007
2348                     ; 2 void ADCInit(void) //设置单次转换
2348                     ; 3 {
2349                     	switch	.text
2350  0000               f_ADCInit:
2354                     ; 4     CLK.PCKENR2 |=0x08; // 使能 adc 时钟
2356  0000 721650ca      	bset	_CLK+10,#3
2357                     ; 5     ADC.CSR =0x00; // 选择通道 0 禁止中断
2359  0004 725f5400      	clr	_ADC
2360                     ; 6     ADC.CR1 =0x00; // 使能 ADC,连续模式,2分频
2362  0008 725f5401      	clr	_ADC+1
2363                     ; 7     ADC.CR2 =0x08; // 数据右对齐， low 8BIT AT ADC_DRL;
2365  000c 35085402      	mov	_ADC+2,#8
2366                     ; 8 }
2369  0010 87            	retf
2417                     ; 10 u8 ADC_8BIT(u8 ch)
2417                     ; 11 {
2418                     	switch	.text
2419  0011               f_ADC_8BIT:
2421  0011 5203          	subw	sp,#3
2422       00000003      OFST:	set	3
2425                     ; 14     ADC.CR2=0;
2427  0013 725f5402      	clr	_ADC+2
2428                     ; 15     ADC.CSR =ch &0x0F;
2430  0017 a40f          	and	a,#15
2431  0019 c75400        	ld	_ADC,a
2432                     ; 16     ADC.CR1 |=0x1; // 启动ADC
2434  001c 72105401      	bset	_ADC+1,#0
2435                     ; 17     _asm("nop");
2438  0020 9d            nop
2440                     ; 18     ADC.CR1 |=0x1; // 开始转换
2442  0021 72105401      	bset	_ADC+1,#0
2443                     ; 19     for(i=0;(i<100)&&((ADC.CSR &ADC_CSR_EOC)==0);i++)
2445  0025 0f03          	clr	(OFST+0,sp)
2447  0027 2009          	jra	L1241
2448  0029               L5141:
2449                     ; 20         Delay(1);
2451  0029 ae0001        	ldw	x,#1
2452  002c 8d000000      	callf	f_Delay
2454                     ; 19     for(i=0;(i<100)&&((ADC.CSR &ADC_CSR_EOC)==0);i++)
2456  0030 0c03          	inc	(OFST+0,sp)
2457  0032               L1241:
2460  0032 7b03          	ld	a,(OFST+0,sp)
2461  0034 a164          	cp	a,#100
2462  0036 2407          	jruge	L5241
2464  0038 c65400        	ld	a,_ADC
2465  003b a580          	bcp	a,#128
2466  003d 27ea          	jreq	L5141
2467  003f               L5241:
2468                     ; 21     Adc = ADC.DRH; //READ DATA 因为是右对齐所以先读低位
2470  003f c65404        	ld	a,_ADC+4
2471  0042 5f            	clrw	x
2472  0043 97            	ld	xl,a
2473  0044 1f01          	ldw	(OFST-2,sp),x
2474                     ; 22     ADC.CR1 &=0xfe; // 关闭ADC
2476  0046 72115401      	bres	_ADC+1,#0
2477                     ; 23     return(Adc);
2479  004a 7b02          	ld	a,(OFST-1,sp)
2482  004c 5b03          	addw	sp,#3
2483  004e 87            	retf
2531                     ; 26 u16 ADC_10BIT(u8 ch)
2531                     ; 27 {
2532                     	switch	.text
2533  004f               f_ADC_10BIT:
2535  004f 5205          	subw	sp,#5
2536       00000005      OFST:	set	5
2539                     ; 30     ADC.CR2 =0x08; // 数据右对齐， low 8BIT AT ADC_DRL;
2541  0051 35085402      	mov	_ADC+2,#8
2542                     ; 31     ADC.CSR =ch &0x0F;
2544  0055 a40f          	and	a,#15
2545  0057 c75400        	ld	_ADC,a
2546                     ; 32     ADC.CR1 |=0x1; // 启动ADC
2548  005a 72105401      	bset	_ADC+1,#0
2549                     ; 33     _asm("nop");
2552  005e 9d            nop
2554                     ; 34     ADC.CR1 |=0x1; // 开始转换
2556  005f 72105401      	bset	_ADC+1,#0
2557                     ; 35     for(i=0;(i<100)&&((ADC.CSR &ADC_CSR_EOC)==0);i++)
2559  0063 0f05          	clr	(OFST+0,sp)
2561  0065 2009          	jra	L3541
2562  0067               L7441:
2563                     ; 36         Delay(1);
2565  0067 ae0001        	ldw	x,#1
2566  006a 8d000000      	callf	f_Delay
2568                     ; 35     for(i=0;(i<100)&&((ADC.CSR &ADC_CSR_EOC)==0);i++)
2570  006e 0c05          	inc	(OFST+0,sp)
2571  0070               L3541:
2574  0070 7b05          	ld	a,(OFST+0,sp)
2575  0072 a164          	cp	a,#100
2576  0074 2407          	jruge	L7541
2578  0076 c65400        	ld	a,_ADC
2579  0079 a580          	bcp	a,#128
2580  007b 27ea          	jreq	L7441
2581  007d               L7541:
2582                     ; 37     Adc = ADC.DRH; //READ DATA 因为是右对齐所以先读低位
2584  007d c65404        	ld	a,_ADC+4
2585  0080 5f            	clrw	x
2586  0081 97            	ld	xl,a
2587  0082 1f03          	ldw	(OFST-2,sp),x
2588                     ; 38     Adc<<=8;
2590  0084 7b04          	ld	a,(OFST-1,sp)
2591  0086 6b03          	ld	(OFST-2,sp),a
2592  0088 0f04          	clr	(OFST-1,sp)
2593                     ; 39     Adc +=ADC.DRL;
2595  008a c65405        	ld	a,_ADC+5
2596  008d 5f            	clrw	x
2597  008e 97            	ld	xl,a
2598  008f 1f01          	ldw	(OFST-4,sp),x
2599  0091 1e03          	ldw	x,(OFST-2,sp)
2600  0093 72fb01        	addw	x,(OFST-4,sp)
2601  0096 1f03          	ldw	(OFST-2,sp),x
2602                     ; 40     ADC.CR1 &=0xfe; // 关闭ADC
2604  0098 72115401      	bres	_ADC+1,#0
2605                     ; 41     return(Adc);
2607  009c 1e03          	ldw	x,(OFST-2,sp)
2610  009e 5b05          	addw	sp,#5
2611  00a0 87            	retf
2613                     .const:	section	.text
2614  0000               _AD_Key_Tab:
2615  0000 00            	dc.b	0
2616  0001 01            	dc.b	1
2617  0002 00            	dc.b	0
2618  0003 16            	dc.b	22
2619  0004 02            	dc.b	2
2620  0005 00            	dc.b	0
2621  0006 2d            	dc.b	45
2622  0007 03            	dc.b	3
2623  0008 00            	dc.b	0
2624  0009 50            	dc.b	80
2625  000a 04            	dc.b	4
2626  000b 00            	dc.b	0
2627  000c 6d            	dc.b	109
2628  000d 05            	dc.b	5
2629  000e 00            	dc.b	0
2630  000f 8e            	dc.b	142
2631  0010 06            	dc.b	6
2632  0011 00            	dc.b	0
2633  0012 a8            	dc.b	168
2634  0013 07            	dc.b	7
2635  0014 00            	dc.b	0
2636  0015 bf            	dc.b	191
2637  0016 08            	dc.b	8
2638  0017 00            	dc.b	0
2639  0018 d0            	dc.b	208
2640  0019 09            	dc.b	9
2641  001a 00            	dc.b	0
2642  001b e0            	dc.b	224
2643  001c 0a            	dc.b	10
2644  001d 00            	dc.b	0
2645  001e ff            	dc.b	255
2646  001f 00            	dc.b	0
2647  0020 00            	dc.b	0
2648                     	switch	.bss
2649  0000               L1641_Key_backup:
2650  0000 00            	ds.b	1
2700                     ; 72 void Key_Scan_AD(void)
2700                     ; 73 {
2701                     	switch	.text
2702  00a1               f_Key_Scan_AD:
2704  00a1 89            	pushw	x
2705       00000002      OFST:	set	2
2708                     ; 74     u8 index=0;			//当前扫描值
2710  00a2 7b02          	ld	a,(OFST+0,sp)
2711  00a4 97            	ld	xl,a
2712                     ; 75 	u8 ADC_Value=0;
2714  00a5 7b01          	ld	a,(OFST-1,sp)
2715  00a7 97            	ld	xl,a
2716                     ; 77 	ADC_Value=ADC_8BIT(ADC_KEY1);
2718  00a8 a609          	ld	a,#9
2719  00aa 8d110011      	callf	f_ADC_8BIT
2721  00ae 6b01          	ld	(OFST-1,sp),a
2722                     ; 78 	for(index=0;index<KEY_NUM;index++)
2724  00b0 0f02          	clr	(OFST+0,sp)
2725  00b2               L7251:
2726                     ; 80 		if ( (ADC_Value >=((AD_Key_Tab[index][0]>8)?(AD_Key_Tab[index][0]-8):0))
2726                     ; 81 		 &&(ADC_Value <=(AD_Key_Tab[index][0]+8)) )
2728  00b2 9c            	rvf
2729  00b3 7b02          	ld	a,(OFST+0,sp)
2730  00b5 97            	ld	xl,a
2731  00b6 a603          	ld	a,#3
2732  00b8 42            	mul	x,a
2733  00b9 d60000        	ld	a,(_AD_Key_Tab,x)
2734  00bc a109          	cp	a,#9
2735  00be 2510          	jrult	L41
2736  00c0 7b02          	ld	a,(OFST+0,sp)
2737  00c2 97            	ld	xl,a
2738  00c3 a603          	ld	a,#3
2739  00c5 42            	mul	x,a
2740  00c6 d60000        	ld	a,(_AD_Key_Tab,x)
2741  00c9 5f            	clrw	x
2742  00ca 97            	ld	xl,a
2743  00cb 1d0008        	subw	x,#8
2744  00ce 2001          	jra	L61
2745  00d0               L41:
2746  00d0 5f            	clrw	x
2747  00d1               L61:
2748  00d1 7b01          	ld	a,(OFST-1,sp)
2749  00d3 905f          	clrw	y
2750  00d5 9097          	ld	yl,a
2751  00d7 90bf01        	ldw	c_y+1,y
2752  00da b301          	cpw	x,c_y+1
2753  00dc 2c1c          	jrsgt	L5351
2755  00de 9c            	rvf
2756  00df 7b02          	ld	a,(OFST+0,sp)
2757  00e1 97            	ld	xl,a
2758  00e2 a603          	ld	a,#3
2759  00e4 42            	mul	x,a
2760  00e5 d60000        	ld	a,(_AD_Key_Tab,x)
2761  00e8 5f            	clrw	x
2762  00e9 97            	ld	xl,a
2763  00ea 1c0008        	addw	x,#8
2764  00ed 7b01          	ld	a,(OFST-1,sp)
2765  00ef 905f          	clrw	y
2766  00f1 9097          	ld	yl,a
2767  00f3 90bf01        	ldw	c_y+1,y
2768  00f6 b301          	cpw	x,c_y+1
2769  00f8 2e08          	jrsge	L3351
2770                     ; 83 			break;
2772  00fa               L5351:
2773                     ; 78 	for(index=0;index<KEY_NUM;index++)
2775  00fa 0c02          	inc	(OFST+0,sp)
2778  00fc 7b02          	ld	a,(OFST+0,sp)
2779  00fe a10a          	cp	a,#10
2780  0100 25b0          	jrult	L7251
2781  0102               L3351:
2782                     ; 86 	if(AD_Key_Tab[index][1]!=Key_backup)
2784  0102 7b02          	ld	a,(OFST+0,sp)
2785  0104 97            	ld	xl,a
2786  0105 a603          	ld	a,#3
2787  0107 42            	mul	x,a
2788  0108 d60001        	ld	a,(_AD_Key_Tab+1,x)
2789  010b c10000        	cp	a,L1641_Key_backup
2790  010e 2604          	jrne	L02
2791  0110 acc301c3      	jpf	L7351
2792  0114               L02:
2793                     ; 88 	    Key_backup=AD_Key_Tab[index][1];
2795  0114 7b02          	ld	a,(OFST+0,sp)
2796  0116 97            	ld	xl,a
2797  0117 a603          	ld	a,#3
2798  0119 42            	mul	x,a
2799  011a d60001        	ld	a,(_AD_Key_Tab+1,x)
2800  011d c70000        	ld	L1641_Key_backup,a
2801                     ; 89 	    switch(Key_backup)
2803  0120 c60000        	ld	a,L1641_Key_backup
2805                     ; 127 	            break;
2806  0123 4a            	dec	a
2807  0124 271d          	jreq	L3641
2808  0126 4a            	dec	a
2809  0127 2720          	jreq	L5641
2810  0129 4a            	dec	a
2811  012a 2723          	jreq	L7641
2812  012c 4a            	dec	a
2813  012d 2726          	jreq	L1741
2814  012f 4a            	dec	a
2815  0130 2731          	jreq	L3741
2816  0132 4a            	dec	a
2817  0133 273c          	jreq	L5741
2818  0135 4a            	dec	a
2819  0136 2747          	jreq	L7741
2820  0138 4a            	dec	a
2821  0139 2752          	jreq	L1051
2822  013b 4a            	dec	a
2823  013c 275d          	jreq	L3051
2824  013e 4a            	dec	a
2825  013f 2768          	jreq	L5051
2826  0141 2072          	jra	L3451
2827  0143               L3641:
2828                     ; 91 	        case UICC_0:
2828                     ; 92 	            BeepState=BEEP_ON;
2830  0143 35010000      	mov	_BeepState,#1
2831                     ; 93 	            break;
2833  0147 206c          	jra	L3451
2834  0149               L5641:
2835                     ; 94 	        case UICC_1:
2835                     ; 95 	            BeepState=BEEP_OFF;
2837  0149 725f0000      	clr	_BeepState
2838                     ; 96 	            break;
2840  014d 2066          	jra	L3451
2841  014f               L7641:
2842                     ; 97 	        case UICC_2:
2842                     ; 98 	            BeepState=BEEP_SHORTBREAK;
2844  014f 35030000      	mov	_BeepState,#3
2845                     ; 99 	            break;
2847  0153 2060          	jra	L3451
2848  0155               L1741:
2849                     ; 100 	        case UICC_3:
2849                     ; 101 	            LED_1=~LED_1;
2851  0155 c6500a        	ld	a,_GPIOC
2852  0158 a802          	xor	a,#2
2853  015a c7500a        	ld	_GPIOC,a
2854                     ; 102 	            BeepState=BEEP_MIDDLEBREAK;
2856  015d 35040000      	mov	_BeepState,#4
2857                     ; 103 	            break;
2859  0161 2052          	jra	L3451
2860  0163               L3741:
2861                     ; 104 	        case UICC_4:
2861                     ; 105 	            LED_2=~LED_2;
2863  0163 c6500a        	ld	a,_GPIOC
2864  0166 a804          	xor	a,#4
2865  0168 c7500a        	ld	_GPIOC,a
2866                     ; 106 	            BeepState=BEEP_LONGBREAK;
2868  016b 35050000      	mov	_BeepState,#5
2869                     ; 107 	            break;
2871  016f 2044          	jra	L3451
2872  0171               L5741:
2873                     ; 108 	        case UICC_5:
2873                     ; 109 	            LED_3=~LED_3;
2875  0171 c6500a        	ld	a,_GPIOC
2876  0174 a808          	xor	a,#8
2877  0176 c7500a        	ld	_GPIOC,a
2878                     ; 110 	            BeepState=BEEP_OFF;
2880  0179 725f0000      	clr	_BeepState
2881                     ; 111 	            break;
2883  017d 2036          	jra	L3451
2884  017f               L7741:
2885                     ; 112 	        case UICC_6:
2885                     ; 113 	            LED_4=~LED_4;
2887  017f c6500a        	ld	a,_GPIOC
2888  0182 a810          	xor	a,#16
2889  0184 c7500a        	ld	_GPIOC,a
2890                     ; 114 	            BeepState=BEEP_OFF;
2892  0187 725f0000      	clr	_BeepState
2893                     ; 115 	            break;
2895  018b 2028          	jra	L3451
2896  018d               L1051:
2897                     ; 116 	        case UICC_7:
2897                     ; 117 	            LED_5=~LED_5;
2899  018d c6500a        	ld	a,_GPIOC
2900  0190 a820          	xor	a,#32
2901  0192 c7500a        	ld	_GPIOC,a
2902                     ; 118 	            BeepState=BEEP_OFF;
2904  0195 725f0000      	clr	_BeepState
2905                     ; 119 	            break;
2907  0199 201a          	jra	L3451
2908  019b               L3051:
2909                     ; 120 	        case UICC_8:
2909                     ; 121 	            LED_6=~LED_6;
2911  019b c6500a        	ld	a,_GPIOC
2912  019e a840          	xor	a,#64
2913  01a0 c7500a        	ld	_GPIOC,a
2914                     ; 122 	            BeepState=BEEP_OFF;
2916  01a3 725f0000      	clr	_BeepState
2917                     ; 123 	            break;
2919  01a7 200c          	jra	L3451
2920  01a9               L5051:
2921                     ; 124 	        case UICC_9:
2921                     ; 125 	            LED_7=~LED_7;
2923  01a9 c6500a        	ld	a,_GPIOC
2924  01ac a880          	xor	a,#128
2925  01ae c7500a        	ld	_GPIOC,a
2926                     ; 126 	            BeepState=BEEP_OFF;
2928  01b1 725f0000      	clr	_BeepState
2929                     ; 127 	            break;
2931  01b5               L3451:
2932                     ; 129         if(CAN_RUNNING==CanBusState)
2934  01b5 c60000        	ld	a,_CanBusState
2935  01b8 a102          	cp	a,#2
2936  01ba 2607          	jrne	L7351
2937                     ; 131     	    SendBraodcast(LED);
2939  01bc c6500a        	ld	a,_GPIOC
2940  01bf 8d000000      	callf	f_SendBraodcast
2942  01c3               L7351:
2943                     ; 136 }
2946  01c3 85            	popw	x
2947  01c4 87            	retf
2972                     	xdef	_AD_Key_Tab
2973                     	xref	f_SendBraodcast
2974                     	xref	_CanBusState
2975                     	xdef	f_Key_Scan_AD
2976                     	xdef	f_ADC_10BIT
2977                     	xdef	f_ADC_8BIT
2978                     	xdef	f_ADCInit
2979                     	xref	_BeepState
2980                     	xref	f_Delay
2981                     	xref.b	c_y
3000                     	end
