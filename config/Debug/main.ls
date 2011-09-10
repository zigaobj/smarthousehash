   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
3135                     ; 10 void SysClkInit(void)
3135                     ; 11 {
3136                     	switch	.text
3137  0000               f_SysClkInit:
3141                     ; 12     CLK.ECKR = 0x01; // 开启外部时钟 8MHz
3143  0000 350150c1      	mov	_CLK+1,#1
3145  0004               L1602:
3146                     ; 13     while(!(CLK.ECKR & 0x02)); // 等待外部时钟 rdy
3148  0004 c650c1        	ld	a,_CLK+1
3149  0007 a502          	bcp	a,#2
3150  0009 27f9          	jreq	L1602
3151                     ; 14     CLK.CKDIVR &= 0xf8; //CPU 无分频
3153  000b c650c6        	ld	a,_CLK+6
3154  000e a4f8          	and	a,#248
3155  0010 c750c6        	ld	_CLK+6,a
3156                     ; 15     CLK.SWR = 0xB4; // 选择外部时钟
3158  0013 35b450c4      	mov	_CLK+4,#180
3160  0017               L1702:
3161                     ; 16     while(!(CLK.SWCR & 0x08)); // 等待目标时钟源就绪
3163  0017 c650c5        	ld	a,_CLK+5
3164  001a a508          	bcp	a,#8
3165  001c 27f9          	jreq	L1702
3166                     ; 17     CLK.SWCR |= 0x02; // 使能外部时钟
3168  001e 721250c5      	bset	_CLK+5,#1
3169                     ; 18 }
3172  0022 87            	retf
3196                     ; 19 void InterruptInit(void)
3196                     ; 20 {
3197                     	switch	.text
3198  0023               f_InterruptInit:
3202                     ; 21     _asm("sim"); //关中断
3205  0023 9b            sim
3207                     ; 22     ITC.ISPR1 =0xff;
3209  0024 35ff7f70      	mov	_ITC,#255
3210                     ; 23     ITC.ISPR2 =0xff;
3212  0028 35ff7f71      	mov	_ITC+1,#255
3213                     ; 24     ITC.ISPR3 =0xff;
3215  002c 35ff7f72      	mov	_ITC+2,#255
3216                     ; 25     ITC.ISPR4 =0xff;
3218  0030 35ff7f73      	mov	_ITC+3,#255
3219                     ; 26     ITC.ISPR5 =0xff;
3221  0034 35ff7f74      	mov	_ITC+4,#255
3222                     ; 27     ITC.ISPR6 =0xff;
3224  0038 35ff7f75      	mov	_ITC+5,#255
3225                     ; 28     ITC.ISPR7 =0xff;
3227  003c 35ff7f76      	mov	_ITC+6,#255
3228                     ; 29     ITC.ISPR8 =0xff;
3230  0040 35ff7f77      	mov	_ITC+7,#255
3231                     ; 30     EXTI.CR1 =0x00;
3233  0044 725f50a0      	clr	_EXTI
3234                     ; 31     EXTI.CR2 =0x00;
3236  0048 725f50a1      	clr	_EXTI+1
3237                     ; 32     _asm("rim"); //开中断
3240  004c 9a            rim
3242                     ; 33 }
3245  004d 87            	retf
3270                     ; 34 void VariableInit(void)
3270                     ; 35 {
3271                     	switch	.text
3272  004e               f_VariableInit:
3276                     ; 36     FlagMain.byte=0;
3278  004e 725f000b      	clr	_FlagMain
3279                     ; 37     PowerState =POWER_INITIAL;
3281  0052 725f0000      	clr	_PowerState
3282                     ; 38     CanBusState=CAN_INITIAL;
3284  0056 725f0034      	clr	_CanBusState
3285                     ; 39 }
3288  005a 87            	retf
3315                     ; 40 void HardwareInit(void)
3315                     ; 41 {
3316                     	switch	.text
3317  005b               f_HardwareInit:
3321                     ; 42     SysClkInit();
3323  005b 8d000000      	callf	f_SysClkInit
3325                     ; 43     Delay(10000); //wait for system power stability
3327  005f ae2710        	ldw	x,#10000
3328  0062 8d000000      	callf	f_Delay
3330                     ; 44     GPIOInit();
3332  0066 8d000000      	callf	f_GPIOInit
3334                     ; 45     TimerInit();
3336  006a 8d000000      	callf	f_TimerInit
3338                     ; 46     BeepInit();
3340  006e 8d000000      	callf	f_BeepInit
3342                     ; 47 }
3345  0072 87            	retf
3375                     ; 48 main()
3375                     ; 49 {
3376                     	switch	.text
3377  0073               f_main:
3381                     ; 51     HardwareInit();
3383  0073 8d5b005b      	callf	f_HardwareInit
3385                     ; 52     VariableInit();
3387  0077 8d4e004e      	callf	f_VariableInit
3389                     ; 53     InterruptInit();
3391  007b 8d230023      	callf	f_InterruptInit
3393                     ; 54     BEGIN_WATCHDOG;
3395  007f 357f50d2      	mov	_WWDG+1,#127
3398  0083 35ff50d1      	mov	_WWDG,#255
3399  0087               L5312:
3400                     ; 58         CLEAR_WATCHDOG;
3402  0087 357f50d1      	mov	_WWDG,#127
3403                     ; 59         if(FLAGMAIN_4MS)
3406  008b c6000b        	ld	a,_FlagMain
3407  008e a502          	bcp	a,#2
3408  0090 2710          	jreq	L1412
3409                     ; 61             FLAGMAIN_4MS=0; // 4ms时基标志清0
3411  0092 7213000b      	bres	_FlagMain,#1
3412                     ; 62             BeepManage();
3414  0096 8d000000      	callf	f_BeepManage
3416                     ; 63             Key_Scan_AD();
3418  009a 8d000000      	callf	f_Key_Scan_AD
3420                     ; 64             Can_Main();
3422  009e 8d000000      	callf	f_Can_Main
3424  00a2               L1412:
3425                     ; 66         if(FLAGMAIN_100MS)
3427  00a2 c6000b        	ld	a,_FlagMain
3428  00a5 a504          	bcp	a,#4
3429  00a7 2704          	jreq	L3412
3430                     ; 68             FLAGMAIN_100MS=0;
3432  00a9 7215000b      	bres	_FlagMain,#2
3433  00ad               L3412:
3434                     ; 71         if(FLAGMAIN_FATAL)
3436  00ad c6000b        	ld	a,_FlagMain
3437  00b0 a540          	bcp	a,#64
3438  00b2 27d3          	jreq	L5312
3439                     ; 73             break;
3440  00b4               L7412:
3442  00b4 20fe          	jra	L7412
3454                     	xdef	f_main
3455                     	xdef	f_HardwareInit
3456                     	xdef	f_VariableInit
3457                     	xdef	f_InterruptInit
3458                     	xdef	f_SysClkInit
3459                     	switch	.bss
3460  0000               _PowerState:
3461  0000 00            	ds.b	1
3462                     	xdef	_PowerState
3463  0001               _FatalCode:
3464  0001 00            	ds.b	1
3465                     	xdef	_FatalCode
3466  0002               _DebugWord:
3467  0002 000000000000  	ds.b	8
3468                     	xdef	_DebugWord
3469  000a               _DebugParameter:
3470  000a 00            	ds.b	1
3471                     	xdef	_DebugParameter
3472  000b               _FlagMain:
3473  000b 00            	ds.b	1
3474                     	xdef	_FlagMain
3475  000c               _AdcValue:
3476  000c 0000          	ds.b	2
3477                     	xdef	_AdcValue
3478                     	xref	f_Can_Main
3479  000e               _can_msg_id32:
3480  000e 00000000      	ds.b	4
3481                     	xdef	_can_msg_id32
3482  0012               _can_msg_id16:
3483  0012 0000          	ds.b	2
3484                     	xdef	_can_msg_id16
3485  0014               _CntSendFalse:
3486  0014 00            	ds.b	1
3487                     	xdef	_CntSendFalse
3488  0015               _FlagCan:
3489  0015 00            	ds.b	1
3490                     	xdef	_FlagCan
3491  0016               _CANMsgACC:
3492  0016 000000000000  	ds.b	17
3493                     	xdef	_CANMsgACC
3494  0027               _CanTxRxBuffer:
3495  0027 000000000000  	ds.b	13
3496                     	xdef	_CanTxRxBuffer
3497  0034               _CanBusState:
3498  0034 00            	ds.b	1
3499                     	xdef	_CanBusState
3500  0035               _NodeState:
3501  0035 00000000      	ds.b	4
3502                     	xdef	_NodeState
3503  0039               _CanPage:
3504  0039 00            	ds.b	1
3505                     	xdef	_CanPage
3506                     	xref	f_Key_Scan_AD
3507  003a               _debug_adc:
3508  003a 0000          	ds.b	2
3509                     	xdef	_debug_adc
3510                     	xref	f_GPIOInit
3511                     	xref	f_TimerInit
3512                     	xref	f_BeepManage
3513                     	xref	f_BeepInit
3514  003c               _BeepTimer:
3515  003c 00            	ds.b	1
3516                     	xdef	_BeepTimer
3517  003d               _BeepState:
3518  003d 00            	ds.b	1
3519                     	xdef	_BeepState
3520                     	xref	f_Delay
3540                     	end
