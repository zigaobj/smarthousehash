#include "includes.h"

void Delay(u16 num)
{
	while(num--)
	{
	    CLEAR_WATCHDOG;
	}
}

