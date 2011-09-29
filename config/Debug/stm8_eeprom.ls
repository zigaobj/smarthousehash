   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2452                     .const:	section	.text
2453  0000               _UniqueID:
2454  0000 48cd          	dc.w	18637
2486                     ; 12 void FlashWaitForEepromOperation(void)
2486                     ; 13 {
2487                     	switch	.text
2488  0000               f_FlashWaitForEepromOperation:
2492  0000 2004          	jra	L5641
2493  0002               L3641:
2494                     ; 15     while(!(FLASH.IAPSR & FLASH_IAPSR_EOP))CLEAR_WATCHDOG; //等待写入FLASH完成
2496  0002 357f50d1      	mov	_WWDG,#127
2497  0006               L5641:
2500  0006 c6505f        	ld	a,_FLASH+5
2501  0009 a504          	bcp	a,#4
2502  000b 27f5          	jreq	L3641
2503                     ; 16 }
2507  000d 87            	retf
2565                     ; 26 void FlashSetProgrammingTime(FLASH_ProgramTime_TypeDef ProgTime)
2565                     ; 27 {
2566                     	switch	.text
2567  000e               f_FlashSetProgrammingTime:
2571                     ; 28     FLASH.CR1 &= (u8)(~FLASH_CR1_FIX);
2573  000e 7211505a      	bres	_FLASH,#0
2574                     ; 29     FLASH.CR1 |= (u8)ProgTime;
2576  0012 ca505a        	or	a,_FLASH
2577  0015 c7505a        	ld	_FLASH,a
2578                     ; 30 }
2581  0018 87            	retf
2636                     ; 40 void FlashUnlock(FlashType MemType)
2636                     ; 41 {
2637                     	switch	.text
2638  0019               f_FlashUnlock:
2640  0019 88            	push	a
2641       00000000      OFST:	set	0
2644                     ; 42     if(FLASH_CODE==MemType)
2646  001a a101          	cp	a,#1
2647  001c 260a          	jrne	L5451
2648                     ; 44         FLASH.PUKR=FLASH_RASS_KEY1; //程序区 First 解锁码
2650  001e 35565062      	mov	_FLASH+8,#86
2651                     ; 45         FLASH.PUKR=FLASH_RASS_KEY2; //Second 解锁码
2653  0022 35ae5062      	mov	_FLASH+8,#174
2655  0026 200e          	jra	L7451
2656  0028               L5451:
2657                     ; 47     else if(FLASH_DATA==MemType)
2659  0028 7b01          	ld	a,(OFST+1,sp)
2660  002a a102          	cp	a,#2
2661  002c 2608          	jrne	L7451
2662                     ; 49         FLASH.DUKR=FLASH_RASS_KEY2; //数据区 First 解锁码 ,数据区解锁码与程序区相反
2664  002e 35ae5064      	mov	_FLASH+10,#174
2665                     ; 50         FLASH.DUKR=FLASH_RASS_KEY1; //Second 解锁码
2667  0032 35565064      	mov	_FLASH+10,#86
2668  0036               L7451:
2669                     ; 52 }
2672  0036 84            	pop	a
2673  0037 87            	retf
2708                     ; 62 void FlashLock(FlashType MemType)
2708                     ; 63 {
2709                     	switch	.text
2710  0038               f_FlashLock:
2712  0038 88            	push	a
2713       00000000      OFST:	set	0
2716                     ; 64     if(FLASH_CODE==MemType)
2718  0039 a101          	cp	a,#1
2719  003b 2606          	jrne	L1751
2720                     ; 66         FLASH.IAPSR &=(u8)(~FLASH_IAPSR_PUL); //FLASH程序区写保护使能
2722  003d 7213505f      	bres	_FLASH+5,#1
2724  0041 200a          	jra	L3751
2725  0043               L1751:
2726                     ; 68     else if(FLASH_DATA==MemType)
2728  0043 7b01          	ld	a,(OFST+1,sp)
2729  0045 a102          	cp	a,#2
2730  0047 2604          	jrne	L3751
2731                     ; 70         FLASH.IAPSR &=(u8)(~FLASH_IAPSR_DUL); //EEPROM写保护使能
2733  0049 7217505f      	bres	_FLASH+5,#3
2734  004d               L3751:
2735                     ; 72 }
2738  004d 84            	pop	a
2739  004e 87            	retf
2763                     ; 82 void EepromInit(void)
2763                     ; 83 {
2764                     	switch	.text
2765  004f               f_EepromInit:
2769                     ; 84     FlashUnlock(FLASH_DATA);
2771  004f a602          	ld	a,#2
2772  0051 8d190019      	callf	f_FlashUnlock
2774                     ; 85     FlashSetProgrammingTime(FLASH_PROGRAMTIME_STANDARD); //编程时间为 1/2 Tprog 或者 Tprog
2776  0055 4f            	clr	a
2777  0056 8d0e000e      	callf	f_FlashSetProgrammingTime
2779                     ; 86 }
2782  005a 87            	retf
2840                     ; 96 void MemeryCopy(u8 *DesMemery,u8 *SrcMemery,u8 NumOfByte)
2840                     ; 97 {
2841                     	switch	.text
2842  005b               f_MemeryCopy:
2844  005b 89            	pushw	x
2845  005c 88            	push	a
2846       00000001      OFST:	set	1
2849                     ; 99     for(i=0;i<NumOfByte;i++)
2851  005d 0f01          	clr	(OFST+0,sp)
2853  005f 201c          	jra	L1461
2854  0061               L5361:
2855                     ; 101         *(DesMemery+i)=*(SrcMemery+i);
2857  0061 7b02          	ld	a,(OFST+1,sp)
2858  0063 97            	ld	xl,a
2859  0064 7b03          	ld	a,(OFST+2,sp)
2860  0066 1b01          	add	a,(OFST+0,sp)
2861  0068 2401          	jrnc	L02
2862  006a 5c            	incw	x
2863  006b               L02:
2864  006b 02            	rlwa	x,a
2865  006c 89            	pushw	x
2866  006d 7b09          	ld	a,(OFST+8,sp)
2867  006f 97            	ld	xl,a
2868  0070 7b0a          	ld	a,(OFST+9,sp)
2869  0072 1b03          	add	a,(OFST+2,sp)
2870  0074 2401          	jrnc	L22
2871  0076 5c            	incw	x
2872  0077               L22:
2873  0077 02            	rlwa	x,a
2874  0078 f6            	ld	a,(x)
2875  0079 85            	popw	x
2876  007a f7            	ld	(x),a
2877                     ; 99     for(i=0;i<NumOfByte;i++)
2879  007b 0c01          	inc	(OFST+0,sp)
2880  007d               L1461:
2883  007d 7b01          	ld	a,(OFST+0,sp)
2884  007f 1109          	cp	a,(OFST+8,sp)
2885  0081 25de          	jrult	L5361
2886                     ; 103 }
2889  0083 5b03          	addw	sp,#3
2890  0085 87            	retf
2940                     ; 113 void CalculateSettingChkSum(void)
2940                     ; 114 {
2941                     	switch	.text
2942  0086               f_CalculateSettingChkSum:
2944  0086 5204          	subw	sp,#4
2945       00000004      OFST:	set	4
2948                     ; 115     u8 n=0;
2950  0088 7b04          	ld	a,(OFST+0,sp)
2951  008a 97            	ld	xl,a
2952                     ; 116     u8 checksum=0;
2954  008b 0f01          	clr	(OFST-3,sp)
2955                     ; 117     u8* PEAddress=(u8*)EEP_SETTING_ADDRESS;
2957  008d ae4000        	ldw	x,#16384
2958  0090 1f02          	ldw	(OFST-2,sp),x
2959                     ; 118     for(n=0;n<SETTING_BTYE_NUM-1;n++)
2961  0092 0f04          	clr	(OFST+0,sp)
2962  0094               L7661:
2963                     ; 120 		checksum+=*PEAddress;
2965  0094 1e02          	ldw	x,(OFST-2,sp)
2966  0096 7b01          	ld	a,(OFST-3,sp)
2967  0098 fb            	add	a,(x)
2968  0099 6b01          	ld	(OFST-3,sp),a
2969                     ; 121 		PEAddress++;
2971  009b 1e02          	ldw	x,(OFST-2,sp)
2972  009d 1c0001        	addw	x,#1
2973  00a0 1f02          	ldw	(OFST-2,sp),x
2974                     ; 118     for(n=0;n<SETTING_BTYE_NUM-1;n++)
2976  00a2 0c04          	inc	(OFST+0,sp)
2979  00a4 7b04          	ld	a,(OFST+0,sp)
2980  00a6 a13f          	cp	a,#63
2981  00a8 25ea          	jrult	L7661
2982                     ; 123 	checksum=~checksum;
2984  00aa 0301          	cpl	(OFST-3,sp)
2985                     ; 124 	SettingChkSum=checksum;
2987  00ac 7b01          	ld	a,(OFST-3,sp)
2988  00ae c7403f        	ld	_SettingChkSum,a
2989                     ; 125 }
2992  00b1 5b04          	addw	sp,#4
2993  00b3 87            	retf
3062                     ; 135 BoolT CheckSettingChkSum(void)
3062                     ; 136 {
3063                     	switch	.text
3064  00b4               f_CheckSettingChkSum:
3066  00b4 5204          	subw	sp,#4
3067       00000004      OFST:	set	4
3070                     ; 137     u8 n=0;
3072  00b6 7b04          	ld	a,(OFST+0,sp)
3073  00b8 97            	ld	xl,a
3074                     ; 138     u8 checksum=0;
3076  00b9 0f01          	clr	(OFST-3,sp)
3077                     ; 139     u8* PEAddress=(u8*)EEP_SETTING_ADDRESS;
3079  00bb ae4000        	ldw	x,#16384
3080  00be 1f02          	ldw	(OFST-2,sp),x
3081                     ; 140     for(n=0;n<SETTING_BTYE_NUM;n++)
3083  00c0 0f04          	clr	(OFST+0,sp)
3084  00c2               L7271:
3085                     ; 142         checksum+=*PEAddress;
3087  00c2 1e02          	ldw	x,(OFST-2,sp)
3088  00c4 7b01          	ld	a,(OFST-3,sp)
3089  00c6 fb            	add	a,(x)
3090  00c7 6b01          	ld	(OFST-3,sp),a
3091                     ; 143         PEAddress++;
3093  00c9 1e02          	ldw	x,(OFST-2,sp)
3094  00cb 1c0001        	addw	x,#1
3095  00ce 1f02          	ldw	(OFST-2,sp),x
3096                     ; 140     for(n=0;n<SETTING_BTYE_NUM;n++)
3098  00d0 0c04          	inc	(OFST+0,sp)
3101  00d2 7b04          	ld	a,(OFST+0,sp)
3102  00d4 a140          	cp	a,#64
3103  00d6 25ea          	jrult	L7271
3104                     ; 145     if(checksum==0xff)
3106  00d8 7b01          	ld	a,(OFST-3,sp)
3107  00da a1ff          	cp	a,#255
3108  00dc 2604          	jrne	L5371
3109                     ; 147         return TRUE;
3111  00de a601          	ld	a,#1
3113  00e0 2001          	jra	L03
3114  00e2               L5371:
3115                     ; 149     return FALSE;
3117  00e2 4f            	clr	a
3119  00e3               L03:
3121  00e3 5b04          	addw	sp,#4
3122  00e5 87            	retf
3146                     	xdef	f_CheckSettingChkSum
3147                     	xdef	f_CalculateSettingChkSum
3148                     	xdef	f_MemeryCopy
3149                     	xdef	f_EepromInit
3150                     	xdef	f_FlashLock
3151                     	xdef	f_FlashUnlock
3152                     	xdef	f_FlashSetProgrammingTime
3153                     	xdef	f_FlashWaitForEepromOperation
3154                     	xdef	_UniqueID
3173                     	end
