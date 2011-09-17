   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
3109                     ; 10 void SysClkInit(void)
3109                     ; 11 {
3110                     	switch	.text
3111  0000               f_SysClkInit:
3115                     ; 12     CLK.ECKR = 0x01; // 开启外部时钟 8MHz
3117  0000 350150c1      	mov	_CLK+1,#1
3119  0004               L7402:
3120                     ; 13     while(!(CLK.ECKR & 0x02)); // 等待外部时钟 rdy
3122  0004 c650c1        	ld	a,_CLK+1
3123  0007 a502          	bcp	a,#2
3124  0009 27f9          	jreq	L7402
3125                     ; 14     CLK.CKDIVR &= 0xf8; //CPU 无分频
3127  000b c650c6        	ld	a,_CLK+6
3128  000e a4f8          	and	a,#248
3129  0010 c750c6        	ld	_CLK+6,a
3130                     ; 15     CLK.SWR = 0xB4; // 选择外部时钟
3132  0013 35b450c4      	mov	_CLK+4,#180
3134  0017               L7502:
3135                     ; 16     while(!(CLK.SWCR & 0x08)); // 等待目标时钟源就绪
3137  0017 c650c5        	ld	a,_CLK+5
3138  001a a508          	bcp	a,#8
3139  001c 27f9          	jreq	L7502
3140                     ; 17     CLK.SWCR |= 0x02; // 使能外部时钟
3142  001e 721250c5      	bset	_CLK+5,#1
3143                     ; 18 }
3146  0022 87            	retf
3170                     ; 19 void InterruptInit(void)
3170                     ; 20 {
3171                     	switch	.text
3172  0023               f_InterruptInit:
3176                     ; 21     _asm("sim"); //关中断
3179  0023 9b            sim
3181                     ; 22     ITC.ISPR1 =0xff;
3183  0024 35ff7f70      	mov	_ITC,#255
3184                     ; 23     ITC.ISPR2 =0xff;
3186  0028 35ff7f71      	mov	_ITC+1,#255
3187                     ; 24     ITC.ISPR3 =0xff;
3189  002c 35ff7f72      	mov	_ITC+2,#255
3190                     ; 25     ITC.ISPR4 =0xff;
3192  0030 35ff7f73      	mov	_ITC+3,#255
3193                     ; 26     ITC.ISPR5 =0xff;
3195  0034 35ff7f74      	mov	_ITC+4,#255
3196                     ; 27     ITC.ISPR6 =0xff;
3198  0038 35ff7f75      	mov	_ITC+5,#255
3199                     ; 28     ITC.ISPR7 =0xff;
3201  003c 35ff7f76      	mov	_ITC+6,#255
3202                     ; 29     ITC.ISPR8 =0xff;
3204  0040 35ff7f77      	mov	_ITC+7,#255
3205                     ; 30     EXTI.CR1 =0x00;
3207  0044 725f50a0      	clr	_EXTI
3208                     ; 31     EXTI.CR2 =0x00;
3210  0048 725f50a1      	clr	_EXTI+1
3211                     ; 32     _asm("rim"); //开中断
3214  004c 9a            rim
3216                     ; 33 }
3219  004d 87            	retf
3244                     ; 34 void VariableInit(void)
3244                     ; 35 {
3245                     	switch	.text
3246  004e               f_VariableInit:
3250                     ; 36     FlagMain.byte=0;
3252  004e 725f000b      	clr	_FlagMain
3253                     ; 37     PowerState =POWER_INITIAL;
3255  0052 725f0000      	clr	_PowerState
3256                     ; 38     CanBusState=CAN_INITIAL;
3258  0056 725f0034      	clr	_CanBusState
3259                     ; 39 }
3262  005a 87            	retf
3289                     ; 40 void HardwareInit(void)
3289                     ; 41 {
3290                     	switch	.text
3291  005b               f_HardwareInit:
3295                     ; 42     SysClkInit();
3297  005b 8d000000      	callf	f_SysClkInit
3299                     ; 43     Delay(10000); //wait for system power stability
3301  005f ae2710        	ldw	x,#10000
3302  0062 8d000000      	callf	f_Delay
3304                     ; 44     GPIOInit();
3306  0066 8d000000      	callf	f_GPIOInit
3308                     ; 45     TimerInit();
3310  006a 8d000000      	callf	f_TimerInit
3312                     ; 46     BeepInit();
3314  006e 8d000000      	callf	f_BeepInit
3316                     ; 47 }
3319  0072 87            	retf
3349                     ; 48 main()
3349                     ; 49 {
3350                     	switch	.text
3351  0073               f_main:
3355                     ; 51     HardwareInit();
3357  0073 8d5b005b      	callf	f_HardwareInit
3359                     ; 52     VariableInit();
3361  0077 8d4e004e      	callf	f_VariableInit
3363                     ; 53     InterruptInit();
3365  007b 8d230023      	callf	f_InterruptInit
3367                     ; 54     BEGIN_WATCHDOG;
3369  007f 357f50d2      	mov	_WWDG+1,#127
3372  0083 35ff50d1      	mov	_WWDG,#255
3373  0087               L3212:
3374                     ; 58         CLEAR_WATCHDOG;
3376  0087 357f50d1      	mov	_WWDG,#127
3377                     ; 59         if(FLAGMAIN_4MS)
3380  008b c6000b        	ld	a,_FlagMain
3381  008e a502          	bcp	a,#2
3382  0090 2710          	jreq	L7212
3383                     ; 61             FLAGMAIN_4MS=0; // 4ms时基标志清0
3385  0092 7213000b      	bres	_FlagMain,#1
3386                     ; 62             BeepManage();
3388  0096 8d000000      	callf	f_BeepManage
3390                     ; 63             Key_Scan_AD();
3392  009a 8d000000      	callf	f_Key_Scan_AD
3394                     ; 64             Can_Main();
3396  009e 8d000000      	callf	f_Can_Main
3398  00a2               L7212:
3399                     ; 66         if(FLAGMAIN_100MS)
3401  00a2 c6000b        	ld	a,_FlagMain
3402  00a5 a504          	bcp	a,#4
3403  00a7 2704          	jreq	L1312
3404                     ; 68             FLAGMAIN_100MS=0;
3406  00a9 7215000b      	bres	_FlagMain,#2
3407  00ad               L1312:
3408                     ; 71         if(FLAGMAIN_FATAL)
3410  00ad c6000b        	ld	a,_FlagMain
3411  00b0 a540          	bcp	a,#64
3412  00b2 27d3          	jreq	L3212
3413                     ; 73             break;
3414  00b4               L5312:
3416  00b4 20fe          	jra	L5312
3428                     	xdef	f_main
3429                     	xdef	f_HardwareInit
3430                     	xdef	f_VariableInit
3431                     	xdef	f_InterruptInit
3432                     	xdef	f_SysClkInit
3433                     	switch	.bss
3434  0000               _PowerState:
3435  0000 00            	ds.b	1
3436                     	xdef	_PowerState
3437  0001               _FatalCode:
3438  0001 00            	ds.b	1
3439                     	xdef	_FatalCode
3440  0002               _DebugWord:
3441  0002 000000000000  	ds.b	8
3442                     	xdef	_DebugWord
3443  000a               _DebugParameter:
3444  000a 00            	ds.b	1
3445                     	xdef	_DebugParameter
3446  000b               _FlagMain:
3447  000b 00            	ds.b	1
3448                     	xdef	_FlagMain
3449  000c               _AdcValue:
3450  000c 0000          	ds.b	2
3451                     	xdef	_AdcValue
3452                     	xref	f_Can_Main
3453  000e               _can_msg_id32:
3454  000e 00000000      	ds.b	4
3455                     	xdef	_can_msg_id32
3456  0012               _can_msg_id16:
3457  0012 0000          	ds.b	2
3458                     	xdef	_can_msg_id16
3459  0014               _CntSendFalse:
3460  0014 00            	ds.b	1
3461                     	xdef	_CntSendFalse
3462  0015               _FlagCan:
3463  0015 00            	ds.b	1
3464                     	xdef	_FlagCan
3465  0016               _CANMsgACC:
3466  0016 000000000000  	ds.b	17
3467                     	xdef	_CANMsgACC
3468  0027               _CanTxRxBuffer:
3469  0027 000000000000  	ds.b	13
3470                     	xdef	_CanTxRxBuffer
3471  0034               _CanBusState:
3472  0034 00            	ds.b	1
3473                     	xdef	_CanBusState
3474  0035               _NodeState:
3475  0035 000000        	ds.b	3
3476                     	xdef	_NodeState
3477  0038               _CanPage:
3478  0038 00            	ds.b	1
3479                     	xdef	_CanPage
3480                     	xref	f_Key_Scan_AD
3481                     	xref	f_GPIOInit
3482                     	xref	f_TimerInit
3483                     	xref	f_BeepManage
3484                     	xref	f_BeepInit
3485  0039               _BeepTimer:
3486  0039 00            	ds.b	1
3487                     	xdef	_BeepTimer
3488  003a               _BeepState:
3489  003a 00            	ds.b	1
3490                     	xdef	_BeepState
3491                     	xref	f_Delay
3511                     	end
