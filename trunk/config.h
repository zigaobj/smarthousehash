#ifndef _CONFIG_H
#define _CONFIG_H

#define RELEASE_FOR_PRODUCE 0

#define HS_0001M   1
#define HS_0002S   2

#define HASH_MODEL   HS_0002S //不同机种软件,在此修改机种代号即可

#if 0==RELEASE_FOR_PRODUCE
//#define DEBUG_SEND
//#define DEBUG_BEEP
//#define DEBUG_FLASH
//#define DEBUG_USART
//#define DEBUG_LIN
#endif

#if HASH_MODEL==HS_0001M
    #define MODEL_NAME  "HS_0001M"
#elif HASH_MODEL==HS_0002S
    #define MODEL_NAME  "HS_0002S"
#else
    #define MODEL_NAME  "        "
#endif

#endif
