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
2640                     ; 48 @interrupt void CAN_RX_IRQHandler (void)
2640                     ; 49 {
2641                     	switch	.text
2642  0009               f_CAN_RX_IRQHandler:
2645  0009 3b0002        	push	c_x+2
2646  000c be00          	ldw	x,c_x
2647  000e 89            	pushw	x
2648  000f 3b0002        	push	c_y+2
2649  0012 be00          	ldw	x,c_y
2650  0014 89            	pushw	x
2653                     ; 50     ISR_Can_Rx();
2655  0015 8d000000      	callf	f_ISR_Can_Rx
2657                     ; 51 	return;
2660  0019 85            	popw	x
2661  001a bf00          	ldw	c_y,x
2662  001c 320002        	pop	c_y+2
2663  001f 85            	popw	x
2664  0020 bf00          	ldw	c_x,x
2665  0022 320002        	pop	c_x+2
2666  0025 80            	iret
2689                     ; 54 @interrupt void CAN_TX_IRQHandler (void)
2689                     ; 55 {
2690                     	switch	.text
2691  0026               f_CAN_TX_IRQHandler:
2694  0026 3b0002        	push	c_x+2
2695  0029 be00          	ldw	x,c_x
2696  002b 89            	pushw	x
2697  002c 3b0002        	push	c_y+2
2698  002f be00          	ldw	x,c_y
2699  0031 89            	pushw	x
2702                     ; 56     ISR_Can_Tx();
2704  0032 8d000000      	callf	f_ISR_Can_Tx
2706                     ; 57 	return;
2709  0036 85            	popw	x
2710  0037 bf00          	ldw	c_y,x
2711  0039 320002        	pop	c_y+2
2712  003c 85            	popw	x
2713  003d bf00          	ldw	c_x,x
2714  003f 320002        	pop	c_x+2
2715  0042 80            	iret
2737                     ; 60 @interrupt void SPI_IRQHandler (void)
2737                     ; 61 {
2738                     	switch	.text
2739  0043               f_SPI_IRQHandler:
2744                     ; 62 	return;
2747  0043 80            	iret
2749                     	switch	.data
2750  0000               L5251_FlagTemp:
2751  0000 00            	dc.b	0
2806                     ; 65 @interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler (void)
2806                     ; 66 {
2807                     	switch	.text
2808  0044               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
2813                     ; 68     TIM1.SR1 &=(~TIM1_SR1_UIF); //清更新事件标志
2815  0044 72115255      	bres	_TIM1+5,#0
2816                     ; 69     FlagTemp=~FlagTemp;
2818  0048 72530000      	cpl	L5251_FlagTemp
2819                     ; 70     if(FlagTemp)
2821  004c 725d0000      	tnz	L5251_FlagTemp
2823  0050               L7551:
2824                     ; 76 	return;
2827  0050 80            	iret
2851                     ; 79 @interrupt void TIM1_CAP_COM_IRQHandler (void)
2851                     ; 80 {
2852                     	switch	.text
2853  0051               f_TIM1_CAP_COM_IRQHandler:
2858                     ; 81     if(TIM1.SR1&TIM1_SR1_COMIF)
2860  0051 c65255        	ld	a,_TIM1+5
2861  0054 a520          	bcp	a,#32
2862  0056 2704          	jreq	L1751
2863                     ; 83         TIM1.SR1 &=(~TIM1_SR1_COMIF);
2865  0058 721b5255      	bres	_TIM1+5,#5
2866  005c               L1751:
2867                     ; 85 	return;
2870  005c 80            	iret
2896                     ; 87 @interrupt void TIM2_UPD_OVF_BRK_IRQHandler (void)
2896                     ; 88 {
2897                     	switch	.text
2898  005d               f_TIM2_UPD_OVF_BRK_IRQHandler:
2901       00000001      OFST:	set	1
2902  005d 88            	push	a
2905                     ; 89     TIM2.SR1 &=(~TIM2_SR1_UIF); //清更新事件标志
2907  005e 72115302      	bres	_TIM2+2,#0
2908                     ; 90     TIM1.EGR |=TIM1_EGR_COMG;
2910  0062 721a5257      	bset	_TIM1+7,#5
2911                     ; 91     GPIOC.ODR.byte =GPIOC.ODR.byte &(~0x02)|(~GPIOC.ODR.byte)&0x02;
2913  0066 c6500a        	ld	a,_GPIOC
2914  0069 43            	cpl	a
2915  006a a402          	and	a,#2
2916  006c 6b01          	ld	(OFST+0,sp),a
2917  006e c6500a        	ld	a,_GPIOC
2918  0071 a4fd          	and	a,#253
2919  0073 1a01          	or	a,(OFST+0,sp)
2920  0075 c7500a        	ld	_GPIOC,a
2921                     ; 92     return;
2924  0078 84            	pop	a
2925  0079 80            	iret
2950                     ; 95 @interrupt void TIM2_CAP_COM_IRQHandler (void)
2950                     ; 96 {
2951                     	switch	.text
2952  007a               f_TIM2_CAP_COM_IRQHandler:
2955       00000001      OFST:	set	1
2956  007a 88            	push	a
2959                     ; 97     if(TIM2.SR1&TIM2_SR1_CC1IF)
2961  007b c65302        	ld	a,_TIM2+2
2962  007e a502          	bcp	a,#2
2963  0080 2728          	jreq	L3161
2964                     ; 99         TIM2.SR1 &=(~TIM2_SR1_CC1IF); //清捕获标志
2966  0082 72135302      	bres	_TIM2+2,#1
2967                     ; 101         TIM2.CCER1=(TIM2.CCER1&(~TIM2_CCER1_CC1P))|((~TIM2.CCER1)&TIM2_CCER1_CC1P); //翻转触发极性
2969  0086 c65308        	ld	a,_TIM2+8
2970  0089 43            	cpl	a
2971  008a a402          	and	a,#2
2972  008c 6b01          	ld	(OFST+0,sp),a
2973  008e c65308        	ld	a,_TIM2+8
2974  0091 a4fd          	and	a,#253
2975  0093 1a01          	or	a,(OFST+0,sp)
2976  0095 c75308        	ld	_TIM2+8,a
2977                     ; 102         GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
2979  0098 c6500a        	ld	a,_GPIOC
2980  009b 43            	cpl	a
2981  009c a402          	and	a,#2
2982  009e 6b01          	ld	(OFST+0,sp),a
2983  00a0 c6500a        	ld	a,_GPIOC
2984  00a3 a4fd          	and	a,#253
2985  00a5 1a01          	or	a,(OFST+0,sp)
2986  00a7 c7500a        	ld	_GPIOC,a
2987  00aa               L3161:
2988                     ; 104     if(TIM2.SR1&TIM2_SR1_CC2IF)
2990  00aa c65302        	ld	a,_TIM2+2
2991  00ad a504          	bcp	a,#4
2992  00af 2728          	jreq	L5161
2993                     ; 106         TIM2.SR1 &=(~TIM2_SR1_CC2IF); //清捕获标志
2995  00b1 72155302      	bres	_TIM2+2,#2
2996                     ; 108         TIM2.CCER1=(TIM2.CCER1&(~TIM2_CCER1_CC2P))|((~TIM2.CCER1)&TIM2_CCER1_CC2P); //翻转触发极性
2998  00b5 c65308        	ld	a,_TIM2+8
2999  00b8 43            	cpl	a
3000  00b9 a420          	and	a,#32
3001  00bb 6b01          	ld	(OFST+0,sp),a
3002  00bd c65308        	ld	a,_TIM2+8
3003  00c0 a4df          	and	a,#223
3004  00c2 1a01          	or	a,(OFST+0,sp)
3005  00c4 c75308        	ld	_TIM2+8,a
3006                     ; 109         GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
3008  00c7 c6500a        	ld	a,_GPIOC
3009  00ca 43            	cpl	a
3010  00cb a402          	and	a,#2
3011  00cd 6b01          	ld	(OFST+0,sp),a
3012  00cf c6500a        	ld	a,_GPIOC
3013  00d2 a4fd          	and	a,#253
3014  00d4 1a01          	or	a,(OFST+0,sp)
3015  00d6 c7500a        	ld	_GPIOC,a
3016  00d9               L5161:
3017                     ; 111     if(TIM2.SR1&TIM2_SR1_CC3IF)
3019  00d9 c65302        	ld	a,_TIM2+2
3020  00dc a508          	bcp	a,#8
3021  00de 2728          	jreq	L7161
3022                     ; 113         TIM2.SR1 &=(~TIM2_SR1_CC3IF); //清捕获标志
3024  00e0 72175302      	bres	_TIM2+2,#3
3025                     ; 115         TIM2.CCER2=(TIM2.CCER2&(~TIM2_CCER2_CC3P))|((~TIM2.CCER2)&TIM2_CCER2_CC3P); //翻转触发极性
3027  00e4 c65309        	ld	a,_TIM2+9
3028  00e7 43            	cpl	a
3029  00e8 a402          	and	a,#2
3030  00ea 6b01          	ld	(OFST+0,sp),a
3031  00ec c65309        	ld	a,_TIM2+9
3032  00ef a4fd          	and	a,#253
3033  00f1 1a01          	or	a,(OFST+0,sp)
3034  00f3 c75309        	ld	_TIM2+9,a
3035                     ; 116         GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
3037  00f6 c6500a        	ld	a,_GPIOC
3038  00f9 43            	cpl	a
3039  00fa a402          	and	a,#2
3040  00fc 6b01          	ld	(OFST+0,sp),a
3041  00fe c6500a        	ld	a,_GPIOC
3042  0101 a4fd          	and	a,#253
3043  0103 1a01          	or	a,(OFST+0,sp)
3044  0105 c7500a        	ld	_GPIOC,a
3045  0108               L7161:
3046                     ; 118 	return;
3049  0108 84            	pop	a
3050  0109 80            	iret
3074                     ; 121 @interrupt void TIM3_UPD_OVF_BRK_IRQHandler (void)
3074                     ; 122 {
3075                     	switch	.text
3076  010a               f_TIM3_UPD_OVF_BRK_IRQHandler:
3081                     ; 123 	TIM3.SR1 &=0xfe; //清更新事件标志
3083  010a 72115322      	bres	_TIM3+2,#0
3084                     ; 125     return;
3087  010e 80            	iret
3110                     ; 128 @interrupt void TIM3_CAP_COM_IRQHandler (void)
3110                     ; 129 {
3111                     	switch	.text
3112  010f               f_TIM3_CAP_COM_IRQHandler:
3117                     ; 130 	return;
3120  010f 80            	iret
3143                     ; 133 @interrupt void USART_TX_IRQHandler (void)
3143                     ; 134 {
3144                     	switch	.text
3145  0110               f_USART_TX_IRQHandler:
3150                     ; 136 	return;
3153  0110 80            	iret
3176                     ; 139 @interrupt void USART_RX_IRQHandler (void)
3176                     ; 140 {
3177                     	switch	.text
3178  0111               f_USART_RX_IRQHandler:
3183                     ; 142 	return;
3186  0111 80            	iret
3208                     ; 145 @interrupt void I2C_IRQHandler (void)
3208                     ; 146 {
3209                     	switch	.text
3210  0112               f_I2C_IRQHandler:
3215                     ; 147 	return;
3218  0112 80            	iret
3241                     ; 150 @interrupt void LINUART_TX_IRQHandler (void)
3241                     ; 151 {
3242                     	switch	.text
3243  0113               f_LINUART_TX_IRQHandler:
3248                     ; 153 	return;
3251  0113 80            	iret
3274                     ; 156 @interrupt void LINUART_RX_IRQHandler (void)
3274                     ; 157 {
3275                     	switch	.text
3276  0114               f_LINUART_RX_IRQHandler:
3281                     ; 159 	return;
3284  0114 80            	iret
3324                     ; 162 @interrupt void ADC_IRQHandler (void)
3324                     ; 163 {
3325                     	switch	.text
3326  0115               f_ADC_IRQHandler:
3329       00000004      OFST:	set	4
3330  0115 5204          	subw	sp,#4
3333  0117               L1371:
3334                     ; 165     while(!(ADC.CSR&0x80)); // 等待转换结束 14 个时钟周期
3336  0117 c65400        	ld	a,_ADC
3337  011a a580          	bcp	a,#128
3338  011c 27f9          	jreq	L1371
3339                     ; 166     ADC.CSR &= 0x7F; // 清除中断标志
3341  011e 721f5400      	bres	_ADC,#7
3342                     ; 167     AdcL = ADC.DRL; //READ DATA 因为是右对齐所以先读低位
3344  0122 c65405        	ld	a,_ADC+5
3345  0125 5f            	clrw	x
3346  0126 97            	ld	xl,a
3347  0127 1f01          	ldw	(OFST-3,sp),x
3348                     ; 168     AdcH = ADC.DRH;
3350  0129 c65404        	ld	a,_ADC+4
3351  012c 5f            	clrw	x
3352  012d 97            	ld	xl,a
3353  012e 1f03          	ldw	(OFST-1,sp),x
3354                     ; 169     AdcH =( AdcH << 8 ) + AdcL;
3356  0130 1e03          	ldw	x,(OFST-1,sp)
3357  0132 4f            	clr	a
3358  0133 02            	rlwa	x,a
3359  0134 72fb01        	addw	x,(OFST-3,sp)
3360  0137 1f03          	ldw	(OFST-1,sp),x
3361                     ; 170     ADC.CR1 &=0xfe; // 关闭ADC
3363  0139 72115401      	bres	_ADC+1,#0
3364                     ; 171     AdcValue=AdcH;
3366  013d 1e03          	ldw	x,(OFST-1,sp)
3367  013f cf0000        	ldw	_AdcValue,x
3368                     ; 172 	return;
3371  0142 5b04          	addw	sp,#4
3372  0144 80            	iret
3396                     ; 175 @interrupt void TIM4_UPD_OVF_IRQHandler (void)
3396                     ; 176 {
3397                     	switch	.text
3398  0145               f_TIM4_UPD_OVF_IRQHandler:
3401  0145 3b0002        	push	c_x+2
3402  0148 be00          	ldw	x,c_x
3403  014a 89            	pushw	x
3404  014b 3b0002        	push	c_y+2
3405  014e be00          	ldw	x,c_y
3406  0150 89            	pushw	x
3409                     ; 177     ISR_TIM4_UPD_OVF();
3411  0151 8d000000      	callf	f_ISR_TIM4_UPD_OVF
3413                     ; 178     return;
3416  0155 85            	popw	x
3417  0156 bf00          	ldw	c_y,x
3418  0158 320002        	pop	c_y+2
3419  015b 85            	popw	x
3420  015c bf00          	ldw	c_x,x
3421  015e 320002        	pop	c_x+2
3422  0161 80            	iret
3445                     ; 181 @interrupt void EEPROM_EEC_IRQHandler (void)
3445                     ; 182 {
3446                     	switch	.text
3447  0162               f_EEPROM_EEC_IRQHandler:
3452                     ; 183 	return;
3455  0162 80            	iret
3467                     	xref	_AdcValue
3468                     	xref	f_ISR_Can_Rx
3469                     	xref	f_ISR_Can_Tx
3470                     	xref	f_ISR_TIM4_UPD_OVF
3471                     	xdef	f_EEPROM_EEC_IRQHandler
3472                     	xdef	f_TIM4_UPD_OVF_IRQHandler
3473                     	xdef	f_ADC_IRQHandler
3474                     	xdef	f_LINUART_RX_IRQHandler
3475                     	xdef	f_LINUART_TX_IRQHandler
3476                     	xdef	f_I2C_IRQHandler
3477                     	xdef	f_USART_RX_IRQHandler
3478                     	xdef	f_USART_TX_IRQHandler
3479                     	xdef	f_TIM3_CAP_COM_IRQHandler
3480                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
3481                     	xdef	f_TIM2_CAP_COM_IRQHandler
3482                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
3483                     	xdef	f_TIM1_CAP_COM_IRQHandler
3484                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
3485                     	xdef	f_SPI_IRQHandler
3486                     	xdef	f_CAN_TX_IRQHandler
3487                     	xdef	f_CAN_RX_IRQHandler
3488                     	xdef	f_EXTI_PORTE_IRQHandler
3489                     	xdef	f_EXTI_PORTD_IRQHandler
3490                     	xdef	f_EXTI_PORTC_IRQHandler
3491                     	xdef	f_EXTI_PORTB_IRQHandler
3492                     	xdef	f_EXTI_PORTA_IRQHandler
3493                     	xdef	f_CLK_IRQHandler
3494                     	xdef	f_AWU_IRQHandler
3495                     	xdef	f_TLI_IRQHandler
3496                     	xdef	f_TRAP_IRQHandler
3497                     	xref.b	c_x
3498                     	xref.b	c_y
3517                     	end
