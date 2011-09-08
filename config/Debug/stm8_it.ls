   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.3 - 19 Nov 2007
2346                     ; 3 @interrupt void TRAP_IRQHandler(void)
2346                     ; 4 {
2347                     	switch	.text
2348  0000               f_TRAP_IRQHandler:
2353                     ; 5 	return;
2356  0000 80            	iret
2378                     ; 8 @interrupt void TLI_IRQHandler (void)
2378                     ; 9 {
2379                     	switch	.text
2380  0001               f_TLI_IRQHandler:
2385                     ; 10 	return;
2388  0001 80            	iret
2410                     ; 13 @interrupt void AWU_IRQHandler (void)
2410                     ; 14 {
2411                     	switch	.text
2412  0002               f_AWU_IRQHandler:
2417                     ; 15 	return;
2420  0002 80            	iret
2442                     ; 18 @interrupt void CLK_IRQHandler (void)
2442                     ; 19 {
2443                     	switch	.text
2444  0003               f_CLK_IRQHandler:
2449                     ; 20 	return;
2452  0003 80            	iret
2475                     ; 23 @interrupt void EXTI_PORTA_IRQHandler (void)
2475                     ; 24 {
2476                     	switch	.text
2477  0004               f_EXTI_PORTA_IRQHandler:
2482                     ; 25 	return;
2485  0004 80            	iret
2508                     ; 28 @interrupt void EXTI_PORTB_IRQHandler (void)
2508                     ; 29 {
2509                     	switch	.text
2510  0005               f_EXTI_PORTB_IRQHandler:
2515                     ; 30 	return;
2518  0005 80            	iret
2541                     ; 33 @interrupt void EXTI_PORTC_IRQHandler (void)
2541                     ; 34 {
2542                     	switch	.text
2543  0006               f_EXTI_PORTC_IRQHandler:
2548                     ; 35 	return;
2551  0006 80            	iret
2574                     ; 38 @interrupt void EXTI_PORTD_IRQHandler (void)
2574                     ; 39 {
2575                     	switch	.text
2576  0007               f_EXTI_PORTD_IRQHandler:
2581                     ; 40 	return;
2584  0007 80            	iret
2607                     ; 43 @interrupt void EXTI_PORTE_IRQHandler (void)
2607                     ; 44 {
2608                     	switch	.text
2609  0008               f_EXTI_PORTE_IRQHandler:
2614                     ; 45 	return;
2617  0008 80            	iret
2639                     ; 48 @interrupt void CAN_RX_IRQHandler (void)
2639                     ; 49 {
2640                     	switch	.text
2641  0009               f_CAN_RX_IRQHandler:
2646                     ; 51 	return;
2649  0009 80            	iret
2671                     ; 54 @interrupt void CAN_TX_IRQHandler (void)
2671                     ; 55 {
2672                     	switch	.text
2673  000a               f_CAN_TX_IRQHandler:
2678                     ; 57 	return;
2681  000a 80            	iret
2703                     ; 60 @interrupt void SPI_IRQHandler (void)
2703                     ; 61 {
2704                     	switch	.text
2705  000b               f_SPI_IRQHandler:
2710                     ; 62 	return;
2713  000b 80            	iret
2715                     	switch	.data
2716  0000               L5251_FlagTemp:
2717  0000 00            	dc.b	0
2772                     ; 65 @interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler (void)
2772                     ; 66 {
2773                     	switch	.text
2774  000c               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
2779                     ; 68     TIM1.SR1 &=(~TIM1_SR1_UIF); //清更新事件标志
2781  000c 72115255      	bres	_TIM1+5,#0
2782                     ; 69     FlagTemp=~FlagTemp;
2784  0010 72530000      	cpl	L5251_FlagTemp
2785                     ; 70     if(FlagTemp)
2787  0014 725d0000      	tnz	L5251_FlagTemp
2789  0018               L7551:
2790                     ; 76 	return;
2793  0018 80            	iret
2817                     ; 79 @interrupt void TIM1_CAP_COM_IRQHandler (void)
2817                     ; 80 {
2818                     	switch	.text
2819  0019               f_TIM1_CAP_COM_IRQHandler:
2824                     ; 81     if(TIM1.SR1&TIM1_SR1_COMIF)
2826  0019 c65255        	ld	a,_TIM1+5
2827  001c a520          	bcp	a,#32
2828  001e 2704          	jreq	L1751
2829                     ; 83         TIM1.SR1 &=(~TIM1_SR1_COMIF);
2831  0020 721b5255      	bres	_TIM1+5,#5
2832  0024               L1751:
2833                     ; 85 	return;
2836  0024 80            	iret
2862                     ; 87 @interrupt void TIM2_UPD_OVF_BRK_IRQHandler (void)
2862                     ; 88 {
2863                     	switch	.text
2864  0025               f_TIM2_UPD_OVF_BRK_IRQHandler:
2867       00000001      OFST:	set	1
2868  0025 88            	push	a
2871                     ; 89     TIM2.SR1 &=(~TIM2_SR1_UIF); //清更新事件标志
2873  0026 72115302      	bres	_TIM2+2,#0
2874                     ; 90     TIM1.EGR |=TIM1_EGR_COMG;
2876  002a 721a5257      	bset	_TIM1+7,#5
2877                     ; 91     GPIOC.ODR.byte =GPIOC.ODR.byte &(~0x02)|(~GPIOC.ODR.byte)&0x02;
2879  002e c6500a        	ld	a,_GPIOC
2880  0031 43            	cpl	a
2881  0032 a402          	and	a,#2
2882  0034 6b01          	ld	(OFST+0,sp),a
2883  0036 c6500a        	ld	a,_GPIOC
2884  0039 a4fd          	and	a,#253
2885  003b 1a01          	or	a,(OFST+0,sp)
2886  003d c7500a        	ld	_GPIOC,a
2887                     ; 92     return;
2890  0040 84            	pop	a
2891  0041 80            	iret
2916                     ; 95 @interrupt void TIM2_CAP_COM_IRQHandler (void)
2916                     ; 96 {
2917                     	switch	.text
2918  0042               f_TIM2_CAP_COM_IRQHandler:
2921       00000001      OFST:	set	1
2922  0042 88            	push	a
2925                     ; 97     if(TIM2.SR1&TIM2_SR1_CC1IF)
2927  0043 c65302        	ld	a,_TIM2+2
2928  0046 a502          	bcp	a,#2
2929  0048 2728          	jreq	L3161
2930                     ; 99         TIM2.SR1 &=(~TIM2_SR1_CC1IF); //清捕获标志
2932  004a 72135302      	bres	_TIM2+2,#1
2933                     ; 101         TIM2.CCER1=(TIM2.CCER1&(~TIM2_CCER1_CC1P))|((~TIM2.CCER1)&TIM2_CCER1_CC1P); //翻转触发极性
2935  004e c65308        	ld	a,_TIM2+8
2936  0051 43            	cpl	a
2937  0052 a402          	and	a,#2
2938  0054 6b01          	ld	(OFST+0,sp),a
2939  0056 c65308        	ld	a,_TIM2+8
2940  0059 a4fd          	and	a,#253
2941  005b 1a01          	or	a,(OFST+0,sp)
2942  005d c75308        	ld	_TIM2+8,a
2943                     ; 102         GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
2945  0060 c6500a        	ld	a,_GPIOC
2946  0063 43            	cpl	a
2947  0064 a402          	and	a,#2
2948  0066 6b01          	ld	(OFST+0,sp),a
2949  0068 c6500a        	ld	a,_GPIOC
2950  006b a4fd          	and	a,#253
2951  006d 1a01          	or	a,(OFST+0,sp)
2952  006f c7500a        	ld	_GPIOC,a
2953  0072               L3161:
2954                     ; 104     if(TIM2.SR1&TIM2_SR1_CC2IF)
2956  0072 c65302        	ld	a,_TIM2+2
2957  0075 a504          	bcp	a,#4
2958  0077 2728          	jreq	L5161
2959                     ; 106         TIM2.SR1 &=(~TIM2_SR1_CC2IF); //清捕获标志
2961  0079 72155302      	bres	_TIM2+2,#2
2962                     ; 108         TIM2.CCER1=(TIM2.CCER1&(~TIM2_CCER1_CC2P))|((~TIM2.CCER1)&TIM2_CCER1_CC2P); //翻转触发极性
2964  007d c65308        	ld	a,_TIM2+8
2965  0080 43            	cpl	a
2966  0081 a420          	and	a,#32
2967  0083 6b01          	ld	(OFST+0,sp),a
2968  0085 c65308        	ld	a,_TIM2+8
2969  0088 a4df          	and	a,#223
2970  008a 1a01          	or	a,(OFST+0,sp)
2971  008c c75308        	ld	_TIM2+8,a
2972                     ; 109         GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
2974  008f c6500a        	ld	a,_GPIOC
2975  0092 43            	cpl	a
2976  0093 a402          	and	a,#2
2977  0095 6b01          	ld	(OFST+0,sp),a
2978  0097 c6500a        	ld	a,_GPIOC
2979  009a a4fd          	and	a,#253
2980  009c 1a01          	or	a,(OFST+0,sp)
2981  009e c7500a        	ld	_GPIOC,a
2982  00a1               L5161:
2983                     ; 111     if(TIM2.SR1&TIM2_SR1_CC3IF)
2985  00a1 c65302        	ld	a,_TIM2+2
2986  00a4 a508          	bcp	a,#8
2987  00a6 2728          	jreq	L7161
2988                     ; 113         TIM2.SR1 &=(~TIM2_SR1_CC3IF); //清捕获标志
2990  00a8 72175302      	bres	_TIM2+2,#3
2991                     ; 115         TIM2.CCER2=(TIM2.CCER2&(~TIM2_CCER2_CC3P))|((~TIM2.CCER2)&TIM2_CCER2_CC3P); //翻转触发极性
2993  00ac c65309        	ld	a,_TIM2+9
2994  00af 43            	cpl	a
2995  00b0 a402          	and	a,#2
2996  00b2 6b01          	ld	(OFST+0,sp),a
2997  00b4 c65309        	ld	a,_TIM2+9
2998  00b7 a4fd          	and	a,#253
2999  00b9 1a01          	or	a,(OFST+0,sp)
3000  00bb c75309        	ld	_TIM2+9,a
3001                     ; 116         GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
3003  00be c6500a        	ld	a,_GPIOC
3004  00c1 43            	cpl	a
3005  00c2 a402          	and	a,#2
3006  00c4 6b01          	ld	(OFST+0,sp),a
3007  00c6 c6500a        	ld	a,_GPIOC
3008  00c9 a4fd          	and	a,#253
3009  00cb 1a01          	or	a,(OFST+0,sp)
3010  00cd c7500a        	ld	_GPIOC,a
3011  00d0               L7161:
3012                     ; 118 	return;
3015  00d0 84            	pop	a
3016  00d1 80            	iret
3040                     ; 121 @interrupt void TIM3_UPD_OVF_BRK_IRQHandler (void)
3040                     ; 122 {
3041                     	switch	.text
3042  00d2               f_TIM3_UPD_OVF_BRK_IRQHandler:
3047                     ; 123 	TIM3.SR1 &=0xfe; //清更新事件标志
3049  00d2 72115322      	bres	_TIM3+2,#0
3050                     ; 125     return;
3053  00d6 80            	iret
3076                     ; 128 @interrupt void TIM3_CAP_COM_IRQHandler (void)
3076                     ; 129 {
3077                     	switch	.text
3078  00d7               f_TIM3_CAP_COM_IRQHandler:
3083                     ; 130 	return;
3086  00d7 80            	iret
3109                     ; 133 @interrupt void USART_TX_IRQHandler (void)
3109                     ; 134 {
3110                     	switch	.text
3111  00d8               f_USART_TX_IRQHandler:
3116                     ; 136 	return;
3119  00d8 80            	iret
3142                     ; 139 @interrupt void USART_RX_IRQHandler (void)
3142                     ; 140 {
3143                     	switch	.text
3144  00d9               f_USART_RX_IRQHandler:
3149                     ; 142 	return;
3152  00d9 80            	iret
3174                     ; 145 @interrupt void I2C_IRQHandler (void)
3174                     ; 146 {
3175                     	switch	.text
3176  00da               f_I2C_IRQHandler:
3181                     ; 147 	return;
3184  00da 80            	iret
3207                     ; 150 @interrupt void LINUART_TX_IRQHandler (void)
3207                     ; 151 {
3208                     	switch	.text
3209  00db               f_LINUART_TX_IRQHandler:
3214                     ; 153 	return;
3217  00db 80            	iret
3240                     ; 156 @interrupt void LINUART_RX_IRQHandler (void)
3240                     ; 157 {
3241                     	switch	.text
3242  00dc               f_LINUART_RX_IRQHandler:
3247                     ; 159 	return;
3250  00dc 80            	iret
3290                     ; 162 @interrupt void ADC_IRQHandler (void)
3290                     ; 163 {
3291                     	switch	.text
3292  00dd               f_ADC_IRQHandler:
3295       00000004      OFST:	set	4
3296  00dd 5204          	subw	sp,#4
3299  00df               L1371:
3300                     ; 165     while(!(ADC.CSR&0x80)); // 等待转换结束 14 个时钟周期
3302  00df c65400        	ld	a,_ADC
3303  00e2 a580          	bcp	a,#128
3304  00e4 27f9          	jreq	L1371
3305                     ; 166     ADC.CSR &= 0x7F; // 清除中断标志
3307  00e6 721f5400      	bres	_ADC,#7
3308                     ; 167     AdcL = ADC.DRL; //READ DATA 因为是右对齐所以先读低位
3310  00ea c65405        	ld	a,_ADC+5
3311  00ed 5f            	clrw	x
3312  00ee 97            	ld	xl,a
3313  00ef 1f01          	ldw	(OFST-3,sp),x
3314                     ; 168     AdcH = ADC.DRH;
3316  00f1 c65404        	ld	a,_ADC+4
3317  00f4 5f            	clrw	x
3318  00f5 97            	ld	xl,a
3319  00f6 1f03          	ldw	(OFST-1,sp),x
3320                     ; 169     AdcH =( AdcH << 8 ) + AdcL;
3322  00f8 1e03          	ldw	x,(OFST-1,sp)
3323  00fa 4f            	clr	a
3324  00fb 02            	rlwa	x,a
3325  00fc 72fb01        	addw	x,(OFST-3,sp)
3326  00ff 1f03          	ldw	(OFST-1,sp),x
3327                     ; 170     ADC.CR1 &=0xfe; // 关闭ADC
3329  0101 72115401      	bres	_ADC+1,#0
3330                     ; 171     AdcValue=AdcH;
3332  0105 1e03          	ldw	x,(OFST-1,sp)
3333  0107 cf0000        	ldw	_AdcValue,x
3334                     ; 172 	return;
3337  010a 5b04          	addw	sp,#4
3338  010c 80            	iret
3362                     ; 175 @interrupt void TIM4_UPD_OVF_IRQHandler (void)
3362                     ; 176 {
3363                     	switch	.text
3364  010d               f_TIM4_UPD_OVF_IRQHandler:
3367  010d 3b0002        	push	c_x+2
3368  0110 be00          	ldw	x,c_x
3369  0112 89            	pushw	x
3370  0113 3b0002        	push	c_y+2
3371  0116 be00          	ldw	x,c_y
3372  0118 89            	pushw	x
3375                     ; 177     ISR_TIM4_UPD_OVF();
3377  0119 8d000000      	callf	f_ISR_TIM4_UPD_OVF
3379                     ; 178     return;
3382  011d 85            	popw	x
3383  011e bf00          	ldw	c_y,x
3384  0120 320002        	pop	c_y+2
3385  0123 85            	popw	x
3386  0124 bf00          	ldw	c_x,x
3387  0126 320002        	pop	c_x+2
3388  0129 80            	iret
3411                     ; 181 @interrupt void EEPROM_EEC_IRQHandler (void)
3411                     ; 182 {
3412                     	switch	.text
3413  012a               f_EEPROM_EEC_IRQHandler:
3418                     ; 183 	return;
3421  012a 80            	iret
3444                     ; 186 void Startup(void)
3444                     ; 187 {
3445                     	switch	.text
3446  012b               f_Startup:
3450                     ; 188 	_stext();
3452  012b 8d000000      	callf	f__stext
3454                     ; 189 }
3457  012f 87            	retf
3469                     	xref	f__stext
3470                     	xref	_AdcValue
3471                     	xref	f_ISR_TIM4_UPD_OVF
3472                     	xdef	f_Startup
3473                     	xdef	f_EEPROM_EEC_IRQHandler
3474                     	xdef	f_TIM4_UPD_OVF_IRQHandler
3475                     	xdef	f_ADC_IRQHandler
3476                     	xdef	f_LINUART_RX_IRQHandler
3477                     	xdef	f_LINUART_TX_IRQHandler
3478                     	xdef	f_I2C_IRQHandler
3479                     	xdef	f_USART_RX_IRQHandler
3480                     	xdef	f_USART_TX_IRQHandler
3481                     	xdef	f_TIM3_CAP_COM_IRQHandler
3482                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
3483                     	xdef	f_TIM2_CAP_COM_IRQHandler
3484                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
3485                     	xdef	f_TIM1_CAP_COM_IRQHandler
3486                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
3487                     	xdef	f_SPI_IRQHandler
3488                     	xdef	f_CAN_TX_IRQHandler
3489                     	xdef	f_CAN_RX_IRQHandler
3490                     	xdef	f_EXTI_PORTE_IRQHandler
3491                     	xdef	f_EXTI_PORTD_IRQHandler
3492                     	xdef	f_EXTI_PORTC_IRQHandler
3493                     	xdef	f_EXTI_PORTB_IRQHandler
3494                     	xdef	f_EXTI_PORTA_IRQHandler
3495                     	xdef	f_CLK_IRQHandler
3496                     	xdef	f_AWU_IRQHandler
3497                     	xdef	f_TLI_IRQHandler
3498                     	xdef	f_TRAP_IRQHandler
3499                     	xref.b	c_x
3500                     	xref.b	c_y
3519                     	end
