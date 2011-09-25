#include "includes.h"
EXT u8* const UniqueID = (u8*)0x48CD;
/******************************************************************
*函数名称:FlashWaitForEepromOperation()
*功   能 :FLASH等待数据写入完成
*入口参数:FLASH_CODE,FLASH_DATA
*出口参数:NONE
*描   述 :
*时   间 :2010.6.4
*作   者 :hash
******************************************************************/
void FlashWaitForEepromOperation(void)
{
    u8 FlashStatus;
    while(!(FLASH.IAPSR & FLASH_IAPSR_EOP))CLEAR_WATCHDOG; //等待写入FLASH完成
}
/******************************************************************
*函数名称:FlashSetProgrammingTime()
*功   能 :FLASH解锁
*入口参数:FLASH_CODE,FLASH_DATA
*出口参数:NONE
*描   述 :
*时   间 :2010.6.4
*作   者 :hash
******************************************************************/
void FlashSetProgrammingTime(FLASH_ProgramTime_TypeDef ProgTime)
{
    FLASH.CR1 &= (u8)(~FLASH_CR1_FIX);
    FLASH.CR1 |= (u8)ProgTime;
}
/******************************************************************
*函数名称:FlashUnlock()
*功   能 :FLASH解锁
*入口参数:FLASH_CODE,FLASH_DATA
*出口参数:NONE
*描   述 :
*时   间 :2010.6.4
*作   者 :hash
******************************************************************/
void FlashUnlock(FlashType MemType)
{
    if(FLASH_CODE==MemType)
    {
        FLASH.PUKR=FLASH_RASS_KEY1; //程序区 First 解锁码
        FLASH.PUKR=FLASH_RASS_KEY2; //Second 解锁码
    }
    else if(FLASH_DATA==MemType)
    {
        FLASH.DUKR=FLASH_RASS_KEY2; //数据区 First 解锁码 ,数据区解锁码与程序区相反
        FLASH.DUKR=FLASH_RASS_KEY1; //Second 解锁码
    }
}
/******************************************************************
*函数名称:FlashLock()
*功   能 :FLASH上锁
*入口参数:FLASH_CODE,FLASH_DATA
*出口参数:NONE
*描   述 :
*时   间 :2010.6.4
*作   者 :mjzhang
******************************************************************/
void FlashLock(FlashType MemType)
{
    if(FLASH_CODE==MemType)
    {
        FLASH.IAPSR &=(u8)(~FLASH_IAPSR_PUL); //FLASH程序区写保护使能
    }
    else if(FLASH_DATA==MemType)
    {
        FLASH.IAPSR &=(u8)(~FLASH_IAPSR_DUL); //EEPROM写保护使能
    }
}
/******************************************************************
*函数名称:EepromInit()
*功   能 :EEPROM初始化
*入口参数:NONE
*出口参数:NONE
*描   述 :
*时   间 :2010.6.4
*作   者 :hash
******************************************************************/
void EepromInit(void)
{
    FlashUnlock(FLASH_DATA);
    FlashSetProgrammingTime(FLASH_PROGRAMTIME_STANDARD); //编程时间为 1/2 Tprog 或者 Tprog
}
/******************************************************************
*函数名称:MemeryCopy()
*功   能 :数据复制
*入口参数:目标地址,元数据地址,字节数
*出口参数:NONE
*描   述 :
*时   间 :2010.6.4
*作   者 :hash
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
*函数名称:CalculateSettingChkSum()
*功   能 :计算设置参数校验和
*入口参数:NONE
*出口参数:NONE
*描   述 :
*时   间 :2010.6.4
*作   者 :hash
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
*函数名称:CheckSettingChkSum()
*功   能 :检查设置参数校验和
*入口参数:NONE
*出口参数:NONE
*描   述 :
*时   间 :2010.6.4
*作   者 :hash
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

