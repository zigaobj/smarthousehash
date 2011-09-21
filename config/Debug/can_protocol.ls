   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.3 - 19 Nov 2007
2453                     ; 3 void SendNMTModuleControl(NMT_MODULE_CONTROL NmtCmd,NODEID NodeID)
2453                     ; 4 {
2454                     	switch	.text
2455  0000               f_SendNMTModuleControl:
2457  0000 88            	push	a
2458  0001 520d          	subw	sp,#13
2459       0000000d      OFST:	set	13
2462                     ; 6     CanBuffer.id =CANID_NMT_MODULE_CONTROL;
2464  0003 ae0000        	ldw	x,#0
2465  0006 1f03          	ldw	(OFST-10,sp),x
2466  0008 ae0000        	ldw	x,#0
2467  000b 1f01          	ldw	(OFST-12,sp),x
2468                     ; 7     CanBuffer.dlc =2;
2470  000d a602          	ld	a,#2
2471  000f 6b05          	ld	(OFST-8,sp),a
2472                     ; 8     CanBuffer.data[0]=NmtCmd;
2474  0011 7b0e          	ld	a,(OFST+1,sp)
2475  0013 6b06          	ld	(OFST-7,sp),a
2476                     ; 9     CanBuffer.data[1]=NodeID;
2478  0015 7b13          	ld	a,(OFST+6,sp)
2479  0017 6b07          	ld	(OFST-6,sp),a
2480                     ; 10     SendToCan(&CanBuffer);
2482  0019 96            	ldw	x,sp
2483  001a 1c0001        	addw	x,#OFST-12
2484  001d 8d000000      	callf	f_SendToCan
2486                     ; 11 }
2489  0021 5b0e          	addw	sp,#14
2490  0023 87            	retf
2502                     	xref	f_SendToCan
2503                     	xdef	f_SendNMTModuleControl
2522                     	end
