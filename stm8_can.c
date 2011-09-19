#include "includes.h"
/*******       Node ID        ******/
//uc8 UniqueID_Temp[8]={0x51,0x02,0x03,0x04,0x05,0x06,0x07,0x08};

/*******************************************************************************
* Function Name : CanInit
* Description   : 配置,激活CAN模块
* Input         : CAN_MasterCtrlReg (MCR各bit的组合)
				  - CAN_MCR_ABOM: Automatic bus-off management -> left
				  automatically by HW once 128 x 11 recessive bits,
				  - CAN_MCR_AWUM: Automatic Wake-up mode,
				  - CAN_MCR_NART: No Automatic Retransmission,
				  - CAN_MCR_RFLM: Discard last message when FIFO full,
				  - CAN_MCR_TXFP: Transmit order by FIFO -> Priority by the
				  request order or identifier of the message.
* Output        : .
* Return        : .
*******************************************************************************/  
void CanInit(u8 CAN_MasterCtrlReg)
{
    CLK.PCKENR2|=CLK_PCKENR2_CAN; // 开启CAN时钟，stm8 的外设时钟可控
    
    CAN.PSR =CAN_PS_TXMB0;
    CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;

    CAN.PSR =CAN_PS_TXMB1;
    CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;

    CAN.PSR =CAN_PS_TXMB2;
    CAN_PAGE_MCSR |=CAN_PAGE_MCSR_ABRQ;

    CAN.MCR |=CAN_MCR_INRQ; // Request initialisation
    while(!(CAN.MSR &CAN_MSR_INAK)) // Wait until acknowledged
    {
        _asm("nop");
    }

	/* Clear Transmit mailbox empty interrupts (RQCP 0 & 1 & 2) and therefore */
	/* clear TXOK 0 & 1 & 2 bits */
    CAN.TSR |=CAN_TSR_RQCP0 |CAN_TSR_RQCP1 |CAN_TSR_RQCP2;

    /* Release the Receive FIFO -> clear FMP bits and FULL bit */
    while(CAN.RFR &CAN_RFR_FMP)
    {
        CAN.RFR =CAN_RFR_RFOM; //释放一级FIFO
    }

    /* Clear the FIFO Overrun (FOVR) bit */
    CAN.RFR |=CAN_RFR_FOVR; 

    /* Clear Wake-up pending interrupt */
	CAN.MSR =CAN_MSR_WKUI;

    /* ABOM - /NART - TXFP */
	CAN.MCR |= CAN_MasterCtrlReg;

	/* Filter initialization */
	/* Deactivate all filters */
	CAN.PSR =CAN_PS_CTRL;	
	CAN_PAGE_FCR1 = 0x00;
	CAN_PAGE_FCR2 = 0x00;
	CAN_PAGE_FCR3 = 0x00;

	/* Filter 0 in one 32-bit registers */
	CAN_PAGE_FCR1 = CAN_FCR1_FILTER0_SCALE_1_32BIT;
	/* Filter 0 in one 32-bit registers & Filter 1 in one 32-bit registers */
//	CAN_PAGE_FCR1 = CAN_FCR1_FILTER0_SCALE_1_32BIT
//	               |CAN_FCR1_FILTER1_SCALE_1_32BIT;
	/* Filter 2 in one 32-bit registers */
//	CAN_PAGE_FCR2 = CAN_FCR2_FILTER2_SCALE_1_32BIT;
	/* Filter 2 in one 32-bit registers & Filter 3 in one 32-bit registers */
//	CAN_PAGE_FCR2 = CAN_FCR2_FILTER2_SCALE_1_32BIT
//	               |CAN_FCR2_FILTER3_SCALE_1_32BIT;	
	/* Filter 4 in one 32-bit registers */
//	CAN_PAGE_FCR3 = CAN_FCR3_FILTER4_SCALE_1_32BIT;
	/* Filter 4 in one 32-bit registers & Filter 5 in one 32-bit registers */
//	CAN_PAGE_FCR3 = CAN_FCR3_FILTER4_SCALE_1_32BIT
//	               |CAN_FCR3_FILTER5_SCALE_1_32BIT;	

	CAN_PAGE_FMR1 = 0x00;	/* Filter 0, 1, 2, 3 Low/High Register in Mask mode */
	CAN_PAGE_FMR2 = 0x00;	/* Filter 4, 5 Low/High Register in Mask mode */

	/* Filter 0 Low/High Register in Identifier List mode */
//	CAN_PAGE_FMR1 = CAN_FMR1_FILTER0_LR_LIST | CAN_FMR1_FILTER0_HR_LIST;	
	/* Filter 0,1,2,3 Low/High Register in Identifier List mode */
/*	CAN_PAGE_FMR1 = CAN_FMR1_FILTER0_LR_LIST
                   |CAN_FMR1_FILTER0_HR_LIST
                   |CAN_FMR1_FILTER1_LR_LIST
                   |CAN_FMR1_FILTER1_HR_LIST
                   |CAN_FMR1_FILTER2_LR_LIST
                   |CAN_FMR1_FILTER2_HR_LIST
                   |CAN_FMR1_FILTER3_LR_LIST
                   |CAN_FMR1_FILTER3_HR_LIST;*/
	/* Filter 4 Low/High Register in Identifier List mode */
//	CAN_PAGE_FMR2 = CAN_FMR2_FILTER4_LR_LIST | CAN_FMR2_FILTER4_HR_LIST;	
	/* Filter 4,5 Low/High Register in Identifier List mode & Filter 5 Low/High Register in Identifier List mode */
/*	CAN_PAGE_FMR2 = CAN_FMR2_FILTER4_LR_LIST
                   |CAN_FMR2_FILTER4_HR_LIST
                   |CAN_FMR2_FILTER5_LR_LIST
                   |CAN_FMR2_FILTER5_HR_LIST;*/

	/* Select filter 0:1 Page */
	CAN.PSR = CAN_PS_FILTER01;
	/* All ID values are accepted */ 
	CAN_PAGE_FLR1 = 0x00;
	CAN_PAGE_FLR2 = 0x00;
	CAN_PAGE_FLR3 = 0x00;
	CAN_PAGE_FLR4 = 0x00;
	CAN_PAGE_FLR5 = 0x00;
	CAN_PAGE_FLR6 = 0x00;
	CAN_PAGE_FLR7 = 0x00;
	CAN_PAGE_FLR8 = 0x00;
	
	CAN_PAGE_FHR1 = 0x00;
	CAN_PAGE_FHR2 = 0x00;
	CAN_PAGE_FHR3 = 0x00;
	CAN_PAGE_FHR4 = 0x00;
	CAN_PAGE_FHR5 = 0x00;
	CAN_PAGE_FHR6 = 0x00;
	CAN_PAGE_FHR7 = 0x00;
	CAN_PAGE_FHR8 = 0x00;

	/* Select filter 2:3 Page */
	CAN.PSR = CAN_PS_FILTER23;
	/* All ID values are accepted */ 
	CAN_PAGE_FLR1 = 0x00;
	CAN_PAGE_FLR2 = 0x00;
	CAN_PAGE_FLR3 = 0x00;
	CAN_PAGE_FLR4 = 0x00;
	CAN_PAGE_FLR5 = 0x00;
	CAN_PAGE_FLR6 = 0x00;
	CAN_PAGE_FLR7 = 0x00;
	CAN_PAGE_FLR8 = 0x00;
	
	CAN_PAGE_FHR1 = 0x00;
	CAN_PAGE_FHR2 = 0x00;
	CAN_PAGE_FHR3 = 0x00;
	CAN_PAGE_FHR4 = 0x00;
	CAN_PAGE_FHR5 = 0x00;
	CAN_PAGE_FHR6 = 0x00;
	CAN_PAGE_FHR7 = 0x00;
	CAN_PAGE_FHR8 = 0x00;

	/* Select filter 4:5 Page */
	CAN.PSR = CAN_PS_FILTER45;
	/* All ID values are accepted */ 
	CAN_PAGE_FLR1 = 0xff;
	CAN_PAGE_FLR2 = 0xff;
	CAN_PAGE_FLR3 = 0xff;
	CAN_PAGE_FLR4 = 0xff;
	CAN_PAGE_FLR5 = 0xff;
	CAN_PAGE_FLR6 = 0xff;
	CAN_PAGE_FLR7 = 0xff;
	CAN_PAGE_FLR8 = 0xff;
	
	CAN_PAGE_FHR1 = 0xff;
	CAN_PAGE_FHR2 = 0xff;
	CAN_PAGE_FHR3 = 0xff;
	CAN_PAGE_FHR4 = 0xff;
	CAN_PAGE_FHR5 = 0xff;
	CAN_PAGE_FHR6 = 0xff;
	CAN_PAGE_FHR7 = 0xff;
	CAN_PAGE_FHR8 = 0xff;

	/* Activate needed filters */
	CAN.PSR = CAN_PS_CTRL;	
	CAN_PAGE_FCR1 |= CAN_FCR1_FILTER0_ACTIVE;	/* Filter 0 active */
	//CAN_PAGE_FCR1 |= CAN_FCR1_FILTER1_ACTIVE;	/* Filter 1 active */
	//CAN_PAGE_FCR2 |= CAN_FCR2_FILTER2_ACTIVE;	/* Filter 2 active */
	//CAN_PAGE_FCR2 |= CAN_FCR2_FILTER3_ACTIVE;	/* Filter 3 active */
	//CAN_PAGE_FCR3 |= CAN_FCR3_FILTER4_ACTIVE;	/* Filter 4 active */
	//CAN_PAGE_FCR3 |= CAN_FCR3_FILTER5_ACTIVE;	/* Filter 5 active */

	/* Configure bit timing */
	CAN.PSR =CAN_PS_CTRL;
	CAN_PAGE_BTR1 =(CAN_PAGE_BTR1_BRP&(CAN_PAGE_BTR1_BRP_RESET_VALUE-1))
	              |(CAN_PAGE_BTR1_SJW&((CAN_PAGE_BTR1_SJW_RESET_VALUE-1)<<6));		// see can.h for modification of
	CAN_PAGE_BTR2 =(CAN_PAGE_BTR2_BS1&(CAN_PAGE_BTR2_BS1_RESET_VALUE-1)) 	        // bit timing parameters.
	              |(CAN_PAGE_BTR2_BS2&((CAN_PAGE_BTR2_BS2_RESET_VALUE-1)<<4))
	               |CAN_PAGE_BTR2_CLKS;
	/* 配置滤波器序号   */
    /*CAN.PSR =CAN_PS_FIFO;
    CAN_PAGE_MFMIR =0;*/

	CAN.DGR |= CAN_DGR_TXM2E;	/* enable 3th Tx mailboxe */ 
  
	CAN.MCR &= ~CAN_MCR_INRQ;	/* Leave the Init mode */
	while ((CAN.MSR &CAN_MSR_INAK))	/* Wait until acknowledged */ 
	{
		_asm("nop");
	}
    
}

/*******************************************************************************
* Function Name : Can_Wakeup_Enable()
* Description   : This service enable CAN WAKEUP interrupts.
* Input         : .
* Output        : .
* Return        : .
*******************************************************************************/
void Can_Wakeup_Enable(void)
{
	CanSavePg();

	CAN.IER = CAN_IER_WKUIE | /* Wake-up Interrupt */
			  CAN_IER_FOVIE | /* FIFO overrun Interrupt */
			  CAN_IER_FFIE  | /* FIFO Full Interrupt */
			  CAN_IER_FMPIE | /* FIFO Message Pending Interrupt */
			  CAN_IER_TMEIE;  /* Transmit Mailbox Empty Interrupt */

	CAN.PSR = CAN_PS_CTRL;
	CAN_PAGE_EIER = CAN_PAGE_EIER_ERRIE|	/* Error Interrupt */
				    CAN_PAGE_EIER_LECIE|	/* Last Error Code Interrupt */
				    CAN_PAGE_EIER_BOFIE|	/* Bus-Off Interrupt */
				    CAN_PAGE_EIER_EPVIE|	/* Error Passive Interrupt */
				    CAN_PAGE_EIER_EWGIE;	/* Error Warning Interrupt */

	CanRestorePg();
}

/*******************************************************************************
* Function Name : CanSleep
* Description   : This routine lets the CAN sleep.
* Input         : .
* Output        : .
* Return        : .
*******************************************************************************/
void CanSleep(void)
{
    CanInit(CAN_MCR_AWUM);
    Can_Wakeup_Enable();
    
    /* Wait for Sleep acknowledge */
    while(!(CAN.MSR &CAN_MSR_SLAK))
    {
        /* Set Sleep mode */
        CAN.MCR |= CAN_MCR_SLEEP;		
    }
}

/*******************************************************************************
* Function Name : CanWakeUp
* Description   : This routine wakes the CAN up.
* Input         : .
* Output        : .
* Return        : .
*******************************************************************************/
void CanWakeUp(void)
{
	CanBusWakeup();
	
	/* Leave Sleep mode */
	CAN.MCR &= ~CAN_MCR_SLEEP;	

	/* Wait until slak bit cleared */
	while(CAN.MSR & CAN_MSR_SLAK)
	{
        _asm("nop");
	}
}

/*******************************************************************************
* Function Name : CanMsgTransmit
* Description   : This service initiates the transmission for the message 
                  referenced by <txData>. 
				  This service shall not be called when the CAN driver is in
                  stop or sleep mode.
* Input         : txData - Pointer to structure which contains about CAN-Id,
                  CAN-DLC,CAN-Frame Data.
					CAN-Frame Data[0] = Mailbox number (for debug) 
* Output        : .
* Return        : KCANTXOK - Request is accepted by CAN driver.
                  KCANTXFAILED - Request is not accepted by CAN driver.
*******************************************************************************/
BoolT CanMsgTransmit(CanMsgTypeDef *pCanMsg)
{
	unsigned char idx, MailboxNumber;

	if(CAN.TPR & CAN_TPR_TME0)			/* Mailbox 1 empty ? */
	{
		CAN.PSR = CAN_PS_TXMB0;
		MailboxNumber = 1;
	}
	else if(CAN.TPR & CAN_TPR_TME1)	/* Mailbox 2 empty ? */
	{
		CAN.PSR = CAN_PS_TXMB1;
		MailboxNumber = 2;		
	}
	else if(CAN.TPR & CAN_TPR_TME2)	/* Mailbox 3 empty ? */
	{
		CAN.PSR = CAN_PS_TXMB2;
		MailboxNumber = 3;		
	}
	else
	{
		return (FALSE);
	}

	/* Transfert ID, DLC and Data in RAM to the right Mailbox */
	//Data Length Code
    CAN_PAGE_MDLCR = pCanMsg->dlc;
    //EXT ID
    *((u32*)&CAN_PAGE_MIDR1)=pCanMsg->id;
    CAN_PAGE_MIDR1|= CAN_ID_EXT;
    //Data
    CAN_PAGE_MDAR1 =pCanMsg->data[0];
    CAN_PAGE_MDAR2 =pCanMsg->data[1];
    CAN_PAGE_MDAR3 =pCanMsg->data[2];
    CAN_PAGE_MDAR4 =pCanMsg->data[3];
    CAN_PAGE_MDAR5 =pCanMsg->data[4];
    CAN_PAGE_MDAR6 =pCanMsg->data[5];
    CAN_PAGE_MDAR7 =pCanMsg->data[6];
    CAN_PAGE_MDAR8 =pCanMsg->data[7];
    //Transmit Request
    CAN_PAGE_MCSR |=CAN_PAGE_MCSR_TXRQ;
	return(TRUE);
} 

/*******************************************************************************
* Function Name : CanInterruptDisable
* Description   : This routine disables all CAN interrupts.
* Input         : .
* Output        : .
* Return        : .
*******************************************************************************/
void CanInterruptDisable(void)
{
	CanSavePg();

	CAN.IER = 0x00; 
	CAN.PSR = CAN_PS_CTRL;         
	CAN_PAGE_EIER = 0x00;

	CanRestorePg();
}

/*******************************************************************************
* Function Name : CanInterruptRestore
* Description   : This service restores all CAN interrupts.
* Input         : .
* Output        : .
* Return        : .
*******************************************************************************/
void CanInterruptRestore (void)
{
	CanSavePg();

	CAN.IER = 	//CAN_IER_WKUIE |	/* Wake-up Interrupt */
				CAN_IER_FOVIE /* FIFO overrun Interrupt */
				|CAN_IER_FFIE /* FIFO Full Interrupt */
				|CAN_IER_FMPIE /* FIFO Message Pending Interrupt */
				//|CAN_IER_TMEIE	/* Transmit Mailbox Empty Interrupt */
                ;
	CAN.PSR = CAN_PS_CTRL;
	CAN_PAGE_EIER = CAN_PAGE_EIER_ERRIE|    /* Error Interrupt */
				    CAN_PAGE_EIER_LECIE|        /* Last Error Code Interrupt */
				    CAN_PAGE_EIER_BOFIE|        /* Bus-Off Interrupt */
				    CAN_PAGE_EIER_EPVIE|        /* Error Passive Interrupt */
				    CAN_PAGE_EIER_EWGIE;        /* Error Warning Interrupt */

	CanRestorePg();
}


void Can_Store_Rcvd_Msg(void)	//中断服务程序中执行
{
	u8 idx;
	u8 *u8p =&CAN_PAGE_MDAR1;
	
	CAN.PSR = CAN_PS_FIFO; //进入接收数据FIFO页面
    CanTxRxBuffer.id =CAN_PAGE_MIDR1&0x1F;
    CanTxRxBuffer.id <<=8; //移位计算更优
    CanTxRxBuffer.id +=CAN_PAGE_MIDR2;
    CanTxRxBuffer.id <<=8;
    CanTxRxBuffer.id +=CAN_PAGE_MIDR3;
    CanTxRxBuffer.id <<=8;
    CanTxRxBuffer.id +=CAN_PAGE_MIDR4;

    switch(CanTxRxBuffer.id)
    {   //此处对ID进行软件过滤
        case CANID_BROADCAST: // OK
        case CANID_SWITCHSTATE:
        case CANID_NODEREGISTER:
        {
    		CanTxRxBuffer.dlc= CAN_PAGE_MDLCR; //此帧长度(字节数)
			for (idx=0;idx<CanTxRxBuffer.dlc;idx++)
			{   //保存此帧CAN数据
				CanTxRxBuffer.data[idx]=u8p[idx];
			}
            CanMsgAnalyze(&CanTxRxBuffer);
            break;
        }
        default:
    		break;
    }
}
/******************************************************************
*函数名称:ISR_Can_Tx()
*功   能 :CAN发送中断服务程序
*入口参数:NONE
*出口参数:NONE
*描   述 :
*时   间 :2010.5.25
*作   者 :mjzhang
******************************************************************/
void ISR_Can_Tx(void)
{
    u8 ErrorCode;
    CanSavePg();

    CAN.PSR =CAN_PS_CTRL;
    if(CAN_PAGE_ESR)
    {
        ErrorCode=CAN_PAGE_ESR;
        if((CAN_PAGE_ESR&CAN_PAGE_ESR_LEC)!=0)
        {
            CAN_PAGE_ESR =0;//|=CAN_PAGE_ESR_LEC;
        }
        CAN.MSR |=CAN_MSR_ERRI;
    }
    CanRestorePg();
}

/******************************************************************
*函数名称:ISR_Can_Rx()
*功   能 :CAN接收中断服务程序
*入口参数:NONE
*出口参数:NONE
*描   述 :
*时   间 :2010.5.25
*作   者 :mjzhang
******************************************************************/
void ISR_Can_Rx(void)
{
	CanSavePg();   

	if (CAN.RFR & CAN_RFR_FOVR)
	{
		CAN.RFR |= CAN_RFR_FOVR;		/* clear the FIFO Overrun (FOVR) bit */
	}
	else if (CAN.RFR & CAN_RFR_FULL)
	{
		CAN.RFR |= CAN_RFR_FULL;		/* clear the FIFO full (FULL) bit */      
	}
	while (CAN.RFR & CAN_RFR_FMP)	/* Check until FMP != 0 */
	{
        Can_Store_Rcvd_Msg();
        CAN.RFR |= CAN_RFR_RFOM; // Release mailbox
		CAN.RFR |= CAN_RFR_RFOM; //此语句要用2句,原因还没搞明白
    }
	CanRestorePg();
}
/******************************************************************
*函数名称:CanMsgAnalyze()
*功   能 :如果收到CAN消息,分析CAN消息结构体,
*         将结果保存到NodeState
*入口参数:NONE   
*出口参数:NONE
*描   述 :
*时   间 :2010.5.25
*作   者 :mjzhang
******************************************************************/
static void CanMsgAnalyze(CanMsgTypeDef *pCanMsg)
{
    u16 TempPara;
    u8 u8Temp;
    BoolT FlagCANDataOK=TRUE;
    CanMsgTypeDef CanBuffer;
    
    switch(pCanMsg->id)
    {
        case CANID_BROADCAST:
        {
#if HASH_MODEL==HS_0002S
            LED=pCanMsg->data[0];
#endif
            break;
        }
        case CANID_SWITCHSTATE:
        {
#if HASH_MODEL==HS_0001M
            LED=pCanMsg->data[0];
            //SendToCan(pCanMsg);
#endif
            break;
        }
        case CANID_NODEREGISTER:
        {
#if HASH_MODEL==HS_0001M
            CanBuffer.data[0]=pCanMsg->data[0];
            CanBuffer.data[1]=pCanMsg->data[1];
            CanBuffer.data[2]=pCanMsg->data[2];
            CanBuffer.data[3]=pCanMsg->data[3];
            CanBuffer.data[4]=pCanMsg->data[4];
            CanBuffer.data[5]=pCanMsg->data[5];
            CanBuffer.data[6]=pCanMsg->data[6];
            CanBuffer.data[7]=pCanMsg->data[7];
            CanBuffer.id =CANID_NODEREGISTER;
            CanBuffer.dlc =8;
            SendToCan(&CanBuffer);
#elif HASH_MODEL==HS_0002S
            if(UniqueID[0]==pCanMsg->data[0]&&UniqueID[1]==pCanMsg->data[1]
             &&UniqueID[2]==pCanMsg->data[2]&&UniqueID[3]==pCanMsg->data[3]
             &&UniqueID[4]==pCanMsg->data[4]&&UniqueID[5]==pCanMsg->data[5]
             &&UniqueID[6]==pCanMsg->data[6]&&UniqueID[7]==pCanMsg->data[7]
            )
            {
                NODE_REGISTER_FLAG=1;
            }
#endif
            break;
        }
    }
    CanFlagAnalyse();
}

/******************************************************************
*函数名称:CanFlagAnalyse()
*功   能 :处理CAN网络发来的控制信息
*入口参数:NONE   
*出口参数:NONE
*描   述 :获取的信息12ms时基
*时   间 :2010.5.25
*作   者 :mjzhang
******************************************************************/
void CanFlagAnalyse(void)
{
}
/******************************************************************
*函数名称:CANGetEmptyMegBox()
*功   能 :检查是否有发送邮箱为空,有的话设为当前页,返回TRUE,否则返回FALSE
*入口参数:NONE   
*出口参数:TRUE/FALSE
*描   述 :
*时   间 :2010.5.25
*作   者 :mjzhang
******************************************************************/
BoolT CANGetEmptyMegBox(void)
{
    if(CAN.TPR &CAN_TPR_TME0)
    {
        CAN.PSR =CAN_PS_TXMB0;
    }
    else if(CAN.TPR &CAN_TPR_TME1)
    {
        CAN.PSR =CAN_PS_TXMB1;
    }
    else if(CAN.TPR &CAN_TPR_TME2)
    {
        CAN.PSR =CAN_PS_TXMB2;
    }
    else
    {
        return FALSE;
    }
    return TRUE;
}
/******************************************************************
*函数名称:SendToCan()
*功   能 :
*入口参数:CanMsgTypeDef   
*出口参数:NONE
*描   述 :
*时   间 :2010.5.25
*作   者 :mjzhang
******************************************************************/
void SendToCan(CanMsgTypeDef *pCanMsg)
{
    CanMsgTransmit(pCanMsg);
}
/******************************************************************
*函数名称:NodeRegister()
*功   能 :
*入口参数:NONE   
*出口参数:NONE
*描   述 :
*时   间 :2010.5.25
*作   者 :mjzhang
******************************************************************/
void NodeRegister(void)
{
    CanMsgTypeDef CanBuffer;
    CanBuffer.id =CANID_NODEREGISTER;
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
/******************************************************************
*函数名称:SendSwitchState()
*功   能 :
*入口参数:u8   
*出口参数:NONE
*描   述 :
*时   间 :2010.5.25
*作   者 :mjzhang
******************************************************************/
void SendSwitchState(u8 Switch)
{
    CanMsgTypeDef CanBuffer;
    CanBuffer.id =CANID_SWITCHSTATE;
    CanBuffer.dlc =1;
    CanBuffer.data[0]=Switch;
    SendToCan(&CanBuffer);
}
/******************************************************************
*函数名称:SendBraodcast()
*功   能 :
*入口参数:u8   
*出口参数:NONE
*描   述 :
*时   间 :2010.5.25
*作   者 :mjzhang
******************************************************************/
void SendBraodcast(u8 Broadcast)
{
    CanMsgTypeDef CanBuffer;
    CanBuffer.id =CANID_BROADCAST;
    CanBuffer.dlc =1;
    CanBuffer.data[0]=Broadcast;
    SendToCan(&CanBuffer);
}
/******************************************************************
*函数名称:Can_Main()
*功   能 :
*入口参数:NONE   
*出口参数:NONE
*描   述 :
*时   间 :2010.5.25
*作   者 :mjzhang
******************************************************************/
void Can_Main(void)
{
	switch(CanBusState)
	{
		case CAN_INITIAL:
			CanWakeUp();
			CanInit(CAN_MCR_ABOM | CAN_MCR_AWUM |CAN_MCR_NART);
			CanInterruptRestore();
			CanBusWakeup();
			CanBusState=CAN_WAIT;
			break;
		case CAN_WAIT:
#if HASH_MODEL==HS_0002S
		    if(0==NODE_REGISTER_FLAG)
		    {
    		    NodeRegister();
		    }
		    else
#endif 
		    {
		        CanBusState=CAN_RUNNING;
		    }
		    break;
		case CAN_RUNNING:
		    
			break;
		case CAN_ACCOFF:
			CanBusState=CAN_RUNNING;
			break;
		case CAN_WAITSLEEP:
			CanSleep();
			CanBusSleep();
			CanBusState=CAN_SLEEP;	
			break;
		case CAN_SLEEP:
			break;
		default:
			BEGIN_WWDG;			
			CLEAR_WWDG;			
			for(;;)
			{
				//break;
			}
	}

}


