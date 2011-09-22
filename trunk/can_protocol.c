#include "includes.h"

void SendNMTModuleControl(NMT_MODULE_CONTROL NmtCmd,NODEID NodeID)
{
    CanMsgTypeDef CanBuffer;
    CanBuffer.id =CANID_NMT_MODULE_CONTROL;
    CanBuffer.dlc =3;
    CanBuffer.data[0]=NmtCmd;
    CanBuffer.data[1]=(NodeID>>8)&0xFF;
    CanBuffer.data[2]=NodeID&0xFF;
    SendToCan(&CanBuffer);
}

