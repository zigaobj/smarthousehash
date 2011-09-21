#include "includes.h"

void SendNMTModuleControl(NMT_MODULE_CONTROL NmtCmd,NODEID NodeID)
{
    CanMsgTypeDef CanBuffer;
    CanBuffer.id =CANID_NMT_MODULE_CONTROL;
    CanBuffer.dlc =2;
    CanBuffer.data[0]=NmtCmd;
    CanBuffer.data[1]=NodeID;
    SendToCan(&CanBuffer);
}

