#define AIN0		0
#define AIN1		1
#define AIN2		2
#define AIN3		3
#define AIN4		4
#define AIN5		5
#define AIN6		6
#define AIN7		7
#define AIN8		8
#define AIN9		9
#define AIN10		10
#define AIN11		11
#define AIN12		12
#define AIN13		13
#define AIN14		14
#define AIN15		15

#define ADC_KEY1    AIN9
#define KEY_NUM     10

#define NO_KEY      0x00
#define UICC_0      0x01
#define UICC_1      0x02
#define UICC_2      0x03
#define UICC_3      0x04
#define UICC_4      0x05
#define UICC_5      0x06
#define UICC_6      0x07
#define UICC_7      0x08
#define UICC_8      0x09
#define UICC_9      0x0a

EXT u16 debug_adc;

void ADCInit(void);
u8 ADC_8BIT(u8 ch);
u16 ADC_10BIT(u8 ch);
void Key_Scan_AD(void);
