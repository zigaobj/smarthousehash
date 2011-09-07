/* MAIN.C file
 * Time     2011-07-10
 * Writer   mjzhang
 * Copyright (c) 2011-2016 STMicroelectronics
 */
#ifndef _ROOT_
#define _ROOT_ //区别EXT的宏
#endif
#include "includes.h"
void SysClkInit(void)
{
    CLK.ECKR = 0x01; // 开启外部时钟 8MHz
    while(!(CLK.ECKR & 0x02)); // 等待外部时钟 rdy
    CLK.CKDIVR &= 0xf8; //CPU 无分频
    CLK.SWR = 0xB4; // 选择外部时钟
    while(!(CLK.SWCR & 0x08)); // 等待目标时钟源就绪
    CLK.SWCR |= 0x02; // 使能外部时钟
}
void InterruptInit(void)
{
    _asm("sim"); //关中断
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
    _asm("rim"); //开中断
}
void VariableInit(void)
{
    FlagMain.byte=0;
    PowerState =POWER_INITIAL;
    CanBusState=CAN_INITIAL;
}
void HardwareInit(void)
{
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
    //_asm("sim"); //关中断
    while (1)
    {
        CLEAR_WATCHDOG;
        if(FLAGMAIN_4MS)
        {
            FLAGMAIN_4MS=0; // 4ms时基标志清0
            BeepManage();
            Key_Scan_AD();
            CAN_process();
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
