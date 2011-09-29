   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2488                     ; 3 void GPIOInit(void)
2488                     ; 4 {
2489                     	switch	.text
2490  0000               f_GPIOInit:
2494                     ; 5 	GPIOA.DDR=0x00; //
2496  0000 725f5002      	clr	_GPIOA+2
2497                     ; 6 	GPIOA.CR1=0x00;
2499  0004 725f5003      	clr	_GPIOA+3
2500                     ; 7 	GPIOA.CR2=0x00;
2502  0008 725f5004      	clr	_GPIOA+4
2503                     ; 8 	GPIOA.ODR.byte=0x00;
2505  000c 725f5000      	clr	_GPIOA
2506                     ; 10 	GPIOB.DDR=0x00; //bit0=CAN_WAKE
2508  0010 725f5007      	clr	_GPIOB+2
2509                     ; 11 	GPIOB.CR1=0x00;
2511  0014 725f5008      	clr	_GPIOB+3
2512                     ; 12 	GPIOB.CR2=0x00;
2514  0018 725f5009      	clr	_GPIOB+4
2515                     ; 13 	GPIOB.ODR.byte=0x00;
2517  001c 725f5005      	clr	_GPIOB
2518                     ; 15 	GPIOC.DDR=0xFE; //
2520  0020 35fe500c      	mov	_GPIOC+2,#254
2521                     ; 16 	GPIOC.CR1=0xFE;
2523  0024 35fe500d      	mov	_GPIOC+3,#254
2524                     ; 17 	GPIOC.CR2=0x00;
2526  0028 725f500e      	clr	_GPIOC+4
2527                     ; 18 	GPIOC.ODR.byte=0x00;
2529  002c 725f500a      	clr	_GPIOC
2530                     ; 20 	GPIOD.DDR=0x10; //bit2=BEEP_CTL
2532  0030 35105011      	mov	_GPIOD+2,#16
2533                     ; 21 	GPIOD.CR1=0x10;
2535  0034 35105012      	mov	_GPIOD+3,#16
2536                     ; 22 	GPIOD.CR2=0x00;
2538  0038 725f5013      	clr	_GPIOD+4
2539                     ; 23 	GPIOD.ODR.byte=0x00;
2541  003c 725f500f      	clr	_GPIOD
2542                     ; 25 	GPIOE.DDR=0x08; //bit3=CAN_WAKE
2544  0040 35085016      	mov	_GPIOE+2,#8
2545                     ; 26 	GPIOE.CR1=0x08;
2547  0044 35085017      	mov	_GPIOE+3,#8
2548                     ; 27 	GPIOE.CR2=0x00;
2550  0048 725f5018      	clr	_GPIOE+4
2551                     ; 28 	GPIOE.ODR.byte=0x00;
2553  004c 725f5014      	clr	_GPIOE
2554                     ; 30 	GPIOF.DDR=0x00; //
2556  0050 725f501b      	clr	_GPIOF+2
2557                     ; 31 	GPIOF.CR1=0x00;
2559  0054 725f501c      	clr	_GPIOF+3
2560                     ; 32 	GPIOF.CR2=0x00;
2562  0058 725f501d      	clr	_GPIOF+4
2563                     ; 33 	GPIOF.ODR.byte=0x00;
2565  005c 725f5019      	clr	_GPIOF
2566                     ; 35 	GPIOG.DDR=0x00; //
2568  0060 725f5020      	clr	_GPIOG+2
2569                     ; 36 	GPIOG.CR1=0x00;
2571  0064 725f5021      	clr	_GPIOG+3
2572                     ; 37 	GPIOG.CR2=0x00;
2574  0068 725f5022      	clr	_GPIOG+4
2575                     ; 38 	GPIOG.ODR.byte=0x00;
2577  006c 725f501e      	clr	_GPIOG
2578                     ; 40 	GPIOH.DDR=0x00; //
2580  0070 725f5025      	clr	_GPIOH+2
2581                     ; 41 	GPIOH.CR1=0x00;
2583  0074 725f5026      	clr	_GPIOH+3
2584                     ; 42 	GPIOH.CR2=0x00;
2586  0078 725f5027      	clr	_GPIOH+4
2587                     ; 43 	GPIOH.ODR.byte=0x00;
2589  007c 725f5023      	clr	_GPIOH
2590                     ; 45 	GPIOI.DDR=0x00; //
2592  0080 725f502a      	clr	_GPIOI+2
2593                     ; 46 	GPIOI.CR1=0x00;
2595  0084 725f502b      	clr	_GPIOI+3
2596                     ; 47 	GPIOI.CR2=0x00;
2598  0088 725f502c      	clr	_GPIOI+4
2599                     ; 48 	GPIOI.ODR.byte=0x00;
2601  008c 725f5028      	clr	_GPIOI
2602                     ; 49 }
2605  0090 87            	retf
2617                     	xdef	f_GPIOInit
2636                     	end
