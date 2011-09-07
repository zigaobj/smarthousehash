   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2355                     ; 3 void GPIOInit(void)
2355                     ; 4 {
2357                     	switch	.text
2358  0000               _GPIOInit:
2362                     ; 5 	GPIOA.DDR=0x00; //
2364  0000 725f5002      	clr	_GPIOA+2
2365                     ; 6 	GPIOA.CR1=0x00;
2367  0004 725f5003      	clr	_GPIOA+3
2368                     ; 7 	GPIOA.CR2=0x00;
2370  0008 725f5004      	clr	_GPIOA+4
2371                     ; 8 	GPIOA.ODR.byte=0x00;
2373  000c 725f5000      	clr	_GPIOA
2374                     ; 10 	GPIOB.DDR=0x00; //bit0=CAN_WAKE
2376  0010 725f5007      	clr	_GPIOB+2
2377                     ; 11 	GPIOB.CR1=0x00;
2379  0014 725f5008      	clr	_GPIOB+3
2380                     ; 12 	GPIOB.CR2=0x00;
2382  0018 725f5009      	clr	_GPIOB+4
2383                     ; 13 	GPIOB.ODR.byte=0x00;
2385  001c 725f5005      	clr	_GPIOB
2386                     ; 15 	GPIOC.DDR=0xFE; //
2388  0020 35fe500c      	mov	_GPIOC+2,#254
2389                     ; 16 	GPIOC.CR1=0xFE;
2391  0024 35fe500d      	mov	_GPIOC+3,#254
2392                     ; 17 	GPIOC.CR2=0x00;
2394  0028 725f500e      	clr	_GPIOC+4
2395                     ; 18 	GPIOC.ODR.byte=0x00;
2397  002c 725f500a      	clr	_GPIOC
2398                     ; 20 	GPIOD.DDR=0x10; //bit2=BEEP_CTL
2400  0030 35105011      	mov	_GPIOD+2,#16
2401                     ; 21 	GPIOD.CR1=0x10;
2403  0034 35105012      	mov	_GPIOD+3,#16
2404                     ; 22 	GPIOD.CR2=0x00;
2406  0038 725f5013      	clr	_GPIOD+4
2407                     ; 23 	GPIOD.ODR.byte=0x00;
2409  003c 725f500f      	clr	_GPIOD
2410                     ; 25 	GPIOE.DDR=0x08; //bit3=CAN_WAKE
2412  0040 35085016      	mov	_GPIOE+2,#8
2413                     ; 26 	GPIOE.CR1=0x08;
2415  0044 35085017      	mov	_GPIOE+3,#8
2416                     ; 27 	GPIOE.CR2=0x00;
2418  0048 725f5018      	clr	_GPIOE+4
2419                     ; 28 	GPIOE.ODR.byte=0x00;
2421  004c 725f5014      	clr	_GPIOE
2422                     ; 30 	GPIOF.DDR=0x00; //
2424  0050 725f501b      	clr	_GPIOF+2
2425                     ; 31 	GPIOF.CR1=0x00;
2427  0054 725f501c      	clr	_GPIOF+3
2428                     ; 32 	GPIOF.CR2=0x00;
2430  0058 725f501d      	clr	_GPIOF+4
2431                     ; 33 	GPIOF.ODR.byte=0x00;
2433  005c 725f5019      	clr	_GPIOF
2434                     ; 35 	GPIOG.DDR=0x00; //
2436  0060 725f5020      	clr	_GPIOG+2
2437                     ; 36 	GPIOG.CR1=0x00;
2439  0064 725f5021      	clr	_GPIOG+3
2440                     ; 37 	GPIOG.CR2=0x00;
2442  0068 725f5022      	clr	_GPIOG+4
2443                     ; 38 	GPIOG.ODR.byte=0x00;
2445  006c 725f501e      	clr	_GPIOG
2446                     ; 40 	GPIOH.DDR=0x00; //
2448  0070 725f5025      	clr	_GPIOH+2
2449                     ; 41 	GPIOH.CR1=0x00;
2451  0074 725f5026      	clr	_GPIOH+3
2452                     ; 42 	GPIOH.CR2=0x00;
2454  0078 725f5027      	clr	_GPIOH+4
2455                     ; 43 	GPIOH.ODR.byte=0x00;
2457  007c 725f5023      	clr	_GPIOH
2458                     ; 45 	GPIOI.DDR=0x00; //
2460  0080 725f502a      	clr	_GPIOI+2
2461                     ; 46 	GPIOI.CR1=0x00;
2463  0084 725f502b      	clr	_GPIOI+3
2464                     ; 47 	GPIOI.CR2=0x00;
2466  0088 725f502c      	clr	_GPIOI+4
2467                     ; 48 	GPIOI.ODR.byte=0x00;
2469  008c 725f5028      	clr	_GPIOI
2470                     ; 49 }
2473  0090 81            	ret
2486                     	xdef	_GPIOInit
2505                     	end
