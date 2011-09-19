   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.3 - 19 Nov 2007
2348                     ; 12 @far @interrupt void NonHandledInterrupt (void)
2348                     ; 13 {
2349                     	switch	.text
2350  0000               f_NonHandledInterrupt:
2355                     ; 17 	return;
2358  0000 80            	iret
2360                     .const:	section	.text
2361  0000               __vectab:
2362  0000 82            	dc.b	130
2364  0001 00            	dc.b	page(__stext)
2365  0002 0000          	dc.w	__stext
2366  0004 82            	dc.b	130
2368  0005 00            	dc.b	page(f_TRAP_IRQHandler)
2369  0006 0000          	dc.w	f_TRAP_IRQHandler
2370  0008 82            	dc.b	130
2372  0009 00            	dc.b	page(f_TLI_IRQHandler)
2373  000a 0000          	dc.w	f_TLI_IRQHandler
2374  000c 82            	dc.b	130
2376  000d 00            	dc.b	page(f_AWU_IRQHandler)
2377  000e 0000          	dc.w	f_AWU_IRQHandler
2378  0010 82            	dc.b	130
2380  0011 00            	dc.b	page(f_CLK_IRQHandler)
2381  0012 0000          	dc.w	f_CLK_IRQHandler
2382  0014 82            	dc.b	130
2384  0015 00            	dc.b	page(f_EXTI_PORTA_IRQHandler)
2385  0016 0000          	dc.w	f_EXTI_PORTA_IRQHandler
2386  0018 82            	dc.b	130
2388  0019 00            	dc.b	page(f_EXTI_PORTB_IRQHandler)
2389  001a 0000          	dc.w	f_EXTI_PORTB_IRQHandler
2390  001c 82            	dc.b	130
2392  001d 00            	dc.b	page(f_EXTI_PORTC_IRQHandler)
2393  001e 0000          	dc.w	f_EXTI_PORTC_IRQHandler
2394  0020 82            	dc.b	130
2396  0021 00            	dc.b	page(f_EXTI_PORTD_IRQHandler)
2397  0022 0000          	dc.w	f_EXTI_PORTD_IRQHandler
2398  0024 82            	dc.b	130
2400  0025 00            	dc.b	page(f_EXTI_PORTE_IRQHandler)
2401  0026 0000          	dc.w	f_EXTI_PORTE_IRQHandler
2402  0028 82            	dc.b	130
2404  0029 00            	dc.b	page(f_CAN_RX_IRQHandler)
2405  002a 0000          	dc.w	f_CAN_RX_IRQHandler
2406  002c 82            	dc.b	130
2408  002d 00            	dc.b	page(f_CAN_TX_IRQHandler)
2409  002e 0000          	dc.w	f_CAN_TX_IRQHandler
2410  0030 82            	dc.b	130
2412  0031 00            	dc.b	page(f_SPI_IRQHandler)
2413  0032 0000          	dc.w	f_SPI_IRQHandler
2414  0034 82            	dc.b	130
2416  0035 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_BRK_IRQHandler)
2417  0036 0000          	dc.w	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
2418  0038 82            	dc.b	130
2420  0039 00            	dc.b	page(f_TIM1_CAP_COM_IRQHandler)
2421  003a 0000          	dc.w	f_TIM1_CAP_COM_IRQHandler
2422  003c 82            	dc.b	130
2424  003d 00            	dc.b	page(f_TIM2_UPD_OVF_BRK_IRQHandler)
2425  003e 0000          	dc.w	f_TIM2_UPD_OVF_BRK_IRQHandler
2426  0040 82            	dc.b	130
2428  0041 00            	dc.b	page(f_TIM2_CAP_COM_IRQHandler)
2429  0042 0000          	dc.w	f_TIM2_CAP_COM_IRQHandler
2430  0044 82            	dc.b	130
2432  0045 00            	dc.b	page(f_TIM3_UPD_OVF_BRK_IRQHandler)
2433  0046 0000          	dc.w	f_TIM3_UPD_OVF_BRK_IRQHandler
2434  0048 82            	dc.b	130
2436  0049 00            	dc.b	page(f_TIM3_CAP_COM_IRQHandler)
2437  004a 0000          	dc.w	f_TIM3_CAP_COM_IRQHandler
2438  004c 82            	dc.b	130
2440  004d 00            	dc.b	page(f_USART_TX_IRQHandler)
2441  004e 0000          	dc.w	f_USART_TX_IRQHandler
2442  0050 82            	dc.b	130
2444  0051 00            	dc.b	page(f_USART_RX_IRQHandler)
2445  0052 0000          	dc.w	f_USART_RX_IRQHandler
2446  0054 82            	dc.b	130
2448  0055 00            	dc.b	page(f_I2C_IRQHandler)
2449  0056 0000          	dc.w	f_I2C_IRQHandler
2450  0058 82            	dc.b	130
2452  0059 00            	dc.b	page(f_LINUART_TX_IRQHandler)
2453  005a 0000          	dc.w	f_LINUART_TX_IRQHandler
2454  005c 82            	dc.b	130
2456  005d 00            	dc.b	page(f_LINUART_RX_IRQHandler)
2457  005e 0000          	dc.w	f_LINUART_RX_IRQHandler
2458  0060 82            	dc.b	130
2460  0061 00            	dc.b	page(f_ADC_IRQHandler)
2461  0062 0000          	dc.w	f_ADC_IRQHandler
2462  0064 82            	dc.b	130
2464  0065 00            	dc.b	page(f_TIM4_UPD_OVF_IRQHandler)
2465  0066 0000          	dc.w	f_TIM4_UPD_OVF_IRQHandler
2466  0068 82            	dc.b	130
2468  0069 00            	dc.b	page(f_EEPROM_EEC_IRQHandler)
2469  006a 0000          	dc.w	f_EEPROM_EEC_IRQHandler
2470  006c 82            	dc.b	130
2472  006d 00            	dc.b	page(f_NonHandledInterrupt)
2473  006e 0000          	dc.w	f_NonHandledInterrupt
2474  0070 82            	dc.b	130
2476  0071 00            	dc.b	page(f_NonHandledInterrupt)
2477  0072 0000          	dc.w	f_NonHandledInterrupt
2478  0074 82            	dc.b	130
2480  0075 00            	dc.b	page(f_NonHandledInterrupt)
2481  0076 0000          	dc.w	f_NonHandledInterrupt
2482  0078 82            	dc.b	130
2484  0079 00            	dc.b	page(f_NonHandledInterrupt)
2485  007a 0000          	dc.w	f_NonHandledInterrupt
2486  007c 82            	dc.b	130
2488  007d 00            	dc.b	page(f_NonHandledInterrupt)
2489  007e 0000          	dc.w	f_NonHandledInterrupt
2540                     	xdef	__vectab
2541                     	xref	__stext
2542                     	xdef	f_NonHandledInterrupt
2543                     	xref	f_EEPROM_EEC_IRQHandler
2544                     	xref	f_TIM4_UPD_OVF_IRQHandler
2545                     	xref	f_ADC_IRQHandler
2546                     	xref	f_LINUART_RX_IRQHandler
2547                     	xref	f_LINUART_TX_IRQHandler
2548                     	xref	f_I2C_IRQHandler
2549                     	xref	f_USART_RX_IRQHandler
2550                     	xref	f_USART_TX_IRQHandler
2551                     	xref	f_TIM3_CAP_COM_IRQHandler
2552                     	xref	f_TIM3_UPD_OVF_BRK_IRQHandler
2553                     	xref	f_TIM2_CAP_COM_IRQHandler
2554                     	xref	f_TIM2_UPD_OVF_BRK_IRQHandler
2555                     	xref	f_TIM1_CAP_COM_IRQHandler
2556                     	xref	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
2557                     	xref	f_SPI_IRQHandler
2558                     	xref	f_CAN_TX_IRQHandler
2559                     	xref	f_CAN_RX_IRQHandler
2560                     	xref	f_EXTI_PORTE_IRQHandler
2561                     	xref	f_EXTI_PORTD_IRQHandler
2562                     	xref	f_EXTI_PORTC_IRQHandler
2563                     	xref	f_EXTI_PORTB_IRQHandler
2564                     	xref	f_EXTI_PORTA_IRQHandler
2565                     	xref	f_CLK_IRQHandler
2566                     	xref	f_AWU_IRQHandler
2567                     	xref	f_TLI_IRQHandler
2568                     	xref	f_TRAP_IRQHandler
2587                     	end
