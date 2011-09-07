#define T4MS100MS       25
#define T4MS200MS       50
#define T4MS500MS       125
#define T4MS1000MS      250
#define T100MS2S        20
#define T100MS5S        50
#define T100MS10S       100
#define T100MS20S       200

void TimerInit(void);
void ISR_TIM4_UPD_OVF(void);
