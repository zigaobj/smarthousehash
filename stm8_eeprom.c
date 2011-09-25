#include "includes.h"
EXT u8* const UniqueID = (u8*)0x48CD;
/******************************************************************
*��������:FlashWaitForEepromOperation()
*��   �� :FLASH�ȴ�����д�����
*��ڲ���:FLASH_CODE,FLASH_DATA
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :hash
******************************************************************/
void FlashWaitForEepromOperation(void)
{
    u8 FlashStatus;
    while(!(FLASH.IAPSR & FLASH_IAPSR_EOP))CLEAR_WATCHDOG; //�ȴ�д��FLASH���
}
/******************************************************************
*��������:FlashSetProgrammingTime()
*��   �� :FLASH����
*��ڲ���:FLASH_CODE,FLASH_DATA
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :hash
******************************************************************/
void FlashSetProgrammingTime(FLASH_ProgramTime_TypeDef ProgTime)
{
    FLASH.CR1 &= (u8)(~FLASH_CR1_FIX);
    FLASH.CR1 |= (u8)ProgTime;
}
/******************************************************************
*��������:FlashUnlock()
*��   �� :FLASH����
*��ڲ���:FLASH_CODE,FLASH_DATA
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :hash
******************************************************************/
void FlashUnlock(FlashType MemType)
{
    if(FLASH_CODE==MemType)
    {
        FLASH.PUKR=FLASH_RASS_KEY1; //������ First ������
        FLASH.PUKR=FLASH_RASS_KEY2; //Second ������
    }
    else if(FLASH_DATA==MemType)
    {
        FLASH.DUKR=FLASH_RASS_KEY2; //������ First ������ ,��������������������෴
        FLASH.DUKR=FLASH_RASS_KEY1; //Second ������
    }
}
/******************************************************************
*��������:FlashLock()
*��   �� :FLASH����
*��ڲ���:FLASH_CODE,FLASH_DATA
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :mjzhang
******************************************************************/
void FlashLock(FlashType MemType)
{
    if(FLASH_CODE==MemType)
    {
        FLASH.IAPSR &=(u8)(~FLASH_IAPSR_PUL); //FLASH������д����ʹ��
    }
    else if(FLASH_DATA==MemType)
    {
        FLASH.IAPSR &=(u8)(~FLASH_IAPSR_DUL); //EEPROMд����ʹ��
    }
}
/******************************************************************
*��������:EepromInit()
*��   �� :EEPROM��ʼ��
*��ڲ���:NONE
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :hash
******************************************************************/
void EepromInit(void)
{
    FlashUnlock(FLASH_DATA);
    FlashSetProgrammingTime(FLASH_PROGRAMTIME_STANDARD); //���ʱ��Ϊ 1/2 Tprog ���� Tprog
}
/******************************************************************
*��������:MemeryCopy()
*��   �� :���ݸ���
*��ڲ���:Ŀ���ַ,Ԫ���ݵ�ַ,�ֽ���
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :hash
******************************************************************/
void MemeryCopy(u8 *DesMemery,u8 *SrcMemery,u8 NumOfByte)
{
    u8 i;
    for(i=0;i<NumOfByte;i++)
    {
        *(DesMemery+i)=*(SrcMemery+i);
    }
}
/******************************************************************
*��������:CalculateSettingChkSum()
*��   �� :�������ò���У���
*��ڲ���:NONE
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :hash
******************************************************************/
void CalculateSettingChkSum(void)
{
    u8 n=0;
    u8 checksum=0;
    u8* PEAddress=(u8*)EEP_SETTING_ADDRESS;
    for(n=0;n<SETTING_BTYE_NUM-1;n++)
	{
		checksum+=*PEAddress;
		PEAddress++;
	}
	checksum=~checksum;
	SettingChkSum=checksum;
}
/******************************************************************
*��������:CheckSettingChkSum()
*��   �� :������ò���У���
*��ڲ���:NONE
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :hash
******************************************************************/
BoolT CheckSettingChkSum(void)
{
    u8 n=0;
    u8 checksum=0;
    u8* PEAddress=(u8*)EEP_SETTING_ADDRESS;
    for(n=0;n<SETTING_BTYE_NUM;n++)
    {
        checksum+=*PEAddress;
        PEAddress++;
    }
    if(checksum==0xff)
    {
        return TRUE;
    }
    return FALSE;
}

