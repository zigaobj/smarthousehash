#ifndef __INCLUDES_H
#define __INCLUDES_H

#ifdef _ROOT_  //�� main.c �ļ��ж���˷���
    #define EXT
#else
    #define EXT extern
#endif

#include "modsl.h"
#include "stm8_type.h"
#include "stm8_map.h" //stm8_type.h,stm8_map.h������ͷ�ļ����������ǰ��

#include "config.h" //�����ļ�
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