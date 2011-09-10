#define SetBit(byte,bit) (byte|=(1<<bit))
#define ClrBit(byte,bit) (byte&=(~(1<<bit)))
#define RevBit(byte,bit) (byte=((~byte)&(1<<bit))|(byte&(~(1<<bit))))

#define BEGIN_WWDG		{WWDG.WR=0X7F;WWDG.CR=0XFF;}
#define CLEAR_WWDG		{WWDG.CR=0X7F;}

EXT u16 AdcValue;
EXT BYTE_TypeDef FlagMain; //全局标志位
#define FLAGMAIN_BEEP_ON   FlagMain.field.bit0
#define FLAGMAIN_4MS    FlagMain.field.bit1
#define FLAGMAIN_100MS  FlagMain.field.bit2
#define FLAGMAIN_1S     FlagMain.field.bit3
#define FlagSendToMainACK   FlagMain.field.bit4 //标志数据分析OK，发给主机MAIN等待ACK
#define FLAGMAIN_LINKSTATE  FlagMain.field.bit5
#define FLAGMAIN_FATAL  FlagMain.field.bit6

#ifdef _DEBUG_
EXT u8 DebugParameter;
EXT u32 DebugWord[2];
#endif

EXT u8 FatalCode;

typedef enum
{
	POWER_INITIAL,
	POWER_ON,
	POWER_SLEEPWAIT,
	POWER_SLEEP,
	POWER_ACCOFFWAIT,
	POWER_ACCOFF
}POWER_STATUS;
EXT POWER_STATUS PowerState;

extern void _fctcpy(char);
void Power(void);