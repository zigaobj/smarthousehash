   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
2348                     ; 12 @far @interrupt void NonHandledInterrupt (void)
2348                     ; 13 {
2349                     	switch	.text
2350  0000               f_NonHandledInterrupt:
2354                     ; 17 	return;
2357  0000 80            	iret
2359                     .const:	section	.text
2360  0000               __vectab:
2361  0000 82            	dc.b	130
2363  0001 00            	dc.b	page(__stext)
2364  0002 0000          	dc.w	__stext
2365  0004 82            	dc.b	130
2367  0005 00            	dc.b	page(f_TRAP_IRQHandler)
2368  0006 0000          	dc.w	f_TRAP_IRQHandler
2369  0008 82            	dc.b	130
2371  0009 00            	dc.b	page(f_TLI_IRQHandler)
2372  000a 0000          	dc.w	f_TLI_IRQHandler
2373  000c 82            	dc.b	130
2375  000d 00            	dc.b	page(f_AWU_IRQHandler)
2376  000e 0000          	dc.w	f_AWU_IRQHandler
2377  0010 82            	dc.b	130
2379  0011 00            	dc.b	page(f_CLK_IRQHandler)
2380  0012 0000          	dc.w	f_CLK_IRQHandler
2381  0014 82            	dc.b	130
2383  0015 00            	dc.b	page(f_EXTI_PORTA_IRQHandler)
2384  0016 0000          	dc.w	f_EXTI_PORTA_IRQHandler
2385  0018 82            	dc.b	130
2387  0019 00            	dc.b	page(f_EXTI_PORTB_IRQHandler)
2388  001a 0000          	dc.w	f_EXTI_PORTB_IRQHandler
2389  001c 82            	dc.b	130
2391  001d 00            	dc.b	page(f_EXTI_PORTC_IRQHandler)
2392  001e 0000          	dc.w	f_EXTI_PORTC_IRQHandler
2393  0020 82            	dc.b	130
2395  0021 00            	dc.b	page(f_EXTI_PORTD_IRQHandler)
2396  0022 0000          	dc.w	f_EXTI_PORTD_IRQHandler
2397  0024 82            	dc.b	130
2399  0025 00            	dc.b	page(f_EXTI_PORTE_IRQHandler)
2400  0026 0000          	dc.w	f_EXTI_PORTE_IRQHandler
2401  0028 82            	dc.b	130
2403  0029 00            	dc.b	page(f_CAN_RX_IRQHandler)
2404  002a 0000          	dc.w	f_CAN_RX_IRQHandler
2405  002c 82            	dc.b	130
2407  002d 00            	dc.b	page(f_CAN_TX_IRQHandler)
2408  002e 0000          	dc.w	f_CAN_TX_IRQHandler
2409  0030 82            	dc.b	130
2411  0031 00            	dc.b	page(f_SPI_IRQHandler)
2412  0032 0000          	dc.w	f_SPI_IRQHandler
2413  0034 82            	dc.b	130
2415  0035 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_BRK_IRQHandler)
2416  0036 0000          	dc.w	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
2417  0038 82            	dc.b	130
2419  0039 00            	dc.b	page(f_TIM1_CAP_COM_IRQHandler)
2420  003a 0000          	dc.w	f_TIM1_CAP_COM_IRQHandler
2421  003c 82            	dc.b	130
2423  003d 00            	dc.b	page(f_TIM2_UPD_OVF_BRK_IRQHandler)
2424  003e 0000          	dc.w	f_TIM2_UPD_OVF_BRK_IRQHandler
2425  0040 82            	dc.b	130
2427  0041 00            	dc.b	page(f_TIM2_CAP_COM_IRQHandler)
2428  0042 0000          	dc.w	f_TIM2_CAP_COM_IRQHandler
2429  0044 82            	dc.b	130
2431  0045 00            	dc.b	page(f_TIM3_UPD_OVF_BRK_IRQHandler)
2432  0046 0000          	dc.w	f_TIM3_UPD_OVF_BRK_IRQHandler
2433  0048 82            	dc.b	130
2435  0049 00            	dc.b	page(f_TIM3_CAP_COM_IRQHandler)
2436  004a 0000          	dc.w	f_TIM3_CAP_COM_IRQHandler
2437  004c 82            	dc.b	130
2439  004d 00            	dc.b	page(f_USART_TX_IRQHandler)
2440  004e 0000          	dc.w	f_USART_TX_IRQHandler
2441  0050 82            	dc.b	130
2443  0051 00            	dc.b	page(f_USART_RX_IRQHandler)
2444  0052 0000          	dc.w	f_USART_RX_IRQHandler
2445  0054 82            	dc.b	130
2447  0055 00            	dc.b	page(f_I2C_IRQHandler)
2448  0056 0000          	dc.w	f_I2C_IRQHandler
2449  0058 82            	dc.b	130
2451  0059 00            	dc.b	page(f_LINUART_TX_IRQHandler)
2452  005a 0000          	dc.w	f_LINUART_TX_IRQHandler
2453  005c 82            	dc.b	130
2455  005d 00            	dc.b	page(f_LINUART_RX_IRQHandler)
2456  005e 0000          	dc.w	f_LINUART_RX_IRQHandler
2457  0060 82            	dc.b	130
2459  0061 00            	dc.b	page(f_ADC_IRQHandler)
2460  0062 0000          	dc.w	f_ADC_IRQHandler
2461  0064 82            	dc.b	130
2463  0065 00            	dc.b	page(f_TIM4_UPD_OVF_IRQHandler)
2464  0066 0000          	dc.w	f_TIM4_UPD_OVF_IRQHandler
2465  0068 82            	dc.b	130
2467  0069 00            	dc.b	page(f_EEPROM_EEC_IRQHandler)
2468  006a 0000          	dc.w	f_EEPROM_EEC_IRQHandler
2469  006c 82            	dc.b	130
2471  006d 00            	dc.b	page(f_NonHandledInterrupt)
2472  006e 0000          	dc.w	f_NonHandledInterrupt
2473  0070 82            	dc.b	130
2475  0071 00            	dc.b	page(f_NonHandledInterrupt)
2476  0072 0000          	dc.w	f_NonHandledInterrupt
2477  0074 82            	dc.b	130
2479  0075 00            	dc.b	page(f_NonHandledInterrupt)
2480  0076 0000          	dc.w	f_NonHandledInterrupt
2481  0078 82            	dc.b	130
2483  0079 00            	dc.b	page(f_NonHandledInterrupt)
2484  007a 0000          	dc.w	f_NonHandledInterrupt
2485  007c 82            	dc.b	130
2487  007d 00            	dc.b	page(f_NonHandledInterrupt)
2488  007e 0000          	dc.w	f_NonHandledInterrupt
2539                     	xdef	__vectab
2540                     	xref	__stext
2541                     	xdef	f_NonHandledInterrupt
2542                     	xref	f_EEPROM_EEC_IRQHandler
2543                     	xref	f_TIM4_UPD_OVF_IRQHandler
2544                     	xref	f_ADC_IRQHandler
2545                     	xref	f_LINUART_RX_IRQHandler
2546                     	xref	f_LINUART_TX_IRQHandler
2547                     	xref	f_I2C_IRQHandler
2548                     	xref	f_USART_RX_IRQHandler
2549                     	xref	f_USART_TX_IRQHandler
2550                     	xref	f_TIM3_CAP_COM_IRQHandler
2551                     	xref	f_TIM3_UPD_OVF_BRK_IRQHandler
2552                     	xref	f_TIM2_CAP_COM_IRQHandler
2553                     	xref	f_TIM2_UPD_OVF_BRK_IRQHandler
2554                     	xref	f_TIM1_CAP_COM_IRQHandler
2555                     	xref	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
2556                     	xref	f_SPI_IRQHandler
2557                     	xref	f_CAN_TX_IRQHandler
2558                     	xref	f_CAN_RX_IRQHandler
2559                     	xref	f_EXTI_PORTE_IRQHandler
2560                     	xref	f_EXTI_PORTD_IRQHandler
2561                     	xref	f_EXTI_PORTC_IRQHandler
2562                     	xref	f_EXTI_PORTB_IRQHandler
2563                     	xref	f_EXTI_PORTA_IRQHandler
2564                     	xref	f_CLK_IRQHandler
2565                     	xref	f_AWU_IRQHandler
2566                     	xref	f_TLI_IRQHandler
2567                     	xref	f_TRAP_IRQHandler
2586                     	end
