   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2480                     ; 3 void BeepInit(void)
2480                     ; 4 {
2481                     	switch	.text
2482  0000               f_BeepInit:
2486                     ; 5     BEEP.CSR =BEEP_CSR_BEEPDIV&0x15; //设置BEEP分频比
2488  0000 351550f3      	mov	_BEEP,#21
2489                     ; 6     BEEP.CSR |=BEEP_CSR_BEEPSEL&0x00;
2491  0004 c650f3        	ld	a,_BEEP
2492  0007 97            	ld	xl,a
2493                     ; 7 }
2496  0008 87            	retf
2498                     	switch	.data
2499  0000               L3641_BeepTimeOn:
2500  0000 00            	dc.b	0
2501  0001               L5641_BeepTimeOff:
2502  0001 00            	dc.b	0
2543                     ; 18 void BeepManage(void)
2543                     ; 19 {
2544                     	switch	.text
2545  0009               f_BeepManage:
2549                     ; 21     switch(BeepState) //该全局变量控制BEEP的状态
2551  0009 c60000        	ld	a,_BeepState
2553                     ; 56         case BEEP_IDLE:
2553                     ; 57         default:
2553                     ; 58             break;
2554  000c 4d            	tnz	a
2555  000d 270f          	jreq	L7641
2556  000f 4a            	dec	a
2557  0010 271a          	jreq	L1741
2558  0012 a002          	sub	a,#2
2559  0014 2730          	jreq	L3741
2560  0016 4a            	dec	a
2561  0017 2747          	jreq	L5741
2562  0019 4a            	dec	a
2563  001a 2760          	jreq	L7741
2564  001c 2078          	jra	L3251
2565  001e               L7641:
2566                     ; 23         case BEEP_OFF:
2566                     ; 24             BeepTimeOn=0;
2568  001e 725f0000      	clr	L3641_BeepTimeOn
2569                     ; 25             BeepTimeOff=0;
2571  0022 725f0001      	clr	L5641_BeepTimeOff
2572                     ; 26             BeepState=BEEP_IDLE;
2574  0026 35020000      	mov	_BeepState,#2
2575                     ; 27             break;
2577  002a 206a          	jra	L3251
2578  002c               L1741:
2579                     ; 28         case BEEP_ON:
2579                     ; 29             BeepTimeOn=T4MS200MS;
2581  002c 35320000      	mov	L3641_BeepTimeOn,#50
2582                     ; 30             BeepTimeOff=0;
2584  0030 725f0001      	clr	L5641_BeepTimeOff
2585                     ; 31             BEEP.CSR =(BEEP.CSR&(~BEEP_CSR_BEEPSEL))|BEEP_CSR_BEEPSEL_1K;
2587  0034 c650f3        	ld	a,_BEEP
2588  0037 a43f          	and	a,#63
2589  0039 c750f3        	ld	_BEEP,a
2590                     ; 32             BeepTimer=0;
2592  003c 725f0000      	clr	_BeepTimer
2593                     ; 33             BeepState=BEEP_IDLE;
2595  0040 35020000      	mov	_BeepState,#2
2596                     ; 34             break;
2598  0044 2050          	jra	L3251
2599  0046               L3741:
2600                     ; 35         case BEEP_SHORTBREAK:
2600                     ; 36             BeepTimeOn=T4MS200MS;
2602  0046 35320000      	mov	L3641_BeepTimeOn,#50
2603                     ; 37             BeepTimeOff=T4MS200MS;
2605  004a 35320001      	mov	L5641_BeepTimeOff,#50
2606                     ; 38             BEEP.CSR =(BEEP.CSR&(~BEEP_CSR_BEEPSEL))|BEEP_CSR_BEEPSEL_1K;
2608  004e c650f3        	ld	a,_BEEP
2609  0051 a43f          	and	a,#63
2610  0053 c750f3        	ld	_BEEP,a
2611                     ; 39             BeepTimer=0;
2613  0056 725f0000      	clr	_BeepTimer
2614                     ; 40             BeepState=BEEP_IDLE;
2616  005a 35020000      	mov	_BeepState,#2
2617                     ; 41             break;
2619  005e 2036          	jra	L3251
2620  0060               L5741:
2621                     ; 42         case BEEP_MIDDLEBREAK:
2621                     ; 43             BeepTimeOn=T4MS500MS;
2623  0060 357d0000      	mov	L3641_BeepTimeOn,#125
2624                     ; 44             BeepTimeOff=T4MS500MS;
2626  0064 357d0001      	mov	L5641_BeepTimeOff,#125
2627                     ; 45             BEEP.CSR =(BEEP.CSR&(~BEEP_CSR_BEEPSEL))|BEEP_CSR_BEEPSEL_2K;
2629  0068 c650f3        	ld	a,_BEEP
2630  006b a43f          	and	a,#63
2631  006d aa40          	or	a,#64
2632  006f c750f3        	ld	_BEEP,a
2633                     ; 46             BeepTimer=0;
2635  0072 725f0000      	clr	_BeepTimer
2636                     ; 47             BeepState=BEEP_IDLE;
2638  0076 35020000      	mov	_BeepState,#2
2639                     ; 48             break;
2641  007a 201a          	jra	L3251
2642  007c               L7741:
2643                     ; 49         case BEEP_LONGBREAK:
2643                     ; 50             BeepTimeOn=T4MS1000MS;
2645  007c 35fa0000      	mov	L3641_BeepTimeOn,#250
2646                     ; 51             BeepTimeOff=T4MS1000MS;
2648  0080 35fa0001      	mov	L5641_BeepTimeOff,#250
2649                     ; 52             BEEP.CSR =(BEEP.CSR&(~BEEP_CSR_BEEPSEL))|BEEP_CSR_BEEPSEL_4K;
2651  0084 c650f3        	ld	a,_BEEP
2652  0087 a43f          	and	a,#63
2653  0089 aa80          	or	a,#128
2654  008b c750f3        	ld	_BEEP,a
2655                     ; 53             BeepTimer=0;
2657  008e 725f0000      	clr	_BeepTimer
2658                     ; 54             BeepState=BEEP_IDLE;
2660  0092 35020000      	mov	_BeepState,#2
2661                     ; 55             break;
2663  0096               L1051:
2664                     ; 56         case BEEP_IDLE:
2664                     ; 57         default:
2664                     ; 58             break;
2666  0096               L3251:
2667                     ; 60     if(0==BeepTimeOn)
2669  0096 725d0000      	tnz	L3641_BeepTimeOn
2670  009a 2611          	jrne	L5251
2671                     ; 62         if(FLAGMAIN_BEEP_ON)
2673  009c c60000        	ld	a,_FlagMain
2674  009f a501          	bcp	a,#1
2675  00a1 2746          	jreq	L1351
2676                     ; 64             FLAGMAIN_BEEP_ON=BEEP_OFF;
2678  00a3 72110000      	bres	_FlagMain,#0
2679                     ; 65             BEEP.CSR &=(~BEEP_CSR_BEEPEN);
2681  00a7 721b50f3      	bres	_BEEP,#5
2682  00ab 203c          	jra	L1351
2683  00ad               L5251:
2684                     ; 68     else if(0==BeepTimeOff)
2686  00ad 725d0001      	tnz	L5641_BeepTimeOff
2687  00b1 2611          	jrne	L3351
2688                     ; 70         if(!FLAGMAIN_BEEP_ON)
2690  00b3 c60000        	ld	a,_FlagMain
2691  00b6 a501          	bcp	a,#1
2692  00b8 262f          	jrne	L1351
2693                     ; 72             FLAGMAIN_BEEP_ON=BEEP_ON;
2695  00ba 72100000      	bset	_FlagMain,#0
2696                     ; 73             BEEP.CSR |=BEEP_CSR_BEEPEN;
2698  00be 721a50f3      	bset	_BEEP,#5
2699  00c2 2025          	jra	L1351
2700  00c4               L3351:
2701                     ; 78         if(0==BeepTimer)
2703  00c4 725d0000      	tnz	_BeepTimer
2704  00c8 261f          	jrne	L1351
2705                     ; 80             FLAGMAIN_BEEP_ON=~FLAGMAIN_BEEP_ON;
2707  00ca 90100000      	bcpl	_FlagMain,#0
2708                     ; 81             if(FLAGMAIN_BEEP_ON)
2710  00ce c60000        	ld	a,_FlagMain
2711  00d1 a501          	bcp	a,#1
2712  00d3 270b          	jreq	L3451
2713                     ; 83                 BeepTimer=BeepTimeOn;
2715  00d5 5500000000    	mov	_BeepTimer,L3641_BeepTimeOn
2716                     ; 84                 BEEP.CSR |=BEEP_CSR_BEEPEN;
2718  00da 721a50f3      	bset	_BEEP,#5
2720  00de 2009          	jra	L1351
2721  00e0               L3451:
2722                     ; 88                 BeepTimer=BeepTimeOff;
2724  00e0 5500010000    	mov	_BeepTimer,L5641_BeepTimeOff
2725                     ; 89                 BEEP.CSR &=(~BEEP_CSR_BEEPEN);
2727  00e5 721b50f3      	bres	_BEEP,#5
2728  00e9               L1351:
2729                     ; 93 }
2732  00e9 87            	retf
2744                     	xref	_FlagMain
2745                     	xdef	f_BeepManage
2746                     	xdef	f_BeepInit
2747                     	xref	_BeepTimer
2748                     	xref	_BeepState
2767                     	end
