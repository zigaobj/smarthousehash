   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.3 - 19 Nov 2007
2348                     ; 2 void ADCInit(void) //���õ���ת��
2348                     ; 3 {
2349                     	switch	.text
2350  0000               f_ADCInit:
2354                     ; 4     CLK.PCKENR2 |=0x08; // ʹ�� adc ʱ��
2356  0000 721650ca      	bset	_CLK+10,#3
2357                     ; 5     ADC.CSR =0x00; // ѡ��ͨ�� 0 ��ֹ�ж�
2359  0004 725f5400      	clr	_ADC
2360                     ; 6     ADC.CR1 =0x00; // ʹ�� ADC,����ģʽ,2��Ƶ
2362  0008 725f5401      	clr	_ADC+1
2363                     ; 7     ADC.CR2 =0x08; // �����Ҷ��룬 low 8BIT AT ADC_DRL;
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
2432                     ; 16     ADC.CR1 |=0x1; // ����ADC
2434  001c 72105401      	bset	_ADC+1,#0
2435                     ; 17     _asm("nop");
2438  0020 9d            nop
2440                     ; 18     ADC.CR1 |=0x1; // ��ʼת��
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
2468                     ; 21     Adc = ADC.DRH; //READ DATA ��Ϊ���Ҷ��������ȶ���λ
2470  003f c65404        	ld	a,_ADC+4
2471  0042 5f            	clrw	x
2472  0043 97            	ld	xl,a
2473  0044 1f01          	ldw	(OFST-2,sp),x
2474                     ; 22     ADC.CR1 &=0xfe; // �ر�ADC
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
2539                     ; 30     ADC.CR2 =0x08; // �����Ҷ��룬 low 8BIT AT ADC_DRL;
2541  0051 35085402      	mov	_ADC+2,#8
2542                     ; 31     ADC.CSR =ch &0x0F;
2544  0055 a40f          	and	a,#15
2545  0057 c75400        	ld	_ADC,a
2546                     ; 32     ADC.CR1 |=0x1; // ����ADC
2548  005a 72105401      	bset	_ADC+1,#0
2549                     ; 33     _asm("nop");
2552  005e 9d            nop
2554                     ; 34     ADC.CR1 |=0x1; // ��ʼת��
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
2582                     ; 37     Adc = ADC.DRH; //READ DATA ��Ϊ���Ҷ��������ȶ���λ
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
2602                     ; 40     ADC.CR1 &=0xfe; // �ر�ADC
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
2618  0003 17            	dc.b	23
2619  0004 02            	dc.b	2
2620  0005 00            	dc.b	0
2621  0006 3c            	dc.b	60
2622  0007 03            	dc.b	3
2623  0008 00            	dc.b	0
2624  0009 5c            	dc.b	92
2625  000a 04            	dc.b	4
2626  000b 00            	dc.b	0
2627  000c 72            	dc.b	114
2628  000d 05            	dc.b	5
2629  000e 00            	dc.b	0
2630  000f 91            	dc.b	145
2631  0010 06            	dc.b	6
2632  0011 00            	dc.b	0
2633  0012 a9            	dc.b	169
2634  0013 07            	dc.b	7
2635  0014 00            	dc.b	0
2636  0015 c0            	dc.b	192
2637  0016 08            	dc.b	8
2638  0017 00            	dc.b	0
2639  0018 d6            	dc.b	214
2640  0019 09            	dc.b	9
2641  001a 00            	dc.b	0
2642  001b ea            	dc.b	234
2643  001c 0a            	dc.b	10
2644  001d 00            	dc.b	0
2645  001e ff            	dc.b	255
2646  001f 00            	dc.b	0
2647  0020 00            	dc.b	0
2689                     ; 58 void Key_Scan_AD(void)
2689                     ; 59 {
2690                     	switch	.text
2691  00a1               f_Key_Scan_AD:
2693  00a1 89            	pushw	x
2694       00000002      OFST:	set	2
2697                     ; 60     u8 index=0;			//��ǰɨ��ֵ
2699  00a2 7b02          	ld	a,(OFST+0,sp)
2700  00a4 97            	ld	xl,a
2701                     ; 61 	u8 ADC_Value=0;
2703  00a5 7b01          	ld	a,(OFST-1,sp)
2704  00a7 97            	ld	xl,a
2705                     ; 62 	ADC_Value=ADC_8BIT(ADC_KEY1);
2707  00a8 a609          	ld	a,#9
2708  00aa 8d110011      	callf	f_ADC_8BIT
2710  00ae 6b01          	ld	(OFST-1,sp),a
2711                     ; 63 	for(index=0;index<KEY_NUM;index++)
2713  00b0 0f02          	clr	(OFST+0,sp)
2714  00b2               L3251:
2715                     ; 65 		if ( (ADC_Value >=((AD_Key_Tab[index][0]>8)?(AD_Key_Tab[index][0]-8):0))
2715                     ; 66 		 &&(ADC_Value <=(AD_Key_Tab[index][0]+8)) )
2717  00b2 9c            	rvf
2718  00b3 7b02          	ld	a,(OFST+0,sp)
2719  00b5 97            	ld	xl,a
2720  00b6 a603          	ld	a,#3
2721  00b8 42            	mul	x,a
2722  00b9 d60000        	ld	a,(_AD_Key_Tab,x)
2723  00bc a109          	cp	a,#9
2724  00be 2510          	jrult	L41
2725  00c0 7b02          	ld	a,(OFST+0,sp)
2726  00c2 97            	ld	xl,a
2727  00c3 a603          	ld	a,#3
2728  00c5 42            	mul	x,a
2729  00c6 d60000        	ld	a,(_AD_Key_Tab,x)
2730  00c9 5f            	clrw	x
2731  00ca 97            	ld	xl,a
2732  00cb 1d0008        	subw	x,#8
2733  00ce 2001          	jra	L61
2734  00d0               L41:
2735  00d0 5f            	clrw	x
2736  00d1               L61:
2737  00d1 7b01          	ld	a,(OFST-1,sp)
2738  00d3 905f          	clrw	y
2739  00d5 9097          	ld	yl,a
2740  00d7 90bf01        	ldw	c_y+1,y
2741  00da b301          	cpw	x,c_y+1
2742  00dc 2c1c          	jrsgt	L1351
2744  00de 9c            	rvf
2745  00df 7b02          	ld	a,(OFST+0,sp)
2746  00e1 97            	ld	xl,a
2747  00e2 a603          	ld	a,#3
2748  00e4 42            	mul	x,a
2749  00e5 d60000        	ld	a,(_AD_Key_Tab,x)
2750  00e8 5f            	clrw	x
2751  00e9 97            	ld	xl,a
2752  00ea 1c0008        	addw	x,#8
2753  00ed 7b01          	ld	a,(OFST-1,sp)
2754  00ef 905f          	clrw	y
2755  00f1 9097          	ld	yl,a
2756  00f3 90bf01        	ldw	c_y+1,y
2757  00f6 b301          	cpw	x,c_y+1
2758  00f8 2e08          	jrsge	L7251
2759                     ; 68 			break;
2761  00fa               L1351:
2762                     ; 63 	for(index=0;index<KEY_NUM;index++)
2764  00fa 0c02          	inc	(OFST+0,sp)
2767  00fc 7b02          	ld	a,(OFST+0,sp)
2768  00fe a10a          	cp	a,#10
2769  0100 25b0          	jrult	L3251
2770  0102               L7251:
2771                     ; 71 	if(AD_Key_Tab[index][1]!=debug_adc)
2773  0102 7b02          	ld	a,(OFST+0,sp)
2774  0104 97            	ld	xl,a
2775  0105 a603          	ld	a,#3
2776  0107 42            	mul	x,a
2777  0108 d60001        	ld	a,(_AD_Key_Tab+1,x)
2778  010b 5f            	clrw	x
2779  010c 97            	ld	xl,a
2780  010d c30000        	cpw	x,_debug_adc
2781  0110 2604          	jrne	L02
2782  0112 acb901b9      	jpf	L3351
2783  0116               L02:
2784                     ; 73 	    debug_adc=AD_Key_Tab[index][1];
2786  0116 7b02          	ld	a,(OFST+0,sp)
2787  0118 97            	ld	xl,a
2788  0119 a603          	ld	a,#3
2789  011b 42            	mul	x,a
2790  011c d60001        	ld	a,(_AD_Key_Tab+1,x)
2791  011f 5f            	clrw	x
2792  0120 97            	ld	xl,a
2793  0121 cf0000        	ldw	_debug_adc,x
2794                     ; 74 	    switch(debug_adc)
2796  0124 ce0000        	ldw	x,_debug_adc
2798                     ; 112 	            break;
2799  0127 5a            	decw	x
2800  0128 271d          	jreq	L1641
2801  012a 5a            	decw	x
2802  012b 2720          	jreq	L3641
2803  012d 5a            	decw	x
2804  012e 2723          	jreq	L5641
2805  0130 5a            	decw	x
2806  0131 2726          	jreq	L7641
2807  0133 5a            	decw	x
2808  0134 2731          	jreq	L1741
2809  0136 5a            	decw	x
2810  0137 273c          	jreq	L3741
2811  0139 5a            	decw	x
2812  013a 2747          	jreq	L5741
2813  013c 5a            	decw	x
2814  013d 2752          	jreq	L7741
2815  013f 5a            	decw	x
2816  0140 275d          	jreq	L1051
2817  0142 5a            	decw	x
2818  0143 2768          	jreq	L3051
2819  0145 2072          	jra	L3351
2820  0147               L1641:
2821                     ; 76 	        case UICC_0:
2821                     ; 77 	            BeepState=BEEP_ON;
2823  0147 35010000      	mov	_BeepState,#1
2824                     ; 78 	            break;
2826  014b 206c          	jra	L3351
2827  014d               L3641:
2828                     ; 79 	        case UICC_1:
2828                     ; 80 	            BeepState=BEEP_OFF;
2830  014d 725f0000      	clr	_BeepState
2831                     ; 81 	            break;
2833  0151 2066          	jra	L3351
2834  0153               L5641:
2835                     ; 82 	        case UICC_2:
2835                     ; 83 	            BeepState=BEEP_SHORTBREAK;
2837  0153 35030000      	mov	_BeepState,#3
2838                     ; 84 	            break;
2840  0157 2060          	jra	L3351
2841  0159               L7641:
2842                     ; 85 	        case UICC_3:
2842                     ; 86 	            LED_1=~LED_1;
2844  0159 c6500a        	ld	a,_GPIOC
2845  015c a802          	xor	a,#2
2846  015e c7500a        	ld	_GPIOC,a
2847                     ; 87 	            BeepState=BEEP_MIDDLEBREAK;
2849  0161 35040000      	mov	_BeepState,#4
2850                     ; 88 	            break;
2852  0165 2052          	jra	L3351
2853  0167               L1741:
2854                     ; 89 	        case UICC_4:
2854                     ; 90 	            LED_2=~LED_2;
2856  0167 c6500a        	ld	a,_GPIOC
2857  016a a804          	xor	a,#4
2858  016c c7500a        	ld	_GPIOC,a
2859                     ; 91 	            BeepState=BEEP_LONGBREAK;
2861  016f 35050000      	mov	_BeepState,#5
2862                     ; 92 	            break;
2864  0173 2044          	jra	L3351
2865  0175               L3741:
2866                     ; 93 	        case UICC_5:
2866                     ; 94 	            LED_3=~LED_3;
2868  0175 c6500a        	ld	a,_GPIOC
2869  0178 a808          	xor	a,#8
2870  017a c7500a        	ld	_GPIOC,a
2871                     ; 95 	            BeepState=BEEP_OFF;
2873  017d 725f0000      	clr	_BeepState
2874                     ; 96 	            break;
2876  0181 2036          	jra	L3351
2877  0183               L5741:
2878                     ; 97 	        case UICC_6:
2878                     ; 98 	            LED_4=~LED_4;
2880  0183 c6500a        	ld	a,_GPIOC
2881  0186 a810          	xor	a,#16
2882  0188 c7500a        	ld	_GPIOC,a
2883                     ; 99 	            BeepState=BEEP_OFF;
2885  018b 725f0000      	clr	_BeepState
2886                     ; 100 	            break;
2888  018f 2028          	jra	L3351
2889  0191               L7741:
2890                     ; 101 	        case UICC_7:
2890                     ; 102 	            LED_5=~LED_5;
2892  0191 c6500a        	ld	a,_GPIOC
2893  0194 a820          	xor	a,#32
2894  0196 c7500a        	ld	_GPIOC,a
2895                     ; 103 	            BeepState=BEEP_OFF;
2897  0199 725f0000      	clr	_BeepState
2898                     ; 104 	            break;
2900  019d 201a          	jra	L3351
2901  019f               L1051:
2902                     ; 105 	        case UICC_8:
2902                     ; 106 	            LED_6=~LED_6;
2904  019f c6500a        	ld	a,_GPIOC
2905  01a2 a840          	xor	a,#64
2906  01a4 c7500a        	ld	_GPIOC,a
2907                     ; 107 	            BeepState=BEEP_OFF;
2909  01a7 725f0000      	clr	_BeepState
2910                     ; 108 	            break;
2912  01ab 200c          	jra	L3351
2913  01ad               L3051:
2914                     ; 109 	        case UICC_9:
2914                     ; 110 	            LED_7=~LED_7;
2916  01ad c6500a        	ld	a,_GPIOC
2917  01b0 a880          	xor	a,#128
2918  01b2 c7500a        	ld	_GPIOC,a
2919                     ; 111 	            BeepState=BEEP_OFF;
2921  01b5 725f0000      	clr	_BeepState
2922                     ; 112 	            break;
2924  01b9               L7351:
2925  01b9               L3351:
2926                     ; 115 }
2929  01b9 85            	popw	x
2930  01ba 87            	retf
2955                     	xdef	_AD_Key_Tab
2956                     	xdef	f_Key_Scan_AD
2957                     	xdef	f_ADC_10BIT
2958                     	xdef	f_ADC_8BIT
2959                     	xdef	f_ADCInit
2960                     	xref	_debug_adc
2961                     	xref	_BeepState
2962                     	xref	f_Delay
2963                     	xref.b	c_y
2982                     	end