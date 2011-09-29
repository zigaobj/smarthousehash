   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2482                     ; 13 void FlashWaitForLastOperation(void)
2482                     ; 14 {
2483                     .iapcode:	section	.text
2484  0000               f_FlashWaitForLastOperation:
2488  0000 2004          	jra	L5641
2489  0002               L3641:
2490                     ; 16     while(!(FLASH.IAPSR & FLASH_IAPSR_EOP))CLEAR_WATCHDOG; //等待写入FLASH完成
2492  0002 357f50d1      	mov	_WWDG,#127
2493  0006               L5641:
2496  0006 c6505f        	ld	a,_FLASH+5
2497  0009 a504          	bcp	a,#4
2498  000b 27f5          	jreq	L3641
2499                     ; 17 }
2503  000d 87            	retf
2542                     ; 27 void FlashWriteByte(u32 Address,u8 Data)
2542                     ; 28 {
2543                     	switch	.iapcode
2544  000e               f_FlashWriteByte:
2546       00000000      OFST:	set	0
2549                     ; 29     *((@far u8*)Address) = Data; //写一个字节
2551  000e 7b08          	ld	a,(OFST+8,sp)
2552  0010 88            	push	a
2553  0011 7b06          	ld	a,(OFST+6,sp)
2554  0013 b700          	ld	c_x,a
2555  0015 1e07          	ldw	x,(OFST+7,sp)
2556  0017 84            	pop	a
2557  0018 bf01          	ldw	c_x+1,x
2558  001a 92bd0000      	ldf	[c_x.e],a
2559                     ; 30     FlashWaitForLastOperation(); //等待写操作结束
2561  001e 8d000000      	callf	f_FlashWaitForLastOperation
2563                     ; 31 }
2566  0022 87            	retf
2606                     ; 41 void FlashWriteWord(u32 Address,u32 Data32)
2606                     ; 42 {
2607                     	switch	.iapcode
2608  0023               f_FlashWriteWord:
2610       00000000      OFST:	set	0
2613                     ; 43     FLASH.CR2 |=FLASH_CR2_WPRG;
2615  0023 721c505b      	bset	_FLASH+1,#6
2616                     ; 44     FLASH.NCR2 &=(u8)(~FLASH_NCR2_NWPRG);
2618  0027 721d505c      	bres	_FLASH+2,#6
2619                     ; 46     *(((@far u8*)Address)+0) =BYTE_3(Data32); //写一个字节
2621  002b 7b08          	ld	a,(OFST+8,sp)
2622  002d 88            	push	a
2623  002e 7b06          	ld	a,(OFST+6,sp)
2624  0030 b700          	ld	c_x,a
2625  0032 1e07          	ldw	x,(OFST+7,sp)
2626  0034 84            	pop	a
2627  0035 bf01          	ldw	c_x+1,x
2628  0037 92bd0000      	ldf	[c_x.e],a
2629                     ; 47     *(((@far u8*)Address)+1) =BYTE_2(Data32); //写一个字节
2631  003b 7b09          	ld	a,(OFST+9,sp)
2632  003d 88            	push	a
2633  003e 7b06          	ld	a,(OFST+6,sp)
2634  0040 b700          	ld	c_x,a
2635  0042 1e07          	ldw	x,(OFST+7,sp)
2636  0044 84            	pop	a
2637  0045 90ae0001      	ldw	y,#1
2638  0049 bf01          	ldw	c_x+1,x
2639  004b 93            	ldw	x,y
2640  004c 92a70000      	ldf	([c_x.e],x),a
2641                     ; 48     *(((@far u8*)Address)+2) =BYTE_1(Data32); //写一个字节
2643  0050 7b0a          	ld	a,(OFST+10,sp)
2644  0052 88            	push	a
2645  0053 7b06          	ld	a,(OFST+6,sp)
2646  0055 b700          	ld	c_x,a
2647  0057 1e07          	ldw	x,(OFST+7,sp)
2648  0059 84            	pop	a
2649  005a 90ae0002      	ldw	y,#2
2650  005e bf01          	ldw	c_x+1,x
2651  0060 93            	ldw	x,y
2652  0061 92a70000      	ldf	([c_x.e],x),a
2653                     ; 49     *(((@far u8*)Address)+3) =BYTE_0(Data32); //写一个字节
2655  0065 7b0b          	ld	a,(OFST+11,sp)
2656  0067 a4ff          	and	a,#255
2657  0069 88            	push	a
2658  006a 7b06          	ld	a,(OFST+6,sp)
2659  006c b700          	ld	c_x,a
2660  006e 1e07          	ldw	x,(OFST+7,sp)
2661  0070 84            	pop	a
2662  0071 90ae0003      	ldw	y,#3
2663  0075 bf01          	ldw	c_x+1,x
2664  0077 93            	ldw	x,y
2665  0078 92a70000      	ldf	([c_x.e],x),a
2666                     ; 50     FlashWaitForLastOperation(); //等待写操作结束
2668  007c 8d000000      	callf	f_FlashWaitForLastOperation
2670                     ; 51 }
2673  0080 87            	retf
2704                     ; 61 u8 FlashReadByte(u32 Address)
2704                     ; 62 {
2705                     	switch	.iapcode
2706  0081               f_FlashReadByte:
2708       00000000      OFST:	set	0
2711                     ; 63     return(*((@far u8*)Address)); //读一个字节
2713  0081 7b05          	ld	a,(OFST+5,sp)
2714  0083 b700          	ld	c_x,a
2715  0085 1e06          	ldw	x,(OFST+6,sp)
2716  0087 bf01          	ldw	c_x+1,x
2717  0089 92bc0000      	ldf	a,[c_x.e]
2720  008d 87            	retf
2751                     ; 74 u32 FlashReadWord(u32 Address)
2751                     ; 75 {
2752                     	switch	.iapcode
2753  008e               f_FlashReadWord:
2755       00000000      OFST:	set	0
2758                     ; 76     return(*((@far u32 *)Address)); //读一个字
2760  008e 7b05          	ld	a,(OFST+5,sp)
2761  0090 b700          	ld	c_x,a
2762  0092 1e06          	ldw	x,(OFST+6,sp)
2763  0094 8d000000      	callf	d_fltor
2767  0098 87            	retf
2799                     ; 87 void FlashEraseByte(u32 Address)
2799                     ; 88 {
2800                     	switch	.iapcode
2801  0099               f_FlashEraseByte:
2803       00000000      OFST:	set	0
2806                     ; 89     *((@far u8*)Address) =0x00; //擦除一个字节
2808  0099 7b05          	ld	a,(OFST+5,sp)
2809  009b b700          	ld	c_x,a
2810  009d 1e06          	ldw	x,(OFST+6,sp)
2811  009f bf01          	ldw	c_x+1,x
2812  00a1 4f            	clr	a
2813  00a2 92bd0000      	ldf	[c_x.e],a
2814                     ; 90     FlashWaitForLastOperation(); //等待写操作结束
2816  00a6 8d000000      	callf	f_FlashWaitForLastOperation
2818                     ; 91 }
2821  00aa 87            	retf
2898                     ; 101 void FlashEraseBlock(u16 BlockNum, FlashType MemType)
2898                     ; 102 {
2899                     	switch	.iapcode
2900  00ab               f_FlashEraseBlock:
2902  00ab 89            	pushw	x
2903  00ac 5205          	subw	sp,#5
2904       00000005      OFST:	set	5
2907                     ; 104     u32 StartAddress = 0;
2909  00ae ae0000        	ldw	x,#0
2910  00b1 1f03          	ldw	(OFST-2,sp),x
2911  00b3 ae0000        	ldw	x,#0
2912  00b6 1f01          	ldw	(OFST-4,sp),x
2913                     ; 105     if(FLASH_CODE==MemType)
2915  00b8 7b0b          	ld	a,(OFST+6,sp)
2916  00ba a101          	cp	a,#1
2917  00bc 260c          	jrne	L5261
2918                     ; 107         StartAddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2920  00be ae8000        	ldw	x,#32768
2921  00c1 1f03          	ldw	(OFST-2,sp),x
2922  00c3 ae0000        	ldw	x,#0
2923  00c6 1f01          	ldw	(OFST-4,sp),x
2925  00c8 2010          	jra	L7261
2926  00ca               L5261:
2927                     ; 109     else if(FLASH_DATA==MemType)
2929  00ca 7b0b          	ld	a,(OFST+6,sp)
2930  00cc a102          	cp	a,#2
2931  00ce 260a          	jrne	L7261
2932                     ; 111         StartAddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2934  00d0 ae4000        	ldw	x,#16384
2935  00d3 1f03          	ldw	(OFST-2,sp),x
2936  00d5 ae0000        	ldw	x,#0
2937  00d8 1f01          	ldw	(OFST-4,sp),x
2938  00da               L7261:
2939                     ; 114     StartAddress =StartAddress + ((u32)BlockNum *FLASH_BLOCK_SIZE);
2941  00da 1e06          	ldw	x,(OFST+1,sp)
2942  00dc a680          	ld	a,#128
2943  00de 8d000000      	callf	d_cmulx
2945  00e2 96            	ldw	x,sp
2946  00e3 1c0001        	addw	x,#OFST-4
2947  00e6 8d000000      	callf	d_lgadd
2949                     ; 115     FLASH.CR2  |= FLASH_CR2_ERASE;
2951  00ea 721a505b      	bset	_FLASH+1,#5
2952                     ; 116     FLASH.NCR2 &= (u8)(~FLASH_NCR2_NERASE);
2954  00ee 721b505c      	bres	_FLASH+2,#5
2955                     ; 117     for (i = 0; i <FLASH_BLOCK_SIZE; i++)
2957  00f2 0f05          	clr	(OFST+0,sp)
2958  00f4               L3361:
2959                     ; 119         *(((@far u8*)StartAddress)+i) =0x00;
2961  00f4 7b02          	ld	a,(OFST-3,sp)
2962  00f6 b700          	ld	c_x,a
2963  00f8 1e03          	ldw	x,(OFST-2,sp)
2964  00fa 7b05          	ld	a,(OFST+0,sp)
2965  00fc 905f          	clrw	y
2966  00fe 9097          	ld	yl,a
2967  0100 bf01          	ldw	c_x+1,x
2968  0102 93            	ldw	x,y
2969  0103 4f            	clr	a
2970  0104 92a70000      	ldf	([c_x.e],x),a
2971                     ; 117     for (i = 0; i <FLASH_BLOCK_SIZE; i++)
2973  0108 0c05          	inc	(OFST+0,sp)
2976  010a 7b05          	ld	a,(OFST+0,sp)
2977  010c a180          	cp	a,#128
2978  010e 25e4          	jrult	L3361
2979                     ; 121     FlashWaitForLastOperation(); //等待写操作结束
2981  0110 8d000000      	callf	f_FlashWaitForLastOperation
2983                     ; 122 }
2986  0114 5b07          	addw	sp,#7
2987  0116 87            	retf
3086                     ; 132 void FlashProgramBlock(u16 BlockNum, FlashType MemType, FLASH_ProgramMode_TypeDef ProgMode, u8 *Buffer)
3086                     ; 133 {
3087                     	switch	.iapcode
3088  0117               f_FlashProgramBlock:
3090  0117 89            	pushw	x
3091  0118 5206          	subw	sp,#6
3092       00000006      OFST:	set	6
3095                     ; 134     u16 i = 0;
3097  011a 1e05          	ldw	x,(OFST-1,sp)
3098                     ; 135     u32 StartAddress = 0;
3100  011c 96            	ldw	x,sp
3101  011d 1c0001        	addw	x,#OFST-5
3102  0120 8d000000      	callf	d_ltor
3104                     ; 137     if (FLASH_CODE==MemType)
3106  0124 7b0c          	ld	a,(OFST+6,sp)
3107  0126 a101          	cp	a,#1
3108  0128 260c          	jrne	L5071
3109                     ; 139         StartAddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
3111  012a ae8000        	ldw	x,#32768
3112  012d 1f03          	ldw	(OFST-3,sp),x
3113  012f ae0000        	ldw	x,#0
3114  0132 1f01          	ldw	(OFST-5,sp),x
3116  0134 200a          	jra	L7071
3117  0136               L5071:
3118                     ; 143         StartAddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
3120  0136 ae4000        	ldw	x,#16384
3121  0139 1f03          	ldw	(OFST-3,sp),x
3122  013b ae0000        	ldw	x,#0
3123  013e 1f01          	ldw	(OFST-5,sp),x
3124  0140               L7071:
3125                     ; 147     StartAddress = StartAddress + ((u32)BlockNum *FLASH_BLOCK_SIZE);
3127  0140 1e07          	ldw	x,(OFST+1,sp)
3128  0142 a680          	ld	a,#128
3129  0144 8d000000      	callf	d_cmulx
3131  0148 96            	ldw	x,sp
3132  0149 1c0001        	addw	x,#OFST-5
3133  014c 8d000000      	callf	d_lgadd
3135                     ; 150     if (FLASH_PROGRAMMODE_STANDARD==ProgMode)
3137  0150 0d0d          	tnz	(OFST+7,sp)
3138  0152 260a          	jrne	L1171
3139                     ; 153         FLASH.CR2 |= FLASH_CR2_PRG;
3141  0154 7210505b      	bset	_FLASH+1,#0
3142                     ; 154         FLASH.NCR2 &= (u8)(~FLASH_NCR2_NPRG);
3144  0158 7211505c      	bres	_FLASH+2,#0
3146  015c 2008          	jra	L3171
3147  015e               L1171:
3148                     ; 159         FLASH.CR2 |= FLASH_CR2_FPRG;
3150  015e 7218505b      	bset	_FLASH+1,#4
3151                     ; 160         FLASH.NCR2 &= (u8)(~FLASH_NCR2_NFPRG);
3153  0162 7219505c      	bres	_FLASH+2,#4
3154  0166               L3171:
3155                     ; 164     for (i = 0; i <FLASH_BLOCK_SIZE; i++)
3157  0166 5f            	clrw	x
3158  0167 1f05          	ldw	(OFST-1,sp),x
3159  0169               L5171:
3160                     ; 166         *(((@far u8*)StartAddress)+i) =((u8)(Buffer[i]));
3162  0169 1e0e          	ldw	x,(OFST+8,sp)
3163  016b 72fb05        	addw	x,(OFST-1,sp)
3164  016e f6            	ld	a,(x)
3165  016f 88            	push	a
3166  0170 7b03          	ld	a,(OFST-3,sp)
3167  0172 b700          	ld	c_x,a
3168  0174 1e04          	ldw	x,(OFST-2,sp)
3169  0176 84            	pop	a
3170  0177 1605          	ldw	y,(OFST-1,sp)
3171  0179 bf01          	ldw	c_x+1,x
3172  017b 93            	ldw	x,y
3173  017c 92a70000      	ldf	([c_x.e],x),a
3174                     ; 164     for (i = 0; i <FLASH_BLOCK_SIZE; i++)
3176  0180 1e05          	ldw	x,(OFST-1,sp)
3177  0182 1c0001        	addw	x,#1
3178  0185 1f05          	ldw	(OFST-1,sp),x
3181  0187 1e05          	ldw	x,(OFST-1,sp)
3182  0189 a30080        	cpw	x,#128
3183  018c 25db          	jrult	L5171
3184                     ; 168     FlashWaitForLastOperation(); //等待写操作结束
3186  018e 8d000000      	callf	f_FlashWaitForLastOperation
3188                     ; 169 }
3191  0192 5b08          	addw	sp,#8
3192  0194 87            	retf
3204                     	xdef	f_FlashProgramBlock
3205                     	xdef	f_FlashEraseBlock
3206                     	xdef	f_FlashEraseByte
3207                     	xdef	f_FlashReadWord
3208                     	xdef	f_FlashReadByte
3209                     	xdef	f_FlashWriteWord
3210                     	xdef	f_FlashWriteByte
3211                     	xdef	f_FlashWaitForLastOperation
3212                     	xref.b	c_x
3231                     	xref	d_ltor
3232                     	xref	d_lgadd
3233                     	xref	d_cmulx
3234                     	xref	d_fltor
3235                     	end
