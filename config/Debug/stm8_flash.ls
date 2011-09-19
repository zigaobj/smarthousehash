   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.3 - 19 Nov 2007
2351                     ; 17 void EepromUnlock(void)
2351                     ; 18 {
2352                     	switch	.text
2353  0000               f_EepromUnlock:
2357                     ; 19     FLASH.DUKR=FLASH_RASS_KEY2; //数据区 First 解锁码 ,数据区解锁码与程序区相反
2359  0000 35ae5064      	mov	_FLASH+10,#174
2360                     ; 20     FLASH.DUKR=FLASH_RASS_KEY1; //Second 解锁码
2362  0004 35565064      	mov	_FLASH+10,#86
2363                     ; 21 }
2366  0008 87            	retf
2401                     ; 31 void EepromSave(void)
2401                     ; 32 {
2402                     	switch	.text
2403  0009               f_EepromSave:
2405  0009 88            	push	a
2406       00000001      OFST:	set	1
2409                     ; 34     EepromUnlock();
2411  000a 8d000000      	callf	f_EepromUnlock
2413                     ; 35     for(i=0;i<128;i++)
2415  000e 0f01          	clr	(OFST+0,sp)
2416  0010               L1141:
2417                     ; 37         Eeprom[i]=0xa1;
2419  0010 7b01          	ld	a,(OFST+0,sp)
2420  0012 5f            	clrw	x
2421  0013 97            	ld	xl,a
2422  0014 a6a1          	ld	a,#161
2423  0016 d74000        	ld	(_Eeprom,x),a
2424                     ; 38         FlashWaitForEepromOperation(); //等待写操作结束
2426  0019 8d2c002c      	callf	f_FlashWaitForEepromOperation
2428                     ; 35     for(i=0;i<128;i++)
2430  001d 0c01          	inc	(OFST+0,sp)
2433  001f 7b01          	ld	a,(OFST+0,sp)
2434  0021 a180          	cp	a,#128
2435  0023 25eb          	jrult	L1141
2436                     ; 40     FLASH.IAPSR &=(u8)(~FLASH_IAPSR_DUL); //EEPROM写保护使能
2438  0025 7217505f      	bres	_FLASH+5,#3
2439                     ; 41 }
2442  0029 84            	pop	a
2443  002a 87            	retf
2486                     ; 51 BoolT EepromLoad(void)
2486                     ; 52 {
2487                     	switch	.text
2488  002b               f_EepromLoad:
2492                     ; 54 }
2495  002b 87            	retf
2520                     ; 64 void FlashWaitForEepromOperation(void)
2520                     ; 65 {
2521                     	switch	.text
2522  002c               f_FlashWaitForEepromOperation:
2526  002c 2004          	jra	L1541
2527  002e               L7441:
2528                     ; 67     while(!(FLASH.IAPSR & FLASH_IAPSR_EOP))CLEAR_WATCHDOG; //等待写入FLASH完成
2530  002e 357f50d1      	mov	_WWDG,#127
2531  0032               L1541:
2534  0032 c6505f        	ld	a,_FLASH+5
2535  0035 a504          	bcp	a,#4
2536  0037 27f5          	jreq	L7441
2537                     ; 68 }
2541  0039 87            	retf
2592                     ; 71 void IapProc(u8 Byte)
2592                     ; 72 {
2593                     .iapcode:	section	.text
2594  0000               f_IapProc:
2596  0000 88            	push	a
2597  0001 5205          	subw	sp,#5
2598       00000005      OFST:	set	5
2601                     ; 73     u32 Add=0;
2603  0003 96            	ldw	x,sp
2604  0004 1c0001        	addw	x,#OFST-4
2605  0007 8d000000      	callf	d_ltor
2607                     ; 74     u8 i=0;
2609  000b 7b05          	ld	a,(OFST+0,sp)
2610  000d 97            	ld	xl,a
2611                     ; 76     for (i = 0; i < FLASH_BLOCK_SIZE; i++)
2613  000e 0f05          	clr	(OFST+0,sp)
2614  0010               L5741:
2615                     ; 78         GBuffer[i] = Byte;
2617  0010 7b05          	ld	a,(OFST+0,sp)
2618  0012 5f            	clrw	x
2619  0013 97            	ld	xl,a
2620  0014 7b06          	ld	a,(OFST+1,sp)
2621  0016 d70007        	ld	(_GBuffer,x),a
2622                     ; 76     for (i = 0; i < FLASH_BLOCK_SIZE; i++)
2624  0019 0c05          	inc	(OFST+0,sp)
2627  001b 7b05          	ld	a,(OFST+0,sp)
2628  001d a180          	cp	a,#128
2629  001f 25ef          	jrult	L5741
2630                     ; 80     FlashSetProgrammingTime(FLASH_PROGRAMTIME_HALFTPROG); //编程时间为 1/2 Tprog 或者 Tprog
2632  0021 4f            	clr	a
2633  0022 8d530053      	callf	f_FlashSetProgrammingTime
2635                     ; 81     FlashUnlock(FLASH_CODE); //程序区解锁
2637  0026 a601          	ld	a,#1
2638  0028 8d5e005e      	callf	f_FlashUnlock
2640                     ; 82     Add=0x20000;
2642  002c 96            	ldw	x,sp
2643  002d 1c0001        	addw	x,#OFST-4
2644  0030 8d000000      	callf	d_ltor
2646                     ; 83     Block=0x300;
2648  0034 ae0300        	ldw	x,#768
2649  0037 cf0000        	ldw	_Block,x
2650                     ; 87     FlashProgramBlock(Block, FLASH_CODE, FLASH_PROGRAMMODE_STANDARD, GBuffer); //写一个块128字节
2652  003a ae0007        	ldw	x,#_GBuffer
2653  003d 89            	pushw	x
2654  003e 4b00          	push	#0
2655  0040 4b01          	push	#1
2656  0042 ae0300        	ldw	x,#768
2657  0045 8dab01ab      	callf	f_FlashProgramBlock
2659  0049 5b04          	addw	sp,#4
2660                     ; 88     FlashLock(FLASH_CODE);//FLASH程序区写保护使能
2662  004b a601          	ld	a,#1
2663  004d 8d7d007d      	callf	f_FlashLock
2665  0051               L3051:
2666                     ; 89     for(;;); //FLASH写入完成后等待WDG复位
2668  0051 20fe          	jra	L3051
2726                     ; 100 void FlashSetProgrammingTime(FLASH_ProgramTime_TypeDef ProgTime)
2726                     ; 101 {
2727                     	switch	.iapcode
2728  0053               f_FlashSetProgrammingTime:
2732                     ; 102     FLASH.CR1 &= (u8)(~FLASH_CR1_FIX);
2734  0053 7211505a      	bres	_FLASH,#0
2735                     ; 103     FLASH.CR1 |= (u8)ProgTime;
2737  0057 ca505a        	or	a,_FLASH
2738  005a c7505a        	ld	_FLASH,a
2739                     ; 104 }
2742  005d 87            	retf
2797                     ; 114 void FlashUnlock(FlashType MemType)
2797                     ; 115 {
2798                     	switch	.iapcode
2799  005e               f_FlashUnlock:
2801  005e 88            	push	a
2802       00000000      OFST:	set	0
2805                     ; 116     if(FLASH_CODE==MemType)
2807  005f a101          	cp	a,#1
2808  0061 260a          	jrne	L3651
2809                     ; 118         FLASH.PUKR=FLASH_RASS_KEY1; //程序区 First 解锁码
2811  0063 35565062      	mov	_FLASH+8,#86
2812                     ; 119         FLASH.PUKR=FLASH_RASS_KEY2; //Second 解锁码
2814  0067 35ae5062      	mov	_FLASH+8,#174
2816  006b 200e          	jra	L5651
2817  006d               L3651:
2818                     ; 121     else if(FLASH_DATA==MemType)
2820  006d 7b01          	ld	a,(OFST+1,sp)
2821  006f a102          	cp	a,#2
2822  0071 2608          	jrne	L5651
2823                     ; 123         FLASH.DUKR=FLASH_RASS_KEY2; //数据区 First 解锁码 ,数据区解锁码与程序区相反
2825  0073 35ae5064      	mov	_FLASH+10,#174
2826                     ; 124         FLASH.DUKR=FLASH_RASS_KEY1; //Second 解锁码
2828  0077 35565064      	mov	_FLASH+10,#86
2829  007b               L5651:
2830                     ; 126 }
2833  007b 84            	pop	a
2834  007c 87            	retf
2869                     ; 136 void FlashLock(FlashType MemType)
2869                     ; 137 {
2870                     	switch	.iapcode
2871  007d               f_FlashLock:
2873  007d 88            	push	a
2874       00000000      OFST:	set	0
2877                     ; 138     if(FLASH_CODE==MemType)
2879  007e a101          	cp	a,#1
2880  0080 2606          	jrne	L7061
2881                     ; 140         FLASH.IAPSR &=(u8)(~FLASH_IAPSR_PUL); //FLASH程序区写保护使能
2883  0082 7213505f      	bres	_FLASH+5,#1
2885  0086 200a          	jra	L1161
2886  0088               L7061:
2887                     ; 142     else if(FLASH_DATA==MemType)
2889  0088 7b01          	ld	a,(OFST+1,sp)
2890  008a a102          	cp	a,#2
2891  008c 2604          	jrne	L1161
2892                     ; 144         FLASH.IAPSR &=(u8)(~FLASH_IAPSR_DUL); //EEPROM写保护使能
2894  008e 7217505f      	bres	_FLASH+5,#3
2895  0092               L1161:
2896                     ; 146 }
2899  0092 84            	pop	a
2900  0093 87            	retf
2925                     ; 156 void FlashWaitForLastOperation(void)
2925                     ; 157 {
2926                     	switch	.iapcode
2927  0094               f_FlashWaitForLastOperation:
2931  0094 2004          	jra	L7261
2932  0096               L5261:
2933                     ; 159     while(!(FLASH.IAPSR & FLASH_IAPSR_EOP))CLEAR_WATCHDOG; //等待写入FLASH完成
2935  0096 357f50d1      	mov	_WWDG,#127
2936  009a               L7261:
2939  009a c6505f        	ld	a,_FLASH+5
2940  009d a504          	bcp	a,#4
2941  009f 27f5          	jreq	L5261
2942                     ; 160 }
2946  00a1 87            	retf
2985                     ; 170 void FlashWriteByte(u32 Address,u8 Data)
2985                     ; 171 {
2986                     	switch	.iapcode
2987  00a2               f_FlashWriteByte:
2989       00000000      OFST:	set	0
2992                     ; 172     *((@far u8*)Address) = Data; //写一个字节
2994  00a2 7b08          	ld	a,(OFST+8,sp)
2995  00a4 88            	push	a
2996  00a5 7b06          	ld	a,(OFST+6,sp)
2997  00a7 b700          	ld	c_x,a
2998  00a9 1e07          	ldw	x,(OFST+7,sp)
2999  00ab 84            	pop	a
3000  00ac bf01          	ldw	c_x+1,x
3001  00ae 92bd0000      	ldf	[c_x.e],a
3002                     ; 173     FlashWaitForLastOperation(); //等待写操作结束
3004  00b2 8d940094      	callf	f_FlashWaitForLastOperation
3006                     ; 174 }
3009  00b6 87            	retf
3049                     ; 184 void FlashWriteWord(u32 Address,u32 Data32)
3049                     ; 185 {
3050                     	switch	.iapcode
3051  00b7               f_FlashWriteWord:
3053       00000000      OFST:	set	0
3056                     ; 186     FLASH.CR2 |=FLASH_CR2_WPRG;
3058  00b7 721c505b      	bset	_FLASH+1,#6
3059                     ; 187     FLASH.NCR2 &=(u8)(~FLASH_NCR2_NWPRG);
3061  00bb 721d505c      	bres	_FLASH+2,#6
3062                     ; 189     *(((@far u8*)Address)+0) =BYTE_3(Data32); //写一个字节
3064  00bf 7b08          	ld	a,(OFST+8,sp)
3065  00c1 88            	push	a
3066  00c2 7b06          	ld	a,(OFST+6,sp)
3067  00c4 b700          	ld	c_x,a
3068  00c6 1e07          	ldw	x,(OFST+7,sp)
3069  00c8 84            	pop	a
3070  00c9 bf01          	ldw	c_x+1,x
3071  00cb 92bd0000      	ldf	[c_x.e],a
3072                     ; 190     *(((@far u8*)Address)+1) =BYTE_2(Data32); //写一个字节
3074  00cf 7b09          	ld	a,(OFST+9,sp)
3075  00d1 88            	push	a
3076  00d2 7b06          	ld	a,(OFST+6,sp)
3077  00d4 b700          	ld	c_x,a
3078  00d6 1e07          	ldw	x,(OFST+7,sp)
3079  00d8 84            	pop	a
3080  00d9 90ae0001      	ldw	y,#1
3081  00dd bf01          	ldw	c_x+1,x
3082  00df 93            	ldw	x,y
3083  00e0 92a70000      	ldf	([c_x.e],x),a
3084                     ; 191     *(((@far u8*)Address)+2) =BYTE_1(Data32); //写一个字节
3086  00e4 7b0a          	ld	a,(OFST+10,sp)
3087  00e6 88            	push	a
3088  00e7 7b06          	ld	a,(OFST+6,sp)
3089  00e9 b700          	ld	c_x,a
3090  00eb 1e07          	ldw	x,(OFST+7,sp)
3091  00ed 84            	pop	a
3092  00ee 90ae0002      	ldw	y,#2
3093  00f2 bf01          	ldw	c_x+1,x
3094  00f4 93            	ldw	x,y
3095  00f5 92a70000      	ldf	([c_x.e],x),a
3096                     ; 192     *(((@far u8*)Address)+3) =BYTE_0(Data32); //写一个字节
3098  00f9 7b0b          	ld	a,(OFST+11,sp)
3099  00fb a4ff          	and	a,#255
3100  00fd 88            	push	a
3101  00fe 7b06          	ld	a,(OFST+6,sp)
3102  0100 b700          	ld	c_x,a
3103  0102 1e07          	ldw	x,(OFST+7,sp)
3104  0104 84            	pop	a
3105  0105 90ae0003      	ldw	y,#3
3106  0109 bf01          	ldw	c_x+1,x
3107  010b 93            	ldw	x,y
3108  010c 92a70000      	ldf	([c_x.e],x),a
3109                     ; 193     FlashWaitForLastOperation(); //等待写操作结束
3111  0110 8d940094      	callf	f_FlashWaitForLastOperation
3113                     ; 194 }
3116  0114 87            	retf
3147                     ; 204 u8 FlashReadByte(u32 Address)
3147                     ; 205 {
3148                     	switch	.iapcode
3149  0115               f_FlashReadByte:
3151       00000000      OFST:	set	0
3154                     ; 206     return(*((@far u8*)Address)); //读一个字节
3156  0115 7b05          	ld	a,(OFST+5,sp)
3157  0117 b700          	ld	c_x,a
3158  0119 1e06          	ldw	x,(OFST+6,sp)
3159  011b bf01          	ldw	c_x+1,x
3160  011d 92bc0000      	ldf	a,[c_x.e]
3163  0121 87            	retf
3194                     ; 217 u32 FlashReadWord(u32 Address)
3194                     ; 218 {
3195                     	switch	.iapcode
3196  0122               f_FlashReadWord:
3198       00000000      OFST:	set	0
3201                     ; 219     return(*((@far u32 *)Address)); //读一个字
3203  0122 7b05          	ld	a,(OFST+5,sp)
3204  0124 b700          	ld	c_x,a
3205  0126 1e06          	ldw	x,(OFST+6,sp)
3206  0128 8d000000      	callf	d_fltor
3210  012c 87            	retf
3242                     ; 230 void FlashEraseByte(u32 Address)
3242                     ; 231 {
3243                     	switch	.iapcode
3244  012d               f_FlashEraseByte:
3246       00000000      OFST:	set	0
3249                     ; 232     *((@far u8*)Address) =0x00; //擦除一个字节
3251  012d 7b05          	ld	a,(OFST+5,sp)
3252  012f b700          	ld	c_x,a
3253  0131 1e06          	ldw	x,(OFST+6,sp)
3254  0133 bf01          	ldw	c_x+1,x
3255  0135 4f            	clr	a
3256  0136 92bd0000      	ldf	[c_x.e],a
3257                     ; 233     FlashWaitForLastOperation(); //等待写操作结束
3259  013a 8d940094      	callf	f_FlashWaitForLastOperation
3261                     ; 234 }
3264  013e 87            	retf
3321                     ; 244 void FlashEraseBlock(u16 BlockNum, FlashType MemType)
3321                     ; 245 {
3322                     	switch	.iapcode
3323  013f               f_FlashEraseBlock:
3325  013f 89            	pushw	x
3326  0140 5205          	subw	sp,#5
3327       00000005      OFST:	set	5
3330                     ; 247     u32 StartAddress = 0;
3332  0142 ae0000        	ldw	x,#0
3333  0145 1f03          	ldw	(OFST-2,sp),x
3334  0147 ae0000        	ldw	x,#0
3335  014a 1f01          	ldw	(OFST-4,sp),x
3336                     ; 248     if(FLASH_CODE==MemType)
3338  014c 7b0b          	ld	a,(OFST+6,sp)
3339  014e a101          	cp	a,#1
3340  0150 260c          	jrne	L7571
3341                     ; 250         StartAddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
3343  0152 ae8000        	ldw	x,#32768
3344  0155 1f03          	ldw	(OFST-2,sp),x
3345  0157 ae0000        	ldw	x,#0
3346  015a 1f01          	ldw	(OFST-4,sp),x
3348  015c 2010          	jra	L1671
3349  015e               L7571:
3350                     ; 252     else if(FLASH_DATA==MemType)
3352  015e 7b0b          	ld	a,(OFST+6,sp)
3353  0160 a102          	cp	a,#2
3354  0162 260a          	jrne	L1671
3355                     ; 254         StartAddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
3357  0164 ae4000        	ldw	x,#16384
3358  0167 1f03          	ldw	(OFST-2,sp),x
3359  0169 ae0000        	ldw	x,#0
3360  016c 1f01          	ldw	(OFST-4,sp),x
3361  016e               L1671:
3362                     ; 257     StartAddress =StartAddress + ((u32)BlockNum *FLASH_BLOCK_SIZE);
3364  016e 1e06          	ldw	x,(OFST+1,sp)
3365  0170 a680          	ld	a,#128
3366  0172 8d000000      	callf	d_cmulx
3368  0176 96            	ldw	x,sp
3369  0177 1c0001        	addw	x,#OFST-4
3370  017a 8d000000      	callf	d_lgadd
3372                     ; 258     FLASH.CR2  |= FLASH_CR2_ERASE;
3374  017e 721a505b      	bset	_FLASH+1,#5
3375                     ; 259     FLASH.NCR2 &= (u8)(~FLASH_NCR2_NERASE);
3377  0182 721b505c      	bres	_FLASH+2,#5
3378                     ; 260     for (i = 0; i <FLASH_BLOCK_SIZE; i++)
3380  0186 0f05          	clr	(OFST+0,sp)
3381  0188               L5671:
3382                     ; 262         *(((@far u8*)StartAddress)+i) =0x00;
3384  0188 7b02          	ld	a,(OFST-3,sp)
3385  018a b700          	ld	c_x,a
3386  018c 1e03          	ldw	x,(OFST-2,sp)
3387  018e 7b05          	ld	a,(OFST+0,sp)
3388  0190 905f          	clrw	y
3389  0192 9097          	ld	yl,a
3390  0194 bf01          	ldw	c_x+1,x
3391  0196 93            	ldw	x,y
3392  0197 4f            	clr	a
3393  0198 92a70000      	ldf	([c_x.e],x),a
3394                     ; 260     for (i = 0; i <FLASH_BLOCK_SIZE; i++)
3396  019c 0c05          	inc	(OFST+0,sp)
3399  019e 7b05          	ld	a,(OFST+0,sp)
3400  01a0 a180          	cp	a,#128
3401  01a2 25e4          	jrult	L5671
3402                     ; 264     FlashWaitForLastOperation(); //等待写操作结束
3404  01a4 8d940094      	callf	f_FlashWaitForLastOperation
3406                     ; 265 }
3409  01a8 5b07          	addw	sp,#7
3410  01aa 87            	retf
3509                     ; 275 void FlashProgramBlock(u16 BlockNum, FlashType MemType, FLASH_ProgramMode_TypeDef ProgMode, u8 *Buffer)
3509                     ; 276 {
3510                     	switch	.iapcode
3511  01ab               f_FlashProgramBlock:
3513  01ab 89            	pushw	x
3514  01ac 5206          	subw	sp,#6
3515       00000006      OFST:	set	6
3518                     ; 277     u16 i = 0;
3520  01ae 1e05          	ldw	x,(OFST-1,sp)
3521                     ; 278     u32 StartAddress = 0;
3523  01b0 96            	ldw	x,sp
3524  01b1 1c0001        	addw	x,#OFST-5
3525  01b4 8d000000      	callf	d_ltor
3527                     ; 280     if (FLASH_CODE==MemType)
3529  01b8 7b0c          	ld	a,(OFST+6,sp)
3530  01ba a101          	cp	a,#1
3531  01bc 260c          	jrne	L7302
3532                     ; 282         StartAddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
3534  01be ae8000        	ldw	x,#32768
3535  01c1 1f03          	ldw	(OFST-3,sp),x
3536  01c3 ae0000        	ldw	x,#0
3537  01c6 1f01          	ldw	(OFST-5,sp),x
3539  01c8 200a          	jra	L1402
3540  01ca               L7302:
3541                     ; 286         StartAddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
3543  01ca ae4000        	ldw	x,#16384
3544  01cd 1f03          	ldw	(OFST-3,sp),x
3545  01cf ae0000        	ldw	x,#0
3546  01d2 1f01          	ldw	(OFST-5,sp),x
3547  01d4               L1402:
3548                     ; 290     StartAddress = StartAddress + ((u32)BlockNum *FLASH_BLOCK_SIZE);
3550  01d4 1e07          	ldw	x,(OFST+1,sp)
3551  01d6 a680          	ld	a,#128
3552  01d8 8d000000      	callf	d_cmulx
3554  01dc 96            	ldw	x,sp
3555  01dd 1c0001        	addw	x,#OFST-5
3556  01e0 8d000000      	callf	d_lgadd
3558                     ; 293     if (FLASH_PROGRAMMODE_STANDARD==ProgMode)
3560  01e4 0d0d          	tnz	(OFST+7,sp)
3561  01e6 260a          	jrne	L3402
3562                     ; 296         FLASH.CR2 |= FLASH_CR2_PRG;
3564  01e8 7210505b      	bset	_FLASH+1,#0
3565                     ; 297         FLASH.NCR2 &= (u8)(~FLASH_NCR2_NPRG);
3567  01ec 7211505c      	bres	_FLASH+2,#0
3569  01f0 2008          	jra	L5402
3570  01f2               L3402:
3571                     ; 302         FLASH.CR2 |= FLASH_CR2_FPRG;
3573  01f2 7218505b      	bset	_FLASH+1,#4
3574                     ; 303         FLASH.NCR2 &= (u8)(~FLASH_NCR2_NFPRG);
3576  01f6 7219505c      	bres	_FLASH+2,#4
3577  01fa               L5402:
3578                     ; 307     for (i = 0; i <FLASH_BLOCK_SIZE; i++)
3580  01fa 5f            	clrw	x
3581  01fb 1f05          	ldw	(OFST-1,sp),x
3582  01fd               L7402:
3583                     ; 309         *(((@far u8*)StartAddress)+i) =((u8)(Buffer[i]));
3585  01fd 1e0e          	ldw	x,(OFST+8,sp)
3586  01ff 72fb05        	addw	x,(OFST-1,sp)
3587  0202 f6            	ld	a,(x)
3588  0203 88            	push	a
3589  0204 7b03          	ld	a,(OFST-3,sp)
3590  0206 b700          	ld	c_x,a
3591  0208 1e04          	ldw	x,(OFST-2,sp)
3592  020a 84            	pop	a
3593  020b 1605          	ldw	y,(OFST-1,sp)
3594  020d bf01          	ldw	c_x+1,x
3595  020f 93            	ldw	x,y
3596  0210 92a70000      	ldf	([c_x.e],x),a
3597                     ; 307     for (i = 0; i <FLASH_BLOCK_SIZE; i++)
3599  0214 1e05          	ldw	x,(OFST-1,sp)
3600  0216 1c0001        	addw	x,#1
3601  0219 1f05          	ldw	(OFST-1,sp),x
3604  021b 1e05          	ldw	x,(OFST-1,sp)
3605  021d a30080        	cpw	x,#128
3606  0220 25db          	jrult	L7402
3607                     ; 311     FlashWaitForLastOperation(); //等待写操作结束
3609  0222 8d940094      	callf	f_FlashWaitForLastOperation
3611                     ; 312 }
3614  0226 5b08          	addw	sp,#8
3615  0228 87            	retf
3676                     	switch	.bss
3677  0000               _Block:
3678  0000 0000          	ds.b	2
3679                     	xdef	_Block
3680  0002               _FlashWord:
3681  0002 00000000      	ds.b	4
3682                     	xdef	_FlashWord
3683  0006               _FlashByte:
3684  0006 00            	ds.b	1
3685                     	xdef	_FlashByte
3686  0007               _GBuffer:
3687  0007 000000000000  	ds.b	128
3688                     	xdef	_GBuffer
3689                     	xdef	f_IapProc
3690                     	xdef	f_FlashProgramBlock
3691                     	xdef	f_FlashEraseBlock
3692                     	xdef	f_FlashEraseByte
3693                     	xdef	f_FlashReadWord
3694                     	xdef	f_FlashReadByte
3695                     	xdef	f_FlashWriteWord
3696                     	xdef	f_FlashWriteByte
3697                     	xdef	f_FlashWaitForLastOperation
3698                     	xdef	f_FlashLock
3699                     	xdef	f_FlashUnlock
3700                     	xdef	f_FlashSetProgrammingTime
3701                     	xdef	f_FlashWaitForEepromOperation
3702                     	xdef	f_EepromLoad
3703                     	xdef	f_EepromSave
3704                     	xdef	f_EepromUnlock
3705                     	xref.b	c_x
3725                     	xref	d_lgadd
3726                     	xref	d_cmulx
3727                     	xref	d_fltor
3728                     	xref	d_ltor
3729                     	end
