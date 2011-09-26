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
/******************************************************************
*函数名称:SendNodeRegister()
*功   能 :
*入口参数:NONE   
*出口参数:NONE
*描   述 :
*时   间 :2010.5.25
*作   者 :mjzhang
******************************************************************/
void SendNodeRegister(NODEID NodeId)
{
    CanMsgTypeDef CanBuffer;
    CanBuffer.id =CANID_NODEREGISTER|NodeId;
    CanBuffer.dlc =8;
    CanBuffer.data[0]=UniqueID[0];
    CanBuffer.data[1]=UniqueID[1];
    CanBuffer.data[2]=UniqueID[2];
    CanBuffer.data[3]=UniqueID[3];
    CanBuffer.data[4]=UniqueID[4];
    CanBuffer.data[5]=UniqueID[5];
    CanBuffer.data[6]=UniqueID[6];
    CanBuffer.data[7]=UniqueID[7];
    SendToCan(&CanBuffer);
}
void MainCanProtocol(void)
{
    switch(CanProtocolState)
    {
        case CANPROTOCOL_INITIAL:
        {
#if HASH_MODEL==HS_0001M
            SendNMTModuleControl(NMT_RESET_COMMUNICATION,CANID_NMT_MODULE_CONTROL);
            CanProtocol1sTimer=0;
#elif HASH_MODEL==HS_0002S
            SendNodeRegister(eep_NodeId);
            CanProtocol1sTimer=5;
#endif
            CanProtocolState=CANPROTOCOL_WAIT;
            break;
        }
        case CANPROTOCOL_WAIT:
        {
            if(CanProtocol1sTimer>0)break;
#if HASH_MODEL==HS_0002S
            if(0==NODE_REGISTER_FLAG)
            {
                CanProtocolState=CANPROTOCOL_INITIAL;
            }
            else
#endif
            {
                CanProtocolState=CANPROTOCOL_RUNNING;
            }
            break;
        }
        case CANPROTOCOL_RUNNING:
        {
            if(CanProtocol1sTimer>0)break;
            break;
        }
        case CANPROTOCOL_WAITSLEEP:
        {
            
            break;
        }
        case CANPROTOCOL_SLEEP:
        {
            
            break;
        }
        default:
            break;
    }
}
