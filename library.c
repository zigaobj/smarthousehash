#include "includes.h"

void Delay(u16 num)
{
	while(num--)
	{
	    CLEAR_WATCHDOG;
	}
}
void Generate_CheckSum(void)
{
	CheckHead=0x55;
	CheckSum=ResetSource;		
	CheckSum+=Clock.sec;
	CheckSum+=Clock.min;
	CheckSum+=Clock.hour;
	CheckSum+=Clock.date;
	CheckSum+=Clock.month;
	CheckSum+=Clock.year;
	CheckSum=~CheckSum;
	CheckTail=0xaa;
}
BoolT Check_CheckSum(void)
{
	if(CheckHead!=0x55)
	{
		return FALSE;
	}
	if(CheckTail!=0xaa)
	{
		return FALSE;
	}
	CheckSum+=ResetSource;
	CheckSum+=Clock.sec;
	CheckSum+=Clock.min;
	CheckSum+=Clock.hour;
	CheckSum+=Clock.date;
	CheckSum+=Clock.month;
	CheckSum+=Clock.year;	
	if(CheckSum!=0xFF)
	{
		return FALSE;
	}
	return TRUE;
}

