#define spnear @near //定义到非0页RAM区(0x100~0x13ff)
#define NULL 0

#define SPTINY @tiny
#define SPNEAR @near
#define SPFAR  @far

#define BYTE_0(Data32) ((u8)((Data32)&(u8)0xFF))
#define BYTE_1(Data32) ((u8)((Data32)>>(u8)8))
#define BYTE_2(Data32) ((u8)((Data32)>>(u8)16))
#define BYTE_3(Data32) ((u8)((Data32)>>(u8)24))

//#define USE_IWDG                //调试看门狗
#define USE_WWDG            //窗口看门狗调试

#ifdef USE_IWDG
#define BEGIN_WATCHDOG	 {IWDG.KR=0xCC;IWDG.KR=0x55;IWDG.PR=0x04;IWDG.RLR=0XFF;IWDG.KR=0xAA;}
#define CLEAR_WATCHDOG	 {IWDG.KR=0xAA;}	
#elif defined(USE_WWDG)
#define BEGIN_WATCHDOG	{WWDG.WR=0X7F;WWDG.CR=0XFF;}
#define CLEAR_WATCHDOG	{WWDG.CR=0X7F;}
#else //no watchdog
#define BEGIN_WATCHDOG	
#define CLEAR_WATCHDOG	 
#endif
typedef struct
{
	unsigned char sec;
	unsigned char min;
	unsigned char hour;
	unsigned char weekday;
	unsigned char date;
	unsigned char month;
	unsigned char year;
}ClockStruct;
typedef enum
{
    RESET_Watchdog,         //Watchdog引起RESET
    RESET_B_Power,          //B+上电引起RESET
    RESET_Key,              //外部按键引起RESET
    RESET_B_Power_Blinking  //瞬检引起RESET
}RESET_STATUS;
#pragma section @tiny [nochange]
EXT SPTINY  u8 CheckHead;
EXT SPTINY  ClockStruct Clock;
EXT SPTINY  RESET_STATUS ResetSource;
EXT SPTINY  u8 CheckSum;
EXT SPTINY  u8 CheckTail;
#pragma section @tiny []

void Delay(u16 num);
void Generate_CheckSum(void);
BoolT Check_CheckSum(void);
