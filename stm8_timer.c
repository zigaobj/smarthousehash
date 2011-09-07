#include "includes.h"
void TIM1Init(void)
{
    CLK.PCKENR1 |=CLK_PCKENR1_TIM1; // ����TIM1ʱ�ӣ�stm8 ������ʱ�ӿɿ�
    TIM1.PSCRH =0x00; // ������д��λ H, DIV8 �ⲿ���� 8mhz 
    TIM1.PSCRL =0x07; // ��д��λ L
    TIM1.ARRH =0x00; // ������д��λ H, �Զ�Ԥװֵ50000
    TIM1.ARRL =0x20; // ��д��λ L
    //TIM1.SMCR|=0x80; //MSM==1
    TIM1.CCMR1 =(TIM1.CCMR1 & 0x8c)|0x40; //OC1����ΪPWM���
    TIM1.CCMR2 =(TIM1.CCMR2 & 0x8c)|0x60; //OC2����ΪPWM���
    TIM1.CCMR3 =(TIM1.CCMR3 & 0x8c)|0x60; //OC3����ΪPWM���
    TIM1.CCMR4 =(TIM1.CCMR4 & 0x8c)|0x60; //OC4����ΪPWM���
    //TIM1.CCER1 =0x55;//(TIM1.CCER1 & 0xf0)|0x05; //����CC1E CC1NE,CC2E CC2NE�������
    //TIM1.CCER2 =(TIM1.CCER2 & 0xc0)|0x15; //����CC3E CC3NE,�������,CC4E���
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
    //TIM1.CNTRH =0x00; // ������д��λ H, ��ֵ 0x0000
    //TIM1.CNTRL =0x00; // ��д��λ L
    //TIM1.RCR =0x00; //�ظ���������
    TIM1.IER |=TIM1_IER_COMIE; //�����ж�
    TIM1.CR2 |=TIM1_CR2_COMS|TIM1_CR2_CCPC; 
    TIM1.CR1 |=TIM1_CR1_CEN; // ������ʱ��
}

void TIM2Init(void)
{
    CLK.PCKENR1 |=CLK_PCKENR1_TIM2; // ����TIM2ʱ�ӣ�stm8 ������ʱ�ӿɿ�
    TIM2.PSCR |=0x03; //DIV 2^15 �ⲿ���� 8mhz ���� 2^15 ʵ�ֵ�λʱ��Ϊ 1us
    TIM2.ARRH =0x01; // ������д��λ H
    TIM2.ARRL =0x00; // ��д��λ L
    TIM2.CCMR1 =TIM2_CCMR1_CCxS_IC_TI1|TIM2_CCMR_ICxF_8; // 8��Fmasterȥ��ʱ��
    TIM2.CCMR2 =TIM2_CCMR2_CCxS_IC_TI2|TIM2_CCMR_ICxF_8;
    TIM2.CCMR3 =TIM2_CCMR3_CCxS_IC_TI3|TIM2_CCMR_ICxF_8;
    TIM2.CCER1 =TIM2_CCER1_CC1E|TIM2_CCER1_CC2E; //����ͨ��ʹ��
    TIM2.CCER2 =TIM2_CCER2_CC3E;
    TIM2.IER =TIM2_IER_CC1IE|TIM2_IER_CC2IE|TIM2_IER_CC3IE; // �����ж�
    TIM2.CR1 |=TIM2_CR1_CEN; // ������ʱ��
}

void TIM3Init(void)
{
    CLK.PCKENR1 |=CLK_PCKENR1_TIM3; // ����TIM3ʱ�ӣ�stm8 ������ʱ�ӿɿ�
    TIM3.PSCR |=0x0f; //DIV 2^15 �ⲿ���� 8mhz ���� 2^15 ʵ�ֵ�λʱ��Ϊ 4096us
    TIM3.ARRH =0x00; // ������д��λ H
    TIM3.ARRL =0x80; // ��д��λ L
    TIM3.IER |=TIM3_IER_UIE; // �����ж�
    TIM3.CR1 |=TIM3_CR1_CEN; // ������ʱ��
}
/*********      TIM4 ��Ϊʱ����ʱ��,��������          *********/
void TIM4Init(void)
{
    CLK.PCKENR1 |=CLK_PCKENR1_TIM4; // ����TIM4ʱ�ӣ�stm8 ������ʱ�ӿɿ�
    TIM4.PSCR =7; //DIV 2^7 �ⲿ���� 8mhz ���� 2^7 ʵ�ֵ�λʱ��Ϊ 16us
    TIM4.ARR =249; //timer period = 1/(8MHz/128)*(249+1) =4 ms
    TIM4.CNTR=6; //counter=256-6=250
    TIM4.SR1 =0;
    TIM4.IER |=TIM4_IER_UIE; // �����ж�
    TIM4.CR1 |=TIM4_CR1_CEN; // ������ʱ��
}

void TimerInit(void)
{
    //TIM1Init();
    //TIM2Init();
    //TIM3Init();
    TIM4Init();
}
/*********      TIM4 ��Ϊʱ����ʱ��,��������          *********/
void ISR_TIM4_UPD_OVF(void)
{
    static u8 CounterTime=0;
	TIM4.SR1 &=(~TIM4_SR1_UIF); //������¼���־
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

