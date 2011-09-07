/*******       event ID                  DLC          ******/
#define CANID_LOCK1            0x10580404 // 3
#define CANID_LOCK2            0x10754040 // 3

#define CANID_ACC1             0x10242040 // 1
#define CANID_ACC2             0x10570402 // 1

#define CANID_ILLUM1           0x10466677 // 3
#define CANID_ILLUM2           0x10644040 // 3

#define CANID_PARKING          0x103B4040 // 1

#define CANID_REVERSE          0x103A80BB // 4 CANID_LOCK中第二字节同时变化

#define CANID_WARNING          0x1040A080 // 1 DOOR,SEATBELT,FRONTCAP,REARCAP,REVERSE报警时此ID为 1

#define CANID_WARN_DOOR1       0x10400040 // 5
#define CANID_WARN_DOOR2       0x10400041 // 5

#define CANID_WARN_DOORZONE1   0x10364044 // 1
#define CANID_WARN_DOORZONE2   0x10630040 // 1

#define CANID_WARN_SEATBELT1   0x10400058 // 5
#define CANID_WARN_SEATBELT2   0x10400059 // 5

#define CANID_WARN_FRONTCAP1   0x1040005F // 3
#define CANID_WARN_FRONTCAP2   0x10400060 // 3

#define CANID_WARN_REARCAP1    0x106B4040 // 1
#define CANID_WARN_REARCAP2    0x106B4041 // 1

#define CANID_WARN_REVERSE1    0x104000BA // 5
#define CANID_WARN_REVERSE2    0x104000BB // 5

#define CANID_SWC1             0x10340845 // 1
#define CANID_SWC2             0x10438040 // 1

#define CANID_TEMPEROUT1       0x10273407 // 3
#define CANID_TEMPEROUT2       0x10424060 // 3

#define CANID_TEMPERSEAT1      0x10273309 // 4
#define CANID_TEMPERSEAT2      0x107220A9 // 4

#define CANID_AIRINFO1         0x109922B1 // 8
#define CANID_AIRINFO2         0x10B02099 // 8

#define CANID_SPEED1           0x10210040 // 8
#define CANID_SPEED2           0x106B8040 // 8

#define CANID_CARCENCTL        0x10AD6080 // 8

#define CANID_CARAIRCTL        0x10AD0C44 // 6

#define CANID_RADAR1           0x10AD0C66 // 8
#define CANID_RADAR2           0x10ADC0BB // 8

#define CANID_ONSTARSW         0x1029C080 // 1

#define CANID_ONSTARNUM        0x10B22080 // 8

#define CANID_PHONEOVER        0x106E0097 // 2

/*******       event paramter        ******/
#define PARA_ILL_OFF    0x00
#define PARA_ILL_LV0    0x0C
#define PARA_ILL_LV1    0x0B
#define PARA_ILL_LV17   0xFA
#define PARA_ILL_ON     0x80

#define KEY_DOWN        0x01
#define KEY_UP          0x00

#define CANCENCTL_FIRSTBYTE 0x03

#define CANCENCTL_SRHCAR    0x2802
#define CANCENCTL_LOCKRUN   0x2C02
#define CANCENCTL_DISOPDRAUTOLOCK 0x2C0F // 防开门自动落锁
#define CANCENCTL_REMOTEUNLOCKLIGHT 0x2C0D
#define CANCENCTL_REMOTEUNLOCK 0x2C0E
#define CANCENCTL_LOCKILLDELAY 0x2805
#define CANCENCTL_PARKAUTOUNLOCK 0x2C03
#define CANCENCTL_REMOTELOCKLIGHTSPEAK 0x2C0B
#define CANCENCTL_LOCKDELAY 0x2C04


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

#define PROTO_LENGTH_STARTEND   0x01
#define PROTO_LENGTH_AIRCMD     0x02
#define PROTO_LENGTH_CENCMD     0x02
#define PROTO_LENGTH_RADARCMD   0x01
#define PROTO_LENGTH_SWC        0x02
#define PROTO_LENGTH_PANEL      0x02
#define PROTO_LENGTH_AIRINFO    0x06
#define PROTO_LENGTH_ILL        0x01
#define PROTO_LENGTH_AIRCTRL    0x01
#define PROTO_LENGTH_CENCTRL    0x02
#define PROTO_LENGTH_RADAR      0x01

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
			u8 F_LOCK         :1;
			u8 F_ACC_On       :1;
			u8 F_Illume       :1;
			u8 F_Parking      :1;
			u8 F_Reverse      :1;
			u8 F_Warning      :1;
			u8 F_SWCKeyUpDown :1;
			u8 F_PNLKeyUpDown :1;
		}field;
	}CarFlag;
	union
	{
		u8 byte;
		struct
		{
			u8 F_ObDistance   :2; //障碍物距离
			u8 F_SEATBELT     :1; //安全带报警
			u8 F_FRONTCAP     :1; //前盖报警
			u8 F_REARCAP      :1; //后盖报警
			u8 F_Radar        :1;
		}field;
	}WarnFlag;
	union
	{
		u8 byte;
		struct
		{
			u8 F_LeftFront    :1; //左前门
			u8 F_LeftRear     :1; //左后门
			u8 F_RightFront   :1; //右前门
			u8 F_RightRear    :1; //右后门
			u8 F_Door         :1; //门未关报警
		}field;
	}DoorFlag;
	union
	{
		u8 byte;
		struct
		{
		    u8 F_WindLv       :4;
		    u8 F_Reserve      :1;
			u8 F_LoopInOut    :1; // 1为内循环
			u8 F_AC           :1; // 1为AC ON
			u8 F_AirSW        :1;
		}field;
	}AirFlag;
	union
	{
		u8 byte;
		struct
		{
		    u8 F_Reserve      :1;
		    u8 F_RWAutoFog    :1;
			u8 F_TemperZone   :2;
			u8 F_SenserSlt    :2;
			u8 F_AutoWdLv     :2;
		}field;
	}AirCtrlFlag;
	union
	{
	    u8 byte;
	    struct
	    {
	        u8 F_RightSeat    :4;
	        u8 F_LeftSeat     :4;
	    }field;
	}TemperSeat;
	union
	{
	    u8 byte;
	    struct
	    {
	        u8 F_LockDelay    :1;
	        u8 F_UnlockPark   :2;
	        u8 F_LockRun      :1;
	        u8 F_UnlockOpDr   :1; //防止开门自动落锁 0有效
	        u8 F_IllumeDelay  :2;
	        u8 F_LightSrhCar  :1;
	    }field;
	}CenLock;
	union
	{
	    u8 byte;
	    struct
	    {
	        u8 F_Reserve      :4;
	        u8 F_RemoUnlockDR   :1;
	        u8 F_RemoLockLightSpeak  :2;
	        u8 F_RemoUnlockLightSW   :1;
	    }field;
	}CenRemote;
    u8 WindMode;
    u8 TemperRight;
    u8 TemperLeft;
    s8 TemperOutdoor;
    u8 SWCKey;
    u8 PanelKey;
    u8 IllumeLevel;
    u8 BatteryVolt;
    u16 Speed;
    u8 OnStarStatus;
    u8 CANParam;
}CAR_STATUS;

EXT CAR_STATUS CarState;

#define CAR_LOCK_FLAG       CarState.CarFlag.field.F_LOCK		 
#define CAR_ACC_FLAG        CarState.CarFlag.field.F_ACC_On			 
#define CAR_ILLUME_FLAG	    CarState.CarFlag.field.F_Illume	
#define CAR_PARKING_FLAG    CarState.CarFlag.field.F_Parking
#define CAR_REVERSE_FLAG    CarState.CarFlag.field.F_Reverse	
#define CAR_WARNING_FLAG    CarState.CarFlag.field.F_Warning
#define CAR_SWCKEYDOWN_FLAG CarState.CarFlag.field.F_SWCKeyUpDown
#define CAR_PNLKEYDOWN_FLAG CarState.CarFlag.field.F_PNLKeyUpDown

#define CAR_WARN_SEATBELT   CarState.WarnFlag.field.F_SEATBELT
#define CAR_WARN_FRONTCAP   CarState.WarnFlag.field.F_FRONTCAP
#define CAR_WARN_REARCAP    CarState.WarnFlag.field.F_REARCAP
#define CAR_WARN_REVERSE    CarState.WarnFlag.field.F_ObDistance //倒车障碍物距离

#define CAR_DOORWARNNING    CarState.DoorFlag.field.F_Door
#define CAR_DOORWARN_LF     CarState.DoorFlag.field.F_LeftFront
#define CAR_DOORWARN_LR     CarState.DoorFlag.field.F_LeftRear
#define CAR_DOORWARN_RF     CarState.DoorFlag.field.F_RightFront
#define CAR_DOORWARN_RR     CarState.DoorFlag.field.F_RightRear

#define CAR_AUTOMODEWINDLV  CarState.AirCtrlFlag.field.F_AutoWdLv
#define CAR_AIRSENSORSLT    CarState.AirCtrlFlag.field.F_SenserSlt
#define CAR_AIRTEMPZONE     CarState.AirCtrlFlag.field.F_TemperZone
#define CAR_REARWAUTOFOG    CarState.AirCtrlFlag.field.F_RWAutoFog

#define CAR_RADAR           CarState.WarnFlag.field.F_Radar

#define CAR_SEARCHCARLIGHT  CarState.CenLock.field.F_LightSrhCar
#define CAR_AUTOLOCKRUN     CarState.CenLock.field.F_LockRun
#define CAR_DISOPDRAUTOLOCK CarState.CenLock.field.F_UnlockOpDr
#define CAR_REMOUNLOCKLIGHT CarState.CenRemote.field.F_RemoUnlockLightSW
#define CAR_REMOTEUNLOCKDR  CarState.CenRemote.field.F_RemoUnlockDR
#define CAR_LOCKILLDELAY    CarState.CenLock.field.F_IllumeDelay
#define CAR_LOCKDELAY       CarState.CenLock.field.F_LockDelay
#define CAR_PARKAUTOUNLOCK  CarState.CenLock.field.F_UnlockPark
#define CAR_REMOLOCKLIGHTSP CarState.CenRemote.field.F_RemoLockLightSpeak

#define CAR_TX_ONSTARSTATUS CarState.OnStar_Status

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


typedef enum
{
	CAN_INITIAL,
	CAN_RUNNING,
	CAN_WAITSLEEP,
	CAN_SLEEP,
	CAN_ACCOFF
}CANBUS_STATUS;

EXT CANBUS_STATUS CanBusState;

EXT spnear rCanMsgBuff CanRxBuffer; //尝试只用一个接收buffer
EXT spnear rCanMsgBuff CANMsgACC; //定义多个消息,为了防止数据处理不及时而丢失
EXT spnear rCanMsgBuff CANMsgIllum;
EXT spnear rCanMsgBuff CANMsgParking;
EXT spnear rCanMsgBuff CANMsgSWC;
EXT spnear rCanMsgBuff CANMsgReverse;
EXT spnear rCanMsgBuff CANMsgWarning;
EXT spnear rCanMsgBuff CANMsgSpeed;
EXT spnear rCanMsgBuff CANMsgTempeOut;
EXT spnear rCanMsgBuff CANMsgAirInfo;
EXT spnear rCanMsgBuff CANMsgTempeSeat;

EXT BYTE_TypeDef FlagCan; //全局标志位
#define FlagReSend           FlagCan.field.bit1
#define FLAGMAIN_CAN_MSG_RDY FlagCan.field.bit0

EXT u8 CntSendFalse;

EXT u16 can_msg_id16;//STD
EXT u32 can_msg_id32;//XTD

void CAN_Init(u8);
void CAN_Sleep(void);
void Can_Wakeup_Enable(void);
void CAN_WakeUp(void);
void CanCanInterruptDisable(void);
void CanCanInterruptRestore (void);
void CAN_Store_Rcvd_Msg(void);	//中断服务程序中执行
void ISR_Can_Tx(void);
void ISR_Can_Rx(void);
u8 CanIllumLevel(u8 Byte);
static void CanMsgAnalyze(void);
void CanFlagAnalyse(void);
void CAN_process(void);

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
