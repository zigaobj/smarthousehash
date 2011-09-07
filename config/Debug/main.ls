   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
3141                     ; 10 void SysClkInit(void)
3141                     ; 11 {
3143                     	switch	.text
3144  0000               _SysClkInit:
3148                     ; 12     CLK.ECKR = 0x01; // 开启外部时钟 8MHz
3150  0000 350150c1      	mov	_CLK+1,#1
3152  0004               L5702:
3153                     ; 13     while(!(CLK.ECKR & 0x02)); // 等待外部时钟 rdy
3155  0004 c650c1        	ld	a,_CLK+1
3156  0007 a502          	bcp	a,#2
3157  0009 27f9          	jreq	L5702
3158                     ; 14     CLK.CKDIVR &= 0xf8; //CPU 无分频
3160  000b c650c6        	ld	a,_CLK+6
3161  000e a4f8          	and	a,#248
3162  0010 c750c6        	ld	_CLK+6,a
3163                     ; 15     CLK.SWR = 0xB4; // 选择外部时钟
3165  0013 35b450c4      	mov	_CLK+4,#180
3167  0017               L5012:
3168                     ; 16     while(!(CLK.SWCR & 0x08)); // 等待目标时钟源就绪
3170  0017 c650c5        	ld	a,_CLK+5
3171  001a a508          	bcp	a,#8
3172  001c 27f9          	jreq	L5012
3173                     ; 17     CLK.SWCR |= 0x02; // 使能外部时钟
3175  001e 721250c5      	bset	_CLK+5,#1
3176                     ; 18 }
3179  0022 81            	ret
3204                     ; 19 void InterruptInit(void)
3204                     ; 20 {
3205                     	switch	.text
3206  0023               _InterruptInit:
3210                     ; 21     _asm("sim"); //关中断
3213  0023 9b            sim
3215                     ; 22     ITC.ISPR1 =0xff;
3217  0024 35ff7f70      	mov	_ITC,#255
3218                     ; 23     ITC.ISPR2 =0xff;
3220  0028 35ff7f71      	mov	_ITC+1,#255
3221                     ; 24     ITC.ISPR3 =0xff;
3223  002c 35ff7f72      	mov	_ITC+2,#255
3224                     ; 25     ITC.ISPR4 =0xff;
3226  0030 35ff7f73      	mov	_ITC+3,#255
3227                     ; 26     ITC.ISPR5 =0xff;
3229  0034 35ff7f74      	mov	_ITC+4,#255
3230                     ; 27     ITC.ISPR6 =0xff;
3232  0038 35ff7f75      	mov	_ITC+5,#255
3233                     ; 28     ITC.ISPR7 =0xff;
3235  003c 35ff7f76      	mov	_ITC+6,#255
3236                     ; 29     ITC.ISPR8 =0xff;
3238  0040 35ff7f77      	mov	_ITC+7,#255
3239                     ; 30     EXTI.CR1 =0x00;
3241  0044 725f50a0      	clr	_EXTI
3242                     ; 31     EXTI.CR2 =0x00;
3244  0048 725f50a1      	clr	_EXTI+1
3245                     ; 32     _asm("rim"); //开中断
3248  004c 9a            rim
3250                     ; 33 }
3253  004d 81            	ret
3279                     ; 34 void VariableInit(void)
3279                     ; 35 {
3280                     	switch	.text
3281  004e               _VariableInit:
3285                     ; 36     FlagMain.byte=0;
3287  004e 3f03          	clr	_FlagMain
3288                     ; 37     PowerState =POWER_INITIAL;
3290  0050 3f00          	clr	_PowerState
3291                     ; 38     CanBusState=CAN_INITIAL;
3293  0052 3f0e          	clr	_CanBusState
3294                     ; 39 }
3297  0054 81            	ret
3325                     ; 40 void HardwareInit(void)
3325                     ; 41 {
3326                     	switch	.text
3327  0055               _HardwareInit:
3331                     ; 42     SysClkInit();
3333  0055 ada9          	call	_SysClkInit
3335                     ; 43     Delay(10000); //wait for system power stability
3337  0057 ae2710        	ldw	x,#10000
3338  005a cd0000        	call	_Delay
3340                     ; 44     GPIOInit();
3342  005d cd0000        	call	_GPIOInit
3344                     ; 45     TimerInit();
3346  0060 cd0000        	call	_TimerInit
3348                     ; 46     BeepInit();
3350  0063 cd0000        	call	_BeepInit
3352                     ; 47 }
3355  0066 81            	ret
3386                     ; 48 main()
3386                     ; 49 {
3387                     	switch	.text
3388  0067               _main:
3392                     ; 51     HardwareInit();
3394  0067 adec          	call	_HardwareInit
3396                     ; 52     VariableInit();
3398  0069 ade3          	call	_VariableInit
3400                     ; 53     InterruptInit();
3402  006b adb6          	call	_InterruptInit
3404                     ; 54     BEGIN_WATCHDOG;
3406  006d 357f50d2      	mov	_WWDG+1,#127
3409  0071 35ff50d1      	mov	_WWDG,#255
3410  0075               L1512:
3411                     ; 58         CLEAR_WATCHDOG;
3413  0075 357f50d1      	mov	_WWDG,#127
3414                     ; 59         if(FLAGMAIN_4MS)
3417  0079 b603          	ld	a,_FlagMain
3418  007b a502          	bcp	a,#2
3419  007d 270d          	jreq	L5512
3420                     ; 61             FLAGMAIN_4MS=0; // 4ms时基标志清0
3422  007f 72130003      	bres	_FlagMain,#1
3423                     ; 62             BeepManage();
3425  0083 cd0000        	call	_BeepManage
3427                     ; 63             Key_Scan_AD();
3429  0086 cd0000        	call	_Key_Scan_AD
3431                     ; 64             Can_Main();
3433  0089 cd0000        	call	_Can_Main
3435  008c               L5512:
3436                     ; 66         if(FLAGMAIN_FATAL)
3438  008c b603          	ld	a,_FlagMain
3439  008e a540          	bcp	a,#64
3440  0090 27e3          	jreq	L1512
3441                     ; 68             break;
3442  0092               L1612:
3444  0092 20fe          	jra	L1612
3457                     	xdef	_main
3458                     	xdef	_HardwareInit
3459                     	xdef	_VariableInit
3460                     	xdef	_InterruptInit
3461                     	xdef	_SysClkInit
3462                     	switch	.ubsct
3463  0000               _PowerState:
3464  0000 00            	ds.b	1
3465                     	xdef	_PowerState
3466  0001               _FatalCode:
3467  0001 00            	ds.b	1
3468                     	xdef	_FatalCode
3469  0002               _DebugParameter:
3470  0002 00            	ds.b	1
3471                     	xdef	_DebugParameter
3472  0003               _FlagMain:
3473  0003 00            	ds.b	1
3474                     	xdef	_FlagMain
3475  0004               _AdcValue:
3476  0004 0000          	ds.b	2
3477                     	xdef	_AdcValue
3478                     	xref	_Can_Main
3479  0006               _can_msg_id32:
3480  0006 00000000      	ds.b	4
3481                     	xdef	_can_msg_id32
3482  000a               _can_msg_id16:
3483  000a 0000          	ds.b	2
3484                     	xdef	_can_msg_id16
3485  000c               _CntSendFalse:
3486  000c 00            	ds.b	1
3487                     	xdef	_CntSendFalse
3488  000d               _FlagCan:
3489  000d 00            	ds.b	1
3490                     	xdef	_FlagCan
3491                     	switch	.bss
3492  0000               _CANMsgACC:
3493  0000 000000000000  	ds.b	17
3494                     	xdef	_CANMsgACC
3495  0011               _CanTxRxBuffer:
3496  0011 000000000000  	ds.b	13
3497                     	xdef	_CanTxRxBuffer
3498                     	switch	.ubsct
3499  000e               _CanBusState:
3500  000e 00            	ds.b	1
3501                     	xdef	_CanBusState
3502  000f               _NodeState:
3503  000f 00000000      	ds.b	4
3504                     	xdef	_NodeState
3505  0013               _CanPage:
3506  0013 00            	ds.b	1
3507                     	xdef	_CanPage
3508                     	xref	_Key_Scan_AD
3509  0014               _debug_adc:
3510  0014 0000          	ds.b	2
3511                     	xdef	_debug_adc
3512                     	xref	_GPIOInit
3513                     	xref	_TimerInit
3514                     	xref	_BeepManage
3515                     	xref	_BeepInit
3516  0016               _BeepTimer:
3517  0016 00            	ds.b	1
3518                     	xdef	_BeepTimer
3519  0017               _BeepState:
3520  0017 00            	ds.b	1
3521                     	xdef	_BeepState
3522                     	xref	_Delay
3542                     	end
