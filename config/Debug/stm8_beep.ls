   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2347                     ; 3 void BeepInit(void)
2347                     ; 4 {
2349                     	switch	.text
2350  0000               _BeepInit:
2354                     ; 5     BEEP.CSR =BEEP_CSR_BEEPDIV&0x15; //设置BEEP分频比
2356  0000 351550f3      	mov	_BEEP,#21
2357                     ; 6     BEEP.CSR |=BEEP_CSR_BEEPSEL&0x00;
2359  0004 c650f3        	ld	a,_BEEP
2360  0007 97            	ld	xl,a
2361                     ; 7 }
2364  0008 81            	ret
2367                     	bsct
2368  0000               L5731_BeepTimeOn:
2369  0000 00            	dc.b	0
2370  0001               L7731_BeepTimeOff:
2371  0001 00            	dc.b	0
2416                     ; 18 void BeepManage(void)
2416                     ; 19 {
2417                     	switch	.text
2418  0009               _BeepManage:
2422                     ; 21     switch(BeepState) //该全局变量控制BEEP的状态
2424  0009 b600          	ld	a,_BeepState
2426                     ; 56         case BEEP_IDLE:
2426                     ; 57         default:
2426                     ; 58             break;
2427  000b 4d            	tnz	a
2428  000c 270f          	jreq	L1041
2429  000e 4a            	dec	a
2430  000f 2716          	jreq	L3041
2431  0011 a002          	sub	a,#2
2432  0013 2728          	jreq	L5041
2433  0015 4a            	dec	a
2434  0016 273d          	jreq	L7041
2435  0018 4a            	dec	a
2436  0019 2754          	jreq	L1141
2437  001b 206a          	jra	L1441
2438  001d               L1041:
2439                     ; 23         case BEEP_OFF:
2439                     ; 24             BeepTimeOn=0;
2441  001d 3f00          	clr	L5731_BeepTimeOn
2442                     ; 25             BeepTimeOff=0;
2444  001f 3f01          	clr	L7731_BeepTimeOff
2445                     ; 26             BeepState=BEEP_IDLE;
2447  0021 35020000      	mov	_BeepState,#2
2448                     ; 27             break;
2450  0025 2060          	jra	L1441
2451  0027               L3041:
2452                     ; 28         case BEEP_ON:
2452                     ; 29             BeepTimeOn=T4MS200MS;
2454  0027 35320000      	mov	L5731_BeepTimeOn,#50
2455                     ; 30             BeepTimeOff=0;
2457  002b 3f01          	clr	L7731_BeepTimeOff
2458                     ; 31             BEEP.CSR =(BEEP.CSR&(~BEEP_CSR_BEEPSEL))|BEEP_CSR_BEEPSEL_1K;
2460  002d c650f3        	ld	a,_BEEP
2461  0030 a43f          	and	a,#63
2462  0032 c750f3        	ld	_BEEP,a
2463                     ; 32             BeepTimer=0;
2465  0035 3f00          	clr	_BeepTimer
2466                     ; 33             BeepState=BEEP_IDLE;
2468  0037 35020000      	mov	_BeepState,#2
2469                     ; 34             break;
2471  003b 204a          	jra	L1441
2472  003d               L5041:
2473                     ; 35         case BEEP_SHORTBREAK:
2473                     ; 36             BeepTimeOn=T4MS200MS;
2475  003d 35320000      	mov	L5731_BeepTimeOn,#50
2476                     ; 37             BeepTimeOff=T4MS200MS;
2478  0041 35320001      	mov	L7731_BeepTimeOff,#50
2479                     ; 38             BEEP.CSR =(BEEP.CSR&(~BEEP_CSR_BEEPSEL))|BEEP_CSR_BEEPSEL_1K;
2481  0045 c650f3        	ld	a,_BEEP
2482  0048 a43f          	and	a,#63
2483  004a c750f3        	ld	_BEEP,a
2484                     ; 39             BeepTimer=0;
2486  004d 3f00          	clr	_BeepTimer
2487                     ; 40             BeepState=BEEP_IDLE;
2489  004f 35020000      	mov	_BeepState,#2
2490                     ; 41             break;
2492  0053 2032          	jra	L1441
2493  0055               L7041:
2494                     ; 42         case BEEP_MIDDLEBREAK:
2494                     ; 43             BeepTimeOn=T4MS500MS;
2496  0055 357d0000      	mov	L5731_BeepTimeOn,#125
2497                     ; 44             BeepTimeOff=T4MS500MS;
2499  0059 357d0001      	mov	L7731_BeepTimeOff,#125
2500                     ; 45             BEEP.CSR =(BEEP.CSR&(~BEEP_CSR_BEEPSEL))|BEEP_CSR_BEEPSEL_2K;
2502  005d c650f3        	ld	a,_BEEP
2503  0060 a43f          	and	a,#63
2504  0062 aa40          	or	a,#64
2505  0064 c750f3        	ld	_BEEP,a
2506                     ; 46             BeepTimer=0;
2508  0067 3f00          	clr	_BeepTimer
2509                     ; 47             BeepState=BEEP_IDLE;
2511  0069 35020000      	mov	_BeepState,#2
2512                     ; 48             break;
2514  006d 2018          	jra	L1441
2515  006f               L1141:
2516                     ; 49         case BEEP_LONGBREAK:
2516                     ; 50             BeepTimeOn=T4MS1000MS;
2518  006f 35fa0000      	mov	L5731_BeepTimeOn,#250
2519                     ; 51             BeepTimeOff=T4MS1000MS;
2521  0073 35fa0001      	mov	L7731_BeepTimeOff,#250
2522                     ; 52             BEEP.CSR =(BEEP.CSR&(~BEEP_CSR_BEEPSEL))|BEEP_CSR_BEEPSEL_4K;
2524  0077 c650f3        	ld	a,_BEEP
2525  007a a43f          	and	a,#63
2526  007c aa80          	or	a,#128
2527  007e c750f3        	ld	_BEEP,a
2528                     ; 53             BeepTimer=0;
2530  0081 3f00          	clr	_BeepTimer
2531                     ; 54             BeepState=BEEP_IDLE;
2533  0083 35020000      	mov	_BeepState,#2
2534                     ; 55             break;
2536  0087               L3141:
2537                     ; 56         case BEEP_IDLE:
2537                     ; 57         default:
2537                     ; 58             break;
2539  0087               L1441:
2540                     ; 60     if(0==BeepTimeOn)
2542  0087 3d00          	tnz	L5731_BeepTimeOn
2543  0089 2610          	jrne	L3441
2544                     ; 62         if(FLAGMAIN_BEEP_ON)
2546  008b b600          	ld	a,_FlagMain
2547  008d a501          	bcp	a,#1
2548  008f 273c          	jreq	L7441
2549                     ; 64             FLAGMAIN_BEEP_ON=BEEP_OFF;
2551  0091 72110000      	bres	_FlagMain,#0
2552                     ; 65             BEEP.CSR &=(~BEEP_CSR_BEEPEN);
2554  0095 721b50f3      	bres	_BEEP,#5
2555  0099 2032          	jra	L7441
2556  009b               L3441:
2557                     ; 68     else if(0==BeepTimeOff)
2559  009b 3d01          	tnz	L7731_BeepTimeOff
2560  009d 2610          	jrne	L1541
2561                     ; 70         if(!FLAGMAIN_BEEP_ON)
2563  009f b600          	ld	a,_FlagMain
2564  00a1 a501          	bcp	a,#1
2565  00a3 2628          	jrne	L7441
2566                     ; 72             FLAGMAIN_BEEP_ON=BEEP_ON;
2568  00a5 72100000      	bset	_FlagMain,#0
2569                     ; 73             BEEP.CSR |=BEEP_CSR_BEEPEN;
2571  00a9 721a50f3      	bset	_BEEP,#5
2572  00ad 201e          	jra	L7441
2573  00af               L1541:
2574                     ; 78         if(0==BeepTimer)
2576  00af 3d00          	tnz	_BeepTimer
2577  00b1 261a          	jrne	L7441
2578                     ; 80             FLAGMAIN_BEEP_ON=~FLAGMAIN_BEEP_ON;
2580  00b3 90100000      	bcpl	_FlagMain,#0
2581                     ; 81             if(FLAGMAIN_BEEP_ON)
2583  00b7 b600          	ld	a,_FlagMain
2584  00b9 a501          	bcp	a,#1
2585  00bb 2709          	jreq	L1641
2586                     ; 83                 BeepTimer=BeepTimeOn;
2588  00bd 450000        	mov	_BeepTimer,L5731_BeepTimeOn
2589                     ; 84                 BEEP.CSR |=BEEP_CSR_BEEPEN;
2591  00c0 721a50f3      	bset	_BEEP,#5
2593  00c4 2007          	jra	L7441
2594  00c6               L1641:
2595                     ; 88                 BeepTimer=BeepTimeOff;
2597  00c6 450100        	mov	_BeepTimer,L7731_BeepTimeOff
2598                     ; 89                 BEEP.CSR &=(~BEEP_CSR_BEEPEN);
2600  00c9 721b50f3      	bres	_BEEP,#5
2601  00cd               L7441:
2602                     ; 93 }
2605  00cd 81            	ret
2618                     	xref.b	_FlagMain
2619                     	xdef	_BeepManage
2620                     	xdef	_BeepInit
2621                     	xref.b	_BeepTimer
2622                     	xref.b	_BeepState
2641                     	end
