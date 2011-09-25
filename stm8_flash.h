
#define FLASH_PROG_START_PHYSICAL_ADDRESS ((u32)0x008000) /*!< Program memory: start address */
#define FLASH_PROG_END_PHYSICAL_ADDRESS   ((u32)0x027FFF) /*!< Program memory: end address */
#define FLASH_PROG_BLOCKS_NUMBER          ((u16)1024)     /*!< Program memory: total number of blocks */

#define FLASH_DATA_START_PHYSICAL_ADDRESS ((u32)0x004000) /*!< Data EEPROM memory: start address */
#define FLASH_DATA_END_PHYSICAL_ADDRESS   ((u32)0x0047FF) /*!< Data EEPROM memory: end address */
#define FLASH_DATA_BLOCKS_NUMBER          ((u16)16)       /*!< Data EEPROM memory: total number of blocks */

#define FLASH_BLOCK_SIZE                  ((u8)128) /*!< Number of bytes in a block (common for Program and Data memories) */

#define FLASH_RASS_KEY1 ((u8)0x56)
#define FLASH_RASS_KEY2 ((u8)0xAE)

typedef enum
{
    FLASH_CODE=1,
    FLASH_DATA=2
}FlashType;
typedef enum {
  FLASH_PROGRAMMODE_STANDARD = (u8)0x00, /*!< Standard programming mode */
  FLASH_PROGRAMMODE_FAST     = (u8)0x10  /*!< Fast programming mode */
} FLASH_ProgramMode_TypeDef;
typedef enum {
  FLASH_PROGRAMTIME_STANDARD = (u8)0x00, /*!< programming time fixed at 1/2 tprog */
  FLASH_PROGRAMTIME_TPROG     = (u8)0x01  /*!< Programming time fixed at tprog */
} FLASH_ProgramTime_TypeDef;

void FlashWaitForLastOperation(void);
void FlashWriteByte(u32 Address,u8 Data);
void FlashWriteWord(u32 Address,u32 Data32);
u8 FlashReadByte(u32 Address);
u32 FlashReadWord(u32 Address);
void FlashEraseByte(u32 Address);
void FlashEraseBlock(u16 BlockNum, FlashType MemType);
void FlashProgramBlock(u16 BlockNum, FlashType MemType, FLASH_ProgramMode_TypeDef ProgMode, u8 *Buffer);

