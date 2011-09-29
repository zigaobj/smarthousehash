//Broadcast
#define CANID_NMT_MODULE_CONTROL        0x00000000
#define CANID_SYNC                      0x02000000
#define CANID_TIME_STAMP                0x04000000
#define CANID_BROADCAST                 0x04030000
#define CANID_SWITCHSTATE               0x04040000

//Point to Point , need to add NodeID
#define CANID_EMERGENCY                 0x02000000
#define CANID_NODEREGISTER_REQUEST      0x04010000
#define CANID_NODEREGISTER_SUCCESS      0x04020000
#define CANID_PDO1_TRANSMIT             0x06000000
#define CANID_PDO1_RECEIVE              0x08000000
#define CANID_PDO2_TRANSMIT             0x0A000000
#define CANID_PDO2_RECEIVE              0x0C000000
#define CANID_PDO3_TRANSMIT             0x0E000000
#define CANID_PDO3_RECEIVE              0x10000000
#define CANID_PDO4_TRANSMIT             0x12000000
#define CANID_PDO4_RECEIVE              0x14000000
#define CANID_SDO_TRANSMIT              0x16000000
#define CANID_SDO_RECEIVE               0x18000000
#define CANID_HEARTBEAT                 0x1C000000

typedef u16 NODEID;
typedef enum
{
    NMT_START_REMOTE_NODE       = 0x01,
    NMT_STOP_REMOTE_NODE        = 0x02,
    NMT_ENTER_PREOPERATIONAL    = 0x80,
    NMT_RESET_NODE              = 0x81,
    NMT_RESET_COMMUNICATION     = 0x82
}NMT_MODULE_CONTROL;
typedef enum
{
	CANPROTOCOL_INITIAL,
	CANPROTOCOL_BUILDCOMM,
	CANPROTOCOL_WAIT,
	CANPROTOCOL_RUNNING,
	CANPROTOCOL_WAITSLEEP,
	CANPROTOCOL_SLEEP
}CANPROTOCOL_STATUS;
EXT CANPROTOCOL_STATUS CanProtocolState;

typedef enum e_accessAttribute { RW, WO, RO, CONST }AccessAttribute;
typedef struct td_subindex
{
    AccessAttribute         bAccessType;    // Access type (RO, RW, ...)
    u8                      bDataType;      // Defines of what datatype the entry is
    u32                     size;           // The size (in Byte) of the variable
    void*                   pObject;        // This is the pointer of the Variable
} SubIndex;

EXT u8 CanProtocol1sTimer;

void SendNMTModuleControl(NMT_MODULE_CONTROL NmtCmd,NODEID NodeID);
void SendNodeRegister(NODEID NodeId);
void MainCanProtocol(void);
