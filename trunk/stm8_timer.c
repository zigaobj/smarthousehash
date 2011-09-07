#include "includes.h"
void TIM1Init(void)
{
    CLK.PCKENR1 |=CLK_PCKENR1_TIM1; // 开启TIM1时钟，stm8 的外设时钟可控
    TIM1.PSCRH =0x00; // 必须先写高位 H, DIV8 外部晶振 8mhz 
    TIM1.PSCRL =0x07; // 再写低位 L
    TIM1.ARRH =0x00; // 必须先写高位 H, 自动预装值50000
    TIM1.ARRL =0x20; // 再写低位 L
    //TIM1.SMCR|=0x80; //MSM==1
    TIM1.CCMR1 =(TIM1.CCMR1 & 0x8c)|0x40; //OC1配置为PWM输出
    TIM1.CCMR2 =(TIM1.CCMR2 & 0x8c)|0x60; //OC2配置为PWM输出
    TIM1.CCMR3 =(TIM1.CCMR3 & 0x8c)|0x60; //OC3配置为PWM输出
    TIM1.CCMR4 =(TIM1.CCMR4 & 0x8c)|0x60; //OC4配置为PWM输出
    //TIM1.CCER1 =0x55;//(TIM1.CCER1 & 0xf0)|0x05; //开启CC1E CC1NE,CC2E CC2NE互补输出
    //TIM1.CCER2 =(TIM1.CCER2 & 0xc0)|0x15; //开启CC3E CC3NE,互补输出,CC4E输出
    TIM1.OISR =TIM1_OISR_RESET_VALUE; //OC1 OC1N,OC2 OC2N,OC3 OC3N,IdleState==0
    TIM1.CCR1H =0x00; // OC1,OC1N duty cycle
    TIM1.CCR1L =0x08;
    TIM1.CCR2H =0x00; // OC2,OC2N duty cycle
    TIM1.CCR2L =0x10;
    TIM1.CCR3H =0x00; // OC3,OC3N duty cycle
    TIM1.CCR3L =0x18;
    TIM1.CCR4H =0x00; // OC3,OC3N duty cycle
    TIM1.CCR4L =0x1f;
    TIM1.DTR =0x1f; //DeadTime==4us
    TIM1.BKR |=TIM1_BKR_MOE; //MOE==1
    //TIM1.EGR |=0x01;
    //TIM1.CNTRH =0x00; // 必须先写高位 H, 初值 0x0000
    //TIM1.CNTRL =0x00; // 再写低位 L
    //TIM1.RCR =0x00; //重复计数次数
    TIM1.IER |=TIM1_IER_COMIE; //允许中断
    TIM1.CR2 |=TIM1_CR2_COMS|TIM1_CR2_CCPC; 
    TIM1.CR1 |=TIM1_CR1_CEN; // 开启定时器
}

void TIM2Init(void)
{
    CLK.PCKENR1 |=CLK_PCKENR1_TIM2; // 开启TIM2时钟，stm8 的外设时钟可控
    TIM2.PSCR |=0x03; //DIV 2^15 外部晶振 8mhz 除以 2^15 实现单位时间为 1us
    TIM2.ARRH =0x01; // 必须先写高位 H
    TIM2.ARRL =0x00; // 再写低位 L
    TIM2.CCMR1 =TIM2_CCMR1_CCxS_IC_TI1|TIM2_CCMR_ICxF_8; // 8个Fmaster去抖时间
    TIM2.CCMR2 =TIM2_CCMR2_CCxS_IC_TI2|TIM2_CCMR_ICxF_8;
    TIM2.CCMR3 =TIM2_CCMR3_CCxS_IC_TI3|TIM2_CCMR_ICxF_8;
    TIM2.CCER1 =TIM2_CCER1_CC1E|TIM2_CCER1_CC2E; //捕获通道使能
    TIM2.CCER2 =TIM2_CCER2_CC3E;
    TIM2.IER =TIM2_IER_CC1IE|TIM2_IER_CC2IE|TIM2_IER_CC3IE; // 允许中断
    TIM2.CR1 |=TIM2_CR1_CEN; // 开启定时器
}

void TIM3Init(void)
{
    CLK.PCKENR1 |=CLK_PCKENR1_TIM3; // 开启TIM3时钟，stm8 的外设时钟可控
    TIM3.PSCR |=0x0f; //DIV 2^15 外部晶振 8mhz 除以 2^15 实现单位时间为 4096us
    TIM3.ARRH =0x00; // 必须先写高位 H
    TIM3.ARRL =0x80; // 再写低位 L
    TIM3.IER |=TIM3_IER_UIE; // 允许中断
    TIM3.CR1 |=TIM3_CR1_CEN; // 开启定时器
}
/*********      TIM4 作为时基定时器,不作它用          *********/
void TIM4Init(void)
{
    CLK.PCKENR1 |=CLK_PCKENR1_TIM4; // 开启TIM4时钟，stm8 的外设时钟可控
    TIM4.PSCR =7; //DIV 2^7 外部晶振 8mhz 除以 2^7 实现单位时间为 16us
    TIM4.ARR =249; //timer period = 1/(8MHz/128)*(249+1) =4 ms
    TIM4.CNTR=6; //counter=256-6=250
    TIM4.SR1 =0;
    TIM4.IER |=TIM4_IER_UIE; // 允许中断
    TIM4.CR1 |=TIM4_CR1_CEN; // 开启定时器
}

void TimerInit(void)
{
    //TIM1Init();
    //TIM2Init();
    //TIM3Init();
    TIM4Init();
}
/*********      TIM4 作为时基定时器,不作它用          *********/
void ISR_TIM4_UPD_OVF(void)
{
    static u8 CounterTime=0;
	TIM4.SR1 &=(~TIM4_SR1_UIF); //清更新事件标志
    FLAGMAIN_4MS=1;
    CounterTime++;
    if(24==CounterTime|49==CounterTime|74==CounterTime|99==CounterTime
    |124==CounterTime|149==CounterTime|174==CounterTime|199==CounterTime
    |224==CounterTime|249==CounterTime)
    {
        FLAGMAIN_100MS=1;
    }
    if(250<=CounterTime)
    {
        FLAGMAIN_1S=1;
        CounterTime=0;
    }
    
    if(0!=BeepTimer)
        BeepTimer--;
    
}

