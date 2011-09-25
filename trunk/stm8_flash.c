#include "includes.h"

#pragma section (iapcode)
/******************************************************************
*��������:FlashWaitForLastOperation()
*��   �� :FLASH�ȴ�����д�����
*��ڲ���:FLASH_CODE,FLASH_DATA
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :mjzhang
******************************************************************/
void FlashWaitForLastOperation(void)
{
    u8 FlashStatus;
    while(!(FLASH.IAPSR & FLASH_IAPSR_EOP))CLEAR_WATCHDOG; //�ȴ�д��FLASH���
}
/******************************************************************
*��������:FlashWriteByte()
*��   �� :FLASHд��һ���ֽ�
*��ڲ���:Address,Data
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :mjzhang
******************************************************************/
void FlashWriteByte(u32 Address,u8 Data)
{
    *((@far u8*)Address) = Data; //дһ���ֽ�
    FlashWaitForLastOperation(); //�ȴ�д��������
}
/******************************************************************
*��������:FlashWriteWord()
*��   �� :FLASHд��һ����4���ֽ�
*��ڲ���:Address,Data32
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :mjzhang
******************************************************************/
void FlashWriteWord(u32 Address,u32 Data32)
{
    FLASH.CR2 |=FLASH_CR2_WPRG;
    FLASH.NCR2 &=(u8)(~FLASH_NCR2_NWPRG);
    
    *(((@far u8*)Address)+0) =BYTE_3(Data32); //дһ���ֽ�
    *(((@far u8*)Address)+1) =BYTE_2(Data32); //дһ���ֽ�
    *(((@far u8*)Address)+2) =BYTE_1(Data32); //дһ���ֽ�
    *(((@far u8*)Address)+3) =BYTE_0(Data32); //дһ���ֽ�
    FlashWaitForLastOperation(); //�ȴ�д��������
}
/******************************************************************
*��������:FlashReadByte()
*��   �� :FLASH����һ���ֽ�
*��ڲ���:Address
*���ڲ���:u8
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :mjzhang
******************************************************************/
u8 FlashReadByte(u32 Address)
{
    return(*((@far u8*)Address)); //��һ���ֽ�
}
/******************************************************************
*��������:FlashReadWord()
*��   �� :FLASH����һ����
*��ڲ���:Address
*���ڲ���:u32
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :mjzhang
******************************************************************/
u32 FlashReadWord(u32 Address)
{
    return(*((@far u32 *)Address)); //��һ����
}
/******************************************************************
*��������:FlashEraseByte()
*��   �� :FLASH����һ���ֽ�
*��ڲ���:Address
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :mjzhang
******************************************************************/
void FlashEraseByte(u32 Address)
{
    *((@far u8*)Address) =0x00; //����һ���ֽ�
    FlashWaitForLastOperation(); //�ȴ�д��������
}
/******************************************************************
*��������:FlashEraseBlock()
*��   �� :FLASH������
*��ڲ���:BlockNum,MemType
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :mjzhang
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
    /* ָ�����׵�ַ */
    StartAddress =StartAddress + ((u32)BlockNum *FLASH_BLOCK_SIZE);
    FLASH.CR2  |= FLASH_CR2_ERASE;
    FLASH.NCR2 &= (u8)(~FLASH_NCR2_NERASE);
    for (i = 0; i <FLASH_BLOCK_SIZE; i++)
    {
        *(((@far u8*)StartAddress)+i) =0x00;
    }
    FlashWaitForLastOperation(); //�ȴ�д��������
}
/******************************************************************
*��������:FlashProgramBlock()
*��   �� :FLASH������
*��ڲ���:BlockNum,MemType,ProgMode,Buffer
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.5
*��   �� :mjzhang
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

    /* ָ�����׵�ַ */
    StartAddress = StartAddress + ((u32)BlockNum *FLASH_BLOCK_SIZE);

    /* ѡ����ģʽ:Standard or Fast programming mode */
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

    /* ��RAM�������ݵ�FLASH */
    for (i = 0; i <FLASH_BLOCK_SIZE; i++)
    {
        *(((@far u8*)StartAddress)+i) =((u8)(Buffer[i]));
    }
    FlashWaitForLastOperation(); //�ȴ�д��������
}

#pragma section ()
