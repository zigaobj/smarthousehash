   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2346                     ; 3 @interrupt void TRAP_IRQHandler(void)
2346                     ; 4 {
2348                     	switch	.text
2349  0000               _TRAP_IRQHandler:
2353                     ; 5 	return;
2356  0000 80            	iret
2379                     ; 8 @interrupt void TLI_IRQHandler (void)
2379                     ; 9 {
2380                     	switch	.text
2381  0001               _TLI_IRQHandler:
2385                     ; 10 	return;
2388  0001 80            	iret
2411                     ; 13 @interrupt void AWU_IRQHandler (void)
2411                     ; 14 {
2412                     	switch	.text
2413  0002               _AWU_IRQHandler:
2417                     ; 15 	return;
2420  0002 80            	iret
2443                     ; 18 @interrupt void CLK_IRQHandler (void)
2443                     ; 19 {
2444                     	switch	.text
2445  0003               _CLK_IRQHandler:
2449                     ; 20 	return;
2452  0003 80            	iret
2476                     ; 23 @interrupt void EXTI_PORTA_IRQHandler (void)
2476                     ; 24 {
2477                     	switch	.text
2478  0004               _EXTI_PORTA_IRQHandler:
2482                     ; 25 	return;
2485  0004 80            	iret
2509                     ; 28 @interrupt void EXTI_PORTB_IRQHandler (void)
2509                     ; 29 {
2510                     	switch	.text
2511  0005               _EXTI_PORTB_IRQHandler:
2515                     ; 30 	return;
2518  0005 80            	iret
2542                     ; 33 @interrupt void EXTI_PORTC_IRQHandler (void)
2542                     ; 34 {
2543                     	switch	.text
2544  0006               _EXTI_PORTC_IRQHandler:
2548                     ; 35 	return;
2551  0006 80            	iret
2575                     ; 38 @interrupt void EXTI_PORTD_IRQHandler (void)
2575                     ; 39 {
2576                     	switch	.text
2577  0007               _EXTI_PORTD_IRQHandler:
2581                     ; 40 	return;
2584  0007 80            	iret
2608                     ; 43 @interrupt void EXTI_PORTE_IRQHandler (void)
2608                     ; 44 {
2609                     	switch	.text
2610  0008               _EXTI_PORTE_IRQHandler:
2614                     ; 45 	return;
2617  0008 80            	iret
2640                     ; 48 @interrupt void CAN_RX_IRQHandler (void)
2640                     ; 49 {
2641                     	switch	.text
2642  0009               _CAN_RX_IRQHandler:
2646                     ; 51 	return;
2649  0009 80            	iret
2672                     ; 54 @interrupt void CAN_TX_IRQHandler (void)
2672                     ; 55 {
2673                     	switch	.text
2674  000a               _CAN_TX_IRQHandler:
2678                     ; 57 	return;
2681  000a 80            	iret
2704                     ; 60 @interrupt void SPI_IRQHandler (void)
2704                     ; 61 {
2705                     	switch	.text
2706  000b               _SPI_IRQHandler:
2710                     ; 62 	return;
2713  000b 80            	iret
2716                     	bsct
2717  0000               L5251_FlagTemp:
2718  0000 00            	dc.b	0
2773                     ; 65 @interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler (void)
2773                     ; 66 {
2774                     	switch	.text
2775  000c               _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
2779                     ; 68     TIM1.SR1 &=(~TIM1_SR1_UIF); //清更新事件标志
2781  000c 72115255      	bres	_TIM1+5,#0
2782                     ; 69     FlagTemp=~FlagTemp;
2784  0010 3300          	cpl	L5251_FlagTemp
2785                     ; 70     if(FlagTemp)
2787  0012 3d00          	tnz	L5251_FlagTemp
2789  0014               L7551:
2790                     ; 76 	return;
2793  0014 80            	iret
2818                     ; 79 @interrupt void TIM1_CAP_COM_IRQHandler (void)
2818                     ; 80 {
2819                     	switch	.text
2820  0015               _TIM1_CAP_COM_IRQHandler:
2824                     ; 81     if(TIM1.SR1&TIM1_SR1_COMIF)
2826  0015 c65255        	ld	a,_TIM1+5
2827  0018 a520          	bcp	a,#32
2828  001a 2704          	jreq	L1751
2829                     ; 83         TIM1.SR1 &=(~TIM1_SR1_COMIF);
2831  001c 721b5255      	bres	_TIM1+5,#5
2832  0020               L1751:
2833                     ; 85 	return;
2836  0020 80            	iret
2863                     ; 87 @interrupt void TIM2_UPD_OVF_BRK_IRQHandler (void)
2863                     ; 88 {
2864                     	switch	.text
2865  0021               _TIM2_UPD_OVF_BRK_IRQHandler:
2867       00000001      OFST:	set	1
2868  0021 88            	push	a
2871                     ; 89     TIM2.SR1 &=(~TIM2_SR1_UIF); //清更新事件标志
2873  0022 72115302      	bres	_TIM2+2,#0
2874                     ; 90     TIM1.EGR |=TIM1_EGR_COMG;
2876  0026 721a5257      	bset	_TIM1+7,#5
2877                     ; 91     GPIOC.ODR.byte =GPIOC.ODR.byte &(~0x02)|(~GPIOC.ODR.byte)&0x02;
2879  002a c6500a        	ld	a,_GPIOC
2880  002d 43            	cpl	a
2881  002e a402          	and	a,#2
2882  0030 6b01          	ld	(OFST+0,sp),a
2883  0032 c6500a        	ld	a,_GPIOC
2884  0035 a4fd          	and	a,#253
2885  0037 1a01          	or	a,(OFST+0,sp)
2886  0039 c7500a        	ld	_GPIOC,a
2887                     ; 92     return;
2890  003c 84            	pop	a
2891  003d 80            	iret
2917                     ; 95 @interrupt void TIM2_CAP_COM_IRQHandler (void)
2917                     ; 96 {
2918                     	switch	.text
2919  003e               _TIM2_CAP_COM_IRQHandler:
2921       00000001      OFST:	set	1
2922  003e 88            	push	a
2925                     ; 97     if(TIM2.SR1&TIM2_SR1_CC1IF)
2927  003f c65302        	ld	a,_TIM2+2
2928  0042 a502          	bcp	a,#2
2929  0044 2728          	jreq	L3161
2930                     ; 99         TIM2.SR1 &=(~TIM2_SR1_CC1IF); //清捕获标志
2932  0046 72135302      	bres	_TIM2+2,#1
2933                     ; 101         TIM2.CCER1=(TIM2.CCER1&(~TIM2_CCER1_CC1P))|((~TIM2.CCER1)&TIM2_CCER1_CC1P); //翻转触发极性
2935  004a c65308        	ld	a,_TIM2+8
2936  004d 43            	cpl	a
2937  004e a402          	and	a,#2
2938  0050 6b01          	ld	(OFST+0,sp),a
2939  0052 c65308        	ld	a,_TIM2+8
2940  0055 a4fd          	and	a,#253
2941  0057 1a01          	or	a,(OFST+0,sp)
2942  0059 c75308        	ld	_TIM2+8,a
2943                     ; 102         GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
2945  005c c6500a        	ld	a,_GPIOC
2946  005f 43            	cpl	a
2947  0060 a402          	and	a,#2
2948  0062 6b01          	ld	(OFST+0,sp),a
2949  0064 c6500a        	ld	a,_GPIOC
2950  0067 a4fd          	and	a,#253
2951  0069 1a01          	or	a,(OFST+0,sp)
2952  006b c7500a        	ld	_GPIOC,a
2953  006e               L3161:
2954                     ; 104     if(TIM2.SR1&TIM2_SR1_CC2IF)
2956  006e c65302        	ld	a,_TIM2+2
2957  0071 a504          	bcp	a,#4
2958  0073 2728          	jreq	L5161
2959                     ; 106         TIM2.SR1 &=(~TIM2_SR1_CC2IF); //清捕获标志
2961  0075 72155302      	bres	_TIM2+2,#2
2962                     ; 108         TIM2.CCER1=(TIM2.CCER1&(~TIM2_CCER1_CC2P))|((~TIM2.CCER1)&TIM2_CCER1_CC2P); //翻转触发极性
2964  0079 c65308        	ld	a,_TIM2+8
2965  007c 43            	cpl	a
2966  007d a420          	and	a,#32
2967  007f 6b01          	ld	(OFST+0,sp),a
2968  0081 c65308        	ld	a,_TIM2+8
2969  0084 a4df          	and	a,#223
2970  0086 1a01          	or	a,(OFST+0,sp)
2971  0088 c75308        	ld	_TIM2+8,a
2972                     ; 109         GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
2974  008b c6500a        	ld	a,_GPIOC
2975  008e 43            	cpl	a
2976  008f a402          	and	a,#2
2977  0091 6b01          	ld	(OFST+0,sp),a
2978  0093 c6500a        	ld	a,_GPIOC
2979  0096 a4fd          	and	a,#253
2980  0098 1a01          	or	a,(OFST+0,sp)
2981  009a c7500a        	ld	_GPIOC,a
2982  009d               L5161:
2983                     ; 111     if(TIM2.SR1&TIM2_SR1_CC3IF)
2985  009d c65302        	ld	a,_TIM2+2
2986  00a0 a508          	bcp	a,#8
2987  00a2 2728          	jreq	L7161
2988                     ; 113         TIM2.SR1 &=(~TIM2_SR1_CC3IF); //清捕获标志
2990  00a4 72175302      	bres	_TIM2+2,#3
2991                     ; 115         TIM2.CCER2=(TIM2.CCER2&(~TIM2_CCER2_CC3P))|((~TIM2.CCER2)&TIM2_CCER2_CC3P); //翻转触发极性
2993  00a8 c65309        	ld	a,_TIM2+9
2994  00ab 43            	cpl	a
2995  00ac a402          	and	a,#2
2996  00ae 6b01          	ld	(OFST+0,sp),a
2997  00b0 c65309        	ld	a,_TIM2+9
2998  00b3 a4fd          	and	a,#253
2999  00b5 1a01          	or	a,(OFST+0,sp)
3000  00b7 c75309        	ld	_TIM2+9,a
3001                     ; 116         GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
3003  00ba c6500a        	ld	a,_GPIOC
3004  00bd 43            	cpl	a
3005  00be a402          	and	a,#2
3006  00c0 6b01          	ld	(OFST+0,sp),a
3007  00c2 c6500a        	ld	a,_GPIOC
3008  00c5 a4fd          	and	a,#253
3009  00c7 1a01          	or	a,(OFST+0,sp)
3010  00c9 c7500a        	ld	_GPIOC,a
3011  00cc               L7161:
3012                     ; 118 	return;
3015  00cc 84            	pop	a
3016  00cd 80            	iret
3041                     ; 121 @interrupt void TIM3_UPD_OVF_BRK_IRQHandler (void)
3041                     ; 122 {
3042                     	switch	.text
3043  00ce               _TIM3_UPD_OVF_BRK_IRQHandler:
3047                     ; 123 	TIM3.SR1 &=0xfe; //清更新事件标志
3049  00ce 72115322      	bres	_TIM3+2,#0
3050                     ; 125     return;
3053  00d2 80            	iret
3077                     ; 128 @interrupt void TIM3_CAP_COM_IRQHandler (void)
3077                     ; 129 {
3078                     	switch	.text
3079  00d3               _TIM3_CAP_COM_IRQHandler:
3083                     ; 130 	return;
3086  00d3 80            	iret
3110                     ; 133 @interrupt void USART_TX_IRQHandler (void)
3110                     ; 134 {
3111                     	switch	.text
3112  00d4               _USART_TX_IRQHandler:
3116                     ; 136 	return;
3119  00d4 80            	iret
3143                     ; 139 @interrupt void USART_RX_IRQHandler (void)
3143                     ; 140 {
3144                     	switch	.text
3145  00d5               _USART_RX_IRQHandler:
3149                     ; 142 	return;
3152  00d5 80            	iret
3175                     ; 145 @interrupt void I2C_IRQHandler (void)
3175                     ; 146 {
3176                     	switch	.text
3177  00d6               _I2C_IRQHandler:
3181                     ; 147 	return;
3184  00d6 80            	iret
3208                     ; 150 @interrupt void LINUART_TX_IRQHandler (void)
3208                     ; 151 {
3209                     	switch	.text
3210  00d7               _LINUART_TX_IRQHandler:
3214                     ; 153 	return;
3217  00d7 80            	iret
3241                     ; 156 @interrupt void LINUART_RX_IRQHandler (void)
3241                     ; 157 {
3242                     	switch	.text
3243  00d8               _LINUART_RX_IRQHandler:
3247                     ; 159 	return;
3250  00d8 80            	iret
3295                     ; 162 @interrupt void ADC_IRQHandler (void)
3295                     ; 163 {
3296                     	switch	.text
3297  00d9               _ADC_IRQHandler:
3299       00000004      OFST:	set	4
3300  00d9 5204          	subw	sp,#4
3303  00db               L5371:
3304                     ; 165     while(!(ADC.CSR&0x80)); // 等待转换结束 14 个时钟周期
3306  00db c65400        	ld	a,_ADC
3307  00de a580          	bcp	a,#128
3308  00e0 27f9          	jreq	L5371
3309                     ; 166     ADC.CSR &= 0x7F; // 清除中断标志
3311  00e2 721f5400      	bres	_ADC,#7
3312                     ; 167     AdcL = ADC.DRL; //READ DATA 因为是右对齐所以先读低位
3314  00e6 c65405        	ld	a,_ADC+5
3315  00e9 5f            	clrw	x
3316  00ea 97            	ld	xl,a
3317  00eb 1f01          	ldw	(OFST-3,sp),x
3318                     ; 168     AdcH = ADC.DRH;
3320  00ed c65404        	ld	a,_ADC+4
3321  00f0 5f            	clrw	x
3322  00f1 97            	ld	xl,a
3323  00f2 1f03          	ldw	(OFST-1,sp),x
3324                     ; 169     AdcH =( AdcH << 8 ) + AdcL;
3326  00f4 1e03          	ldw	x,(OFST-1,sp)
3327  00f6 4f            	clr	a
3328  00f7 02            	rlwa	x,a
3329  00f8 72fb01        	addw	x,(OFST-3,sp)
3330  00fb 1f03          	ldw	(OFST-1,sp),x
3331                     ; 170     ADC.CR1 &=0xfe; // 关闭ADC
3333  00fd 72115401      	bres	_ADC+1,#0
3334                     ; 171     AdcValue=AdcH;
3336  0101 1e03          	ldw	x,(OFST-1,sp)
3337  0103 bf00          	ldw	_AdcValue,x
3338                     ; 172 	return;
3341  0105 5b04          	addw	sp,#4
3342  0107 80            	iret
3367                     ; 175 @interrupt void TIM4_UPD_OVF_IRQHandler (void)
3367                     ; 176 {
3368                     	switch	.text
3369  0108               _TIM4_UPD_OVF_IRQHandler:
3371  0108 3b0002        	push	c_x+2
3372  010b be00          	ldw	x,c_x
3373  010d 89            	pushw	x
3374  010e 3b0002        	push	c_y+2
3375  0111 be00          	ldw	x,c_y
3376  0113 89            	pushw	x
3379                     ; 177     ISR_TIM4_UPD_OVF();
3381  0114 cd0000        	call	_ISR_TIM4_UPD_OVF
3383                     ; 178     return;
3386  0117 85            	popw	x
3387  0118 bf00          	ldw	c_y,x
3388  011a 320002        	pop	c_y+2
3389  011d 85            	popw	x
3390  011e bf00          	ldw	c_x,x
3391  0120 320002        	pop	c_x+2
3392  0123 80            	iret
3416                     ; 181 @interrupt void EEPROM_EEC_IRQHandler (void)
3416                     ; 182 {
3417                     	switch	.text
3418  0124               _EEPROM_EEC_IRQHandler:
3422                     ; 183 	return;
3425  0124 80            	iret
3449                     ; 186 void Startup(void)
3449                     ; 187 {
3450                     	switch	.text
3451  0125               _Startup:
3455                     ; 188 	_stext();
3457  0125 cd0000        	call	__stext
3459                     ; 189 }
3462  0128 81            	ret
3475                     	xref	__stext
3476                     	xref.b	_AdcValue
3477                     	xref	_ISR_TIM4_UPD_OVF
3478                     	xdef	_Startup
3479                     	xdef	_EEPROM_EEC_IRQHandler
3480                     	xdef	_TIM4_UPD_OVF_IRQHandler
3481                     	xdef	_ADC_IRQHandler
3482                     	xdef	_LINUART_RX_IRQHandler
3483                     	xdef	_LINUART_TX_IRQHandler
3484                     	xdef	_I2C_IRQHandler
3485                     	xdef	_USART_RX_IRQHandler
3486                     	xdef	_USART_TX_IRQHandler
3487                     	xdef	_TIM3_CAP_COM_IRQHandler
3488                     	xdef	_TIM3_UPD_OVF_BRK_IRQHandler
3489                     	xdef	_TIM2_CAP_COM_IRQHandler
3490                     	xdef	_TIM2_UPD_OVF_BRK_IRQHandler
3491                     	xdef	_TIM1_CAP_COM_IRQHandler
3492                     	xdef	_TIM1_UPD_OVF_TRG_BRK_IRQHandler
3493                     	xdef	_SPI_IRQHandler
3494                     	xdef	_CAN_TX_IRQHandler
3495                     	xdef	_CAN_RX_IRQHandler
3496                     	xdef	_EXTI_PORTE_IRQHandler
3497                     	xdef	_EXTI_PORTD_IRQHandler
3498                     	xdef	_EXTI_PORTC_IRQHandler
3499                     	xdef	_EXTI_PORTB_IRQHandler
3500                     	xdef	_EXTI_PORTA_IRQHandler
3501                     	xdef	_CLK_IRQHandler
3502                     	xdef	_AWU_IRQHandler
3503                     	xdef	_TLI_IRQHandler
3504                     	xdef	_TRAP_IRQHandler
3505                     	xref.b	c_x
3506                     	xref.b	c_y
3525                     	end
