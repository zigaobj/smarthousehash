   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2355                     ; 3 void GPIOInit(void)
2355                     ; 4 {
2356                     	switch	.text
2357  0000               f_GPIOInit:
2361                     ; 5 	GPIOA.DDR=0x00; //
2363  0000 725f5002      	clr	_GPIOA+2
2364                     ; 6 	GPIOA.CR1=0x00;
2366  0004 725f5003      	clr	_GPIOA+3
2367                     ; 7 	GPIOA.CR2=0x00;
2369  0008 725f5004      	clr	_GPIOA+4
2370                     ; 8 	GPIOA.ODR.byte=0x00;
2372  000c 725f5000      	clr	_GPIOA
2373                     ; 10 	GPIOB.DDR=0x00; //bit0=CAN_WAKE
2375  0010 725f5007      	clr	_GPIOB+2
2376                     ; 11 	GPIOB.CR1=0x00;
2378  0014 725f5008      	clr	_GPIOB+3
2379                     ; 12 	GPIOB.CR2=0x00;
2381  0018 725f5009      	clr	_GPIOB+4
2382                     ; 13 	GPIOB.ODR.byte=0x00;
2384  001c 725f5005      	clr	_GPIOB
2385                     ; 15 	GPIOC.DDR=0xFE; //
2387  0020 35fe500c      	mov	_GPIOC+2,#254
2388                     ; 16 	GPIOC.CR1=0xFE;
2390  0024 35fe500d      	mov	_GPIOC+3,#254
2391                     ; 17 	GPIOC.CR2=0x00;
2393  0028 725f500e      	clr	_GPIOC+4
2394                     ; 18 	GPIOC.ODR.byte=0x00;
2396  002c 725f500a      	clr	_GPIOC
2397                     ; 20 	GPIOD.DDR=0x10; //bit2=BEEP_CTL
2399  0030 35105011      	mov	_GPIOD+2,#16
2400                     ; 21 	GPIOD.CR1=0x10;
2402  0034 35105012      	mov	_GPIOD+3,#16
2403                     ; 22 	GPIOD.CR2=0x00;
2405  0038 725f5013      	clr	_GPIOD+4
2406                     ; 23 	GPIOD.ODR.byte=0x00;
2408  003c 725f500f      	clr	_GPIOD
2409                     ; 25 	GPIOE.DDR=0x08; //bit3=CAN_WAKE
2411  0040 35085016      	mov	_GPIOE+2,#8
2412                     ; 26 	GPIOE.CR1=0x08;
2414  0044 35085017      	mov	_GPIOE+3,#8
2415                     ; 27 	GPIOE.CR2=0x00;
2417  0048 725f5018      	clr	_GPIOE+4
2418                     ; 28 	GPIOE.ODR.byte=0x00;
2420  004c 725f5014      	clr	_GPIOE
2421                     ; 30 	GPIOF.DDR=0x00; //
2423  0050 725f501b      	clr	_GPIOF+2
2424                     ; 31 	GPIOF.CR1=0x00;
2426  0054 725f501c      	clr	_GPIOF+3
2427                     ; 32 	GPIOF.CR2=0x00;
2429  0058 725f501d      	clr	_GPIOF+4
2430                     ; 33 	GPIOF.ODR.byte=0x00;
2432  005c 725f5019      	clr	_GPIOF
2433                     ; 35 	GPIOG.DDR=0x00; //
2435  0060 725f5020      	clr	_GPIOG+2
2436                     ; 36 	GPIOG.CR1=0x00;
2438  0064 725f5021      	clr	_GPIOG+3
2439                     ; 37 	GPIOG.CR2=0x00;
2441  0068 725f5022      	clr	_GPIOG+4
2442                     ; 38 	GPIOG.ODR.byte=0x00;
2444  006c 725f501e      	clr	_GPIOG
2445                     ; 40 	GPIOH.DDR=0x00; //
2447  0070 725f5025      	clr	_GPIOH+2
2448                     ; 41 	GPIOH.CR1=0x00;
2450  0074 725f5026      	clr	_GPIOH+3
2451                     ; 42 	GPIOH.CR2=0x00;
2453  0078 725f5027      	clr	_GPIOH+4
2454                     ; 43 	GPIOH.ODR.byte=0x00;
2456  007c 725f5023      	clr	_GPIOH
2457                     ; 45 	GPIOI.DDR=0x00; //
2459  0080 725f502a      	clr	_GPIOI+2
2460                     ; 46 	GPIOI.CR1=0x00;
2462  0084 725f502b      	clr	_GPIOI+3
2463                     ; 47 	GPIOI.CR2=0x00;
2465  0088 725f502c      	clr	_GPIOI+4
2466                     ; 48 	GPIOI.ODR.byte=0x00;
2468  008c 725f5028      	clr	_GPIOI
2469                     ; 49 }
2472  0090 87            	retf
2484                     	xdef	f_GPIOInit
2503                     	end
