   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2319                     .nochange:	section	.ubsct
2320  0000               _CheckTail:
2321  0000 00            	ds.b	1
2322  0001               _CheckSum:
2323  0001 00            	ds.b	1
2324  0002               _ResetSource:
2325  0002 00            	ds.b	1
2326  0003               _Clock:
2327  0003 000000000000  	ds.b	7
2328  000a               _CheckHead:
2329  000a 00            	ds.b	1
3492                     ; 10 void SysClkInit(void)
3492                     ; 11 {
3493                     	switch	.text
3494  0000               f_SysClkInit:
3498                     ; 12     CLK.ECKR = 0x01; // 开启外部时钟 8MHz
3500  0000 350150c1      	mov	_CLK+1,#1
3502  0004               L3622:
3503                     ; 13     while(!(CLK.ECKR & 0x02)); // 等待外部时钟 rdy
3505  0004 c650c1        	ld	a,_CLK+1
3506  0007 a502          	bcp	a,#2
3507  0009 27f9          	jreq	L3622
3508                     ; 14     CLK.CKDIVR &= 0xf8; //CPU 无分频
3510  000b c650c6        	ld	a,_CLK+6
3511  000e a4f8          	and	a,#248
3512  0010 c750c6        	ld	_CLK+6,a
3513                     ; 15     CLK.SWR = 0xB4; // 选择外部时钟
3515  0013 35b450c4      	mov	_CLK+4,#180
3517  0017               L3722:
3518                     ; 16     while(!(CLK.SWCR & 0x08)); // 等待目标时钟源就绪
3520  0017 c650c5        	ld	a,_CLK+5
3521  001a a508          	bcp	a,#8
3522  001c 27f9          	jreq	L3722
3523                     ; 17     CLK.SWCR |= 0x02; // 使能外部时钟
3525  001e 721250c5      	bset	_CLK+5,#1
3526                     ; 18 }
3529  0022 87            	retf
3553                     ; 19 void InterruptInit(void)
3553                     ; 20 {
3554                     	switch	.text
3555  0023               f_InterruptInit:
3559                     ; 21     _asm("sim"); //关中断
3562  0023 9b            sim
3564                     ; 22     ITC.ISPR1 =0xff;
3566  0024 35ff7f70      	mov	_ITC,#255
3567                     ; 23     ITC.ISPR2 =0xff;
3569  0028 35ff7f71      	mov	_ITC+1,#255
3570                     ; 24     ITC.ISPR3 =0xff;
3572  002c 35ff7f72      	mov	_ITC+2,#255
3573                     ; 25     ITC.ISPR4 =0xff;
3575  0030 35ff7f73      	mov	_ITC+3,#255
3576                     ; 26     ITC.ISPR5 =0xff;
3578  0034 35ff7f74      	mov	_ITC+4,#255
3579                     ; 27     ITC.ISPR6 =0xff;
3581  0038 35ff7f75      	mov	_ITC+5,#255
3582                     ; 28     ITC.ISPR7 =0xff;
3584  003c 35ff7f76      	mov	_ITC+6,#255
3585                     ; 29     ITC.ISPR8 =0xff;
3587  0040 35ff7f77      	mov	_ITC+7,#255
3588                     ; 30     EXTI.CR1 =0x00;
3590  0044 725f50a0      	clr	_EXTI
3591                     ; 31     EXTI.CR2 =0x00;
3593  0048 725f50a1      	clr	_EXTI+1
3594                     ; 32     _asm("rim"); //开中断
3597  004c 9a            rim
3599                     ; 33 }
3602  004d 87            	retf
3631                     ; 34 void VariableInit(void)
3631                     ; 35 {
3632                     	switch	.text
3633  004e               f_VariableInit:
3637                     ; 36     if(Check_CheckSum())
3639  004e 8d000000      	callf	f_Check_CheckSum
3641  0052 4d            	tnz	a
3642  0053 272b          	jreq	L7132
3643                     ; 38         if(RST.SR&RST_SR_EMCF) 
3645  0055 c650b3        	ld	a,_RST
3646  0058 a510          	bcp	a,#16
3647  005a 2706          	jreq	L1232
3648                     ; 40             ResetSource=RESET_B_Power_Blinking;
3650  005c 35030002      	mov	_ResetSource,#3
3652  0060 2022          	jra	L5332
3653  0062               L1232:
3654                     ; 42         else if(RST.SR&(RST_SR_IWDGF|RST_SR_WWDGF))
3656  0062 c650b3        	ld	a,_RST
3657  0065 a503          	bcp	a,#3
3658  0067 2704          	jreq	L5232
3659                     ; 44             ResetSource=RESET_Watchdog;
3661  0069 3f02          	clr	_ResetSource
3663  006b 2017          	jra	L5332
3664  006d               L5232:
3665                     ; 46         else if(RST.SR&RST_SR_SWIMF)
3667  006d c650b3        	ld	a,_RST
3668  0070 a508          	bcp	a,#8
3669  0072 2706          	jreq	L1332
3670                     ; 48             ResetSource=RESET_B_Power; //调试复位可根据需要修改
3672  0074 35010002      	mov	_ResetSource,#1
3674  0078 200a          	jra	L5332
3675  007a               L1332:
3676                     ; 52             ResetSource=RESET_Key;	
3678  007a 35020002      	mov	_ResetSource,#2
3679  007e 2004          	jra	L5332
3680  0080               L7132:
3681                     ; 57         ResetSource=RESET_B_Power;
3683  0080 35010002      	mov	_ResetSource,#1
3684  0084               L5332:
3685                     ; 59     RST.SR=0x1F;    //清除复位标志
3687  0084 351f50b3      	mov	_RST,#31
3688                     ; 60     Generate_CheckSum();    //重新计算CheckSum
3690  0088 8d000000      	callf	f_Generate_CheckSum
3692                     ; 61     FlagMain.byte=0;
3694  008c 725f000b      	clr	_FlagMain
3695                     ; 62     PowerState =POWER_INITIAL;
3697  0090 725f0000      	clr	_PowerState
3698                     ; 63     CanBusState=CAN_INITIAL;
3700  0094 725f0034      	clr	_CanBusState
3701                     ; 64 }
3704  0098 87            	retf
3732                     ; 65 void HardwareInit(void)
3732                     ; 66 {
3733                     	switch	.text
3734  0099               f_HardwareInit:
3738                     ; 67     EepromInit();
3740  0099 8d000000      	callf	f_EepromInit
3742                     ; 68     SysClkInit();
3744  009d 8d000000      	callf	f_SysClkInit
3746                     ; 69     Delay(10000); //wait for system power stability
3748  00a1 ae2710        	ldw	x,#10000
3749  00a4 8d000000      	callf	f_Delay
3751                     ; 70     GPIOInit();
3753  00a8 8d000000      	callf	f_GPIOInit
3755                     ; 71     TimerInit();
3757  00ac 8d000000      	callf	f_TimerInit
3759                     ; 72     BeepInit();
3761  00b0 8d000000      	callf	f_BeepInit
3763                     ; 73 }
3766  00b4 87            	retf
3796                     ; 74 main()
3796                     ; 75 {
3797                     	switch	.text
3798  00b5               f_main:
3802                     ; 77     HardwareInit();
3804  00b5 8d990099      	callf	f_HardwareInit
3806                     ; 78     VariableInit();
3808  00b9 8d4e004e      	callf	f_VariableInit
3810                     ; 79     InterruptInit();
3812  00bd 8d230023      	callf	f_InterruptInit
3814                     ; 80     BEGIN_WATCHDOG;
3816  00c1 357f50d2      	mov	_WWDG+1,#127
3819  00c5 35ff50d1      	mov	_WWDG,#255
3820  00c9               L7532:
3821                     ; 84         CLEAR_WATCHDOG;
3823  00c9 357f50d1      	mov	_WWDG,#127
3824                     ; 85         if(FLAGMAIN_4MS)
3827  00cd c6000b        	ld	a,_FlagMain
3828  00d0 a502          	bcp	a,#2
3829  00d2 2710          	jreq	L3632
3830                     ; 87             FLAGMAIN_4MS=0; // 4ms时基标志清0
3832  00d4 7213000b      	bres	_FlagMain,#1
3833                     ; 88             BeepManage();
3835  00d8 8d000000      	callf	f_BeepManage
3837                     ; 89             Key_Scan_AD();
3839  00dc 8d000000      	callf	f_Key_Scan_AD
3841                     ; 90             Can_Main();
3843  00e0 8d000000      	callf	f_Can_Main
3845  00e4               L3632:
3846                     ; 92         if(FLAGMAIN_100MS)
3848  00e4 c6000b        	ld	a,_FlagMain
3849  00e7 a504          	bcp	a,#4
3850  00e9 2704          	jreq	L5632
3851                     ; 94             FLAGMAIN_100MS=0;
3853  00eb 7215000b      	bres	_FlagMain,#2
3854  00ef               L5632:
3855                     ; 97         if(FLAGMAIN_FATAL)
3857  00ef c6000b        	ld	a,_FlagMain
3858  00f2 a540          	bcp	a,#64
3859  00f4 27d3          	jreq	L7532
3860                     ; 99             break;
3861  00f6               L1732:
3863  00f6 20fe          	jra	L1732
3875                     	xdef	f_main
3876                     	xdef	f_HardwareInit
3877                     	xdef	f_VariableInit
3878                     	xdef	f_InterruptInit
3879                     	xdef	f_SysClkInit
3880                     	switch	.bss
3881  0000               _PowerState:
3882  0000 00            	ds.b	1
3883                     	xdef	_PowerState
3884  0001               _FatalCode:
3885  0001 00            	ds.b	1
3886                     	xdef	_FatalCode
3887  0002               _DebugWord:
3888  0002 000000000000  	ds.b	8
3889                     	xdef	_DebugWord
3890  000a               _DebugParameter:
3891  000a 00            	ds.b	1
3892                     	xdef	_DebugParameter
3893  000b               _FlagMain:
3894  000b 00            	ds.b	1
3895                     	xdef	_FlagMain
3896  000c               _AdcValue:
3897  000c 0000          	ds.b	2
3898                     	xdef	_AdcValue
3899                     	xref	f_EepromInit
3900                     	xref	f_Can_Main
3901  000e               _can_msg_id32:
3902  000e 00000000      	ds.b	4
3903                     	xdef	_can_msg_id32
3904  0012               _can_msg_id16:
3905  0012 0000          	ds.b	2
3906                     	xdef	_can_msg_id16
3907  0014               _CntSendFalse:
3908  0014 00            	ds.b	1
3909                     	xdef	_CntSendFalse
3910  0015               _FlagCan:
3911  0015 00            	ds.b	1
3912                     	xdef	_FlagCan
3913  0016               _CANMsgACC:
3914  0016 000000000000  	ds.b	17
3915                     	xdef	_CANMsgACC
3916  0027               _CanTxRxBuffer:
3917  0027 000000000000  	ds.b	13
3918                     	xdef	_CanTxRxBuffer
3919  0034               _CanBusState:
3920  0034 00            	ds.b	1
3921                     	xdef	_CanBusState
3922  0035               _NodeState:
3923  0035 000000        	ds.b	3
3924                     	xdef	_NodeState
3925  0038               _CanPage:
3926  0038 00            	ds.b	1
3927                     	xdef	_CanPage
3928  0039               _CanProtocol1sTimer:
3929  0039 00            	ds.b	1
3930                     	xdef	_CanProtocol1sTimer
3931  003a               _CanProtocolState:
3932  003a 00            	ds.b	1
3933                     	xdef	_CanProtocolState
3934                     	xref	f_Key_Scan_AD
3935                     	xref	f_GPIOInit
3936                     	xref	f_TimerInit
3937                     	xref	f_BeepManage
3938                     	xref	f_BeepInit
3939  003b               _BeepTimer:
3940  003b 00            	ds.b	1
3941                     	xdef	_BeepTimer
3942  003c               _BeepState:
3943  003c 00            	ds.b	1
3944                     	xdef	_BeepState
3945                     	xref	f_Check_CheckSum
3946                     	xref	f_Generate_CheckSum
3947                     	xref	f_Delay
3948                     	xdef	_CheckTail
3949                     	xdef	_CheckSum
3950                     	xdef	_ResetSource
3951                     	xdef	_Clock
3952                     	xdef	_CheckHead
3972                     	end
