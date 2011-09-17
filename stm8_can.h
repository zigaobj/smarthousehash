/*******       event ID                  DLC          ******/
#define CANID_NODEREGISTER      0x10445701
#define CANID_ACC1              0x10242040 // 1

#define CANID_SWITCHSTATE       0x1029C080 // 1

/*******       event paramter        ******/
#define PARA_ILL_OFF    0x00
#define PARA_ILL_LV0    0x0C
#define PARA_ILL_LV1    0x0B
#define PARA_ILL_LV17   0xFA
#define PARA_ILL_ON     0x80

#define PROTO_TYPE_STENDCMD 0x81
#define PROTO_TYPE_AIRCMD   0x82
#define PROTO_TYPE_CENCMD   0x83
#define PROTO_TYPE_RADARCMD 0x84
#define PROTO_TYPE_SWC      0x01
#define PROTO_TYPE_PANEL    0x02
#define PROTO_TYPE_AIRINFO  0x03
#define PROTO_TYPE_ILL      0x04
#define PROTO_TYPE_AIRCTRL  0x05
#define PROTO_TYPE_CENCTRL  0x06
#define PROTO_TYPE_RADAR    0x07

/* ************************************************************************
                                                       Exported macro 
**************************************************************************/
#define CanBusSleep() 		{CAN_EN=1;}
#define CanBusWakeup()		{CAN_EN=0;}

EXT vu8 CanPage;
#define CanSavePg()     (CanPage = CAN.PSR)
#define CanRestorePg()  (CAN.PSR = CanPage)

typedef struct 
{
	union
	{
		u8 byte;
		struct
		{
			u8 F_ACC_On       :1;
			u8 F_Register     :1;
		}field;
	}Flag;
    u8 WindVelocity;
    u8 Temperature;
}NODE_STATUS;

EXT NODE_STATUS NodeState;

#define NODE_ACC_FLAG       NodeState.Flag.field.F_ACC_On			 
#define NODE_REGISTER_FLAG  NodeState.Flag.field.F_Register	

/* user receive structure */
typedef volatile struct
{
    u16 stdid;
    u32 extid;
    u8  dlc;
    u8  data[8];
    BoolT RxRdy; //if true cannot be read or written otherwise can be used 
    BoolT Busy;    //shared variable If CTRUE, the data can be modified.
} rCanMsgBuff;
typedef volatile struct
{
    u32 id;
    u8  dlc;
    u8  data[8];
} CanMsgTypeDef;

typedef enum
{
	CAN_INITIAL,
	CAN_WAIT,
	CAN_RUNNING,
	CAN_WAITSLEEP,
	CAN_SLEEP,
	CAN_ACCOFF
}CANBUS_STATUS;
EXT CANBUS_STATUS CanBusState;

EXT spnear CanMsgTypeDef CanTxRxBuffer; //尝试只用一个接收buffer
EXT spnear rCanMsgBuff CANMsgACC; //定义多个消息,为了防止数据处理不及时而丢失

EXT BYTE_TypeDef FlagCan; //全局标志位
#define FlagReSend           FlagCan.field.bit1
#define FLAGMAIN_CAN_MSG_RDY FlagCan.field.bit0

EXT u8 CntSendFalse;

EXT u16 can_msg_id16;//STD
EXT u32 can_msg_id32;//XTD

void CanInit(u8);
void CanSleep(void);
void Can_Wakeup_Enable(void);
void CanWakeUp(void);
void CanInterruptDisable(void);
void CanInterruptRestore (void);
void Can_Store_Rcvd_Msg(void);	//中断服务程序中执行
void ISR_Can_Tx(void);
void ISR_Can_Rx(void);
u8 CanIllumLevel(u8 Byte);
static void CanMsgAnalyze(CanMsgTypeDef *pCanMsg);
void SendToCan(CanMsgTypeDef *pCanMsg);
void NodeRegister(void);
void SendSwitchState(u8 Switch);
void CanFlagAnalyse(void);
void Can_Main(void);

/*-- CAN Filter Parameters ------------------------------------------------*/
#define CAN_FCR1_FILTER0_ACTIVE		0x01
#define CAN_FCR1_FILTER1_ACTIVE		0x10
#define CAN_FCR2_FILTER2_ACTIVE		0x01
#define CAN_FCR2_FILTER3_ACTIVE		0x10
#define CAN_FCR3_FILTER4_ACTIVE		0x01
#define CAN_FCR3_FILTER5_ACTIVE		0x10

#define CAN_FCR1_FILTER0_SCALE_1_32BIT	        0x06
#define CAN_FCR1_FILTER0_SCALE_2_16BIT	        0x04
#define CAN_FCR1_FILTER0_SCALE_1_16BIT_2_8BIT	0x02
#define CAN_FCR1_FILTER0_SCALE_4_8BIT	        0x00

#define CAN_FCR1_FILTER1_SCALE_1_32BIT	        0x60
#define CAN_FCR1_FILTER1_SCALE_2_16BIT	        0x40
#define CAN_FCR1_FILTER1_SCALE_1_16BIT_2_8BIT	0x20
#define CAN_FCR1_FILTER1_SCALE_4_8BIT	        0x00

#define CAN_FCR2_FILTER2_SCALE_1_32BIT	        0x06
#define CAN_FCR2_FILTER2_SCALE_2_16BIT	        0x04
#define CAN_FCR2_FILTER2_SCALE_1_16BIT_2_8BIT	0x02
#define CAN_FCR2_FILTER2_SCALE_4_8BIT	        0x00

#define CAN_FCR2_FILTER3_SCALE_1_32BIT	        0x60
#define CAN_FCR2_FILTER3_SCALE_2_16BIT	        0x40
#define CAN_FCR2_FILTER3_SCALE_1_16BIT_2_8BIT	0x20
#define CAN_FCR2_FILTER3_SCALE_4_8BIT	        0x00

#define CAN_FCR3_FILTER4_SCALE_1_32BIT	        0x06
#define CAN_FCR3_FILTER4_SCALE_2_16BIT	        0x04
#define CAN_FCR3_FILTER4_SCALE_1_16BIT_2_8BIT	0x02
#define CAN_FCR3_FILTER4_SCALE_4_8BIT	        0x00

#define CAN_FCR3_FILTER5_SCALE_1_32BIT	        0x60
#define CAN_FCR3_FILTER5_SCALE_2_16BIT	        0x40
#define CAN_FCR3_FILTER5_SCALE_1_16BIT_2_8BIT	0x20
#define CAN_FCR3_FILTER5_SCALE_4_8BIT	        0x00

#define CAN_FMR1_FILTER0_LR_LIST	0x01
#define CAN_FMR1_FILTER0_HR_LIST	0x02
#define CAN_FMR1_FILTER1_LR_LIST	0x04
#define CAN_FMR1_FILTER1_HR_LIST	0x08
#define CAN_FMR1_FILTER2_LR_LIST	0x10
#define CAN_FMR1_FILTER2_HR_LIST	0x20
#define CAN_FMR1_FILTER3_LR_LIST	0x40
#define CAN_FMR1_FILTER3_HR_LIST	0x80

#define CAN_FMR2_FILTER4_LR_LIST	0x01
#define CAN_FMR2_FILTER4_HR_LIST	0x02
#define CAN_FMR2_FILTER5_LR_LIST	0x04
#define CAN_FMR2_FILTER5_HR_LIST	0x08
