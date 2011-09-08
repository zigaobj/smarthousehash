   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.3 - 19 Nov 2007
3125                     ; 10 void SysClkInit(void)
3125                     ; 11 {
3126                     	switch	.text
3127  0000               f_SysClkInit:
3131                     ; 12     CLK.ECKR = 0x01; // 开启外部时钟 8MHz
3133  0000 350150c1      	mov	_CLK+1,#1
3135  0004               L5502:
3136                     ; 13     while(!(CLK.ECKR & 0x02)); // 等待外部时钟 rdy
3138  0004 c650c1        	ld	a,_CLK+1
3139  0007 a502          	bcp	a,#2
3140  0009 27f9          	jreq	L5502
3141                     ; 14     CLK.CKDIVR &= 0xf8; //CPU 无分频
3143  000b c650c6        	ld	a,_CLK+6
3144  000e a4f8          	and	a,#248
3145  0010 c750c6        	ld	_CLK+6,a
3146                     ; 15     CLK.SWR = 0xB4; // 选择外部时钟
3148  0013 35b450c4      	mov	_CLK+4,#180
3150  0017               L5602:
3151                     ; 16     while(!(CLK.SWCR & 0x08)); // 等待目标时钟源就绪
3153  0017 c650c5        	ld	a,_CLK+5
3154  001a a508          	bcp	a,#8
3155  001c 27f9          	jreq	L5602
3156                     ; 17     CLK.SWCR |= 0x02; // 使能外部时钟
3158  001e 721250c5      	bset	_CLK+5,#1
3159                     ; 18 }
3162  0022 87            	retf
3186                     ; 19 void InterruptInit(void)
3186                     ; 20 {
3187                     	switch	.text
3188  0023               f_InterruptInit:
3192                     ; 21     _asm("sim"); //关中断
3195  0023 9b            sim
3197                     ; 22     ITC.ISPR1 =0xff;
3199  0024 35ff7f70      	mov	_ITC,#255
3200                     ; 23     ITC.ISPR2 =0xff;
3202  0028 35ff7f71      	mov	_ITC+1,#255
3203                     ; 24     ITC.ISPR3 =0xff;
3205  002c 35ff7f72      	mov	_ITC+2,#255
3206                     ; 25     ITC.ISPR4 =0xff;
3208  0030 35ff7f73      	mov	_ITC+3,#255
3209                     ; 26     ITC.ISPR5 =0xff;
3211  0034 35ff7f74      	mov	_ITC+4,#255
3212                     ; 27     ITC.ISPR6 =0xff;
3214  0038 35ff7f75      	mov	_ITC+5,#255
3215                     ; 28     ITC.ISPR7 =0xff;
3217  003c 35ff7f76      	mov	_ITC+6,#255
3218                     ; 29     ITC.ISPR8 =0xff;
3220  0040 35ff7f77      	mov	_ITC+7,#255
3221                     ; 30     EXTI.CR1 =0x00;
3223  0044 725f50a0      	clr	_EXTI
3224                     ; 31     EXTI.CR2 =0x00;
3226  0048 725f50a1      	clr	_EXTI+1
3227                     ; 32     _asm("rim"); //开中断
3230  004c 9a            rim
3232                     ; 33 }
3235  004d 87            	retf
3260                     ; 34 void VariableInit(void)
3260                     ; 35 {
3261                     	switch	.text
3262  004e               f_VariableInit:
3266                     ; 36     FlagMain.byte=0;
3268  004e 725f0003      	clr	_FlagMain
3269                     ; 37     PowerState =POWER_INITIAL;
3271  0052 725f0000      	clr	_PowerState
3272                     ; 38     CanBusState=CAN_INITIAL;
3274  0056 725f002c      	clr	_CanBusState
3275                     ; 39 }
3278  005a 87            	retf
3305                     ; 40 void HardwareInit(void)
3305                     ; 41 {
3306                     	switch	.text
3307  005b               f_HardwareInit:
3311                     ; 42     SysClkInit();
3313  005b 8d000000      	callf	f_SysClkInit
3315                     ; 43     Delay(10000); //wait for system power stability
3317  005f ae2710        	ldw	x,#10000
3318  0062 8d000000      	callf	f_Delay
3320                     ; 44     GPIOInit();
3322  0066 8d000000      	callf	f_GPIOInit
3324                     ; 45     TimerInit();
3326  006a 8d000000      	callf	f_TimerInit
3328                     ; 46     BeepInit();
3330  006e 8d000000      	callf	f_BeepInit
3332                     ; 47 }
3335  0072 87            	retf
3365                     ; 48 main()
3365                     ; 49 {
3366                     	switch	.text
3367  0073               f_main:
3371                     ; 51     HardwareInit();
3373  0073 8d5b005b      	callf	f_HardwareInit
3375                     ; 52     VariableInit();
3377  0077 8d4e004e      	callf	f_VariableInit
3379                     ; 53     InterruptInit();
3381  007b 8d230023      	callf	f_InterruptInit
3383                     ; 54     BEGIN_WATCHDOG;
3385  007f 357f50d2      	mov	_WWDG+1,#127
3388  0083 35ff50d1      	mov	_WWDG,#255
3389  0087               L1312:
3390                     ; 58         CLEAR_WATCHDOG;
3392  0087 357f50d1      	mov	_WWDG,#127
3393                     ; 59         if(FLAGMAIN_4MS)
3396  008b c60003        	ld	a,_FlagMain
3397  008e a502          	bcp	a,#2
3398  0090 2710          	jreq	L5312
3399                     ; 61             FLAGMAIN_4MS=0; // 4ms时基标志清0
3401  0092 72130003      	bres	_FlagMain,#1
3402                     ; 62             BeepManage();
3404  0096 8d000000      	callf	f_BeepManage
3406                     ; 63             Key_Scan_AD();
3408  009a 8d000000      	callf	f_Key_Scan_AD
3410                     ; 64             Can_Main();
3412  009e 8d000000      	callf	f_Can_Main
3414  00a2               L5312:
3415                     ; 66         if(FLAGMAIN_FATAL)
3417  00a2 c60003        	ld	a,_FlagMain
3418  00a5 a540          	bcp	a,#64
3419  00a7 27de          	jreq	L1312
3420                     ; 68             break;
3421  00a9               L1412:
3423  00a9 20fe          	jra	L1412
3435                     	xdef	f_main
3436                     	xdef	f_HardwareInit
3437                     	xdef	f_VariableInit
3438                     	xdef	f_InterruptInit
3439                     	xdef	f_SysClkInit
3440                     	switch	.bss
3441  0000               _PowerState:
3442  0000 00            	ds.b	1
3443                     	xdef	_PowerState
3444  0001               _FatalCode:
3445  0001 00            	ds.b	1
3446                     	xdef	_FatalCode
3447  0002               _DebugParameter:
3448  0002 00            	ds.b	1
3449                     	xdef	_DebugParameter
3450  0003               _FlagMain:
3451  0003 00            	ds.b	1
3452                     	xdef	_FlagMain
3453  0004               _AdcValue:
3454  0004 0000          	ds.b	2
3455                     	xdef	_AdcValue
3456                     	xref	f_Can_Main
3457  0006               _can_msg_id32:
3458  0006 00000000      	ds.b	4
3459                     	xdef	_can_msg_id32
3460  000a               _can_msg_id16:
3461  000a 0000          	ds.b	2
3462                     	xdef	_can_msg_id16
3463  000c               _CntSendFalse:
3464  000c 00            	ds.b	1
3465                     	xdef	_CntSendFalse
3466  000d               _FlagCan:
3467  000d 00            	ds.b	1
3468                     	xdef	_FlagCan
3469  000e               _CANMsgACC:
3470  000e 000000000000  	ds.b	17
3471                     	xdef	_CANMsgACC
3472  001f               _CanTxRxBuffer:
3473  001f 000000000000  	ds.b	13
3474                     	xdef	_CanTxRxBuffer
3475  002c               _CanBusState:
3476  002c 00            	ds.b	1
3477                     	xdef	_CanBusState
3478  002d               _NodeState:
3479  002d 00000000      	ds.b	4
3480                     	xdef	_NodeState
3481  0031               _CanPage:
3482  0031 00            	ds.b	1
3483                     	xdef	_CanPage
3484                     	xref	f_Key_Scan_AD
3485  0032               _debug_adc:
3486  0032 0000          	ds.b	2
3487                     	xdef	_debug_adc
3488                     	xref	f_GPIOInit
3489                     	xref	f_TimerInit
3490                     	xref	f_BeepManage
3491                     	xref	f_BeepInit
3492  0034               _BeepTimer:
3493  0034 00            	ds.b	1
3494                     	xdef	_BeepTimer
3495  0035               _BeepState:
3496  0035 00            	ds.b	1
3497                     	xdef	_BeepState
3498                     	xref	f_Delay
3518                     	end
