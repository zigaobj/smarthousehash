#include "includes.h"

void BeepInit(void)
{
    BEEP.CSR =BEEP_CSR_BEEPDIV&0x15; //����BEEP��Ƶ��
    BEEP.CSR |=BEEP_CSR_BEEPSEL&0x00;
}
/******************************************************************
*��������:        BeepManage()
*��          ��  :����BEEP������,Ƶ��,������BEEP on offʱ����ڴ���
                  ���޸�
*��ڲ���:NONE   
*���ڲ���:NONE
* By             :mjzhang
*ʱ          ��  :2010.5.8
*��          ��  :�������õ�ȫ�ֱ���BeepState,BeepTimer
******************************************************************/
void BeepManage(void)
{
    static u8 BeepTimeOn=0,BeepTimeOff=0; //BEEP on off����ʱ��
    switch(BeepState) //��ȫ�ֱ�������BEEP��״̬
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