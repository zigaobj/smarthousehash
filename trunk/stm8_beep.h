typedef enum
{
    BEEP_OFF=0,
    BEEP_ON,
    BEEP_IDLE,
    BEEP_SHORTBREAK,
    BEEP_MIDDLEBREAK,
    BEEP_LONGBREAK
}BEEP_state;
EXT BEEP_state BeepState;

EXT u8 BeepTimer;

void BeepInit(void);
void BeepManage(void);
