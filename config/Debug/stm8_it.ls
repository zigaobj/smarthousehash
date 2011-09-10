   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2346                     ; 3 @interrupt void TRAP_IRQHandler(void)
2346                     ; 4 {
2347                     	switch	.text
2348  0000               f_TRAP_IRQHandler:
2352                     ; 5 	return;
2355  0000 80            	iret
2377                     ; 8 @interrupt void TLI_IRQHandler (void)
2377                     ; 9 {
2378                     	switch	.text
2379  0001               f_TLI_IRQHandler:
2383                     ; 10 	return;
2386  0001 80            	iret
2408                     ; 13 @interrupt void AWU_IRQHandler (void)
2408                     ; 14 {
2409                     	switch	.text
2410  0002               f_AWU_IRQHandler:
2414                     ; 15 	return;
2417  0002 80            	iret
2439                     ; 18 @interrupt void CLK_IRQHandler (void)
2439                     ; 19 {
2440                     	switch	.text
2441  0003               f_CLK_IRQHandler:
2445                     ; 20 	return;
2448  0003 80            	iret
2471                     ; 23 @interrupt void EXTI_PORTA_IRQHandler (void)
2471                     ; 24 {
2472                     	switch	.text
2473  0004               f_EXTI_PORTA_IRQHandler:
2477                     ; 25 	return;
2480  0004 80            	iret
2503                     ; 28 @interrupt void EXTI_PORTB_IRQHandler (void)
2503                     ; 29 {
2504                     	switch	.text
2505  0005               f_EXTI_PORTB_IRQHandler:
2509                     ; 30 	return;
2512  0005 80            	iret
2535                     ; 33 @interrupt void EXTI_PORTC_IRQHandler (void)
2535                     ; 34 {
2536                     	switch	.text
2537  0006               f_EXTI_PORTC_IRQHandler:
2541                     ; 35 	return;
2544  0006 80            	iret
2567                     ; 38 @interrupt void EXTI_PORTD_IRQHandler (void)
2567                     ; 39 {
2568                     	switch	.text
2569  0007               f_EXTI_PORTD_IRQHandler:
2573                     ; 40 	return;
2576  0007 80            	iret
2599                     ; 43 @interrupt void EXTI_PORTE_IRQHandler (void)
2599                     ; 44 {
2600                     	switch	.text
2601  0008               f_EXTI_PORTE_IRQHandler:
2605                     ; 45 	return;
2608  0008 80            	iret
2631                     ; 48 @interrupt void CAN_RX_IRQHandler (void)
2631                     ; 49 {
2632                     	switch	.text
2633  0009               f_CAN_RX_IRQHandler:
2635  0009 3b0002        	push	c_x+2
2636  000c be00          	ldw	x,c_x
2637  000e 89            	pushw	x
2638  000f 3b0002        	push	c_y+2
2639  0012 be00          	ldw	x,c_y
2640  0014 89            	pushw	x
2643                     ; 50     ISR_Can_Rx();
2645  0015 8d000000      	callf	f_ISR_Can_Rx
2647                     ; 51 	return;
2650  0019 85            	popw	x
2651  001a bf00          	ldw	c_y,x
2652  001c 320002        	pop	c_y+2
2653  001f 85            	popw	x
2654  0020 bf00          	ldw	c_x,x
2655  0022 320002        	pop	c_x+2
2656  0025 80            	iret
2679                     ; 54 @interrupt void CAN_TX_IRQHandler (void)
2679                     ; 55 {
2680                     	switch	.text
2681  0026               f_CAN_TX_IRQHandler:
2683  0026 3b0002        	push	c_x+2
2684  0029 be00          	ldw	x,c_x
2685  002b 89            	pushw	x
2686  002c 3b0002        	push	c_y+2
2687  002f be00          	ldw	x,c_y
2688  0031 89            	pushw	x
2691                     ; 56     ISR_Can_Tx();
2693  0032 8d000000      	callf	f_ISR_Can_Tx
2695                     ; 57 	return;
2698  0036 85            	popw	x
2699  0037 bf00          	ldw	c_y,x
2700  0039 320002        	pop	c_y+2
2701  003c 85            	popw	x
2702  003d bf00          	ldw	c_x,x
2703  003f 320002        	pop	c_x+2
2704  0042 80            	iret
2726                     ; 60 @interrupt void SPI_IRQHandler (void)
2726                     ; 61 {
2727                     	switch	.text
2728  0043               f_SPI_IRQHandler:
2732                     ; 62 	return;
2735  0043 80            	iret
2737                     	switch	.data
2738  0000               L5251_FlagTemp:
2739  0000 00            	dc.b	0
2794                     ; 65 @interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler (void)
2794                     ; 66 {
2795                     	switch	.text
2796  0044               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
2800                     ; 68     TIM1.SR1 &=(~TIM1_SR1_UIF); //清更新事件标志
2802  0044 72115255      	bres	_TIM1+5,#0
2803                     ; 69     FlagTemp=~FlagTemp;
2805  0048 72530000      	cpl	L5251_FlagTemp
2806                     ; 70     if(FlagTemp)
2808  004c 725d0000      	tnz	L5251_FlagTemp
2810  0050               L7551:
2811                     ; 76 	return;
2814  0050 80            	iret
2838                     ; 79 @interrupt void TIM1_CAP_COM_IRQHandler (void)
2838                     ; 80 {
2839                     	switch	.text
2840  0051               f_TIM1_CAP_COM_IRQHandler:
2844                     ; 81     if(TIM1.SR1&TIM1_SR1_COMIF)
2846  0051 c65255        	ld	a,_TIM1+5
2847  0054 a520          	bcp	a,#32
2848  0056 2704          	jreq	L1751
2849                     ; 83         TIM1.SR1 &=(~TIM1_SR1_COMIF);
2851  0058 721b5255      	bres	_TIM1+5,#5
2852  005c               L1751:
2853                     ; 85 	return;
2856  005c 80            	iret
2882                     ; 87 @interrupt void TIM2_UPD_OVF_BRK_IRQHandler (void)
2882                     ; 88 {
2883                     	switch	.text
2884  005d               f_TIM2_UPD_OVF_BRK_IRQHandler:
2886       00000001      OFST:	set	1
2887  005d 88            	push	a
2890                     ; 89     TIM2.SR1 &=(~TIM2_SR1_UIF); //清更新事件标志
2892  005e 72115302      	bres	_TIM2+2,#0
2893                     ; 90     TIM1.EGR |=TIM1_EGR_COMG;
2895  0062 721a5257      	bset	_TIM1+7,#5
2896                     ; 91     GPIOC.ODR.byte =GPIOC.ODR.byte &(~0x02)|(~GPIOC.ODR.byte)&0x02;
2898  0066 c6500a        	ld	a,_GPIOC
2899  0069 43            	cpl	a
2900  006a a402          	and	a,#2
2901  006c 6b01          	ld	(OFST+0,sp),a
2902  006e c6500a        	ld	a,_GPIOC
2903  0071 a4fd          	and	a,#253
2904  0073 1a01          	or	a,(OFST+0,sp)
2905  0075 c7500a        	ld	_GPIOC,a
2906                     ; 92     return;
2909  0078 84            	pop	a
2910  0079 80            	iret
2935                     ; 95 @interrupt void TIM2_CAP_COM_IRQHandler (void)
2935                     ; 96 {
2936                     	switch	.text
2937  007a               f_TIM2_CAP_COM_IRQHandler:
2939       00000001      OFST:	set	1
2940  007a 88            	push	a
2943                     ; 97     if(TIM2.SR1&TIM2_SR1_CC1IF)
2945  007b c65302        	ld	a,_TIM2+2
2946  007e a502          	bcp	a,#2
2947  0080 2728          	jreq	L3161
2948                     ; 99         TIM2.SR1 &=(~TIM2_SR1_CC1IF); //清捕获标志
2950  0082 72135302      	bres	_TIM2+2,#1
2951                     ; 101         TIM2.CCER1=(TIM2.CCER1&(~TIM2_CCER1_CC1P))|((~TIM2.CCER1)&TIM2_CCER1_CC1P); //翻转触发极性
2953  0086 c65308        	ld	a,_TIM2+8
2954  0089 43            	cpl	a
2955  008a a402          	and	a,#2
2956  008c 6b01          	ld	(OFST+0,sp),a
2957  008e c65308        	ld	a,_TIM2+8
2958  0091 a4fd          	and	a,#253
2959  0093 1a01          	or	a,(OFST+0,sp)
2960  0095 c75308        	ld	_TIM2+8,a
2961                     ; 102         GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
2963  0098 c6500a        	ld	a,_GPIOC
2964  009b 43            	cpl	a
2965  009c a402          	and	a,#2
2966  009e 6b01          	ld	(OFST+0,sp),a
2967  00a0 c6500a        	ld	a,_GPIOC
2968  00a3 a4fd          	and	a,#253
2969  00a5 1a01          	or	a,(OFST+0,sp)
2970  00a7 c7500a        	ld	_GPIOC,a
2971  00aa               L3161:
2972                     ; 104     if(TIM2.SR1&TIM2_SR1_CC2IF)
2974  00aa c65302        	ld	a,_TIM2+2
2975  00ad a504          	bcp	a,#4
2976  00af 2728          	jreq	L5161
2977                     ; 106         TIM2.SR1 &=(~TIM2_SR1_CC2IF); //清捕获标志
2979  00b1 72155302      	bres	_TIM2+2,#2
2980                     ; 108         TIM2.CCER1=(TIM2.CCER1&(~TIM2_CCER1_CC2P))|((~TIM2.CCER1)&TIM2_CCER1_CC2P); //翻转触发极性
2982  00b5 c65308        	ld	a,_TIM2+8
2983  00b8 43            	cpl	a
2984  00b9 a420          	and	a,#32
2985  00bb 6b01          	ld	(OFST+0,sp),a
2986  00bd c65308        	ld	a,_TIM2+8
2987  00c0 a4df          	and	a,#223
2988  00c2 1a01          	or	a,(OFST+0,sp)
2989  00c4 c75308        	ld	_TIM2+8,a
2990                     ; 109         GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
2992  00c7 c6500a        	ld	a,_GPIOC
2993  00ca 43            	cpl	a
2994  00cb a402          	and	a,#2
2995  00cd 6b01          	ld	(OFST+0,sp),a
2996  00cf c6500a        	ld	a,_GPIOC
2997  00d2 a4fd          	and	a,#253
2998  00d4 1a01          	or	a,(OFST+0,sp)
2999  00d6 c7500a        	ld	_GPIOC,a
3000  00d9               L5161:
3001                     ; 111     if(TIM2.SR1&TIM2_SR1_CC3IF)
3003  00d9 c65302        	ld	a,_TIM2+2
3004  00dc a508          	bcp	a,#8
3005  00de 2728          	jreq	L7161
3006                     ; 113         TIM2.SR1 &=(~TIM2_SR1_CC3IF); //清捕获标志
3008  00e0 72175302      	bres	_TIM2+2,#3
3009                     ; 115         TIM2.CCER2=(TIM2.CCER2&(~TIM2_CCER2_CC3P))|((~TIM2.CCER2)&TIM2_CCER2_CC3P); //翻转触发极性
3011  00e4 c65309        	ld	a,_TIM2+9
3012  00e7 43            	cpl	a
3013  00e8 a402          	and	a,#2
3014  00ea 6b01          	ld	(OFST+0,sp),a
3015  00ec c65309        	ld	a,_TIM2+9
3016  00ef a4fd          	and	a,#253
3017  00f1 1a01          	or	a,(OFST+0,sp)
3018  00f3 c75309        	ld	_TIM2+9,a
3019                     ; 116         GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
3021  00f6 c6500a        	ld	a,_GPIOC
3022  00f9 43            	cpl	a
3023  00fa a402          	and	a,#2
3024  00fc 6b01          	ld	(OFST+0,sp),a
3025  00fe c6500a        	ld	a,_GPIOC
3026  0101 a4fd          	and	a,#253
3027  0103 1a01          	or	a,(OFST+0,sp)
3028  0105 c7500a        	ld	_GPIOC,a
3029  0108               L7161:
3030                     ; 118 	return;
3033  0108 84            	pop	a
3034  0109 80            	iret
3058                     ; 121 @interrupt void TIM3_UPD_OVF_BRK_IRQHandler (void)
3058                     ; 122 {
3059                     	switch	.text
3060  010a               f_TIM3_UPD_OVF_BRK_IRQHandler:
3064                     ; 123 	TIM3.SR1 &=0xfe; //清更新事件标志
3066  010a 72115322      	bres	_TIM3+2,#0
3067                     ; 125     return;
3070  010e 80            	iret
3093                     ; 128 @interrupt void TIM3_CAP_COM_IRQHandler (void)
3093                     ; 129 {
3094                     	switch	.text
3095  010f               f_TIM3_CAP_COM_IRQHandler:
3099                     ; 130 	return;
3102  010f 80            	iret
3125                     ; 133 @interrupt void USART_TX_IRQHandler (void)
3125                     ; 134 {
3126                     	switch	.text
3127  0110               f_USART_TX_IRQHandler:
3131                     ; 136 	return;
3134  0110 80            	iret
3157                     ; 139 @interrupt void USART_RX_IRQHandler (void)
3157                     ; 140 {
3158                     	switch	.text
3159  0111               f_USART_RX_IRQHandler:
3163                     ; 142 	return;
3166  0111 80            	iret
3188                     ; 145 @interrupt void I2C_IRQHandler (void)
3188                     ; 146 {
3189                     	switch	.text
3190  0112               f_I2C_IRQHandler:
3194                     ; 147 	return;
3197  0112 80            	iret
3220                     ; 150 @interrupt void LINUART_TX_IRQHandler (void)
3220                     ; 151 {
3221                     	switch	.text
3222  0113               f_LINUART_TX_IRQHandler:
3226                     ; 153 	return;
3229  0113 80            	iret
3252                     ; 156 @interrupt void LINUART_RX_IRQHandler (void)
3252                     ; 157 {
3253                     	switch	.text
3254  0114               f_LINUART_RX_IRQHandler:
3258                     ; 159 	return;
3261  0114 80            	iret
3301                     ; 162 @interrupt void ADC_IRQHandler (void)
3301                     ; 163 {
3302                     	switch	.text
3303  0115               f_ADC_IRQHandler:
3305       00000004      OFST:	set	4
3306  0115 5204          	subw	sp,#4
3309  0117               L1371:
3310                     ; 165     while(!(ADC.CSR&0x80)); // 等待转换结束 14 个时钟周期
3312  0117 c65400        	ld	a,_ADC
3313  011a a580          	bcp	a,#128
3314  011c 27f9          	jreq	L1371
3315                     ; 166     ADC.CSR &= 0x7F; // 清除中断标志
3317  011e 721f5400      	bres	_ADC,#7
3318                     ; 167     AdcL = ADC.DRL; //READ DATA 因为是右对齐所以先读低位
3320  0122 c65405        	ld	a,_ADC+5
3321  0125 5f            	clrw	x
3322  0126 97            	ld	xl,a
3323  0127 1f01          	ldw	(OFST-3,sp),x
3324                     ; 168     AdcH = ADC.DRH;
3326  0129 c65404        	ld	a,_ADC+4
3327  012c 5f            	clrw	x
3328  012d 97            	ld	xl,a
3329  012e 1f03          	ldw	(OFST-1,sp),x
3330                     ; 169     AdcH =( AdcH << 8 ) + AdcL;
3332  0130 1e03          	ldw	x,(OFST-1,sp)
3333  0132 4f            	clr	a
3334  0133 02            	rlwa	x,a
3335  0134 72fb01        	addw	x,(OFST-3,sp)
3336  0137 1f03          	ldw	(OFST-1,sp),x
3337                     ; 170     ADC.CR1 &=0xfe; // 关闭ADC
3339  0139 72115401      	bres	_ADC+1,#0
3340                     ; 171     AdcValue=AdcH;
3342  013d 1e03          	ldw	x,(OFST-1,sp)
3343  013f cf0000        	ldw	_AdcValue,x
3344                     ; 172 	return;
3347  0142 5b04          	addw	sp,#4
3348  0144 80            	iret
3372                     ; 175 @interrupt void TIM4_UPD_OVF_IRQHandler (void)
3372                     ; 176 {
3373                     	switch	.text
3374  0145               f_TIM4_UPD_OVF_IRQHandler:
3376  0145 3b0002        	push	c_x+2
3377  0148 be00          	ldw	x,c_x
3378  014a 89            	pushw	x
3379  014b 3b0002        	push	c_y+2
3380  014e be00          	ldw	x,c_y
3381  0150 89            	pushw	x
3384                     ; 177     ISR_TIM4_UPD_OVF();
3386  0151 8d000000      	callf	f_ISR_TIM4_UPD_OVF
3388                     ; 178     return;
3391  0155 85            	popw	x
3392  0156 bf00          	ldw	c_y,x
3393  0158 320002        	pop	c_y+2
3394  015b 85            	popw	x
3395  015c bf00          	ldw	c_x,x
3396  015e 320002        	pop	c_x+2
3397  0161 80            	iret
3420                     ; 181 @interrupt void EEPROM_EEC_IRQHandler (void)
3420                     ; 182 {
3421                     	switch	.text
3422  0162               f_EEPROM_EEC_IRQHandler:
3426                     ; 183 	return;
3429  0162 80            	iret
3441                     	xref	_AdcValue
3442                     	xref	f_ISR_Can_Rx
3443                     	xref	f_ISR_Can_Tx
3444                     	xref	f_ISR_TIM4_UPD_OVF
3445                     	xdef	f_EEPROM_EEC_IRQHandler
3446                     	xdef	f_TIM4_UPD_OVF_IRQHandler
3447                     	xdef	f_ADC_IRQHandler
3448                     	xdef	f_LINUART_RX_IRQHandler
3449                     	xdef	f_LINUART_TX_IRQHandler
3450                     	xdef	f_I2C_IRQHandler
3451                     	xdef	f_USART_RX_IRQHandler
3452                     	xdef	f_USART_TX_IRQHandler
3453                     	xdef	f_TIM3_CAP_COM_IRQHandler
3454                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
3455                     	xdef	f_TIM2_CAP_COM_IRQHandler
3456                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
3457                     	xdef	f_TIM1_CAP_COM_IRQHandler
3458                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
3459                     	xdef	f_SPI_IRQHandler
3460                     	xdef	f_CAN_TX_IRQHandler
3461                     	xdef	f_CAN_RX_IRQHandler
3462                     	xdef	f_EXTI_PORTE_IRQHandler
3463                     	xdef	f_EXTI_PORTD_IRQHandler
3464                     	xdef	f_EXTI_PORTC_IRQHandler
3465                     	xdef	f_EXTI_PORTB_IRQHandler
3466                     	xdef	f_EXTI_PORTA_IRQHandler
3467                     	xdef	f_CLK_IRQHandler
3468                     	xdef	f_AWU_IRQHandler
3469                     	xdef	f_TLI_IRQHandler
3470                     	xdef	f_TRAP_IRQHandler
3471                     	xref.b	c_x
3472                     	xref.b	c_y
3491                     	end
