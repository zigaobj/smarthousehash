#include "includes.h"
void ADCInit(void) //设置单次转换
{
    CLK.PCKENR2 |=0x08; // 使能 adc 时钟
    ADC.CSR =0x00; // 选择通道 0 禁止中断
    ADC.CR1 =0x00; // 使能 ADC,连续模式,2分频
    ADC.CR2 =0x08; // 数据右对齐， low 8BIT AT ADC_DRL;
}
//8-bit AD convertor
u8 ADC_8BIT(u8 ch)
{
    u16 Adc;
    u8 i;
    ADC.CR2=0;
    ADC.CSR =ch &0x0F;
    ADC.CR1 |=0x1; // 启动ADC
    _asm("nop");
    ADC.CR1 |=0x1; // 开始转换
    for(i=0;(i<100)&&((ADC.CSR &ADC_CSR_EOC)==0);i++)
        Delay(1);
    Adc = ADC.DRH; //READ DATA 因为是右对齐所以先读低位
    ADC.CR1 &=0xfe; // 关闭ADC
    return(Adc);
}
//10-bit AD convertor
u16 ADC_10BIT(u8 ch)
{
    u16 Adc;
    u8 i;
    ADC.CR2 =0x08; // 数据右对齐， low 8BIT AT ADC_DRL;
    ADC.CSR =ch &0x0F;
    ADC.CR1 |=0x1; // 启动ADC
    _asm("nop");
    ADC.CR1 |=0x1; // 开始转换
    for(i=0;(i<100)&&((ADC.CSR &ADC_CSR_EOC)==0);i++)
        Delay(1);
    Adc = ADC.DRH; //READ DATA 因为是右对齐所以先读低位
    Adc<<=8;
    Adc +=ADC.DRL;
    ADC.CR1 &=0xfe; // 关闭ADC
    return(Adc);
}

const u8 AD_Key_Tab[KEY_NUM+1][3]=
{
    {0,UICC_0,0},
    {23,UICC_1,0},
    {60,UICC_2,0},
    {92,UICC_3,0},
    {114,UICC_4,0},
    {145,UICC_5,0},
    {169,UICC_6,0},
    {192,UICC_7,0},
    {214,UICC_8,0},
    {234,UICC_9,0},
    {255,NO_KEY,0}
};
void Key_Scan_AD(void)
{
    u8 index=0;			//当前扫描值
	u8 ADC_Value=0;
	ADC_Value=ADC_8BIT(ADC_KEY1);
	for(index=0;index<KEY_NUM;index++)
	{
		if ( (ADC_Value >=((AD_Key_Tab[index][0]>8)?(AD_Key_Tab[index][0]-8):0))
		 &&(ADC_Value <=(AD_Key_Tab[index][0]+8)) )
		{
			break;
		}
	}
	if(AD_Key_Tab[index][1]!=debug_adc)
	{
	    debug_adc=AD_Key_Tab[index][1];
	    switch(debug_adc)
	    {
	        case UICC_0:
	            BeepState=BEEP_ON;
	            break;
	        case UICC_1:
	            BeepState=BEEP_OFF;
	            break;
	        case UICC_2:
	            BeepState=BEEP_SHORTBREAK;
	            break;
	        case UICC_3:
	            LED_1=~LED_1;
	            BeepState=BEEP_MIDDLEBREAK;
	            break;
	        case UICC_4:
	            LED_2=~LED_2;
	            BeepState=BEEP_LONGBREAK;
	            break;
	        case UICC_5:
	            LED_3=~LED_3;
	            BeepState=BEEP_OFF;
	            break;
	        case UICC_6:
	            LED_4=~LED_4;
	            BeepState=BEEP_OFF;
	            break;
	        case UICC_7:
	            LED_5=~LED_5;
	            BeepState=BEEP_OFF;
	            break;
	        case UICC_8:
	            LED_6=~LED_6;
	            BeepState=BEEP_OFF;
	            break;
	        case UICC_9:
	            LED_7=~LED_7;
	            BeepState=BEEP_OFF;
	            break;
	    }
	}
}