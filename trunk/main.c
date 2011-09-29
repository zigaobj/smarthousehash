/* MAIN.C file
 * Time     2011-07-10
 * Writer   mjzhang
 * Copyright (c) 2011-2016 STMicroelectronics
 */
#ifndef _ROOT_
#define _ROOT_ //����EXT�ĺ�
#endif
#include "includes.h"
void SysClkInit(void)
{
    CLK.ECKR = 0x01; // �����ⲿʱ�� 8MHz
    while(!(CLK.ECKR & 0x02)); // �ȴ��ⲿʱ�� rdy
    CLK.CKDIVR &= 0xf8; //CPU �޷�Ƶ
    CLK.SWR = 0xB4; // ѡ���ⲿʱ��
    while(!(CLK.SWCR & 0x08)); // �ȴ�Ŀ��ʱ��Դ����
    CLK.SWCR |= 0x02; // ʹ���ⲿʱ��
}
void InterruptInit(void)
{
    _asm("sim"); //���ж�
    ITC.ISPR1 =0xff;
    ITC.ISPR2 =0xff;
    ITC.ISPR3 =0xff;
    ITC.ISPR4 =0xff;
    ITC.ISPR5 =0xff;
    ITC.ISPR6 =0xff;
    ITC.ISPR7 =0xff;
    ITC.ISPR8 =0xff;
    EXTI.CR1 =0x00;
    EXTI.CR2 =0x00;
    _asm("rim"); //���ж�
}
void VariableInit(void)
{
    if(Check_CheckSum())
    {
        if(RST.SR&RST_SR_EMCF) 
        {
            ResetSource=RESET_B_Power_Blinking;
        }
        else if(RST.SR&(RST_SR_IWDGF|RST_SR_WWDGF))
        {
            ResetSource=RESET_Watchdog;
        }
        else if(RST.SR&RST_SR_SWIMF)
        {
            ResetSource=RESET_B_Power; //���Ը�λ�ɸ�����Ҫ�޸�
        }
        else//�ⲿReset������λ		
        {
            ResetSource=RESET_Key;	
        }
    }
    else
    {
        ResetSource=RESET_B_Power;
    }
    RST.SR=0x1F;    //�����λ��־
    Generate_CheckSum();    //���¼���CheckSum
    FlagMain.byte=0;
    PowerState =POWER_INITIAL;
    CanBusState=CAN_INITIAL;
}
void HardwareInit(void)
{
    EepromInit();
    SysClkInit();
    Delay(10000); //wait for system power stability
    GPIOInit();
    TimerInit();
    BeepInit();
}
main()
{
    //_fctcpy('F');
    HardwareInit();
    VariableInit();
    InterruptInit();
    BEGIN_WATCHDOG;
    //_asm("sim"); //���ж�
    while (1)
    {
        CLEAR_WATCHDOG;
        if(FLAGMAIN_4MS)
        {
            FLAGMAIN_4MS=0; // 4msʱ����־��0
            BeepManage();
            Key_Scan_AD();
            Can_Main();
        }
        if(FLAGMAIN_100MS)
        {
            FLAGMAIN_100MS=0;
            
        }
        if(FLAGMAIN_FATAL)
        {
            break;
        }
    }
    while(1)
    {
        
    }
}
