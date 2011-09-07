#include "includes.h"

void BeepInit(void)
{
    BEEP.CSR =BEEP_CSR_BEEPDIV&0x15; //设置BEEP分频比
    BEEP.CSR |=BEEP_CSR_BEEPSEL&0x00;
}
/******************************************************************
*函数名称:        BeepManage()
*功          能  :产生BEEP警告音,频率,单周期BEEP on off时间可在代码
                  中修改
*入口参数:NONE   
*出口参数:NONE
* By             :mjzhang
*时          间  :2010.5.8
*描          述  :函数中用到全局变量BeepState,BeepTimer
******************************************************************/
void BeepManage(void)
{
    static u8 BeepTimeOn=0,BeepTimeOff=0; //BEEP on off持续时间
    switch(BeepState) //该全局变量控制BEEP的状态
    {
        case BEEP_OFF:
            BeepTimeOn=0;
            BeepTimeOff=0;
            BeepState=BEEP_IDLE;
            break;
        case BEEP_ON:
            BeepTimeOn=T4MS200MS;
            BeepTimeOff=0;
            BEEP.CSR =(BEEP.CSR&(~BEEP_CSR_BEEPSEL))|BEEP_CSR_BEEPSEL_1K;
            BeepTimer=0;
            BeepState=BEEP_IDLE;
            break;
        case BEEP_SHORTBREAK:
            BeepTimeOn=T4MS200MS;
            BeepTimeOff=T4MS200MS;
            BEEP.CSR =(BEEP.CSR&(~BEEP_CSR_BEEPSEL))|BEEP_CSR_BEEPSEL_1K;
            BeepTimer=0;
            BeepState=BEEP_IDLE;
            break;
        case BEEP_MIDDLEBREAK:
            BeepTimeOn=T4MS500MS;
            BeepTimeOff=T4MS500MS;
            BEEP.CSR =(BEEP.CSR&(~BEEP_CSR_BEEPSEL))|BEEP_CSR_BEEPSEL_2K;
            BeepTimer=0;
            BeepState=BEEP_IDLE;
            break;
        case BEEP_LONGBREAK:
            BeepTimeOn=T4MS1000MS;
            BeepTimeOff=T4MS1000MS;
            BEEP.CSR =(BEEP.CSR&(~BEEP_CSR_BEEPSEL))|BEEP_CSR_BEEPSEL_4K;
            BeepTimer=0;
            BeepState=BEEP_IDLE;
            break;
        case BEEP_IDLE:
        default:
            break;
    }
    if(0==BeepTimeOn)
    {
        if(FLAGMAIN_BEEP_ON)
        {
            FLAGMAIN_BEEP_ON=BEEP_OFF;
            BEEP.CSR &=(~BEEP_CSR_BEEPEN);
        }
    }
    else if(0==BeepTimeOff)
    {
        if(!FLAGMAIN_BEEP_ON)
        {
            FLAGMAIN_BEEP_ON=BEEP_ON;
            BEEP.CSR |=BEEP_CSR_BEEPEN;
        }
    }
    else
    {
        if(0==BeepTimer)
        {
            FLAGMAIN_BEEP_ON=~FLAGMAIN_BEEP_ON;
            if(FLAGMAIN_BEEP_ON)
            {
                BeepTimer=BeepTimeOn;
                BEEP.CSR |=BEEP_CSR_BEEPEN;
            }
            else
            {
                BeepTimer=BeepTimeOff;
                BEEP.CSR &=(~BEEP_CSR_BEEPEN);
            }
        }
    }
}