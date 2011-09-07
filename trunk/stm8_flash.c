#define _FLASH_
#include "includes.h"

spnear u8 GBuffer[FLASH_BLOCK_SIZE];
spnear u8 FlashByte;
spnear u32 FlashWord;
spnear u16 Block; /*block 0 is first block of Data memory: address is 4000*/
volatile u8 Eeprom[128] @(0x4000);
/******************************************************************
*函数名称:EepromUnlock()
*功   能 :EEPROM解锁
*入口参数:NONE
*出口参数:NONE
*描   述 :
*时   间 :2010.6.4
*作   者 :mjzhang
******************************************************************/
void EepromUnlock(void)
{
    FLASH.DUKR=FLASH_RASS_KEY2; //数据区 First 解锁码 ,数据区解锁码与程序区相反
    FLASH.DUKR=FLASH_RASS_KEY1; //Second 解锁码
}
/******************************************************************
*函数名称:EepromSave()
*功   能 :EEPROM保存
*入口参数:NONE
*出口参数:NONE
*描   述 :
*时   间 :2011.6.4
*作   者 :mjzhang
******************************************************************/
void EepromSave(void)
{
    u8 i;
    EepromUnlock();
    for(i=0;i<128;i++)
    {
        Eeprom[i]=0xa1;
        FlashWaitForEepromOperation(); //等待写操作结束
    }
    FLASH.IAPSR &=(u8)(~FLASH_IAPSR_DUL); //EEPROM写保护使能
}
/******************************************************************
*函数名称:EepromLoad()
*功   能 :EEPROM保存
*入口参数:NONE
*出口参数:NONE
*描   述 :
*时   间 :2011.6.4
*作   者 :mjzhang
******************************************************************/
BoolT EepromLoad(void)
{
    u8 i;
}
/******************************************************************
*函数名称:FlashWaitForEepromOperation()
*功   能 :FLASH等待数据写入完成
*入口参数:FLASH_CODE,FLASH_DATA
*出口参数:NONE
*描   述 :
*时   间 :2010.6.4
*作   者 :mjzhang
******************************************************************/
void FlashWaitForEepromOperation(void)
{
    u8 FlashStatus;
    while(!(FLASH.IAPSR & FLASH_IAPSR_EOP))CLEAR_WATCHDOG; //等待写入FLASH完成
}

#pragma section (iapcode)
void IapProc(u8 Byte)
{
    u32 Add=0;
    u8 i=0;
    /* Fill the buffer in RAM */
    for (i = 0; i < FLASH_BLOCK_SIZE; i++)
    {
        GBuffer[i] = Byte;
    }
    FlashSetProgrammingTime(FLASH_PROGRAMTIME_HALFTPROG); //编程时间为 1/2 Tprog 或者 Tprog
    FlashUnlock(FLASH_CODE); //程序区解锁
    Add=0x20000;
    Block=0x300;
    //FlashWriteByte(Add,Byte);
    //FlashWriteWord(Add,0x53525150); //写一个字
    //FlashEraseBlock(Block, FLASH_CODE); //擦除块
    FlashProgramBlock(Block, FLASH_CODE, FLASH_PROGRAMMODE_STANDARD, GBuffer); //写一个块128字节
    FlashLock(FLASH_CODE);//FLASH程序区写保护使能
    for(;;); //FLASH写入完成后等待WDG复位
}
/******************************************************************
*函数名称:FlashUnlock()
*功   能 :FLASH解锁
*入口参数:FLASH_CODE,FLASH_DATA
*出口参数:NONE
*描   述 :
*时   间 :2010.6.4
*作   者 :mjzhang
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
*作   者 :mjzhang
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
*函数名称:FlashWaitForLastOperation()
*功   能 :FLASH等待数据写入完成
*入口参数:FLASH_CODE,FLASH_DATA
*出口参数:NONE
*描   述 :
*时   间 :2010.6.4
*作   者 :mjzhang
******************************************************************/
void FlashWaitForLastOperation(void)
{
    u8 FlashStatus;
    while(!(FLASH.IAPSR & FLASH_IAPSR_EOP))CLEAR_WATCHDOG; //等待写入FLASH完成
}
/******************************************************************
*函数名称:FlashWriteByte()
*功   能 :FLASH写入一个字节
*入口参数:Address,Data
*出口参数:NONE
*描   述 :
*时   间 :2010.6.4
*作   者 :mjzhang
******************************************************************/
void FlashWriteByte(u32 Address,u8 Data)
{
    *((@far u8*)Address) = Data; //写一个字节
    FlashWaitForLastOperation(); //等待写操作结束
}
/******************************************************************
*函数名称:FlashWriteWord()
*功   能 :FLASH写入一个字4个字节
*入口参数:Address,Data32
*出口参数:NONE
*描   述 :
*时   间 :2010.6.4
*作   者 :mjzhang
******************************************************************/
void FlashWriteWord(u32 Address,u32 Data32)
{
    FLASH.CR2 |=FLASH_CR2_WPRG;
    FLASH.NCR2 &=(u8)(~FLASH_NCR2_NWPRG);
    
    *(((@far u8*)Address)+0) =BYTE_3(Data32); //写一个字节
    *(((@far u8*)Address)+1) =BYTE_2(Data32); //写一个字节
    *(((@far u8*)Address)+2) =BYTE_1(Data32); //写一个字节
    *(((@far u8*)Address)+3) =BYTE_0(Data32); //写一个字节
    FlashWaitForLastOperation(); //等待写操作结束
}
/******************************************************************
*函数名称:FlashReadByte()
*功   能 :FLASH读出一个字节
*入口参数:Address
*出口参数:u8
*描   述 :
*时   间 :2010.6.4
*作   者 :mjzhang
******************************************************************/
u8 FlashReadByte(u32 Address)
{
    return(*((@far u8*)Address)); //读一个字节
}
/******************************************************************
*函数名称:FlashReadWord()
*功   能 :FLASH读出一个字
*入口参数:Address
*出口参数:u32
*描   述 :
*时   间 :2010.6.4
*作   者 :mjzhang
******************************************************************/
u32 FlashReadWord(u32 Address)
{
    return(*((@far u32 *)Address)); //读一个字
}
/******************************************************************
*函数名称:FlashEraseByte()
*功   能 :FLASH擦除一个字节
*入口参数:Address
*出口参数:NONE
*描   述 :
*时   间 :2010.6.4
*作   者 :mjzhang
******************************************************************/
void FlashEraseByte(u32 Address)
{
    *((@far u8*)Address) =0x00; //擦除一个字节
    FlashWaitForLastOperation(); //等待写操作结束
}
/******************************************************************
*函数名称:FlashEraseBlock()
*功   能 :FLASH擦除块
*入口参数:BlockNum,MemType
*出口参数:NONE
*描   述 :
*时   间 :2010.6.4
*作   者 :mjzhang
******************************************************************/
void FlashEraseBlock(u16 BlockNum, FlashType MemType)
{
    u8 i;
    u32 StartAddress = 0;
    if(FLASH_CODE==MemType)
    {
        StartAddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
    }
    else if(FLASH_DATA==MemType)
    {
        StartAddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
    }
    /* 指向块的首地址 */
    StartAddress =StartAddress + ((u32)BlockNum *FLASH_BLOCK_SIZE);
    FLASH.CR2  |= FLASH_CR2_ERASE;
    FLASH.NCR2 &= (u8)(~FLASH_NCR2_NERASE);
    for (i = 0; i <FLASH_BLOCK_SIZE; i++)
    {
        *(((@far u8*)StartAddress)+i) =0x00;
    }
    FlashWaitForLastOperation(); //等待写操作结束
}
/******************************************************************
*函数名称:FlashProgramBlock()
*功   能 :FLASH擦除块
*入口参数:BlockNum,MemType,ProgMode,Buffer
*出口参数:NONE
*描   述 :
*时   间 :2010.6.5
*作   者 :mjzhang
******************************************************************/
void FlashProgramBlock(u16 BlockNum, FlashType MemType, FLASH_ProgramMode_TypeDef ProgMode, u8 *Buffer)
{
    u16 i = 0;
    u32 StartAddress = 0;

    if (FLASH_CODE==MemType)
    {
        StartAddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
    }
    else
    {
        StartAddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
    }

    /* 指向块的首地址 */
    StartAddress = StartAddress + ((u32)BlockNum *FLASH_BLOCK_SIZE);

    /* 选择编程模式:Standard or Fast programming mode */
    if (FLASH_PROGRAMMODE_STANDARD==ProgMode)
    {
        /* Standard programming mode */ /*No need in standard mode*/
        FLASH.CR2 |= FLASH_CR2_PRG;
        FLASH.NCR2 &= (u8)(~FLASH_NCR2_NPRG);
    }
    else
    {
        /* Fast programming mode */
        FLASH.CR2 |= FLASH_CR2_FPRG;
        FLASH.NCR2 &= (u8)(~FLASH_NCR2_NFPRG);
    }

    /* 从RAM复制数据到FLASH */
    for (i = 0; i <FLASH_BLOCK_SIZE; i++)
    {
        *(((@far u8*)StartAddress)+i) =((u8)(Buffer[i]));
    }
    FlashWaitForLastOperation(); //等待写操作结束
}

#pragma section ()
