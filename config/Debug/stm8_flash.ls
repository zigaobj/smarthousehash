   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2351                     ; 18 void EepromUnlock(void)
2351                     ; 19 {
2353                     	switch	.text
2354  0000               _EepromUnlock:
2358                     ; 20     FLASH.DUKR=FLASH_RASS_KEY2; //数据区 First 解锁码 ,数据区解锁码与程序区相反
2360  0000 35ae5064      	mov	_FLASH+10,#174
2361                     ; 21     FLASH.DUKR=FLASH_RASS_KEY1; //Second 解锁码
2363  0004 35565064      	mov	_FLASH+10,#86
2364                     ; 22 }
2367  0008 81            	ret
2405                     ; 32 void EepromSave(void)
2405                     ; 33 {
2406                     	switch	.text
2407  0009               _EepromSave:
2409  0009 88            	push	a
2410       00000001      OFST:	set	1
2413                     ; 35     EepromUnlock();
2415  000a adf4          	call	_EepromUnlock
2417                     ; 36     for(i=0;i<128;i++)
2419  000c 0f01          	clr	(OFST+0,sp)
2420  000e               L3141:
2421                     ; 38         Eeprom[i]=0xa1;
2423  000e 7b01          	ld	a,(OFST+0,sp)
2424  0010 5f            	clrw	x
2425  0011 97            	ld	xl,a
2426  0012 a6a1          	ld	a,#161
2427  0014 d74000        	ld	(_Eeprom,x),a
2428                     ; 39         FlashWaitForEepromOperation(); //等待写操作结束
2430  0017 ad0f          	call	_FlashWaitForEepromOperation
2432                     ; 36     for(i=0;i<128;i++)
2434  0019 0c01          	inc	(OFST+0,sp)
2437  001b 7b01          	ld	a,(OFST+0,sp)
2438  001d a180          	cp	a,#128
2439  001f 25ed          	jrult	L3141
2440                     ; 41     FLASH.IAPSR &=(u8)(~FLASH_IAPSR_DUL); //EEPROM写保护使能
2442  0021 7217505f      	bres	_FLASH+5,#3
2443                     ; 42 }
2446  0025 84            	pop	a
2447  0026 81            	ret
2491                     ; 52 BoolT EepromLoad(void)
2491                     ; 53 {
2492                     	switch	.text
2493  0027               _EepromLoad:
2497                     ; 55 }
2500  0027 81            	ret
2526                     ; 65 void FlashWaitForEepromOperation(void)
2526                     ; 66 {
2527                     	switch	.text
2528  0028               _FlashWaitForEepromOperation:
2532  0028 2004          	jra	L3541
2533  002a               L1541:
2534                     ; 68     while(!(FLASH.IAPSR & FLASH_IAPSR_EOP))CLEAR_WATCHDOG; //等待写入FLASH完成
2536  002a 357f50d1      	mov	_WWDG,#127
2537  002e               L3541:
2540  002e c6505f        	ld	a,_FLASH+5
2541  0031 a504          	bcp	a,#4
2542  0033 27f5          	jreq	L1541
2543                     ; 69 }
2547  0035 81            	ret
2605                     ; 72 void IapProc(u8 Byte)
2605                     ; 73 {
2606                     .iapcode:	section	.text
2607  0000               _IapProc:
2609  0000 88            	push	a
2610  0001 5205          	subw	sp,#5
2611       00000005      OFST:	set	5
2614                     ; 74     u32 Add=0;
2616  0003 96            	ldw	x,sp
2617  0004 1c0001        	addw	x,#OFST-4
2618  0007 cd0000        	call	c_ltor
2620                     ; 75     u8 i=0;
2622  000a 7b05          	ld	a,(OFST+0,sp)
2623  000c 97            	ld	xl,a
2624                     ; 77     for (i = 0; i < FLASH_BLOCK_SIZE; i++)
2626  000d 0f05          	clr	(OFST+0,sp)
2627  000f               L5051:
2628                     ; 79         GBuffer[i] = Byte;
2630  000f 7b05          	ld	a,(OFST+0,sp)
2631  0011 5f            	clrw	x
2632  0012 97            	ld	xl,a
2633  0013 7b06          	ld	a,(OFST+1,sp)
2634  0015 d70007        	ld	(_GBuffer,x),a
2635                     ; 77     for (i = 0; i < FLASH_BLOCK_SIZE; i++)
2637  0018 0c05          	inc	(OFST+0,sp)
2640  001a 7b05          	ld	a,(OFST+0,sp)
2641  001c a180          	cp	a,#128
2642  001e 25ef          	jrult	L5051
2643                     ; 81     FlashSetProgrammingTime(FLASH_PROGRAMTIME_HALFTPROG); //编程时间为 1/2 Tprog 或者 Tprog
2645  0020 4f            	clr	a
2646  0021 ad27          	call	_FlashSetProgrammingTime
2648                     ; 82     FlashUnlock(FLASH_CODE); //程序区解锁
2650  0023 a601          	ld	a,#1
2651  0025 ad2e          	call	_FlashUnlock
2653                     ; 83     Add=0x20000;
2655  0027 96            	ldw	x,sp
2656  0028 1c0001        	addw	x,#OFST-4
2657  002b cd0000        	call	c_ltor
2659                     ; 84     Block=0x300;
2661  002e ae0300        	ldw	x,#768
2662  0031 cf0000        	ldw	_Block,x
2663                     ; 88     FlashProgramBlock(Block, FLASH_CODE, FLASH_PROGRAMMODE_STANDARD, GBuffer); //写一个块128字节
2665  0034 ae0007        	ldw	x,#_GBuffer
2666  0037 89            	pushw	x
2667  0038 4b00          	push	#0
2668  003a 4b01          	push	#1
2669  003c ae0300        	ldw	x,#768
2670  003f cd0199        	call	_FlashProgramBlock
2672  0042 5b04          	addw	sp,#4
2673                     ; 89     FlashLock(FLASH_CODE);//FLASH程序区写保护使能
2675  0044 a601          	ld	a,#1
2676  0046 ad2c          	call	_FlashLock
2678  0048               L3151:
2679                     ; 90     for(;;); //FLASH写入完成后等待WDG复位
2681  0048 20fe          	jra	L3151
2740                     ; 101 void FlashSetProgrammingTime(FLASH_ProgramTime_TypeDef ProgTime)
2740                     ; 102 {
2741                     	switch	.iapcode
2742  004a               _FlashSetProgrammingTime:
2746                     ; 103     FLASH.CR1 &= (u8)(~FLASH_CR1_FIX);
2748  004a 7211505a      	bres	_FLASH,#0
2749                     ; 104     FLASH.CR1 |= (u8)ProgTime;
2751  004e ca505a        	or	a,_FLASH
2752  0051 c7505a        	ld	_FLASH,a
2753                     ; 105 }
2756  0054 81            	ret
2812                     ; 115 void FlashUnlock(FlashType MemType)
2812                     ; 116 {
2813                     	switch	.iapcode
2814  0055               _FlashUnlock:
2816  0055 88            	push	a
2817       00000000      OFST:	set	0
2820                     ; 117     if(FLASH_CODE==MemType)
2822  0056 a101          	cp	a,#1
2823  0058 260a          	jrne	L3751
2824                     ; 119         FLASH.PUKR=FLASH_RASS_KEY1; //程序区 First 解锁码
2826  005a 35565062      	mov	_FLASH+8,#86
2827                     ; 120         FLASH.PUKR=FLASH_RASS_KEY2; //Second 解锁码
2829  005e 35ae5062      	mov	_FLASH+8,#174
2831  0062 200e          	jra	L5751
2832  0064               L3751:
2833                     ; 122     else if(FLASH_DATA==MemType)
2835  0064 7b01          	ld	a,(OFST+1,sp)
2836  0066 a102          	cp	a,#2
2837  0068 2608          	jrne	L5751
2838                     ; 124         FLASH.DUKR=FLASH_RASS_KEY2; //数据区 First 解锁码 ,数据区解锁码与程序区相反
2840  006a 35ae5064      	mov	_FLASH+10,#174
2841                     ; 125         FLASH.DUKR=FLASH_RASS_KEY1; //Second 解锁码
2843  006e 35565064      	mov	_FLASH+10,#86
2844  0072               L5751:
2845                     ; 127 }
2848  0072 84            	pop	a
2849  0073 81            	ret
2885                     ; 137 void FlashLock(FlashType MemType)
2885                     ; 138 {
2886                     	switch	.iapcode
2887  0074               _FlashLock:
2889  0074 88            	push	a
2890       00000000      OFST:	set	0
2893                     ; 139     if(FLASH_CODE==MemType)
2895  0075 a101          	cp	a,#1
2896  0077 2606          	jrne	L7161
2897                     ; 141         FLASH.IAPSR &=(u8)(~FLASH_IAPSR_PUL); //FLASH程序区写保护使能
2899  0079 7213505f      	bres	_FLASH+5,#1
2901  007d 200a          	jra	L1261
2902  007f               L7161:
2903                     ; 143     else if(FLASH_DATA==MemType)
2905  007f 7b01          	ld	a,(OFST+1,sp)
2906  0081 a102          	cp	a,#2
2907  0083 2604          	jrne	L1261
2908                     ; 145         FLASH.IAPSR &=(u8)(~FLASH_IAPSR_DUL); //EEPROM写保护使能
2910  0085 7217505f      	bres	_FLASH+5,#3
2911  0089               L1261:
2912                     ; 147 }
2915  0089 84            	pop	a
2916  008a 81            	ret
2942                     ; 157 void FlashWaitForLastOperation(void)
2942                     ; 158 {
2943                     	switch	.iapcode
2944  008b               _FlashWaitForLastOperation:
2948  008b 2004          	jra	L7361
2949  008d               L5361:
2950                     ; 160     while(!(FLASH.IAPSR & FLASH_IAPSR_EOP))CLEAR_WATCHDOG; //等待写入FLASH完成
2952  008d 357f50d1      	mov	_WWDG,#127
2953  0091               L7361:
2956  0091 c6505f        	ld	a,_FLASH+5
2957  0094 a504          	bcp	a,#4
2958  0096 27f5          	jreq	L5361
2959                     ; 161 }
2963  0098 81            	ret
3007                     ; 171 void FlashWriteByte(u32 Address,u8 Data)
3007                     ; 172 {
3008                     	switch	.iapcode
3009  0099               _FlashWriteByte:
3011       00000000      OFST:	set	0
3014                     ; 173     *((@far u8*)Address) = Data; //写一个字节
3016  0099 7b07          	ld	a,(OFST+7,sp)
3017  009b 88            	push	a
3018  009c 7b05          	ld	a,(OFST+5,sp)
3019  009e b700          	ld	c_x,a
3020  00a0 1e06          	ldw	x,(OFST+6,sp)
3021  00a2 84            	pop	a
3022  00a3 bf01          	ldw	c_x+1,x
3023  00a5 92bd0000      	ldf	[c_x.e],a
3024                     ; 174     FlashWaitForLastOperation(); //等待写操作结束
3026  00a9 ade0          	call	_FlashWaitForLastOperation
3028                     ; 175 }
3031  00ab 81            	ret
3076                     ; 185 void FlashWriteWord(u32 Address,u32 Data32)
3076                     ; 186 {
3077                     	switch	.iapcode
3078  00ac               _FlashWriteWord:
3080       00000000      OFST:	set	0
3083                     ; 187     FLASH.CR2 |=FLASH_CR2_WPRG;
3085  00ac 721c505b      	bset	_FLASH+1,#6
3086                     ; 188     FLASH.NCR2 &=(u8)(~FLASH_NCR2_NWPRG);
3088  00b0 721d505c      	bres	_FLASH+2,#6
3089                     ; 190     *(((@far u8*)Address)+0) =BYTE_3(Data32); //写一个字节
3091  00b4 7b07          	ld	a,(OFST+7,sp)
3092  00b6 88            	push	a
3093  00b7 7b05          	ld	a,(OFST+5,sp)
3094  00b9 b700          	ld	c_x,a
3095  00bb 1e06          	ldw	x,(OFST+6,sp)
3096  00bd 84            	pop	a
3097  00be bf01          	ldw	c_x+1,x
3098  00c0 92bd0000      	ldf	[c_x.e],a
3099                     ; 191     *(((@far u8*)Address)+1) =BYTE_2(Data32); //写一个字节
3101  00c4 7b08          	ld	a,(OFST+8,sp)
3102  00c6 88            	push	a
3103  00c7 7b05          	ld	a,(OFST+5,sp)
3104  00c9 b700          	ld	c_x,a
3105  00cb 1e06          	ldw	x,(OFST+6,sp)
3106  00cd 84            	pop	a
3107  00ce 90ae0001      	ldw	y,#1
3108  00d2 bf01          	ldw	c_x+1,x
3109  00d4 93            	ldw	x,y
3110  00d5 92a70000      	ldf	([c_x.e],x),a
3111                     ; 192     *(((@far u8*)Address)+2) =BYTE_1(Data32); //写一个字节
3113  00d9 7b09          	ld	a,(OFST+9,sp)
3114  00db 88            	push	a
3115  00dc 7b05          	ld	a,(OFST+5,sp)
3116  00de b700          	ld	c_x,a
3117  00e0 1e06          	ldw	x,(OFST+6,sp)
3118  00e2 84            	pop	a
3119  00e3 90ae0002      	ldw	y,#2
3120  00e7 bf01          	ldw	c_x+1,x
3121  00e9 93            	ldw	x,y
3122  00ea 92a70000      	ldf	([c_x.e],x),a
3123                     ; 193     *(((@far u8*)Address)+3) =BYTE_0(Data32); //写一个字节
3125  00ee 7b0a          	ld	a,(OFST+10,sp)
3126  00f0 a4ff          	and	a,#255
3127  00f2 88            	push	a
3128  00f3 7b05          	ld	a,(OFST+5,sp)
3129  00f5 b700          	ld	c_x,a
3130  00f7 1e06          	ldw	x,(OFST+6,sp)
3131  00f9 84            	pop	a
3132  00fa 90ae0003      	ldw	y,#3
3133  00fe bf01          	ldw	c_x+1,x
3134  0100 93            	ldw	x,y
3135  0101 92a70000      	ldf	([c_x.e],x),a
3136                     ; 194     FlashWaitForLastOperation(); //等待写操作结束
3138  0105 ad84          	call	_FlashWaitForLastOperation
3140                     ; 195 }
3143  0107 81            	ret
3177                     ; 205 u8 FlashReadByte(u32 Address)
3177                     ; 206 {
3178                     	switch	.iapcode
3179  0108               _FlashReadByte:
3181       00000000      OFST:	set	0
3184                     ; 207     return(*((@far u8*)Address)); //读一个字节
3186  0108 7b04          	ld	a,(OFST+4,sp)
3187  010a b700          	ld	c_x,a
3188  010c 1e05          	ldw	x,(OFST+5,sp)
3189  010e bf01          	ldw	c_x+1,x
3190  0110 92bc0000      	ldf	a,[c_x.e]
3193  0114 81            	ret
3227                     ; 218 u32 FlashReadWord(u32 Address)
3227                     ; 219 {
3228                     	switch	.iapcode
3229  0115               _FlashReadWord:
3231       00000000      OFST:	set	0
3234                     ; 220     return(*((@far u32 *)Address)); //读一个字
3236  0115 7b04          	ld	a,(OFST+4,sp)
3237  0117 b700          	ld	c_x,a
3238  0119 1e05          	ldw	x,(OFST+5,sp)
3239  011b cd0000        	call	c_fltor
3243  011e 81            	ret
3278                     ; 231 void FlashEraseByte(u32 Address)
3278                     ; 232 {
3279                     	switch	.iapcode
3280  011f               _FlashEraseByte:
3282       00000000      OFST:	set	0
3285                     ; 233     *((@far u8*)Address) =0x00; //擦除一个字节
3287  011f 7b04          	ld	a,(OFST+4,sp)
3288  0121 b700          	ld	c_x,a
3289  0123 1e05          	ldw	x,(OFST+5,sp)
3290  0125 bf01          	ldw	c_x+1,x
3291  0127 4f            	clr	a
3292  0128 92bd0000      	ldf	[c_x.e],a
3293                     ; 234     FlashWaitForLastOperation(); //等待写操作结束
3295  012c cd008b        	call	_FlashWaitForLastOperation
3297                     ; 235 }
3300  012f 81            	ret
3364                     ; 245 void FlashEraseBlock(u16 BlockNum, FlashType MemType)
3364                     ; 246 {
3365                     	switch	.iapcode
3366  0130               _FlashEraseBlock:
3368  0130 89            	pushw	x
3369  0131 5205          	subw	sp,#5
3370       00000005      OFST:	set	5
3373                     ; 248     u32 StartAddress = 0;
3375  0133 ae0000        	ldw	x,#0
3376  0136 1f03          	ldw	(OFST-2,sp),x
3377  0138 ae0000        	ldw	x,#0
3378  013b 1f01          	ldw	(OFST-4,sp),x
3379                     ; 249     if(FLASH_CODE==MemType)
3381  013d 7b0a          	ld	a,(OFST+5,sp)
3382  013f a101          	cp	a,#1
3383  0141 260c          	jrne	L3102
3384                     ; 251         StartAddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
3386  0143 ae8000        	ldw	x,#32768
3387  0146 1f03          	ldw	(OFST-2,sp),x
3388  0148 ae0000        	ldw	x,#0
3389  014b 1f01          	ldw	(OFST-4,sp),x
3391  014d 2010          	jra	L5102
3392  014f               L3102:
3393                     ; 253     else if(FLASH_DATA==MemType)
3395  014f 7b0a          	ld	a,(OFST+5,sp)
3396  0151 a102          	cp	a,#2
3397  0153 260a          	jrne	L5102
3398                     ; 255         StartAddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
3400  0155 ae4000        	ldw	x,#16384
3401  0158 1f03          	ldw	(OFST-2,sp),x
3402  015a ae0000        	ldw	x,#0
3403  015d 1f01          	ldw	(OFST-4,sp),x
3404  015f               L5102:
3405                     ; 258     StartAddress =StartAddress + ((u32)BlockNum *FLASH_BLOCK_SIZE);
3407  015f 1e06          	ldw	x,(OFST+1,sp)
3408  0161 a680          	ld	a,#128
3409  0163 cd0000        	call	c_cmulx
3411  0166 96            	ldw	x,sp
3412  0167 1c0001        	addw	x,#OFST-4
3413  016a cd0000        	call	c_lgadd
3415                     ; 259     FLASH.CR2  |= FLASH_CR2_ERASE;
3417  016d 721a505b      	bset	_FLASH+1,#5
3418                     ; 260     FLASH.NCR2 &= (u8)(~FLASH_NCR2_NERASE);
3420  0171 721b505c      	bres	_FLASH+2,#5
3421                     ; 261     for (i = 0; i <FLASH_BLOCK_SIZE; i++)
3423  0175 0f05          	clr	(OFST+0,sp)
3424  0177               L1202:
3425                     ; 263         *(((@far u8*)StartAddress)+i) =0x00;
3427  0177 7b02          	ld	a,(OFST-3,sp)
3428  0179 b700          	ld	c_x,a
3429  017b 1e03          	ldw	x,(OFST-2,sp)
3430  017d 7b05          	ld	a,(OFST+0,sp)
3431  017f 905f          	clrw	y
3432  0181 9097          	ld	yl,a
3433  0183 bf01          	ldw	c_x+1,x
3434  0185 93            	ldw	x,y
3435  0186 4f            	clr	a
3436  0187 92a70000      	ldf	([c_x.e],x),a
3437                     ; 261     for (i = 0; i <FLASH_BLOCK_SIZE; i++)
3439  018b 0c05          	inc	(OFST+0,sp)
3442  018d 7b05          	ld	a,(OFST+0,sp)
3443  018f a180          	cp	a,#128
3444  0191 25e4          	jrult	L1202
3445                     ; 265     FlashWaitForLastOperation(); //等待写操作结束
3447  0193 cd008b        	call	_FlashWaitForLastOperation
3449                     ; 266 }
3452  0196 5b07          	addw	sp,#7
3453  0198 81            	ret
3559                     ; 276 void FlashProgramBlock(u16 BlockNum, FlashType MemType, FLASH_ProgramMode_TypeDef ProgMode, u8 *Buffer)
3559                     ; 277 {
3560                     	switch	.iapcode
3561  0199               _FlashProgramBlock:
3563  0199 89            	pushw	x
3564  019a 5206          	subw	sp,#6
3565       00000006      OFST:	set	6
3568                     ; 278     u16 i = 0;
3570  019c 1e05          	ldw	x,(OFST-1,sp)
3571                     ; 279     u32 StartAddress = 0;
3573  019e 96            	ldw	x,sp
3574  019f 1c0001        	addw	x,#OFST-5
3575  01a2 cd0000        	call	c_ltor
3577                     ; 281     if (FLASH_CODE==MemType)
3579  01a5 7b0b          	ld	a,(OFST+5,sp)
3580  01a7 a101          	cp	a,#1
3581  01a9 260c          	jrne	L1012
3582                     ; 283         StartAddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
3584  01ab ae8000        	ldw	x,#32768
3585  01ae 1f03          	ldw	(OFST-3,sp),x
3586  01b0 ae0000        	ldw	x,#0
3587  01b3 1f01          	ldw	(OFST-5,sp),x
3589  01b5 200a          	jra	L3012
3590  01b7               L1012:
3591                     ; 287         StartAddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
3593  01b7 ae4000        	ldw	x,#16384
3594  01ba 1f03          	ldw	(OFST-3,sp),x
3595  01bc ae0000        	ldw	x,#0
3596  01bf 1f01          	ldw	(OFST-5,sp),x
3597  01c1               L3012:
3598                     ; 291     StartAddress = StartAddress + ((u32)BlockNum *FLASH_BLOCK_SIZE);
3600  01c1 1e07          	ldw	x,(OFST+1,sp)
3601  01c3 a680          	ld	a,#128
3602  01c5 cd0000        	call	c_cmulx
3604  01c8 96            	ldw	x,sp
3605  01c9 1c0001        	addw	x,#OFST-5
3606  01cc cd0000        	call	c_lgadd
3608                     ; 294     if (FLASH_PROGRAMMODE_STANDARD==ProgMode)
3610  01cf 0d0c          	tnz	(OFST+6,sp)
3611  01d1 260a          	jrne	L5012
3612                     ; 297         FLASH.CR2 |= FLASH_CR2_PRG;
3614  01d3 7210505b      	bset	_FLASH+1,#0
3615                     ; 298         FLASH.NCR2 &= (u8)(~FLASH_NCR2_NPRG);
3617  01d7 7211505c      	bres	_FLASH+2,#0
3619  01db 2008          	jra	L7012
3620  01dd               L5012:
3621                     ; 303         FLASH.CR2 |= FLASH_CR2_FPRG;
3623  01dd 7218505b      	bset	_FLASH+1,#4
3624                     ; 304         FLASH.NCR2 &= (u8)(~FLASH_NCR2_NFPRG);
3626  01e1 7219505c      	bres	_FLASH+2,#4
3627  01e5               L7012:
3628                     ; 308     for (i = 0; i <FLASH_BLOCK_SIZE; i++)
3630  01e5 5f            	clrw	x
3631  01e6 1f05          	ldw	(OFST-1,sp),x
3632  01e8               L1112:
3633                     ; 310         *(((@far u8*)StartAddress)+i) =((u8)(Buffer[i]));
3635  01e8 1e0d          	ldw	x,(OFST+7,sp)
3636  01ea 72fb05        	addw	x,(OFST-1,sp)
3637  01ed f6            	ld	a,(x)
3638  01ee 88            	push	a
3639  01ef 7b03          	ld	a,(OFST-3,sp)
3640  01f1 b700          	ld	c_x,a
3641  01f3 1e04          	ldw	x,(OFST-2,sp)
3642  01f5 84            	pop	a
3643  01f6 1605          	ldw	y,(OFST-1,sp)
3644  01f8 bf01          	ldw	c_x+1,x
3645  01fa 93            	ldw	x,y
3646  01fb 92a70000      	ldf	([c_x.e],x),a
3647                     ; 308     for (i = 0; i <FLASH_BLOCK_SIZE; i++)
3649  01ff 1e05          	ldw	x,(OFST-1,sp)
3650  0201 1c0001        	addw	x,#1
3651  0204 1f05          	ldw	(OFST-1,sp),x
3654  0206 1e05          	ldw	x,(OFST-1,sp)
3655  0208 a30080        	cpw	x,#128
3656  020b 25db          	jrult	L1112
3657                     ; 312     FlashWaitForLastOperation(); //等待写操作结束
3659  020d cd008b        	call	_FlashWaitForLastOperation
3661                     ; 313 }
3664  0210 5b08          	addw	sp,#8
3665  0212 81            	ret
3727                     	switch	.bss
3728  0000               _Block:
3729  0000 0000          	ds.b	2
3730                     	xdef	_Block
3731  0002               _FlashWord:
3732  0002 00000000      	ds.b	4
3733                     	xdef	_FlashWord
3734  0006               _FlashByte:
3735  0006 00            	ds.b	1
3736                     	xdef	_FlashByte
3737  0007               _GBuffer:
3738  0007 000000000000  	ds.b	128
3739                     	xdef	_GBuffer
3740                     	xdef	_IapProc
3741                     	xdef	_FlashProgramBlock
3742                     	xdef	_FlashEraseBlock
3743                     	xdef	_FlashEraseByte
3744                     	xdef	_FlashReadWord
3745                     	xdef	_FlashReadByte
3746                     	xdef	_FlashWriteWord
3747                     	xdef	_FlashWriteByte
3748                     	xdef	_FlashWaitForLastOperation
3749                     	xdef	_FlashLock
3750                     	xdef	_FlashUnlock
3751                     	xdef	_FlashSetProgrammingTime
3752                     	xdef	_FlashWaitForEepromOperation
3753                     	xdef	_EepromLoad
3754                     	xdef	_EepromSave
3755                     	xdef	_EepromUnlock
3756                     	xref.b	c_x
3776                     	xref	c_lgadd
3777                     	xref	c_cmulx
3778                     	xref	c_fltor
3779                     	xref	c_ltor
3780                     	end
