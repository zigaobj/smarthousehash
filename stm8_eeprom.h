extern u8* const UniqueID;

#define EEP_SETTING_ADDRESS 0x4000
EXT vu16  eep_NodeId         @(0x4000);

#define SETTING_BTYE_NUM 64     //第一CheckSum区包含64字节,最后一个字节用来存放CheckSum
EXT vu8 SettingChkSum @(EEP_SETTING_ADDRESS+SETTING_BTYE_NUM-1);

typedef struct
{
    struct
    {
        unsigned F_valid  :1;
        unsigned id       :15;
    }nodeid;
    u8  address[8];
}NodeIdListTypeDef;
#define EEP_NODEIDLIST_ADDRESS 0x4100
#define NODEIDLIST_MAX_NUM 25
EXT volatile NodeIdListTypeDef eep_NodeIdList[NODEIDLIST_MAX_NUM] @(EEP_NODEIDLIST_ADDRESS);
EXT vu8 NodeIdListNodeNum   @(EEP_NODEIDLIST_ADDRESS+250);
#define NODEIDLIST_BTYE_NUM 256
EXT vu8 NodeIdListCheckSum  @(EEP_NODEIDLIST_ADDRESS+NODEIDLIST_BTYE_NUM-1);


void FlashWaitForEepromOperation(void);
void FlashSetProgrammingTime(FLASH_ProgramTime_TypeDef ProgTime);
void FlashUnlock(FlashType MemType);
void FlashLock(FlashType MemType);
void EepromInit(void);
void MemeryCopy(u8 *DesMemery,u8 *SrcMemery,u8 NumOfByte);
void CalculateSettingChkSum(void);
BoolT CheckSettingChkSum(void);

