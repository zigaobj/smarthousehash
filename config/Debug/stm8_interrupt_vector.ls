   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2481                     ; 12 @far @interrupt void NonHandledInterrupt (void)
2481                     ; 13 {
2482                     	switch	.text
2483  0000               f_NonHandledInterrupt:
2487                     ; 17 	return;
2490  0000 80            	iret
2492                     .const:	section	.text
2493  0000               __vectab:
2494  0000 82            	dc.b	130
2496  0001 00            	dc.b	page(__stext)
2497  0002 0000          	dc.w	__stext
2498  0004 82            	dc.b	130
2500  0005 00            	dc.b	page(f_TRAP_IRQHandler)
2501  0006 0000          	dc.w	f_TRAP_IRQHandler
2502  0008 82            	dc.b	130
2504  0009 00            	dc.b	page(f_TLI_IRQHandler)
2505  000a 0000          	dc.w	f_TLI_IRQHandler
2506  000c 82            	dc.b	130
2508  000d 00            	dc.b	page(f_AWU_IRQHandler)
2509  000e 0000          	dc.w	f_AWU_IRQHandler
2510  0010 82            	dc.b	130
2512  0011 00            	dc.b	page(f_CLK_IRQHandler)
2513  0012 0000          	dc.w	f_CLK_IRQHandler
2514  0014 82            	dc.b	130
2516  0015 00            	dc.b	page(f_EXTI_PORTA_IRQHandler)
2517  0016 0000          	dc.w	f_EXTI_PORTA_IRQHandler
2518  0018 82            	dc.b	130
2520  0019 00            	dc.b	page(f_EXTI_PORTB_IRQHandler)
2521  001a 0000          	dc.w	f_EXTI_PORTB_IRQHandler
2522  001c 82            	dc.b	130
2524  001d 00            	dc.b	page(f_EXTI_PORTC_IRQHandler)
2525  001e 0000          	dc.w	f_EXTI_PORTC_IRQHandler
2526  0020 82            	dc.b	130
2528  0021 00            	dc.b	page(f_EXTI_PORTD_IRQHandler)
2529  0022 0000          	dc.w	f_EXTI_PORTD_IRQHandler
2530  0024 82            	dc.b	130
2532  0025 00            	dc.b	page(f_EXTI_PORTE_IRQHandler)
2533  0026 0000          	dc.w	f_EXTI_PORTE_IRQHandler
2534  0028 82            	dc.b	130
2536  0029 00            	dc.b	page(f_CAN_RX_IRQHandler)
2537  002a 0000          	dc.w	f_CAN_RX_IRQHandler
2538  002c 82            	dc.b	130
2540  002d 00            	dc.b	page(f_CAN_TX_IRQHandler)
2541  002e 0000          	dc.w	f_CAN_TX_IRQHandler
2542  0030 82            	dc.b	130
2544  0031 00            	dc.b	page(f_SPI_IRQHandler)
2545  0032 0000          	dc.w	f_SPI_IRQHandler
2546  0034 82            	dc.b	130
2548  0035 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_BRK_IRQHandler)
2549  0036 0000          	dc.w	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
2550  0038 82            	dc.b	130
2552  0039 00            	dc.b	page(f_TIM1_CAP_COM_IRQHandler)
2553  003a 0000          	dc.w	f_TIM1_CAP_COM_IRQHandler
2554  003c 82            	dc.b	130
2556  003d 00            	dc.b	page(f_TIM2_UPD_OVF_BRK_IRQHandler)
2557  003e 0000          	dc.w	f_TIM2_UPD_OVF_BRK_IRQHandler
2558  0040 82            	dc.b	130
2560  0041 00            	dc.b	page(f_TIM2_CAP_COM_IRQHandler)
2561  0042 0000          	dc.w	f_TIM2_CAP_COM_IRQHandler
2562  0044 82            	dc.b	130
2564  0045 00            	dc.b	page(f_TIM3_UPD_OVF_BRK_IRQHandler)
2565  0046 0000          	dc.w	f_TIM3_UPD_OVF_BRK_IRQHandler
2566  0048 82            	dc.b	130
2568  0049 00            	dc.b	page(f_TIM3_CAP_COM_IRQHandler)
2569  004a 0000          	dc.w	f_TIM3_CAP_COM_IRQHandler
2570  004c 82            	dc.b	130
2572  004d 00            	dc.b	page(f_USART_TX_IRQHandler)
2573  004e 0000          	dc.w	f_USART_TX_IRQHandler
2574  0050 82            	dc.b	130
2576  0051 00            	dc.b	page(f_USART_RX_IRQHandler)
2577  0052 0000          	dc.w	f_USART_RX_IRQHandler
2578  0054 82            	dc.b	130
2580  0055 00            	dc.b	page(f_I2C_IRQHandler)
2581  0056 0000          	dc.w	f_I2C_IRQHandler
2582  0058 82            	dc.b	130
2584  0059 00            	dc.b	page(f_LINUART_TX_IRQHandler)
2585  005a 0000          	dc.w	f_LINUART_TX_IRQHandler
2586  005c 82            	dc.b	130
2588  005d 00            	dc.b	page(f_LINUART_RX_IRQHandler)
2589  005e 0000          	dc.w	f_LINUART_RX_IRQHandler
2590  0060 82            	dc.b	130
2592  0061 00            	dc.b	page(f_ADC_IRQHandler)
2593  0062 0000          	dc.w	f_ADC_IRQHandler
2594  0064 82            	dc.b	130
2596  0065 00            	dc.b	page(f_TIM4_UPD_OVF_IRQHandler)
2597  0066 0000          	dc.w	f_TIM4_UPD_OVF_IRQHandler
2598  0068 82            	dc.b	130
2600  0069 00            	dc.b	page(f_EEPROM_EEC_IRQHandler)
2601  006a 0000          	dc.w	f_EEPROM_EEC_IRQHandler
2602  006c 82            	dc.b	130
2604  006d 00            	dc.b	page(f_NonHandledInterrupt)
2605  006e 0000          	dc.w	f_NonHandledInterrupt
2606  0070 82            	dc.b	130
2608  0071 00            	dc.b	page(f_NonHandledInterrupt)
2609  0072 0000          	dc.w	f_NonHandledInterrupt
2610  0074 82            	dc.b	130
2612  0075 00            	dc.b	page(f_NonHandledInterrupt)
2613  0076 0000          	dc.w	f_NonHandledInterrupt
2614  0078 82            	dc.b	130
2616  0079 00            	dc.b	page(f_NonHandledInterrupt)
2617  007a 0000          	dc.w	f_NonHandledInterrupt
2618  007c 82            	dc.b	130
2620  007d 00            	dc.b	page(f_NonHandledInterrupt)
2621  007e 0000          	dc.w	f_NonHandledInterrupt
2672                     	xdef	__vectab
2673                     	xref	__stext
2674                     	xdef	f_NonHandledInterrupt
2675                     	xref	f_EEPROM_EEC_IRQHandler
2676                     	xref	f_TIM4_UPD_OVF_IRQHandler
2677                     	xref	f_ADC_IRQHandler
2678                     	xref	f_LINUART_RX_IRQHandler
2679                     	xref	f_LINUART_TX_IRQHandler
2680                     	xref	f_I2C_IRQHandler
2681                     	xref	f_USART_RX_IRQHandler
2682                     	xref	f_USART_TX_IRQHandler
2683                     	xref	f_TIM3_CAP_COM_IRQHandler
2684                     	xref	f_TIM3_UPD_OVF_BRK_IRQHandler
2685                     	xref	f_TIM2_CAP_COM_IRQHandler
2686                     	xref	f_TIM2_UPD_OVF_BRK_IRQHandler
2687                     	xref	f_TIM1_CAP_COM_IRQHandler
2688                     	xref	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
2689                     	xref	f_SPI_IRQHandler
2690                     	xref	f_CAN_TX_IRQHandler
2691                     	xref	f_CAN_RX_IRQHandler
2692                     	xref	f_EXTI_PORTE_IRQHandler
2693                     	xref	f_EXTI_PORTD_IRQHandler
2694                     	xref	f_EXTI_PORTC_IRQHandler
2695                     	xref	f_EXTI_PORTB_IRQHandler
2696                     	xref	f_EXTI_PORTA_IRQHandler
2697                     	xref	f_CLK_IRQHandler
2698                     	xref	f_AWU_IRQHandler
2699                     	xref	f_TLI_IRQHandler
2700                     	xref	f_TRAP_IRQHandler
2719                     	end
