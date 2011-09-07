#define _CAN_
#include "includes.h"

/*******************************************************************************
* Function Name : CAN_Init
* Description   : ����,����CANģ��
* Input         : CAN_MasterCtrlReg (MCR��bit�����)
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
void CAN_Init(u8 CAN_MasterCtrlReg)
{
    CLK.PCKENR2|=CLK_PCKENR2_CAN; // ����CANʱ�ӣ�stm8 ������ʱ�ӿɿ�
    
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
        CAN.RFR =CAN_RFR_RFOM; //�ͷ�һ��FIFO
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
//	CAN_PAGE_FCR1 = CAN_FCR1_FILTER0_SCALE_1_32BIT;
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
	CAN_PAGE_FLR2 = 0x80; //mask first bit
	CAN_PAGE_FLR3 = 0x00;
	CAN_PAGE_FLR4 = 0x08; //mask 5th bit
	CAN_PAGE_FLR5 = 0x00;
	CAN_PAGE_FLR6 = 0x40; //mask second bit
	CAN_PAGE_FLR7 = 0x00;
	CAN_PAGE_FLR8 = 0x00; //All Pass
	
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
	/* �����˲������   */
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
* Function Name : CAN_Sleep
* Description   : This routine lets the CAN sleep.
* Input         : .
* Output        : .
* Return        : .
*******************************************************************************/
void CAN_Sleep(void)
{
    CAN_Init(CAN_MCR_AWUM);
    Can_Wakeup_Enable();
    
    /* Wait for Sleep acknowledge */
    while(!(CAN.MSR &CAN_MSR_SLAK))
    {
        /* Set Sleep mode */
        CAN.MCR |= CAN_MCR_SLEEP;		
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
* Function Name : CAN_WakeUp
* Description   : This routine wakes the CAN up.
* Input         : .
* Output        : .
* Return        : .
*******************************************************************************/
void CAN_WakeUp(void)
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
BoolT CanMsgTransmit(void)
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
    CAN_PAGE_MDLCR = 4;
    //EXT ID
    CAN_PAGE_MIDR1 =0x1F |CAN_ID_EXT;
    CAN_PAGE_MIDR2 =0x24;
    CAN_PAGE_MIDR3 =0x20;
    CAN_PAGE_MIDR4 =0x40;
    //Data
    CAN_PAGE_MDAR1 =0x51;
    CAN_PAGE_MDAR2 =0x52;
    CAN_PAGE_MDAR3 =0x54;
    CAN_PAGE_MDAR4 =0x58;
    //Transmit Request
    CAN_PAGE_MCSR |=CAN_PAGE_MCSR_TXRQ;
	return(TRUE);
} 

/*******************************************************************************
* Function Name : CanCanInterruptDisable
* Description   : This routine disables all CAN interrupts.
* Input         : .
* Output        : .
* Return        : .
*******************************************************************************/
void CanCanInterruptDisable(void)
{
	CanSavePg();

	CAN.IER = 0x00; 
	CAN.PSR = CAN_PS_CTRL;         
	CAN_PAGE_EIER = 0x00;

	CanRestorePg();
}

/*******************************************************************************
* Function Name : CanCanInterruptRestore
* Description   : This service restores all CAN interrupts.
* Input         : .
* Output        : .
* Return        : .
*******************************************************************************/
void CanCanInterruptRestore (void)
{
	CanSavePg();

	CAN.IER = 	//CAN_IER_WKUIE |	/* Wake-up Interrupt */
				CAN_IER_FOVIE | /* FIFO overrun Interrupt */
				CAN_IER_FFIE  |	/* FIFO Full Interrupt */
				CAN_IER_FMPIE;// |	/* FIFO Message Pending Interrupt */
				//CAN_IER_TMEIE;	/* Transmit Mailbox Empty Interrupt */

	CAN.PSR = CAN_PS_CTRL;
	CAN_PAGE_EIER = CAN_PAGE_EIER_ERRIE|    /* Error Interrupt */
				    CAN_PAGE_EIER_LECIE|        /* Last Error Code Interrupt */
				    CAN_PAGE_EIER_BOFIE|        /* Bus-Off Interrupt */
				    CAN_PAGE_EIER_EPVIE|        /* Error Passive Interrupt */
				    CAN_PAGE_EIER_EWGIE;        /* Error Warning Interrupt */

	CanRestorePg();
}


void CAN_Store_Rcvd_Msg(void)	//�жϷ��������ִ��
{
	u8 i,idx;
	u8 *u8p =&CAN_PAGE_MDAR1;
	spnear rCanMsgBuff *rp=(rCanMsgBuff *)NULL;
	
	CAN.PSR = CAN_PS_FIFO; //�����������FIFOҳ��
    can_msg_id16 =CAN_PAGE_MIDR1&0x1F;
    can_msg_id16 <<=8; //��λ�������
    can_msg_id16 +=CAN_PAGE_MIDR2;
    can_msg_id32 =can_msg_id16;
    can_msg_id32 <<=8;
    can_msg_id32 +=CAN_PAGE_MIDR3;
    can_msg_id32 <<=8;
    can_msg_id32 +=CAN_PAGE_MIDR4;

    switch(can_msg_id32)
    {   //�˴���ID�����������
        case CANID_ACC1: // OK
        case CANID_ILLUM1: // OK
        case CANID_LOCK1: // OK
        case CANID_PARKING: // OK
        case CANID_REVERSE: // OK
        case CANID_SPEED1: // OK
        case CANID_SWC1: // OK
        case CANID_TEMPEROUT1: // OK
        case CANID_TEMPERSEAT1: // OK
        case CANID_AIRINFO1: // OK
        case CANID_WARNING: // OK
        case CANID_WARN_DOOR1: // OK
        case CANID_WARN_DOORZONE1: // OK
        case CANID_WARN_FRONTCAP1: // OK
        case CANID_WARN_REARCAP1: // OK
        case CANID_WARN_REVERSE1: // OK
        case CANID_WARN_SEATBELT1: // OK
        case CANID_CARCENCTL:
        case CANID_CARAIRCTL:
        case CANID_RADAR1:
        case CANID_ONSTARSW:
        case CANID_ONSTARNUM:
        case CANID_PHONEOVER:
            rp =&CanRxBuffer;
            if((*rp).Busy == FALSE) //����������Ƿ������ж�д��
        	{
        		(*rp).stdid = can_msg_id16; //����ID
        		(*rp).extid = can_msg_id32;
        		(*rp).RxRdy =TRUE; //��־������Ҫ��������
        		(*rp).dlc = CAN_PAGE_MDLCR; //��֡����(�ֽ���)
        		{
        			for (idx=0;idx<(*rp).dlc;idx++)
        			{   //�����֡CAN����
        				(*rp).data[idx]=u8p[idx];
        			}
        		}
        	}
            break;
        default:
    		break;
    }
}
/******************************************************************
*��������:ISR_Can_Tx()
*��   �� :CAN�����жϷ������
*��ڲ���:NONE
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.5.25
*��   �� :mjzhang
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
*��������:ISR_Can_Rx()
*��   �� :CAN�����жϷ������
*��ڲ���:NONE
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.5.25
*��   �� :mjzhang
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
        CAN_Store_Rcvd_Msg();
        CAN.RFR |= CAN_RFR_RFOM; // Release mailbox
		CAN.RFR |= CAN_RFR_RFOM; //�����Ҫ��2��,ԭ��û������
    }
	CanRestorePg();
}
/******************************************************************
*��������:IllumeAdjust()
*��   �� :�������ȵ���
*��ڲ���:u8 Parameter
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.5.25
*��   �� :mjzhang
******************************************************************/
void IllumeAdjust(u8 Parameter)
{
    
}
/******************************************************************
*��������:CanIllumLevel()
*��   �� :�������ȵ���
*��ڲ���:(u8 Byte)
*���ڲ���:u8
*��   �� :
*ʱ   �� :2010.6.29
*��   �� :mjzhang
******************************************************************/
u8 CanIllumLevel(u8 Byte)
{
    switch(Byte)
    {
        case PARA_ILL_OFF:
            Byte=0x7F;
            break;
        case PARA_ILL_LV0:
            Byte=0; //����0������
            break;
        case PARA_ILL_LV1:
            Byte=1; //����1������
            break;
        case PARA_ILL_LV17:
            Byte=17; //����17������
            break;
        default:
            if(Byte&0x0F)
            { //���ݴ���
                Byte=0xFF;
            }
            else
            {
                Byte=((Byte>>4)&0x0F)+1;
            }
            break;
    }
    return(Byte);
}
/******************************************************************
*��������:CanMsgAnalyze()
*��   �� :����յ�CAN��Ϣ,����CAN��Ϣ�ṹ��,
*         ��������浽CarState
*��ڲ���:NONE   
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.5.25
*��   �� :mjzhang
******************************************************************/
static void CanMsgAnalyze(void)
{
    u16 TempPara;
    u8 u8Temp;
    static u8 LastSWCValue;
    BoolT FlagCANDataOK=TRUE;
    
    if(CanRxBuffer.RxRdy)
    {
        CanRxBuffer.Busy=TRUE;
        switch(CanRxBuffer.extid)
        {
            case CANID_LOCK1: //Կ�ײ���
                if(0xFF==CanRxBuffer.data[0])
                {
                    CAR_LOCK_FLAG=1;
                }
                else if(0x00==CanRxBuffer.data[0])
                {
                    CAR_LOCK_FLAG=0;
                }
                break;
            case CANID_ACC1: // ACC ON\OFF Message
            {
                if(0x4A==CanRxBuffer.data[0])
                {
                    CAR_ACC_FLAG=1;
                }
                else //if(0x85==CANMsgACC.data[0])
                {
                    CAR_ACC_FLAG=0;
                }
                break;
            }
            case CANID_ILLUM1: // Illume Message
            {
                u8Temp=CanIllumLevel(CanRxBuffer.data[0]);
                if(0xFF!=u8Temp)
                {
                    if(0x7F==u8Temp)
                    {
                        if(CarState.IllumeLevel==u8Temp)
                        {
                            FlagCANDataOK=FALSE; //�ظ�������,���跢������
                        }
                        CAR_ILLUME_FLAG =0;
                        CarState.IllumeLevel=u8Temp;
                    }
                    else
                    {
                        if(CarState.IllumeLevel==u8Temp)
                        {
                            FlagCANDataOK=FALSE; //�ظ�������,���跢������
                        }
                        CAR_ILLUME_FLAG =1;
                        CarState.IllumeLevel=u8Temp;
                    }
                    if(TRUE==FlagCANDataOK)
                    {
                        //WriteToMainMsgQue(PROTO_TYPE_ILL);
                    }
                }
                break;
            }
            case CANID_PARKING: // PARKING Message
            {
                if(0x00==CanRxBuffer.data[0])
                {
                    CAR_PARKING_FLAG=0;
                }
                else if(0xFF==CanRxBuffer.data[0])
                {
                    CAR_PARKING_FLAG=1;
                }
                break;
            }
            case CANID_SWC1: // SWC Message
            {
                if(((CanRxBuffer.data[0]&0x0F)!=((CanRxBuffer.data[0]>>4)&0x0F))
                    /*||((CANMsgSWC.data[0]&0x0F)==LastSWCValue)*/)
                {
                    FlagCANDataOK=FALSE;
                }
                else
                {
                    if(CanRxBuffer.data[0])
                    {   //CAN������ֻ��һ�η��ؼ�����,���Żᷢ���ؼ�̧��
                        LastSWCValue=CanRxBuffer.data[0]&0x0F;
                        CarState.SWCKey=LastSWCValue;
                        CAR_SWCKEYDOWN_FLAG=KEY_DOWN;
                    }
                    else
                    {
                        CarState.SWCKey=LastSWCValue;
                        CAR_SWCKEYDOWN_FLAG=KEY_UP;
                        LastSWCValue=0;
                    }
                }
                if(TRUE==FlagCANDataOK)
                {
                    //WriteToMainMsgQue(PROTO_TYPE_SWC);
                }
                break;
            }
            case CANID_REVERSE: // Reverse Message
            {
                if(0xFF==CanRxBuffer.data[0])			
                {   //����
                    CAR_REVERSE_FLAG =1;
                }
                else if(0x00==CanRxBuffer.data[0])
                {   //�ǵ���
                    CAR_REVERSE_FLAG =0;
                }
                break;
            }
            case CANID_SPEED1: // Speed Message
            {
                TempPara=CanRxBuffer.data[0];
                TempPara<<=8;
                TempPara+=CanRxBuffer.data[1];
                TempPara/=0x3A;
                CarState.Speed=TempPara;
                break;
            }
            case CANID_TEMPEROUT1: // Outdoor Temperature Message
            {
                switch(CanRxBuffer.data[1])
                {
                    case 0x00:
                        u8Temp=-40;
                        break;
                    case 0x50:
                        u8Temp=0;
                        break;
                    case 0x52:
                        u8Temp=1;
                        break;
                    case 0xFF:
                        u8Temp=87;
                        break;
                    default:
                        if(!(CanRxBuffer.data[2]&0x01))
                        {
                            FlagCANDataOK=FALSE;
                        }
                        if(CanRxBuffer.data[1]<0x50)
                        {
                            u8Temp=CanRxBuffer.data[2]+1;
                            u8Temp>>=1;
                            u8Temp&=(~0x80); //ȥ����λ���������λ
                            u8Temp=-u8Temp; //����
                        }
                        else if(CanRxBuffer.data[1]<0xFF)
                        {
                            u8Temp=CanRxBuffer.data[2]-1;
                            u8Temp>>=1;
                            u8Temp&=(~0x80); //ȥ����λ���������λ
                            u8Temp+=2;
                        }
                        break;
                }
                if(CarState.TemperOutdoor!=u8Temp)
                {
                    CarState.TemperOutdoor=u8Temp;
                    if(TRUE==FlagCANDataOK)
                    {
                        //WriteToMainMsgQue(PROTO_TYPE_AIRINFO);
                    }
                }
                break;
            }
            case CANID_TEMPERSEAT1: // Seat Temperature Message
            {
                if(0xFF==CanRxBuffer.data[0])
                {   //����
                    switch(CanRxBuffer.data[2])
                    {
                        case 0x65: // 1���ȶ�
                            u8Temp=0x10;
                            break;
                        case 0x6E: // 2���ȶ�
                            u8Temp=0x20;
                            break;
                        case 0xFF: // 3���ȶ�
                            u8Temp=0x30;
                            break;
                        default:
                            u8Temp=0;
                            FlagCANDataOK=FALSE;
                            break;
                    }
                }
                else if(0x00==CanRxBuffer.data[0])
                {   // �ر������ȶ�
                    u8Temp=0;
                    if(0x00!=CanRxBuffer.data[2])
                    {
                        FlagCANDataOK=FALSE;
                    }
                }
                else
                {
                    FlagCANDataOK=FALSE;
                }
                if(0xFF==CanRxBuffer.data[1])
                {   //����
                    switch(CanRxBuffer.data[3])
                    {
                        case 0x65: // 1���ȶ�
                            u8Temp|=1;
                            break;
                        case 0x6E: // 2���ȶ�
                            u8Temp|=2;
                            break;
                        case 0xFF: // 3���ȶ�
                            u8Temp|=3;
                            break;
                        default:
                            u8Temp&=0xf0;
                            FlagCANDataOK=FALSE;
                            break;
                    }
                }
                else if(0x00==CanRxBuffer.data[1])
                {   // �ر������ȶ�
                    u8Temp&=0xf0;
                    if(0x00!=CanRxBuffer.data[3])
                    {
                        FlagCANDataOK=FALSE;
                    }
                }
                else
                {
                    FlagCANDataOK=FALSE;
                }
                if(CarState.TemperSeat.byte!=u8Temp)
                {
                    CarState.TemperSeat.byte=u8Temp;
                    if(TRUE==FlagCANDataOK)
                    {
                        //WriteToMainMsgQue(PROTO_TYPE_AIRINFO);
                    }
                }
                break;
            }
            case CANID_AIRINFO1: // Air conditioning Infomation Message
            {
                FlagCANDataOK=FALSE;
                if(0xF5<CanRxBuffer.data[1]&&CanRxBuffer.data[1]<0xFF)
                {   //�ͷ�ģʽ
                    u8Temp=0xFF-CanRxBuffer.data[1];
                    if(CarState.WindMode!=u8Temp)
                    {
                        FlagCANDataOK=TRUE;
                        CarState.WindMode=u8Temp;
                    }
                }
                if(CanRxBuffer.data[6]&0x02)
                {   // A/C ON
                    if(!CarState.AirFlag.field.F_AC)
                    {
                        FlagCANDataOK=TRUE;
                        CarState.AirFlag.field.F_AC=1;
                    }
                }
                else
                {   // A/C OFF
                    if(CarState.AirFlag.field.F_AC)
                    {
                        FlagCANDataOK=TRUE;
                        CarState.AirFlag.field.F_AC=0;
                    }
                }
                if(CanRxBuffer.data[6]&0x04)
                {   //��ѭ��
                    if(!CarState.AirFlag.field.F_LoopInOut)
                    {
                        FlagCANDataOK=TRUE;
                        CarState.AirFlag.field.F_LoopInOut=1;
                    }
                }
                else
                {   //��ѭ��
                    if(CarState.AirFlag.field.F_LoopInOut)
                    {
                        FlagCANDataOK=TRUE;
                        CarState.AirFlag.field.F_LoopInOut=0;
                    }
                }
                u8Temp=CanRxBuffer.data[2]&0x07; //����
                if(CarState.AirFlag.field.F_WindLv!=u8Temp)
                {
                    FlagCANDataOK=TRUE;
                    CarState.AirFlag.field.F_WindLv=u8Temp;
                }
                u8Temp=CanRxBuffer.data[4]-0x0C; //��߿յ��¶�
                if(CarState.TemperLeft!=u8Temp)
                {
                    FlagCANDataOK=TRUE;
                    CarState.TemperLeft=u8Temp;
                }
                u8Temp=CanRxBuffer.data[5]-0x0C; //�ұ߿յ��¶�
                if(CarState.TemperRight!=u8Temp)
                {
                    FlagCANDataOK=TRUE;
                    CarState.TemperRight=u8Temp;
                }
                if(TRUE==FlagCANDataOK)
                {
                    //WriteToMainMsgQue(PROTO_TYPE_AIRINFO);
                }
                break;
            }
            case CANID_WARNING: // Warning Message
            {
                if(0x01==CanRxBuffer.data[0])
                {
                    CAR_WARNING_FLAG=1;
                }
                else if(0x00==CanRxBuffer.data[0])
                {
                    CAR_WARNING_FLAG=0; //���κα���
                    CAR_WARN_SEATBELT=0; //�ް�ȫ������
                    CAR_WARN_FRONTCAP=0; //��ǰ�Ǳ���
                    CAR_WARN_REARCAP=0; //�޺�Ǳ���
                    CAR_WARN_REVERSE=0; //���ϰ���
                    CAR_DOORWARNNING=0; //����δ�ر���
                }
                break;
            }
            case CANID_WARN_DOOR1:
            {
                if((0xFF==CanRxBuffer.data[0])&&(0xFF==CanRxBuffer.data[2]))
                {
                    CAR_DOORWARNNING=1; //��δ�ر���
                }
                break;
            }
            case CANID_WARN_DOORZONE1:
            {
                if(0x11==(0x11 & CanRxBuffer.data[0]))
                {
                    CAR_DOORWARN_LF=1; //��ǰ��δ��
                }
                else
                {
                    CAR_DOORWARN_LF=0;
                }
                if(0x22==(0x22 & CanRxBuffer.data[0]))
                {
                    CAR_DOORWARN_LR=1; //�����δ��
                }
                else
                {
                    CAR_DOORWARN_LR=0;
                }
                if(0x44==(0x44 & CanRxBuffer.data[0]))
                {
                    CAR_DOORWARN_RF=1; //��ǰ��δ��
                }
                else
                {
                    CAR_DOORWARN_RF=0;
                }
                if(0x88==(0x88 & CanRxBuffer.data[0]))
                {
                    CAR_DOORWARN_RR=1; //�Һ���δ��
                }
                else
                {
                    CAR_DOORWARN_RR=0;
                }
                if(0x00==CanRxBuffer.data[0])
                {
                    CAR_DOORWARNNING=0;
                }
                break;
            }
            case CANID_WARN_SEATBELT1:
            {
                if((0x20==CanRxBuffer.data[2])&&(0xFF==CanRxBuffer.data[3]))
                {
                    CAR_WARN_SEATBELT=1; //��ȫ������
                }
                else
                {
                    CAR_WARN_SEATBELT=0;
                }
                break;
            }
            case CANID_WARN_FRONTCAP1:
            {
                if((0xFF==CanRxBuffer.data[0])&&(0x24==CanRxBuffer.data[1]))
                {
                    CAR_WARN_FRONTCAP=1; //ǰ�Ǳ���
                }
                else
                {
                    CAR_WARN_FRONTCAP=0;
                }
                break;
            }
            case CANID_WARN_REARCAP1:
            {
                if(0xFF==CanRxBuffer.data[0])
                {
                    CAR_WARN_REARCAP=1; //��Ǳ���
                }
                else
                {
                    CAR_WARN_REARCAP=0;
                }
                break;
            }
            case CANID_WARN_REVERSE1:
            {
                if(CanRxBuffer.data[0]==CanRxBuffer.data[1])
                {
                    if(0xFF==CanRxBuffer.data[0])
                    {
                        CAR_WARN_REVERSE=3; //Զ�����ϰ���
                    }
                    else if(0x80==CanRxBuffer.data[0])
                    {
                        CAR_WARN_REVERSE=2; //�о����ϰ���
                    }
                    else if(0x0F==CanRxBuffer.data[0])
                    {
                        CAR_WARN_REVERSE=1; //�������ϰ���
                    }
                    else
                    {
                        CAR_WARN_REVERSE=0; //���ϰ���
                    }
                }
                break;
            }
            case CANID_CARCENCTL:
            {
                DebugParameter++;
                if(CANCENCTL_FIRSTBYTE==CanRxBuffer.data[0])
                {
                    FlagCANDataOK=FALSE;
                    TempPara=CanRxBuffer.data[1];
                    TempPara<<=8;
                    TempPara+=CanRxBuffer.data[2];
                    switch(TempPara)
                    {
                        case CANCENCTL_SRHCAR:
                            if(CAR_SEARCHCARLIGHT!=(CanRxBuffer.data[7]&0x01))
                            {
                                FlagCANDataOK=TRUE;
                                CAR_SEARCHCARLIGHT=(CanRxBuffer.data[7]&0x01);
                            }
                            break;
                        case CANCENCTL_LOCKRUN:
                            if(CAR_AUTOLOCKRUN!=(CanRxBuffer.data[7]&0x01))
                            {
                                FlagCANDataOK=TRUE;
                                CAR_AUTOLOCKRUN=(CanRxBuffer.data[7]&0x01);
                            }
                            break;
                        case CANCENCTL_DISOPDRAUTOLOCK:
                            if(CAR_DISOPDRAUTOLOCK!=(CanRxBuffer.data[7]&0x01))
                            {
                                FlagCANDataOK=TRUE;
                                CAR_DISOPDRAUTOLOCK=(CanRxBuffer.data[7]&0x01);
                            }
                            break;
                        case CANCENCTL_REMOTEUNLOCKLIGHT:
                            if(CAR_REMOUNLOCKLIGHT!=(CanRxBuffer.data[7]&0x01))
                            {
                                FlagCANDataOK=TRUE;
                                CAR_REMOUNLOCKLIGHT=(CanRxBuffer.data[7]&0x01);
                            }
                            break;
                        case CANCENCTL_REMOTEUNLOCK:
                            if(CAR_REMOTEUNLOCKDR!=(CanRxBuffer.data[7]&0x01))
                            {
                                FlagCANDataOK=TRUE;
                                CAR_REMOTEUNLOCKDR=(CanRxBuffer.data[7]&0x01);
                            }
                            break;
                        case CANCENCTL_LOCKILLDELAY:
                            if(CAR_LOCKILLDELAY!=(CanRxBuffer.data[7]&0x03))
                            {
                                FlagCANDataOK=TRUE;
                                CAR_LOCKILLDELAY=CanRxBuffer.data[7]&0x03;
                            }
                            break;
                        case CANCENCTL_PARKAUTOUNLOCK:
                            if(CAR_PARKAUTOUNLOCK!=(CanRxBuffer.data[7]&0x03))
                            {
                                FlagCANDataOK=TRUE;
                                CAR_PARKAUTOUNLOCK=CanRxBuffer.data[7]&0x03;
                            }
                            break;
                        case CANCENCTL_REMOTELOCKLIGHTSPEAK:
                            if(CAR_REMOLOCKLIGHTSP!=(CanRxBuffer.data[7]&0x03))
                            {
                                FlagCANDataOK=TRUE;
                                CAR_REMOLOCKLIGHTSP=CanRxBuffer.data[7]&0x03;
                            }
                            break;
                        case CANCENCTL_LOCKDELAY:
                            if(CAR_LOCKDELAY!=(CanRxBuffer.data[7]&0x01))
                            {
                                FlagCANDataOK=TRUE;
                                CAR_LOCKDELAY=CanRxBuffer.data[7]&0x01;
                            }
                            break;
                        default:
                            break;
                    }
                    if(TRUE==FlagCANDataOK)
                    {
                        //WriteToMainMsgQue(PROTO_TYPE_CENCTRL);
                    }
                }
                break;
            }
            case CANID_CARAIRCTL:
            {
                FlagCANDataOK=FALSE;
                if(0xFF==CanRxBuffer.data[0])
                {
                    if(!CAR_REARWAUTOFOG)
                    {
                        FlagCANDataOK=TRUE;
                        CAR_REARWAUTOFOG=1;
                    }
                }
                else
                {
                    if(CAR_REARWAUTOFOG)
                    {
                        FlagCANDataOK=TRUE;
                        CAR_REARWAUTOFOG=0;
                    }
                }
                u8Temp=CAR_AIRSENSORSLT;
                if(0x05==CanRxBuffer.data[1])
                {
                    CAR_AIRSENSORSLT=0;
                }
                else if(0xA0==CanRxBuffer.data[1])
                {
                    CAR_AIRSENSORSLT=1;
                }
                else if(0x5A==CanRxBuffer.data[1])
                {
                    CAR_AIRSENSORSLT=2;
                }
                if(u8Temp!=CAR_AIRSENSORSLT)
                {
                    FlagCANDataOK=TRUE;
                }
                u8Temp=CAR_AUTOMODEWINDLV;
                if(0x05==CanRxBuffer.data[3])
                {
                    CAR_AUTOMODEWINDLV=0;
                }
                else if(0xA0==CanRxBuffer.data[3])
                {
                    CAR_AUTOMODEWINDLV=1;
                }
                else if(0x5A==CanRxBuffer.data[3])
                {
                    CAR_AUTOMODEWINDLV=2;
                }
                if(u8Temp!=CAR_AUTOMODEWINDLV)
                {
                    FlagCANDataOK=TRUE;
                }
                u8Temp=CAR_AIRTEMPZONE;
                if(0x05==CanRxBuffer.data[4])
                {
                    CAR_AIRTEMPZONE=0;
                }
                else if(0xA0==CanRxBuffer.data[4])
                {
                    CAR_AIRTEMPZONE=1;
                }
                else if(0x5A==CanRxBuffer.data[4])
                {
                    CAR_AIRTEMPZONE=2;
                }
                if(u8Temp!=CAR_AIRTEMPZONE)
                {
                    FlagCANDataOK=TRUE;
                }
                if(TRUE==FlagCANDataOK)
                {
                    //WriteToMainMsgQue(PROTO_TYPE_AIRCTRL);
                }
                break;
            }
            case CANID_RADAR1:
            {
                FlagCANDataOK=FALSE;
                if(0xFF==CanRxBuffer.data[0]&&0xFF==CanRxBuffer.data[2])
                {
                    if(!CAR_RADAR)
                    {
                        CAR_RADAR=1;
                        FlagCANDataOK=TRUE;
                    }
                }
                else if(0==CanRxBuffer.data[0]&&0==CanRxBuffer.data[2])
                {
                    if(CAR_RADAR)
                    {
                        CAR_RADAR=0;
                        FlagCANDataOK=TRUE;
                    }
                }
                if(TRUE==FlagCANDataOK)
                {
                    //WriteToMainMsgQue(PROTO_TYPE_RADAR);
                }
                break;
            }
            case CANID_ONSTARSW:
            {
                //����������ݷ�������
                break;
            }
            case CANID_ONSTARNUM:
            {
                //����������ݷ�������
                break;
            }
            case CANID_PHONEOVER:
            {
                //����������ݷ�������
                break;
            }
        }
        CanRxBuffer.RxRdy=FALSE; //���ݷ������
        CanRxBuffer.Busy=FALSE; //�����ж�д������
        CanFlagAnalyse();
    }
}

/******************************************************************
*��������:CanFlagAnalyse()
*��   �� :����CAN���緢���Ŀ�����Ϣ
*��ڲ���:NONE   
*���ڲ���:NONE
*��   �� :��ȡ����Ϣ12msʱ��
*ʱ   �� :2010.5.25
*��   �� :mjzhang
******************************************************************/
void CanFlagAnalyse(void)
{
	if(CAR_ACC_FLAG)
	{
		ACC_CTRL=1 ;      
	}
	else
	{
		ACC_CTRL=0;   
	}
	if(CAR_ILLUME_FLAG)  
	{
		ILLUMI_LEVEL=0;
	}
	else	
	{
		ILLUMI_LEVEL=1;
	}
	if(CAR_REVERSE_FLAG)
	{
		REVERSE_LEVEL=0;
	}
	else
	{
		REVERSE_LEVEL=1;
	}
	if(CAR_PARKING_FLAG)
	{
		PARKING_LEVEL=1;
	}
	else
	{
		PARKING_LEVEL=0;
	}
	if(CAR_WARNING_FLAG)
	{
	    BeepState=BEEP_SHORTBREAK;
	}
	else
	{
	    BeepState=BEEP_OFF;
	}
}
/******************************************************************
*��������:CANGetEmptyMegBox()
*��   �� :����Ƿ��з�������Ϊ��,�еĻ���Ϊ��ǰҳ,����TRUE,���򷵻�FALSE
*��ڲ���:NONE   
*���ڲ���:TRUE/FALSE
*��   �� :
*ʱ   �� :2010.5.25
*��   �� :mjzhang
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
*��������:SendToCan()
*��   �� :
*��ڲ���:NONE   
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.5.25
*��   �� :mjzhang
******************************************************************/
void SendToCan(void)
{
    CanMsgTransmit();
}
/******************************************************************
*��������:CAN_process()
*��   �� :
*��ڲ���:NONE   
*���ڲ���:NONE
*��   �� :
*ʱ   �� :2010.5.25
*��   �� :mjzhang
******************************************************************/
void CAN_process(void)
{
	switch(CanBusState)
	{
		case CAN_INITIAL:
			CAN_WakeUp();                                                                      
			CAN_Init(CAN_MCR_ABOM | CAN_MCR_AWUM |CAN_MCR_NART);
			CanCanInterruptRestore();
			CanBusWakeup();
			CanBusState=CAN_RUNNING;
			break;
		case CAN_RUNNING:
            CanMsgAnalyze();
            //SendToCan();
			break;
		case CAN_ACCOFF:
			CanMsgAnalyze();
			if(CAR_ACC_FLAG==1)
			{
				CanBusState=CAN_RUNNING;
			}
			break;
		case CAN_WAITSLEEP:
			CAN_Sleep();
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


