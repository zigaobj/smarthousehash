#define spnear @near //定义到非0页RAM区(0x100~0x13ff)
#define NULL 0

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

void Delay(u16 num);

