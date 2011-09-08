#ifndef __INCLUDES_H
#define __INCLUDES_H

#ifdef _ROOT_  //在 main.c 文件中定义此符号
    #define EXT
#else
    #define EXT extern
#endif

#include "modsl.h"
#include "stm8_type.h"
#include "stm8_map.h" //stm8_type.h,stm8_map.h这两个头文件必须放在最前面

#include "config.h" //配置文件
#include "library.h"
#include "stm8_beep.h"
#include "stm8_it.h"
#include "stm8_timer.h"
#include "stm8_gpio.h"
#include "stm8_adc.h"
//#include "stm8_usart.h"
//#include "stm8_linuart.h"
#include "stm8_can.h"
#include "stm8_flash.h"

#include "main.h"

#endif /* __INCLUDES_H */