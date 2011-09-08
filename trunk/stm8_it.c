#include "includes.h"

@interrupt void TRAP_IRQHandler(void)
{
	return;
}

@interrupt void TLI_IRQHandler (void)
{
	return;
}

@interrupt void AWU_IRQHandler (void)
{
	return;
}

@interrupt void CLK_IRQHandler (void)
{
	return;
}

@interrupt void EXTI_PORTA_IRQHandler (void)
{
	return;
}

@interrupt void EXTI_PORTB_IRQHandler (void)
{
	return;
}

@interrupt void EXTI_PORTC_IRQHandler (void)
{
	return;
}

@interrupt void EXTI_PORTD_IRQHandler (void)
{
	return;
}

@interrupt void EXTI_PORTE_IRQHandler (void)
{
	return;
}

@interrupt void CAN_RX_IRQHandler (void)
{
    ISR_Can_Rx();
	return;
}

@interrupt void CAN_TX_IRQHandler (void)
{
    ISR_Can_Tx();
	return;
}

@interrupt void SPI_IRQHandler (void)
{
	return;
}

@interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler (void)
{
    static BoolT FlagTemp=0;
    TIM1.SR1 &=(~TIM1_SR1_UIF); //清更新事件标志
    FlagTemp=~FlagTemp;
    if(FlagTemp)
    {
    }
    else
    {
    }
	return;
}

@interrupt void TIM1_CAP_COM_IRQHandler (void)
{
    if(TIM1.SR1&TIM1_SR1_COMIF)
    {
        TIM1.SR1 &=(~TIM1_SR1_COMIF);
    }
	return;
}
@interrupt void TIM2_UPD_OVF_BRK_IRQHandler (void)
{
    TIM2.SR1 &=(~TIM2_SR1_UIF); //清更新事件标志
    TIM1.EGR |=TIM1_EGR_COMG;
    GPIOC.ODR.byte =GPIOC.ODR.byte &(~0x02)|(~GPIOC.ODR.byte)&0x02;
    return;
}

@interrupt void TIM2_CAP_COM_IRQHandler (void)
{
    if(TIM2.SR1&TIM2_SR1_CC1IF)
    {
        TIM2.SR1 &=(~TIM2_SR1_CC1IF); //清捕获标志
        //TIM1.EGR |=TIM1_EGR_COMG; //触发TIM1互补输出commutation事件
        TIM2.CCER1=(TIM2.CCER1&(~TIM2_CCER1_CC1P))|((~TIM2.CCER1)&TIM2_CCER1_CC1P); //翻转触发极性
        GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
    }
    if(TIM2.SR1&TIM2_SR1_CC2IF)
    {
        TIM2.SR1 &=(~TIM2_SR1_CC2IF); //清捕获标志
        //TIM1.EGR |=TIM1_EGR_COMG; //触发TIM1互补输出commutation事件
        TIM2.CCER1=(TIM2.CCER1&(~TIM2_CCER1_CC2P))|((~TIM2.CCER1)&TIM2_CCER1_CC2P); //翻转触发极性
        GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
    }
    if(TIM2.SR1&TIM2_SR1_CC3IF)
    {
        TIM2.SR1 &=(~TIM2_SR1_CC3IF); //清捕获标志
        //TIM1.EGR |=TIM1_EGR_COMG; //触发TIM1互补输出commutation事件
        TIM2.CCER2=(TIM2.CCER2&(~TIM2_CCER2_CC3P))|((~TIM2.CCER2)&TIM2_CCER2_CC3P); //翻转触发极性
        GPIOC.ODR.byte=(GPIOC.ODR.byte&(~0x02))|((~GPIOC.ODR.byte)&0x02); //翻转IO电平
    }
	return;
}

@interrupt void TIM3_UPD_OVF_BRK_IRQHandler (void)
{
	TIM3.SR1 &=0xfe; //清更新事件标志
    //FLAGMAIN_BEEP_ON=~FLAGMAIN_BEEP_ON; //RevBit(FlagMain.byte,0); //reverse bit
    return;
}

@interrupt void TIM3_CAP_COM_IRQHandler (void)
{
	return;
}

@interrupt void USART_TX_IRQHandler (void)
{
    //ISR_USART_TX();
	return;
}

@interrupt void USART_RX_IRQHandler (void)
{
    //ISR_USART_RX();
	return;
}

@interrupt void I2C_IRQHandler (void)
{
	return;
}

@interrupt void LINUART_TX_IRQHandler (void)
{
    //ISR_LINUART_TX();
	return;
}

@interrupt void LINUART_RX_IRQHandler (void)
{
    //ISR_LINUART_RX();
	return;
}

@interrupt void ADC_IRQHandler (void)
{
    u16 AdcH,AdcL;
    while(!(ADC.CSR&0x80)); // 等待转换结束 14 个时钟周期
    ADC.CSR &= 0x7F; // 清除中断标志
    AdcL = ADC.DRL; //READ DATA 因为是右对齐所以先读低位
    AdcH = ADC.DRH;
    AdcH =( AdcH << 8 ) + AdcL;
    ADC.CR1 &=0xfe; // 关闭ADC
    AdcValue=AdcH;
	return;
}

@interrupt void TIM4_UPD_OVF_IRQHandler (void)
{
    ISR_TIM4_UPD_OVF();
    return;
}

@interrupt void EEPROM_EEC_IRQHandler (void)
{
	return;
}
extern void _stext(void);
void Startup(void)
{
	_stext();
}

