#define _FLASH_
#include "includes.h"

spnear u8 GBuffer[FLASH_BLOCK_SIZE];
spnear u8 FlashByte;
spnear u32 FlashWord;
spnear u16 Block; /*block 0 is first block of Data memory: address is 4000*/
volatile u8 Eeprom[128] @(0x4000);
/******************************************************************
*��������:EepromUnlock()
*��   �� :EEPROM����
*��ڲ���:NONE
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :mjzhang
******************************************************************/
void EepromUnlock(void)
{
    FLASH.DUKR=FLASH_RASS_KEY2; //������ First ������ ,��������������������෴
    FLASH.DUKR=FLASH_RASS_KEY1; //Second ������
}
/******************************************************************
*��������:EepromSave()
*��   �� :EEPROM����
*��ڲ���:NONE
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2011.6.4
*��   �� :mjzhang
******************************************************************/
void EepromSave(void)
{
    u8 i;
    EepromUnlock();
    for(i=0;i<128;i++)
    {
        Eeprom[i]=0xa1;
        FlashWaitForEepromOperation(); //�ȴ�д��������
    }
    FLASH.IAPSR &=(u8)(~FLASH_IAPSR_DUL); //EEPROMд����ʹ��
}
/******************************************************************
*��������:EepromLoad()
*��   �� :EEPROM����
*��ڲ���:NONE
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2011.6.4
*��   �� :mjzhang
******************************************************************/
BoolT EepromLoad(void)
{
    u8 i;
}
/******************************************************************
*��������:FlashWaitForEepromOperation()
*��   �� :FLASH�ȴ�����д�����
*��ڲ���:FLASH_CODE,FLASH_DATA
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :mjzhang
******************************************************************/
void FlashWaitForEepromOperation(void)
{
    u8 FlashStatus;
    while(!(FLASH.IAPSR & FLASH_IAPSR_EOP))CLEAR_WATCHDOG; //�ȴ�д��FLASH���
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
    FlashSetProgrammingTime(FLASH_PROGRAMTIME_HALFTPROG); //���ʱ��Ϊ 1/2 Tprog ���� Tprog
    FlashUnlock(FLASH_CODE); //����������
    Add=0x20000;
    Block=0x300;
    //FlashWriteByte(Add,Byte);
    //FlashWriteWord(Add,0x53525150); //дһ����
    //FlashEraseBlock(Block, FLASH_CODE); //������
    FlashProgramBlock(Block, FLASH_CODE, FLASH_PROGRAMMODE_STANDARD, GBuffer); //дһ����128�ֽ�
    FlashLock(FLASH_CODE);//FLASH������д����ʹ��
    for(;;); //FLASHд����ɺ�ȴ�WDG��λ
}
/******************************************************************
*��������:FlashUnlock()
*��   �� :FLASH����
*��ڲ���:FLASH_CODE,FLASH_DATA
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.6.4
*��   �� :mjzhang
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
*��   �� :mjzhang
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
