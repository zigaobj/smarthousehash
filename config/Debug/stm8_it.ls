   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2479                     ; 3 @interrupt void TRAP_IRQHandler(void)
2479                     ; 4 {
2480                     	switch	.text
2481  0000               f_TRAP_IRQHandler:
2485                     ; 5 	return;
2488  0000 80            	iret
2510                     ; 8 @interrupt void TLI_IRQHandler (void)
2510                     ; 9 {
2511                     	switch	.text
2512  0001               f_TLI_IRQHandler:
2516                     ; 10 	return;
2519  0001 80            	iret
2541                     ; 13 @interrupt void AWU_IRQHandler (void)
2541                     ; 14 {
2542                     	switch	.text
2543  0002               f_AWU_IRQHandler:
2547                     ; 15 	return;
2550  0002 80            	iret
2572                     ; 18 @interrupt void CLK_IRQHandler (void)
2572                     ; 19 {
2573                     	switch	.text
2574  0003               f_CLK_IRQHandler:
2578                     ; 20 	return;
2581  0003 80            	iret
2604                     ; 23 @interrupt void EXTI_PORTA_IRQHandler (void)
2604                     ; 24 {
2605                     	switch	.text
2606  0004               f_EXTI_PORTA_IRQHandler:
2610                     ; 25 	return;
2613  0004 80            	iret
2636                     ; 28 @interrupt void EXTI_PORTB_IRQHandler (void)
2636                     ; 29 {
2637                     	switch	.text
2638  0005               f_EXTI_PORTB_IRQHandler:
2642                     ; 30 	return;
2645  0005 80            	iret
2668                     ; 33 @interrupt void EXTI_PORTC_IRQHandler (void)
2668                     ; 34 {
2669                     	switch	.text
2670  0006               f_EXTI_PORTC_IRQHandler:
2674                     ; 35 	return;
2677  0006 80            	iret
2700                     ; 38 @interrupt void EXTI_PORTD_IRQHandler (void)
2700                     ; 39 {
2701                     	switch	.text
2702  0007               f_EXTI_PORTD_IRQHandler:
2706                     ; 40 	return;
2709  0007 80            	iret
2732                     ; 43 @interrupt void EXTI_PORTE_IRQHandler (void)
2732                     ; 44 {
2733                     	switch	.text
2734  0008               f_EXTI_PORTE_IRQHandler:
2738                     ; 45 	return;
2741  0008 80            	iret
2764                     ; 48 @interrupt void CAN_RX_IRQHandler (void)
2764                     ; 49 {
2765                     	switch	.text
2766  0009               f_CAN_RX_IRQHandler:
2768  0009 3b0002        	push	c_x+2
2769  000c be00          	ldw	x,c_x
2770  000e 89            	pushw	x
2771  000f 3b0002        	push	c_y+2
2772  0012 be00          	ldw	x,c_y
2773  0014 89            	pushw	x
2776                     ; 50     ISR_Can_Rx();
2778  0015 8d000000      	callf	f_ISR_Can_Rx
2780                     ; 51 	return;
2783  0019 85            	popw	x
2784  001a bf00          	ldw	c_y,x
2785  001c 320002        	pop	c_y+2
2786  001f 85            	popw	x
2787  0020 bf00          	ldw	c_x,x
2788  0022 320002        	pop	c_x+2
2789  0025 80            	iret
2812                     ; 54 @interrupt void CAN_TX_IRQHandler (void)
2812                     ; 55 {
2813                     	switch	.text
2814  0026               f_CAN_TX_IRQHandler:
2816  0026 3b0002        	push	c_x+2
2817  0029 be00          	ldw	x,c_x
2818  002b 89            	pushw	x
2819  002c 3b0002        	push	c_y+2
2820  002f be00          	ldw	x,c_y
2821  0031 89            	pushw	x
2824                     ; 56     ISR_Can_Tx();
2826  0032 8d000000      	callf	f_ISR_Can_Tx
2828                     ; 57 	return;
2831  0036 85            	popw	x
2832  0037 bf00          	ldw	c_y,x
2833  0039 320002        	pop	c_y+2
2834  003c 85            	popw	x
2835  003d bf00          	ldw	c_x,x
2836  003f 320002        	pop	c_x+2
2837  0042 80            	iret
2859                     ; 60 @interrupt void SPI_IRQHandler (void)
2859                     ; 61 {
2860                     	switch	.text
2861  0043               f_SPI_IRQHandler:
2865                     ; 62 	return;
2868  0043 80            	iret
2870                     	switch	.data
2871  0000               L3161_FlagTemp:
2872  0000 00            	dc.b	0
2927                     ; 65 @interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler (void)
2927                     ; 66 {
2928                     	switch	.text
2929  0044               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
2933                     ; 68     TIM1.SR1 &=(~TIM1_SR1_UIF); //清更新事件标志
2935  0044 72115255      	bres	_TIM1+5,#0
2936                     ; 69     FlagTemp=~FlagTemp;
2938  0048 72530000      	cpl	L3161_FlagTemp
2939                     ; 70     if(FlagTemp)
2941  004c 725d0000      	tnz	L3161_FlagTemp
2943  0050               L5461:
2944                     ; 76 	return;
2947  0050 80            	iret
2971                     ; 79 @interrupt void TIM1_CAP_COM_IRQHandler (void)
2971                     ; 80 {
2972                     	switch	.text
2973  0051               f_TIM1_CAP_COM_IRQHandler:
2977                     ; 81     if(TIM1.SR1&TIM1_SR1_COMIF)
2979  0051 c65255        	ld	a,_TIM1+5
2980  0054 a520          	bcp	a,#32
2981  0056 2704          	jreq	L7561
2982                     ; 83         TIM1.SR1 &=(~TIM1_SR1_COMIF);
2984  0058 721b5255      	bres	_TIM1+5,#5
2985  005c               L7561:
2986                     ; 85 	return;
2989  005c 80            	iret
3015                     ; 87 @interrupt void TIM2_UPD_OVF_BRK_IRQHandler (void)
3015                     ; 88 {
3016                     	switch	.text
3017  005d               f_TIM2_UPD_OVF_BRK_IRQHandler:
3019       00000001      OFST:	set	1
3020  005d 88            	push	a
3023                     ; 89     TIM2.SR1 &=(~TIM2_SR1_UIF); //清更新事件标志
3025  005e 72115302      	bres	_TIM2+2,#0
3026                     ; 90     TIM1.EGR |=TIM1_EGR_COMG;
3028  0062 721a5257      	bset	_TIM1+7,#5
3029                     ; 91     GPIOC.ODR.byte =GPIOC.ODR.byte &(~0x02)|(~GPIOC.ODR.byte)&0x02;
3031  0066 c6500a        	ld	a,_GPIOC
3032  0069 43            	cpl	a
3033  006a a402          	and	a,#2
3034  006c 6b01          	ld	(OFST+0,sp),a
3035  006e c6500a        	ld	a,_GPIOC
3036  0071 a4fd          	and	a,#253
3037  0073 1a01          	or	a,(OFST+0,sp)
3038  0075 c7500a        	ld	_GPIOC,a
3039                     ; 92     return;
3042  0078 84            	pop	a
3043  0079 80            	iret
3068                     ; 95 @interrupt void TIM2_CAP_COM_IRQHandler (void)
3068                     ; 96 {
3069                     	switch	.text
3070  007a               f_TIM2_CAP_COM_IRQHandler:
3072       00000001      OFST:	set	1
3073  007a 88            	push	a
3076                     ; 97     if(TIM2.SR1&TIM2_SR1_CC1IF)
3078  007b c65302        	ld	a,_TIM2+2
3079  007e a502          	bcp	a,#2
3080  0080 2728          	jreq	L1071
3081                     ; 99         TIM2.SR1 &=(~TIM2_SR1_CC1IF); //清捕获标志
3083  0082 72135302      	bres	_TIM2+2,#1
3084                     ; 101         TIM2.CCER1=(TIM2.CCER1&(~TIM2_CCER1_CC1P))|((~TIM2.CCER1)&TIM2_CCER1_CC1P); //翻转触发极性
3086  0086 c65308        	ld	a,_TIM2+8
3087  0089 43            	cpl	a
3088  008a a402          	and	a,#2
3089  008c 6b01          	ld	(OFST+0,sp),a
3090  008e c65308        	ld	a,_TIM2+8
3091  0091 a4fd          	and	a,#253
3092  0093 1a01          	or	a,(OFST+0,sp)
3093  0095 c75308        	ld	_TIM2+8,a
3094                     ; 102         GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
3096  0098 c6500a        	ld	a,_GPIOC
3097  009b 43            	cpl	a
3098  009c a402          	and	a,#2
3099  009e 6b01          	ld	(OFST+0,sp),a
3100  00a0 c6500a        	ld	a,_GPIOC
3101  00a3 a4fd          	and	a,#253
3102  00a5 1a01          	or	a,(OFST+0,sp)
3103  00a7 c7500a        	ld	_GPIOC,a
3104  00aa               L1071:
3105                     ; 104     if(TIM2.SR1&TIM2_SR1_CC2IF)
3107  00aa c65302        	ld	a,_TIM2+2
3108  00ad a504          	bcp	a,#4
3109  00af 2728          	jreq	L3071
3110                     ; 106         TIM2.SR1 &=(~TIM2_SR1_CC2IF); //清捕获标志
3112  00b1 72155302      	bres	_TIM2+2,#2
3113                     ; 108         TIM2.CCER1=(TIM2.CCER1&(~TIM2_CCER1_CC2P))|((~TIM2.CCER1)&TIM2_CCER1_CC2P); //翻转触发极性
3115  00b5 c65308        	ld	a,_TIM2+8
3116  00b8 43            	cpl	a
3117  00b9 a420          	and	a,#32
3118  00bb 6b01          	ld	(OFST+0,sp),a
3119  00bd c65308        	ld	a,_TIM2+8
3120  00c0 a4df          	and	a,#223
3121  00c2 1a01          	or	a,(OFST+0,sp)
3122  00c4 c75308        	ld	_TIM2+8,a
3123                     ; 109         GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
3125  00c7 c6500a        	ld	a,_GPIOC
3126  00ca 43            	cpl	a
3127  00cb a402          	and	a,#2
3128  00cd 6b01          	ld	(OFST+0,sp),a
3129  00cf c6500a        	ld	a,_GPIOC
3130  00d2 a4fd          	and	a,#253
3131  00d4 1a01          	or	a,(OFST+0,sp)
3132  00d6 c7500a        	ld	_GPIOC,a
3133  00d9               L3071:
3134                     ; 111     if(TIM2.SR1&TIM2_SR1_CC3IF)
3136  00d9 c65302        	ld	a,_TIM2+2
3137  00dc a508          	bcp	a,#8
3138  00de 2728          	jreq	L5071
3139                     ; 113         TIM2.SR1 &=(~TIM2_SR1_CC3IF); //清捕获标志
3141  00e0 72175302      	bres	_TIM2+2,#3
3142                     ; 115         TIM2.CCER2=(TIM2.CCER2&(~TIM2_CCER2_CC3P))|((~TIM2.CCER2)&TIM2_CCER2_CC3P); //翻转触发极性
3144  00e4 c65309        	ld	a,_TIM2+9
3145  00e7 43            	cpl	a
3146  00e8 a402          	and	a,#2
3147  00ea 6b01          	ld	(OFST+0,sp),a
3148  00ec c65309        	ld	a,_TIM2+9
3149  00ef a4fd          	and	a,#253
3150  00f1 1a01          	or	a,(OFST+0,sp)
3151  00f3 c75309        	ld	_TIM2+9,a
3152                     ; 116         GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
3154  00f6 c6500a        	ld	a,_GPIOC
3155  00f9 43            	cpl	a
3156  00fa a402          	and	a,#2
3157  00fc 6b01          	ld	(OFST+0,sp),a
3158  00fe c6500a        	ld	a,_GPIOC
3159  0101 a4fd          	and	a,#253
3160  0103 1a01          	or	a,(OFST+0,sp)
3161  0105 c7500a        	ld	_GPIOC,a
3162  0108               L5071:
3163                     ; 118 	return;
3166  0108 84            	pop	a
3167  0109 80            	iret
3191                     ; 121 @interrupt void TIM3_UPD_OVF_BRK_IRQHandler (void)
3191                     ; 122 {
3192                     	switch	.text
3193  010a               f_TIM3_UPD_OVF_BRK_IRQHandler:
3197                     ; 123 	TIM3.SR1 &=0xfe; //清更新事件标志
3199  010a 72115322      	bres	_TIM3+2,#0
3200                     ; 125     return;
3203  010e 80            	iret
3226                     ; 128 @interrupt void TIM3_CAP_COM_IRQHandler (void)
3226                     ; 129 {
3227                     	switch	.text
3228  010f               f_TIM3_CAP_COM_IRQHandler:
3232                     ; 130 	return;
3235  010f 80            	iret
3258                     ; 133 @interrupt void USART_TX_IRQHandler (void)
3258                     ; 134 {
3259                     	switch	.text
3260  0110               f_USART_TX_IRQHandler:
3264                     ; 136 	return;
3267  0110 80            	iret
3290                     ; 139 @interrupt void USART_RX_IRQHandler (void)
3290                     ; 140 {
3291                     	switch	.text
3292  0111               f_USART_RX_IRQHandler:
3296                     ; 142 	return;
3299  0111 80            	iret
3321                     ; 145 @interrupt void I2C_IRQHandler (void)
3321                     ; 146 {
3322                     	switch	.text
3323  0112               f_I2C_IRQHandler:
3327                     ; 147 	return;
3330  0112 80            	iret
3353                     ; 150 @interrupt void LINUART_TX_IRQHandler (void)
3353                     ; 151 {
3354                     	switch	.text
3355  0113               f_LINUART_TX_IRQHandler:
3359                     ; 153 	return;
3362  0113 80            	iret
3385                     ; 156 @interrupt void LINUART_RX_IRQHandler (void)
3385                     ; 157 {
3386                     	switch	.text
3387  0114               f_LINUART_RX_IRQHandler:
3391                     ; 159 	return;
3394  0114 80            	iret
3434                     ; 162 @interrupt void ADC_IRQHandler (void)
3434                     ; 163 {
3435                     	switch	.text
3436  0115               f_ADC_IRQHandler:
3438       00000004      OFST:	set	4
3439  0115 5204          	subw	sp,#4
3442  0117               L7102:
3443                     ; 165     while(!(ADC.CSR&0x80)); // 等待转换结束 14 个时钟周期
3445  0117 c65400        	ld	a,_ADC
3446  011a a580          	bcp	a,#128
3447  011c 27f9          	jreq	L7102
3448                     ; 166     ADC.CSR &= 0x7F; // 清除中断标志
3450  011e 721f5400      	bres	_ADC,#7
3451                     ; 167     AdcL = ADC.DRL; //READ DATA 因为是右对齐所以先读低位
3453  0122 c65405        	ld	a,_ADC+5
3454  0125 5f            	clrw	x
3455  0126 97            	ld	xl,a
3456  0127 1f01          	ldw	(OFST-3,sp),x
3457                     ; 168     AdcH = ADC.DRH;
3459  0129 c65404        	ld	a,_ADC+4
3460  012c 5f            	clrw	x
3461  012d 97            	ld	xl,a
3462  012e 1f03          	ldw	(OFST-1,sp),x
3463                     ; 169     AdcH =( AdcH << 8 ) + AdcL;
3465  0130 1e03          	ldw	x,(OFST-1,sp)
3466  0132 4f            	clr	a
3467  0133 02            	rlwa	x,a
3468  0134 72fb01        	addw	x,(OFST-3,sp)
3469  0137 1f03          	ldw	(OFST-1,sp),x
3470                     ; 170     ADC.CR1 &=0xfe; // 关闭ADC
3472  0139 72115401      	bres	_ADC+1,#0
3473                     ; 171     AdcValue=AdcH;
3475  013d 1e03          	ldw	x,(OFST-1,sp)
3476  013f cf0000        	ldw	_AdcValue,x
3477                     ; 172 	return;
3480  0142 5b04          	addw	sp,#4
3481  0144 80            	iret
3505                     ; 175 @interrupt void TIM4_UPD_OVF_IRQHandler (void)
3505                     ; 176 {
3506                     	switch	.text
3507  0145               f_TIM4_UPD_OVF_IRQHandler:
3509  0145 3b0002        	push	c_x+2
3510  0148 be00          	ldw	x,c_x
3511  014a 89            	pushw	x
3512  014b 3b0002        	push	c_y+2
3513  014e be00          	ldw	x,c_y
3514  0150 89            	pushw	x
3517                     ; 177     ISR_TIM4_UPD_OVF();
3519  0151 8d000000      	callf	f_ISR_TIM4_UPD_OVF
3521                     ; 178     return;
3524  0155 85            	popw	x
3525  0156 bf00          	ldw	c_y,x
3526  0158 320002        	pop	c_y+2
3527  015b 85            	popw	x
3528  015c bf00          	ldw	c_x,x
3529  015e 320002        	pop	c_x+2
3530  0161 80            	iret
3553                     ; 181 @interrupt void EEPROM_EEC_IRQHandler (void)
3553                     ; 182 {
3554                     	switch	.text
3555  0162               f_EEPROM_EEC_IRQHandler:
3559                     ; 183 	return;
3562  0162 80            	iret
3574                     	xref	_AdcValue
3575                     	xref	f_ISR_Can_Rx
3576                     	xref	f_ISR_Can_Tx
3577                     	xref	f_ISR_TIM4_UPD_OVF
3578                     	xdef	f_EEPROM_EEC_IRQHandler
3579                     	xdef	f_TIM4_UPD_OVF_IRQHandler
3580                     	xdef	f_ADC_IRQHandler
3581                     	xdef	f_LINUART_RX_IRQHandler
3582                     	xdef	f_LINUART_TX_IRQHandler
3583                     	xdef	f_I2C_IRQHandler
3584                     	xdef	f_USART_RX_IRQHandler
3585                     	xdef	f_USART_TX_IRQHandler
3586                     	xdef	f_TIM3_CAP_COM_IRQHandler
3587                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
3588                     	xdef	f_TIM2_CAP_COM_IRQHandler
3589                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
3590                     	xdef	f_TIM1_CAP_COM_IRQHandler
3591                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
3592                     	xdef	f_SPI_IRQHandler
3593                     	xdef	f_CAN_TX_IRQHandler
3594                     	xdef	f_CAN_RX_IRQHandler
3595                     	xdef	f_EXTI_PORTE_IRQHandler
3596                     	xdef	f_EXTI_PORTD_IRQHandler
3597                     	xdef	f_EXTI_PORTC_IRQHandler
3598                     	xdef	f_EXTI_PORTB_IRQHandler
3599                     	xdef	f_EXTI_PORTA_IRQHandler
3600                     	xdef	f_CLK_IRQHandler
3601                     	xdef	f_AWU_IRQHandler
3602                     	xdef	f_TLI_IRQHandler
3603                     	xdef	f_TRAP_IRQHandler
3604                     	xref.b	c_x
3605                     	xref.b	c_y
3624                     	end
