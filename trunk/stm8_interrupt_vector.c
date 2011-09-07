//新建工程后,在Project Settings/Linker/category中选Input
//将 vector file name中的路径设置为本文件路径
#include "includes.h"

typedef void @far (*interrupt_handler_t)(void);

struct interrupt_vector {
	unsigned char interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};

@far @interrupt void NonHandledInterrupt (void)
{
	/* in order to detect unexpected events during development, 
	   it is recommended to set a breakpoint on the following instruction
	*/
	return;
}

extern void _stext();     /* startup routine 该函数在启动文 件中已被编译为O文件*/
// _vectab向量表已由cosmic指定到0x8000位置上
struct interrupt_vector const _vectab[] = {
	{0x82, (interrupt_handler_t)_stext}, /* reset */
	{0x82, NonHandledInterrupt}, /* TRAP_IRQHandler  */
	{0x82, NonHandledInterrupt}, /* TLI_IRQHandler  */
	{0x82, NonHandledInterrupt}, /* AWU_IRQHandler  */
	{0x82, NonHandledInterrupt}, /* CLK_IRQHandler  */
	{0x82, NonHandledInterrupt}, /* EXTI_PORTA_IRQHandler  */
	{0x82, NonHandledInterrupt}, /* EXTI_PORTB_IRQHandler  */
	{0x82, NonHandledInterrupt}, /* EXTI_PORTC_IRQHandler  */
	{0x82, NonHandledInterrupt}, /* EXTI_PORTD_IRQHandler  */
	{0x82, NonHandledInterrupt}, /* EXTI_PORTE_IRQHandler  */
	{0x82, NonHandledInterrupt}, /* CAN_RX_IRQHandler  */
	{0x82, NonHandledInterrupt}, /* CAN_TX_IRQHandler  */
	{0x82, NonHandledInterrupt}, /* SPI_IRQHandler */
	{0x82, (interrupt_handler_t)TIM1_UPD_OVF_TRG_BRK_IRQHandler}, /* TIM1_UPD_OVF_TRG_BRK_IRQHandler */
	{0x82, (interrupt_handler_t)TIM1_CAP_COM_IRQHandler}, /* TIM1_CAP_COM_IRQHandler */
	{0x82, (interrupt_handler_t)TIM2_UPD_OVF_BRK_IRQHandler}, /* TIM2_UPD_OVF_BRK_IRQHandler */
	{0x82, (interrupt_handler_t)TIM2_CAP_COM_IRQHandler}, /* TIM2_CAP_COM_IRQHandler */
	{0x82, (interrupt_handler_t)TIM3_UPD_OVF_BRK_IRQHandler}, /* TIM3_UPD_OVF_BRK_IRQHandler */
	{0x82, (interrupt_handler_t)TIM3_CAP_COM_IRQHandler}, /* TIM3_CAP_COM_IRQHandler */
	{0x82, NonHandledInterrupt}, /* USART_TX_IRQHandler */
	{0x82, NonHandledInterrupt}, /* USART_RX_IRQHandler */
	{0x82, NonHandledInterrupt}, /* I2C_IRQHandler */
	{0x82, NonHandledInterrupt}, /* LINUART_TX_IRQHandler */
	{0x82, NonHandledInterrupt}, /* LINUART_RX_IRQHandler */
	{0x82, NonHandledInterrupt}, /* ADC_IRQHandler */
	{0x82, (interrupt_handler_t)TIM4_UPD_OVF_IRQHandler}, /* TIM4_UPD_OVF_IRQHandler */
	{0x82, NonHandledInterrupt}, /* EEPROM_EEC_IRQHandler */
	{0x82, NonHandledInterrupt}, /* _IRQHandler */
	{0x82, NonHandledInterrupt}, /* _IRQHandler */
	{0x82, NonHandledInterrupt}, /* _IRQHandler */
	{0x82, NonHandledInterrupt}, /* _IRQHandler */
	{0x82, NonHandledInterrupt}, /* _IRQHandler */
};

