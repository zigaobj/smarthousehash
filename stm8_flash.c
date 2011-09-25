#include "includes.h"

#pragma section (iapcode)
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
