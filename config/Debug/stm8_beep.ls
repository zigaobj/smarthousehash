   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.3 - 19 Nov 2007
2347                     ; 3 void BeepInit(void)
2347                     ; 4 {
2348                     	switch	.text
2349  0000               f_BeepInit:
2353                     ; 5     BEEP.CSR =BEEP_CSR_BEEPDIV&0x15; //设置BEEP分频比
2355  0000 351550f3      	mov	_BEEP,#21
2356                     ; 6     BEEP.CSR |=BEEP_CSR_BEEPSEL&0x00;
2358  0004 c650f3        	ld	a,_BEEP
2359  0007 97            	ld	xl,a
2360                     ; 7 }
2363  0008 87            	retf
2365                     	switch	.data
2366  0000               L5731_BeepTimeOn:
2367  0000 00            	dc.b	0
2368  0001               L7731_BeepTimeOff:
2369  0001 00            	dc.b	0
2410                     ; 18 void BeepManage(void)
2410                     ; 19 {
2411                     	switch	.text
2412  0009               f_BeepManage:
2416                     ; 21     switch(BeepState) //该全局变量控制BEEP的状态
2418  0009 c60000        	ld	a,_BeepState
2420                     ; 56         case BEEP_IDLE:
2420                     ; 57         default:
2420                     ; 58             break;
2421  000c 4d            	tnz	a
2422  000d 270f          	jreq	L1041
2423  000f 4a            	dec	a
2424  0010 271a          	jreq	L3041
2425  0012 a002          	sub	a,#2
2426  0014 2730          	jreq	L5041
2427  0016 4a            	dec	a
2428  0017 2747          	jreq	L7041
2429  0019 4a            	dec	a
2430  001a 2760          	jreq	L1141
2431  001c 2078          	jra	L5341
2432  001e               L1041:
2433                     ; 23         case BEEP_OFF:
2433                     ; 24             BeepTimeOn=0;
2435  001e 725f0000      	clr	L5731_BeepTimeOn
2436                     ; 25             BeepTimeOff=0;
2438  0022 725f0001      	clr	L7731_BeepTimeOff
2439                     ; 26             BeepState=BEEP_IDLE;
2441  0026 35020000      	mov	_BeepState,#2
2442                     ; 27             break;
2444  002a 206a          	jra	L5341
2445  002c               L3041:
2446                     ; 28         case BEEP_ON:
2446                     ; 29             BeepTimeOn=T4MS200MS;
2448  002c 35320000      	mov	L5731_BeepTimeOn,#50
2449                     ; 30             BeepTimeOff=0;
2451  0030 725f0001      	clr	L7731_BeepTimeOff
2452                     ; 31             BEEP.CSR =(BEEP.CSR&(~BEEP_CSR_BEEPSEL))|BEEP_CSR_BEEPSEL_1K;
2454  0034 c650f3        	ld	a,_BEEP
2455  0037 a43f          	and	a,#63
2456  0039 c750f3        	ld	_BEEP,a
2457                     ; 32             BeepTimer=0;
2459  003c 725f0000      	clr	_BeepTimer
2460                     ; 33             BeepState=BEEP_IDLE;
2462  0040 35020000      	mov	_BeepState,#2
2463                     ; 34             break;
2465  0044 2050          	jra	L5341
2466  0046               L5041:
2467                     ; 35         case BEEP_SHORTBREAK:
2467                     ; 36             BeepTimeOn=T4MS200MS;
2469  0046 35320000      	mov	L5731_BeepTimeOn,#50
2470                     ; 37             BeepTimeOff=T4MS200MS;
2472  004a 35320001      	mov	L7731_BeepTimeOff,#50
2473                     ; 38             BEEP.CSR =(BEEP.CSR&(~BEEP_CSR_BEEPSEL))|BEEP_CSR_BEEPSEL_1K;
2475  004e c650f3        	ld	a,_BEEP
2476  0051 a43f          	and	a,#63
2477  0053 c750f3        	ld	_BEEP,a
2478                     ; 39             BeepTimer=0;
2480  0056 725f0000      	clr	_BeepTimer
2481                     ; 40             BeepState=BEEP_IDLE;
2483  005a 35020000      	mov	_BeepState,#2
2484                     ; 41             break;
2486  005e 2036          	jra	L5341
2487  0060               L7041:
2488                     ; 42         case BEEP_MIDDLEBREAK:
2488                     ; 43             BeepTimeOn=T4MS500MS;
2490  0060 357d0000      	mov	L5731_BeepTimeOn,#125
2491                     ; 44             BeepTimeOff=T4MS500MS;
2493  0064 357d0001      	mov	L7731_BeepTimeOff,#125
2494                     ; 45             BEEP.CSR =(BEEP.CSR&(~BEEP_CSR_BEEPSEL))|BEEP_CSR_BEEPSEL_2K;
2496  0068 c650f3        	ld	a,_BEEP
2497  006b a43f          	and	a,#63
2498  006d aa40          	or	a,#64
2499  006f c750f3        	ld	_BEEP,a
2500                     ; 46             BeepTimer=0;
2502  0072 725f0000      	clr	_BeepTimer
2503                     ; 47             BeepState=BEEP_IDLE;
2505  0076 35020000      	mov	_BeepState,#2
2506                     ; 48             break;
2508  007a 201a          	jra	L5341
2509  007c               L1141:
2510                     ; 49         case BEEP_LONGBREAK:
2510                     ; 50             BeepTimeOn=T4MS1000MS;
2512  007c 35fa0000      	mov	L5731_BeepTimeOn,#250
2513                     ; 51             BeepTimeOff=T4MS1000MS;
2515  0080 35fa0001      	mov	L7731_BeepTimeOff,#250
2516                     ; 52             BEEP.CSR =(BEEP.CSR&(~BEEP_CSR_BEEPSEL))|BEEP_CSR_BEEPSEL_4K;
2518  0084 c650f3        	ld	a,_BEEP
2519  0087 a43f          	and	a,#63
2520  0089 aa80          	or	a,#128
2521  008b c750f3        	ld	_BEEP,a
2522                     ; 53             BeepTimer=0;
2524  008e 725f0000      	clr	_BeepTimer
2525                     ; 54             BeepState=BEEP_IDLE;
2527  0092 35020000      	mov	_BeepState,#2
2528                     ; 55             break;
2530  0096               L3141:
2531                     ; 56         case BEEP_IDLE:
2531                     ; 57         default:
2531                     ; 58             break;
2533  0096               L5341:
2534                     ; 60     if(0==BeepTimeOn)
2536  0096 725d0000      	tnz	L5731_BeepTimeOn
2537  009a 2611          	jrne	L7341
2538                     ; 62         if(FLAGMAIN_BEEP_ON)
2540  009c c60000        	ld	a,_FlagMain
2541  009f a501          	bcp	a,#1
2542  00a1 274a          	jreq	L3441
2543                     ; 64             FLAGMAIN_BEEP_ON=BEEP_OFF;
2545  00a3 72110000      	bres	_FlagMain,#0
2546                     ; 65             BEEP.CSR &=(~BEEP_CSR_BEEPEN);
2548  00a7 721b50f3      	bres	_BEEP,#5
2549  00ab 2040          	jra	L3441
2550  00ad               L7341:
2551                     ; 68     else if(0==BeepTimeOff)
2553  00ad 725d0001      	tnz	L7731_BeepTimeOff
2554  00b1 2611          	jrne	L5441
2555                     ; 70         if(!FLAGMAIN_BEEP_ON)
2557  00b3 c60000        	ld	a,_FlagMain
2558  00b6 a501          	bcp	a,#1
2559  00b8 2633          	jrne	L3441
2560                     ; 72             FLAGMAIN_BEEP_ON=BEEP_ON;
2562  00ba 72100000      	bset	_FlagMain,#0
2563                     ; 73             BEEP.CSR |=BEEP_CSR_BEEPEN;
2565  00be 721a50f3      	bset	_BEEP,#5
2566  00c2 2029          	jra	L3441
2567  00c4               L5441:
2568                     ; 78         if(0==BeepTimer)
2570  00c4 725d0000      	tnz	_BeepTimer
2571  00c8 2623          	jrne	L3441
2572                     ; 80             FLAGMAIN_BEEP_ON=~FLAGMAIN_BEEP_ON;
2574  00ca c60000        	ld	a,_FlagMain
2575  00cd a801          	xor	a,#1
2576  00cf c70000        	ld	_FlagMain,a
2577                     ; 81             if(FLAGMAIN_BEEP_ON)
2579  00d2 c60000        	ld	a,_FlagMain
2580  00d5 a501          	bcp	a,#1
2581  00d7 270b          	jreq	L5541
2582                     ; 83                 BeepTimer=BeepTimeOn;
2584  00d9 5500000000    	mov	_BeepTimer,L5731_BeepTimeOn
2585                     ; 84                 BEEP.CSR |=BEEP_CSR_BEEPEN;
2587  00de 721a50f3      	bset	_BEEP,#5
2589  00e2 2009          	jra	L3441
2590  00e4               L5541:
2591                     ; 88                 BeepTimer=BeepTimeOff;
2593  00e4 5500010000    	mov	_BeepTimer,L7731_BeepTimeOff
2594                     ; 89                 BEEP.CSR &=(~BEEP_CSR_BEEPEN);
2596  00e9 721b50f3      	bres	_BEEP,#5
2597  00ed               L3441:
2598                     ; 93 }
2601  00ed 87            	retf
2613                     	xref	_FlagMain
2614                     	xdef	f_BeepManage
2615                     	xdef	f_BeepInit
2616                     	xref	_BeepTimer
2617                     	xref	_BeepState
2636                     	end
