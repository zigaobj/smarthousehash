   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2586                     ; 3 void SendNMTModuleControl(NMT_MODULE_CONTROL NmtCmd,NODEID NodeID)
2586                     ; 4 {
2587                     	switch	.text
2588  0000               f_SendNMTModuleControl:
2590  0000 88            	push	a
2591  0001 520d          	subw	sp,#13
2592       0000000d      OFST:	set	13
2595                     ; 6     CanBuffer.id =CANID_NMT_MODULE_CONTROL;
2597  0003 ae0000        	ldw	x,#0
2598  0006 1f03          	ldw	(OFST-10,sp),x
2599  0008 ae0000        	ldw	x,#0
2600  000b 1f01          	ldw	(OFST-12,sp),x
2601                     ; 7     CanBuffer.dlc =3;
2603  000d a603          	ld	a,#3
2604  000f 6b05          	ld	(OFST-8,sp),a
2605                     ; 8     CanBuffer.data[0]=NmtCmd;
2607  0011 7b0e          	ld	a,(OFST+1,sp)
2608  0013 6b06          	ld	(OFST-7,sp),a
2609                     ; 9     CanBuffer.data[1]=(NodeID>>8)&0xFF;
2611  0015 7b12          	ld	a,(OFST+5,sp)
2612  0017 a4ff          	and	a,#255
2613  0019 6b07          	ld	(OFST-6,sp),a
2614                     ; 10     CanBuffer.data[2]=NodeID&0xFF;
2616  001b 7b13          	ld	a,(OFST+6,sp)
2617  001d a4ff          	and	a,#255
2618  001f 6b08          	ld	(OFST-5,sp),a
2619                     ; 11     SendToCan(&CanBuffer);
2621  0021 96            	ldw	x,sp
2622  0022 1c0001        	addw	x,#OFST-12
2623  0025 8d000000      	callf	f_SendToCan
2625                     ; 12 }
2628  0029 5b0e          	addw	sp,#14
2629  002b 87            	retf
2672                     ; 22 void SendNodeRegister(NODEID NodeId)
2672                     ; 23 {
2673                     	switch	.text
2674  002c               f_SendNodeRegister:
2676  002c 520d          	subw	sp,#13
2677       0000000d      OFST:	set	13
2680                     ; 25     CanBuffer.id =CANID_NODEREGISTER_REQUEST|NodeId;
2682  002e 8d000000      	callf	d_uitolx
2684  0032 72100001      	bset	c_lreg+1,#0
2685  0036 72140000      	bset	c_lreg,#2
2686  003a 96            	ldw	x,sp
2687  003b 1c0001        	addw	x,#OFST-12
2688  003e 8d000000      	callf	d_rtol
2690                     ; 26     CanBuffer.dlc =8;
2692  0042 a608          	ld	a,#8
2693  0044 6b05          	ld	(OFST-8,sp),a
2694                     ; 27     CanBuffer.data[0]=UniqueID[0];
2696  0046 72c60000      	ld	a,[_UniqueID.w]
2697  004a 6b06          	ld	(OFST-7,sp),a
2698                     ; 28     CanBuffer.data[1]=UniqueID[1];
2700  004c ce0000        	ldw	x,_UniqueID
2701  004f e601          	ld	a,(1,x)
2702  0051 6b07          	ld	(OFST-6,sp),a
2703                     ; 29     CanBuffer.data[2]=UniqueID[2];
2705  0053 ce0000        	ldw	x,_UniqueID
2706  0056 e602          	ld	a,(2,x)
2707  0058 6b08          	ld	(OFST-5,sp),a
2708                     ; 30     CanBuffer.data[3]=UniqueID[3];
2710  005a ce0000        	ldw	x,_UniqueID
2711  005d e603          	ld	a,(3,x)
2712  005f 6b09          	ld	(OFST-4,sp),a
2713                     ; 31     CanBuffer.data[4]=UniqueID[4];
2715  0061 ce0000        	ldw	x,_UniqueID
2716  0064 e604          	ld	a,(4,x)
2717  0066 6b0a          	ld	(OFST-3,sp),a
2718                     ; 32     CanBuffer.data[5]=UniqueID[5];
2720  0068 ce0000        	ldw	x,_UniqueID
2721  006b e605          	ld	a,(5,x)
2722  006d 6b0b          	ld	(OFST-2,sp),a
2723                     ; 33     CanBuffer.data[6]=UniqueID[6];
2725  006f ce0000        	ldw	x,_UniqueID
2726  0072 e606          	ld	a,(6,x)
2727  0074 6b0c          	ld	(OFST-1,sp),a
2728                     ; 34     CanBuffer.data[7]=UniqueID[7];
2730  0076 ce0000        	ldw	x,_UniqueID
2731  0079 e607          	ld	a,(7,x)
2732  007b 6b0d          	ld	(OFST+0,sp),a
2733                     ; 35     SendToCan(&CanBuffer);
2735  007d 96            	ldw	x,sp
2736  007e 1c0001        	addw	x,#OFST-12
2737  0081 8d000000      	callf	f_SendToCan
2739                     ; 36 }
2742  0085 5b0d          	addw	sp,#13
2743  0087 87            	retf
2781                     ; 37 void MainCanProtocol(void)
2781                     ; 38 {
2782                     	switch	.text
2783  0088               f_MainCanProtocol:
2785  0088 88            	push	a
2786       00000001      OFST:	set	1
2789                     ; 40     switch(CanProtocolState)
2791  0089 c60000        	ld	a,_CanProtocolState
2793                     ; 100         default:
2793                     ; 101             break;
2794  008c 4d            	tnz	a
2795  008d 2711          	jreq	L1551
2796  008f 4a            	dec	a
2797  0090 2734          	jreq	L3551
2798  0092 4a            	dec	a
2799  0093 274a          	jreq	L5551
2800  0095 4a            	dec	a
2801  0096 2753          	jreq	L7551
2802  0098 4a            	dec	a
2803  0099 2756          	jreq	L5061
2804  009b 4a            	dec	a
2805  009c 2753          	jreq	L5061
2806  009e 2051          	jra	L5061
2807  00a0               L1551:
2808                     ; 44             NODE_REGISTER_FLAG=0;
2810  00a0 72130000      	bres	_NodeState,#1
2811                     ; 46             for(i=0;i<NODEIDLIST_MAX_NUM;i++)
2813  00a4 0f01          	clr	(OFST+0,sp)
2814  00a6               L7061:
2815                     ; 48                 CLEAR_WATCHDOG;
2817  00a6 357f50d1      	mov	_WWDG,#127
2818                     ; 49                 eep_NodeIdList[i].nodeid.F_valid=0;
2821  00aa 7b01          	ld	a,(OFST+0,sp)
2822  00ac 97            	ld	xl,a
2823  00ad a60a          	ld	a,#10
2824  00af 42            	mul	x,a
2825  00b0 d64101        	ld	a,(_eep_NodeIdList+1,x)
2826  00b3 a4fe          	and	a,#254
2827  00b5 d74101        	ld	(_eep_NodeIdList+1,x),a
2828                     ; 46             for(i=0;i<NODEIDLIST_MAX_NUM;i++)
2830  00b8 0c01          	inc	(OFST+0,sp)
2833  00ba 7b01          	ld	a,(OFST+0,sp)
2834  00bc a119          	cp	a,#25
2835  00be 25e6          	jrult	L7061
2836                     ; 52             CanProtocolState=CANPROTOCOL_BUILDCOMM;
2838  00c0 35010000      	mov	_CanProtocolState,#1
2839                     ; 53             break;
2841  00c4 202b          	jra	L5061
2842  00c6               L3551:
2843                     ; 58             if(RESET_Key==ResetSource)
2845  00c6 b600          	ld	a,_ResetSource
2846  00c8 a102          	cp	a,#2
2847  00ca 2609          	jrne	L5161
2848                     ; 60                 SendNMTModuleControl(NMT_RESET_COMMUNICATION,CANID_NMT_MODULE_CONTROL);
2850  00cc 5f            	clrw	x
2851  00cd 89            	pushw	x
2852  00ce a682          	ld	a,#130
2853  00d0 8d000000      	callf	f_SendNMTModuleControl
2855  00d4 85            	popw	x
2856  00d5               L5161:
2857                     ; 62             CanProtocol1sTimer=0;
2859  00d5 725f0000      	clr	_CanProtocol1sTimer
2860                     ; 67             CanProtocolState=CANPROTOCOL_WAIT;
2862  00d9 35020000      	mov	_CanProtocolState,#2
2863                     ; 68             break;
2865  00dd 2012          	jra	L5061
2866  00df               L5551:
2867                     ; 72             if(CanProtocol1sTimer>0)break;
2869  00df 725d0000      	tnz	_CanProtocol1sTimer
2870  00e3 260c          	jrne	L5061
2873                     ; 81                 CanProtocolState=CANPROTOCOL_RUNNING;
2875  00e5 35030000      	mov	_CanProtocolState,#3
2876                     ; 83             break;
2878  00e9 2006          	jra	L5061
2879  00eb               L7551:
2880                     ; 87             if(CanProtocol1sTimer>0)break;
2882  00eb 725d0000      	tnz	_CanProtocol1sTimer
2883  00ef 2600          	jrne	L5061
2886  00f1               L5651:
2887                     ; 100         default:
2887                     ; 101             break;
2889  00f1               L5061:
2890                     ; 103 }
2893  00f1 84            	pop	a
2894  00f2 87            	retf
2906                     	xref	_UniqueID
2907                     	xref	f_SendToCan
2908                     	xref	_NodeState
2909                     	xdef	f_MainCanProtocol
2910                     	xdef	f_SendNodeRegister
2911                     	xdef	f_SendNMTModuleControl
2912                     	xref	_CanProtocol1sTimer
2913                     	xref	_CanProtocolState
2914                     	xref.b	_ResetSource
2915                     	xref.b	c_lreg
2934                     	xref	d_rtol
2935                     	xref	d_uitolx
2936                     	end
