/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM8_MAP_H
#define __STM8_MAP_H

/* Includes ------------------------------------------------------------------*/
//#include "stm8_conf.h"

/* Exported types ------------------------------------------------------------*/

/** @addtogroup MAP_FILE_Exported_Types_and_Constants
  * @{
  */

/******************************************************************************/
/*                          IP registers structures                           */
/******************************************************************************/

/*----------------------------------------------------------------------------*/
/**
  * @brief Analog to Digital Converter (ADC)
  */

typedef volatile struct ADC_struct
{
  u8 CSR;      /*!< ADC control status register */
  u8 CR1;      /*!< ADC configuration register 1 */
  u8 CR2;      /*!< ADC configuration register 2 */
  u8 RESERVED; /*!< Reserved byte */
  u8 DRH;      /*!< ADC Data high */
  u8 DRL;      /*!< ADC Data low */
  u8 TDRH;     /*!< ADC Schmitt trigger disable register high */
  u8 TDRL;     /*!< ADC Schmitt trigger disable register low */
}
ADC_TypeDef;

/** @addtogroup ADC_Registers_Reset_Value
  * @{
  */

#define  ADC_CSR_RESET_VALUE  ((u8)0x00)
#define  ADC_CR1_RESET_VALUE  ((u8)0x00)
#define  ADC_CR2_RESET_VALUE  ((u8)0x00)
#define  ADC_TDRH_RESET_VALUE ((u8)0x00)
#define  ADC_TDRL_RESET_VALUE ((u8)0x00)

/**
  * @}
  */

/** @addtogroup ADC_Registers_Bits_Definition
  * @{
  */

#define ADC_CSR_EOC  ((u8)0x80) /*!< End of Conversion mask */
#define ADC_CSR_ITEN ((u8)0x20) /*!< Interrupt Enable for EOC mask */
#define ADC_CSR_CH   ((u8)0x0F) /*!< Channel selection bits mask */

#define ADC_CR1_SPSEL ((u8)0x70) /*!< Prescaler selectiont mask */
#define ADC_CR1_CONT  ((u8)0x02) /*!< Continuous conversion mask */
#define ADC_CR1_ADON  ((u8)0x01) /*!< A/D Converter on/off mask */

#define ADC_CR2_EXTTRIG ((u8)0x40) /*!< External trigger enable mask */
#define ADC_CR2_EXTSEL  ((u8)0x30) /*!< External event selection mask */
#define ADC_CR2_ALIGN   ((u8)0x08) /*!< Data Alignment mask */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Auto Wake Up (AWU) peripheral registers.
  */

typedef volatile struct AWU_struct
{
  u8 CSR; /*!< AWU Control status register */
  u8 APR; /*!< AWU Asynchronous prescalar buffer */
  u8 TBR; /*!< AWU Time base selection register */
}
AWU_TypeDef;

/** @addtogroup AWU_Registers_Reset_Value
  * @{
  */

#define AWU_CSR_RESET_VALUE ((u8)0x00)
#define AWU_APR_RESET_VALUE ((u8)0x3F)
#define AWU_TBR_RESET_VALUE ((u8)0x00)

/**
  * @}
  */

/** @addtogroup AWU_Registers_Bits_Definition
  * @{
  */

#define AWU_CSR_AWUF  ((u8)0x20) /*!< Interrupt flag mask */
#define AWU_CSR_AWUEN ((u8)0x10) /*!< Auto Wake-up enable mask */
#define AWU_CSR_MR    ((u8)0x02) /*!< Master Reset mask */
#define AWU_CSR_MSR   ((u8)0x01) /*!< Measurement enable mask */

#define AWU_APR_APR ((u8)0x3F) /*!< Asynchronous Prescaler divider mask */

#define AWU_TBR_AWUTB ((u8)0x0F) /*!< Timebase selection mask */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Beeper (BEEP) peripheral registers.
  */

typedef volatile struct BEEP_struct
{
  u8 CSR; /*!< BEEP Control status register */
}
BEEP_TypeDef;

/** @addtogroup BEEP_Registers_Reset_Value
  * @{
  */

#define BEEP_CSR_RESET_VALUE ((u8)0x00)

/**
  * @}
  */

/** @addtogroup BEEP_Registers_Bits_Definition
  * @{
  */

#define BEEP_CSR_BEEPSEL ((u8)0xC0) /*!< Beeper frequency selection mask */
#define BEEP_CSR_BEEPEN  ((u8)0x20) /*!< Beeper enable mask */
#define BEEP_CSR_BEEPDIV ((u8)0x1F) /*!< Beeper Divider prescalar mask */

#define BEEP_CSR_BEEPSEL_1K ((u8)0x00)
#define BEEP_CSR_BEEPSEL_2K ((u8)0x40)
#define BEEP_CSR_BEEPSEL_4K ((u8)0x80)

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Clock Controller (CLK)
  */

typedef volatile struct CLK_struct
{
  u8 ICKR;     /*!< Internal Clocks Control Register */
  u8 ECKR;     /*!< External Clocks Control Register */
  u8 RESERVED; /*!< Reserved byte */
  u8 CMSR;     /*!< Clock Master Status Register */
  u8 SWR;      /*!< Clock Master Switch Register */
  u8 SWCR;     /*!< Switch Control Register */
  u8 CKDIVR;   /*!< Clock Divider Register */
  u8 PCKENR1;  /*!< Peripheral Clock Gating Register 1 */
  u8 CSSR;     /*!< Clock Security System Register */
  u8 CCOR;     /*!< Configurable Clock Output Register */
  u8 PCKENR2;  /*!< Peripheral Clock Gating Register 2 */
  u8 CANCCR;   /*!< CAN external clock control Register */
  u8 HSITRIMR; /*!< HSI Calibration Trimmer Register */ 
  u8 SWIMCCR;  /*!< SWIM clock control register */
}
CLK_TypeDef;

/** @addtogroup CLK_Registers_Reset_Value
  * @{
  */

#define CLK_ICKR_RESET_VALUE     ((u8)0x01)
#define CLK_ECKR_RESET_VALUE     ((u8)0x00)
#define CLK_CMSR_RESET_VALUE     ((u8)0xE1)
#define CLK_SWR_RESET_VALUE      ((u8)0xE1)
#define CLK_SWCR_RESET_VALUE     ((u8)0x00)
#define CLK_CKDIVR_RESET_VALUE   ((u8)0x18)
#define CLK_PCKENR1_RESET_VALUE  ((u8)0xFF)
#define CLK_PCKENR2_RESET_VALUE  ((u8)0xFF)
#define CLK_CSSR_RESET_VALUE     ((u8)0x00)
#define CLK_CCOR_RESET_VALUE     ((u8)0x00)
#define CLK_CANCCR_RESET_VALUE   ((u8)0x00)
#define CLK_HSITRIMR_RESET_VALUE ((u8)0x00)
#define CLK_SWIMCCR_RESET_VALUE  ((u8)0x00)

/**
  * @}
  */

/** @addtogroup CLK_Registers_Bits_Definition
  * @{
  */

#define CLK_ICKR_SWUAH    ((u8)0x20) /*!< Slow Wake-up from Active Halt/Halt modes */
#define CLK_ICKR_LSIRDY ((u8)0x10) /*!< Low speed internal oscillator ready */
#define CLK_ICKR_LSIEN  ((u8)0x08) /*!< Low speed internal RC oscillator enable */
#define CLK_ICKR_FHWU    ((u8)0x04) /*!< Fast Wake-up from Active Halt/Halt mode */
#define CLK_ICKR_HSIRDY ((u8)0x02) /*!< High speed internal RC oscillator ready */
#define CLK_ICKR_HSIEN  ((u8)0x01) /*!< High speed internal RC oscillator enable */

#define CLK_ECKR_HSERDY ((u8)0x02) /*!< High speed external crystal oscillator ready */
#define CLK_ECKR_HSEEN  ((u8)0x01) /*!< High speed external crystal oscillator enable */

#define CLK_CMSR_CKM    ((u8)0xFF) /*!< Clock master status bits */

#define CLK_SWR_SWI     ((u8)0xFF) /*!< Clock master selection bits */

#define CLK_SWCR_SWIF   ((u8)0x08) /*!< Clock switch interrupt flag */
#define CLK_SWCR_SWIEN  ((u8)0x04) /*!< Clock switch interrupt enable */
#define CLK_SWCR_SWEN   ((u8)0x02) /*!< Switch start/stop */
#define CLK_SWCR_SWBSY  ((u8)0x01) /*!< Switch busy */

#define CLK_CKDIVR_HSIDIV ((u8)0x18) /*!< High speed internal clock prescaler */
#define CLK_CKDIVR_CPUDIV ((u8)0x07) /*!< CPU clock prescaler */

#define CLK_PCKENR1_TIM1    ((u8)0x80) /*!< Timer 1 clock enable */ /* TBD verify if correct timer */
#define CLK_PCKENR1_TIM3    ((u8)0x40) /*!< Timer 3 clock enable */
#define CLK_PCKENR1_TIM2    ((u8)0x20) /*!< Timer 2 clock enable */
#define CLK_PCKENR1_TIM4    ((u8)0x10) /*!< Timer 4 clock enable */ /* TBD verify if correct timer */
#define CLK_PCKENR1_LINUART ((u8)0x08) /*!< LINUART clock enable */
#define CLK_PCKENR1_USART   ((u8)0x04) /*!< USART clock enable */
#define CLK_PCKENR1_SPI     ((u8)0x02) /*!< SPI clock enable */
#define CLK_PCKENR1_I2C     ((u8)0x01) /*!< I2C clock enable */

#define CLK_PCKENR2_CAN ((u8)0x80) /*!< CAN clock enable */
#define CLK_PCKENR2_ADC ((u8)0x08) /*!< ADC clock enable */
#define CLK_PCKENR2_AWU ((u8)0x04) /*!< AWU clock enable */

#define CLK_CSSR_CSSD   ((u8)0x08) /*!< Clock security system detection */
#define CLK_CSSR_CSSDIE ((u8)0x04) /*!< Clock security system detection interrupt enable */
#define CLK_CSSR_AUX    ((u8)0x02) /*!< Auxiliary oscillator connected to master clock */
#define CLK_CSSR_CSSEN  ((u8)0x01) /*!< Clock security system enable */

#define CLK_CCOR_CCOBSY ((u8)0x40) /*!< Configurable clock output busy */
#define CLK_CCOR_CCORDY ((u8)0x20) /*!< Configurable clock output ready */
#define CLK_CCOR_CCOSEL ((u8)0x1E) /*!< Configurable clock output selection */
#define CLK_CCOR_CCOEN  ((u8)0x01) /*!< Configurable clock output enable */

#define CLK_CANCCR_CANDIV ((u8)0x07) /*!< External CAN clock divider */ 

#define CLK_HSITRIMR_HSITRIM ((u8)0x07) /*!< High speed internal oscillator trimmer */ 

#define CLK_SWIMCCR_SWIMDIV ((u8)0x01) /*!< SWIM Clock Dividing Factor */ 

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief 16-bit timer with complementary PWM outputs (TIM1)
  */

typedef volatile struct TIM1_struct
{
  u8 CR1;   /*!< control register 1 */
  u8 CR2;   /*!< control register 2 */
  u8 SMCR;  /*!< Synchro mode control register */
  u8 ETR;   /*!< external trigger register */
  u8 IER;   /*!< interrupt enable register*/
  u8 SR1;   /*!< status register 1 */
  u8 SR2;   /*!< status register 2 */
  u8 EGR;   /*!< event generation register */
  u8 CCMR1; /*!< CC mode register 1 */
  u8 CCMR2; /*!< CC mode register 2 */
  u8 CCMR3; /*!< CC mode register 3 */
  u8 CCMR4; /*!< CC mode register 4 */
  u8 CCER1; /*!< CC enable register 1 */
  u8 CCER2; /*!< CC enable register 2 */
  u8 CNTRH; /*!< counter high */
  u8 CNTRL; /*!< counter low */
  u8 PSCRH; /*!< prescaler high */
  u8 PSCRL; /*!< prescaler low */
  u8 ARRH;  /*!< auto-reload register high */
  u8 ARRL;  /*!< auto-reload register low */
  u8 RCR;   /*!< Repetition Counter register */
  u8 CCR1H; /*!< capture/compare register 1 high */
  u8 CCR1L; /*!< capture/compare register 1 low */
  u8 CCR2H; /*!< capture/compare register 2 high */
  u8 CCR2L; /*!< capture/compare register 2 low */
  u8 CCR3H; /*!< capture/compare register 3 high */
  u8 CCR3L; /*!< capture/compare register 3 low */
  u8 CCR4H; /*!< capture/compare register 3 high */
  u8 CCR4L; /*!< capture/compare register 3 low */
  u8 BKR;   /*!< Break Register */
  u8 DTR;   /*!< dead-time register */
  u8 OISR;  /*!< Output idle register */
}
TIM1_TypeDef;

/** @addtogroup TIM1_Registers_Reset_Value
  * @{
  */

#define TIM1_CR1_RESET_VALUE   ((u8)0x00)
#define TIM1_CR2_RESET_VALUE   ((u8)0x00)
#define TIM1_SMCR_RESET_VALUE  ((u8)0x00)
#define TIM1_ETR_RESET_VALUE   ((u8)0x00)
#define TIM1_IER_RESET_VALUE   ((u8)0x00)
#define TIM1_SR1_RESET_VALUE   ((u8)0x00)
#define TIM1_SR2_RESET_VALUE   ((u8)0x00)
#define TIM1_EGR_RESET_VALUE   ((u8)0x00)
#define TIM1_CCMR1_RESET_VALUE ((u8)0x00)
#define TIM1_CCMR2_RESET_VALUE ((u8)0x00)
#define TIM1_CCMR3_RESET_VALUE ((u8)0x00)
#define TIM1_CCMR4_RESET_VALUE ((u8)0x00)
#define TIM1_CCER1_RESET_VALUE ((u8)0x00)
#define TIM1_CCER2_RESET_VALUE ((u8)0x00)
#define TIM1_CNTRH_RESET_VALUE ((u8)0x00)
#define TIM1_CNTRL_RESET_VALUE ((u8)0x00)
#define TIM1_PSCRH_RESET_VALUE ((u8)0x00)
#define TIM1_PSCRL_RESET_VALUE ((u8)0x00)
#define TIM1_ARRH_RESET_VALUE  ((u8)0xFF)
#define TIM1_ARRL_RESET_VALUE  ((u8)0xFF)
#define TIM1_RCR_RESET_VALUE   ((u8)0x00)
#define TIM1_CCR1H_RESET_VALUE ((u8)0x00)
#define TIM1_CCR1L_RESET_VALUE ((u8)0x00)
#define TIM1_CCR2H_RESET_VALUE ((u8)0x00)
#define TIM1_CCR2L_RESET_VALUE ((u8)0x00)
#define TIM1_CCR3H_RESET_VALUE ((u8)0x00)
#define TIM1_CCR3L_RESET_VALUE ((u8)0x00)
#define TIM1_CCR4H_RESET_VALUE ((u8)0x00)
#define TIM1_CCR4L_RESET_VALUE ((u8)0x00)
#define TIM1_BKR_RESET_VALUE   ((u8)0x00)
#define TIM1_DTR_RESET_VALUE   ((u8)0x00)
#define TIM1_OISR_RESET_VALUE  ((u8)0x00)

/**
  * @}
  */

/** @addtogroup TIM1_Registers_Bits_Definition
  * @{
  */

#define TIM1_CR1_ARPE ((u8)0x80) /*!< Auto-Reload Preload Enable mask. */
#define TIM1_CR1_CMS  ((u8)0x60) /*!< Center-aligned Mode Selection mask. */
#define TIM1_CR1_DIR  ((u8)0x10) /*!< Direction mask. */
#define TIM1_CR1_OPM  ((u8)0x08) /*!< One Pulse Mode mask. */
#define TIM1_CR1_URS  ((u8)0x04) /*!< Update Request Source mask. */
#define TIM1_CR1_UDIS ((u8)0x02) /*!< Update DIsable mask. */
#define TIM1_CR1_CEN  ((u8)0x01) /*!< Counter Enable mask. */

#define TIM1_CR2_TI1S ((u8)0x80) /*!< TI1S Selection mask. */
#define TIM1_CR2_MMS  ((u8)0x70) /*!< MMS Selection mask. */
#define TIM1_CR2_COMS ((u8)0x04) /*!< Capture/Compare Control Update Selection mask. */
#define TIM1_CR2_CCPC ((u8)0x01) /*!< Capture/Compare Preloaded Control mask. */

#define TIM1_SMCR_MSM ((u8)0x80) /*!< Master/Slave Mode mask. */
#define TIM1_SMCR_TS  ((u8)0x70) /*!< Trigger Selection mask. */
#define TIM1_SMCR_SMS ((u8)0x07) /*!< Slave Mode Selection mask. */

#define TIM1_ETR_ETP  ((u8)0x80) /*!< External Trigger Polarity mask. */
#define TIM1_ETR_ECE  ((u8)0x40)/*!< External Clock mask. */
#define TIM1_ETR_ETPS ((u8)0x30) /*!< External Trigger Prescaler mask. */
#define TIM1_ETR_ETF  ((u8)0x0F) /*!< External Trigger Filter mask. */

#define TIM1_IER_BIE   ((u8)0x80) /*!< Break Interrupt Enable mask. */
#define TIM1_IER_TIE   ((u8)0x40) /*!< Trigger Interrupt Enable mask. */
#define TIM1_IER_COMIE ((u8)0x20) /*!<  Commutation Interrupt Enable mask.*/
#define TIM1_IER_CC4IE ((u8)0x10) /*!< Capture/Compare 4 Interrupt Enable mask. */
#define TIM1_IER_CC3IE ((u8)0x08) /*!< Capture/Compare 3 Interrupt Enable mask. */
#define TIM1_IER_CC2IE ((u8)0x04) /*!< Capture/Compare 2 Interrupt Enable mask. */
#define TIM1_IER_CC1IE ((u8)0x02) /*!< Capture/Compare 1 Interrupt Enable mask. */
#define TIM1_IER_UIE   ((u8)0x01) /*!< Update Interrupt Enable mask. */

#define TIM1_SR1_BIF   ((u8)0x80) /*!< Break Interrupt Flag mask. */
#define TIM1_SR1_TIF   ((u8)0x40) /*!< Trigger Interrupt Flag mask. */
#define TIM1_SR1_COMIF ((u8)0x20) /*!< Commutation Interrupt Flag mask. */
#define TIM1_SR1_CC4IF ((u8)0x10) /*!< Capture/Compare 4 Interrupt Flag mask. */
#define TIM1_SR1_CC3IF ((u8)0x08) /*!< Capture/Compare 3 Interrupt Flag mask. */
#define TIM1_SR1_CC2IF ((u8)0x04) /*!< Capture/Compare 2 Interrupt Flag mask. */
#define TIM1_SR1_CC1IF ((u8)0x02) /*!< Capture/Compare 1 Interrupt Flag mask. */
#define TIM1_SR1_UIF   ((u8)0x01) /*!< Update Interrupt Flag mask. */

#define TIM1_SR2_CC4OF ((u8)0x10) /*!< Capture/Compare 4 Overcapture Flag mask. */
#define TIM1_SR2_CC3OF ((u8)0x08) /*!< Capture/Compare 3 Overcapture Flag mask. */
#define TIM1_SR2_CC2OF ((u8)0x04) /*!< Capture/Compare 2 Overcapture Flag mask. */
#define TIM1_SR2_CC1OF ((u8)0x02) /*!< Capture/Compare 1 Overcapture Flag mask. */

#define TIM1_EGR_BG   ((u8)0x80) /*!< Break Generation mask. */
#define TIM1_EGR_TG   ((u8)0x40) /*!< Trigger Generation mask. */
#define TIM1_EGR_COMG ((u8)0x20) /*!< Capture/Compare Control Update Generation mask. */
#define TIM1_EGR_CC4G ((u8)0x10) /*!< Capture/Compare 4 Generation mask. */
#define TIM1_EGR_CC3G ((u8)0x08) /*!< Capture/Compare 3 Generation mask. */
#define TIM1_EGR_CC2G ((u8)0x04) /*!< Capture/Compare 2 Generation mask. */
#define TIM1_EGR_CC1G ((u8)0x02) /*!< Capture/Compare 1 Generation mask. */
#define TIM1_EGR_UG   ((u8)0x01) /*!< Update Generation mask. */

#define TIM1_CCMR_ICxPSC ((u8)0x0C) /*!< Input Capture x Prescaler mask. */
#define TIM1_CCMR_ICxF   ((u8)0xF0) /*!< Input Capture x Filter mask. */
#define TIM1_CCMR_OCM    ((u8)0x70) /*!< Output Compare x Mode mask. */
#define TIM1_CCMR_OCxPE  ((u8)0x08) /*!< Output Compare x Preload Enable mask. */
#define TIM1_CCMR_OCxFE  ((u8)0x04) /*!< Output Compare x Fast Enable mask. */
#define TIM1_CCMR_CCxS   ((u8)0x03) /*!< Capture/Compare x Selection mask. */

#define TIM1_CCMR_OCM_PWM1    ((u8)0x60)
#define TIM1_CCMR_OCM_FORCELOW    ((u8)0x40)
#define TIM1_CCMR_OCM_FORCEHIGH    ((u8)0x50)

#define CCMR_TIxDirect_Set ((u8)0x01)

#define TIM1_CCER1_CC2NP ((u8)0x80) /*!< Capture/Compare 2 Complementary output Polarity mask. */
#define TIM1_CCER1_CC2NE ((u8)0x40) /*!< Capture/Compare 2 Complementary output enable mask. */
#define TIM1_CCER1_CC2P  ((u8)0x20) /*!< Capture/Compare 2 output Polarity mask. */
#define TIM1_CCER1_CC2E  ((u8)0x10) /*!< Capture/Compare 2 output enable mask. */
#define TIM1_CCER1_CC1NP ((u8)0x08) /*!< Capture/Compare 1 Complementary output Polarity mask. */
#define TIM1_CCER1_CC1NE ((u8)0x04) /*!< Capture/Compare 1 Complementary output enable mask. */
#define TIM1_CCER1_CC1P  ((u8)0x02) /*!< Capture/Compare 1 output Polarity mask. */
#define TIM1_CCER1_CC1E  ((u8)0x01) /*!< Capture/Compare 1 output enable mask. */

#define TIM1_CCER2_CC4P  ((u8)0x20) /*!< Capture/Compare 4 output Polarity mask. */
#define TIM1_CCER2_CC4E  ((u8)0x10) /*!< Capture/Compare 4 output enable mask. */
#define TIM1_CCER2_CC3NP ((u8)0x08) /*!< Capture/Compare 3 Complementary output Polarity mask. */
#define TIM1_CCER2_CC3NE ((u8)0x04) /*!< Capture/Compare 3 Complementary output enable mask. */
#define TIM1_CCER2_CC3P  ((u8)0x02) /*!< Capture/Compare 3 output Polarity mask. */
#define TIM1_CCER2_CC3E  ((u8)0x01) /*!< Capture/Compare 3 output enable mask. */

#define TIM1_CNTRH_CNT ((u8)0xFF) /*!< Counter Value (MSB) mask. */
#define TIM1_CNTRL_CNT ((u8)0xFF) /*!< Counter Value (LSB) mask. */

#define TIM1_PSCH_PSC ((u8)0xFF) /*!< Prescaler Value (MSB) mask. */
#define TIM1_PSCL_PSC ((u8)0xFF) /*!< Prescaler Value (LSB) mask. */

#define TIM1_ARRH_ARR ((u8)0xFF) /*!< Autoreload Value (MSB) mask. */
#define TIM1_ARRL_ARR ((u8)0xFF) /*!< Autoreload Value (LSB) mask. */

#define TIM1_RCR_REP ((u8)0xFF) /*!< Repetition Counter Value mask. */

#define TIM1_CCR1H_CCR1 ((u8)0xFF) /*!< Capture/Compare 1 Value (MSB) mask. */
#define TIM1_CCR1L_CCR1 ((u8)0xFF) /*!< Capture/Compare 1 Value (LSB) mask. */

#define TIM1_CCR2H_CCR2 ((u8)0xFF) /*!< Capture/Compare 2 Value (MSB) mask. */
#define TIM1_CCR2L_CCR2 ((u8)0xFF) /*!< Capture/Compare 2 Value (LSB) mask. */

#define TIM1_CCR3H_CCR3 ((u8)0xFF) /*!< Capture/Compare 3 Value (MSB) mask. */
#define TIM1_CCR3L_CCR3 ((u8)0xFF) /*!< Capture/Compare 3 Value (LSB) mask. */

#define TIM1_CCR4H_CCR4 ((u8)0xFF) /*!< Capture/Compare 4 Value (MSB) mask. */
#define TIM1_CCR4L_CCR4 ((u8)0xFF) /*!< Capture/Compare 4 Value (LSB) mask. */

#define TIM1_BKR_MOE  ((u8)0x80) /*!< Main Output Enable mask. */
#define TIM1_BKR_AOE  ((u8)0x40) /*!< Automatic Output Enable mask. */
#define TIM1_BKR_BKP  ((u8)0x20) /*!< Break Polarity mask. */
#define TIM1_BKR_BKE  ((u8)0x10) /*!< Break Enable mask. */
#define TIM1_BKR_OSSR ((u8)0x08) /*!< Off-State Selection for Run mode mask. */
#define TIM1_BKR_OSSI ((u8)0x04) /*!< Off-State Selection for Idle mode mask. */
#define TIM1_BKR_LOCK ((u8)0x03) /*!< Lock Configuration mask. */

#define TIM1_DTR_DTG ((u8)0xFF) /*!< Dead-Time Generator set-up mask. */

#define TIM1_OISR_OIS4  ((u8)0x40) /*!< Output Idle state 4 (OC4 output) mask. */
#define TIM1_OISR_OIS3N ((u8)0x20) /*!< Output Idle state 3 (OC3N output) mask. */
#define TIM1_OISR_OIS3  ((u8)0x10) /*!< Output Idle state 3 (OC3 output) mask. */
#define TIM1_OISR_OIS2N ((u8)0x08) /*!< Output Idle state 2 (OC2N output) mask. */
#define TIM1_OISR_OIS2  ((u8)0x04) /*!< Output Idle state 2 (OC2 output) mask. */
#define TIM1_OISR_OIS1N ((u8)0x02) /*!< Output Idle state 1 (OC1N output) mask. */
#define TIM1_OISR_OIS1  ((u8)0x01) /*!< Output Idle state 1 (OC1 output) mask. */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief 16-bit timer (TIM2)
  */

typedef volatile struct TIM2_struct
{
  u8 CR1;   /*!< control register 1 */
  u8 IER;   /*!< interrupt enable register */
  u8 SR1;   /*!< status register 1 */
  u8 SR2;   /*!< status register 2 */
  u8 EGR;   /*!< event generation register */
  u8 CCMR1; /*!< CC mode register 1 */
  u8 CCMR2; /*!< CC mode register 2 */
  u8 CCMR3; /*!< CC mode register 3 */
  u8 CCER1; /*!< CC enable register 1 */
  u8 CCER2; /*!< CC enable register 2 */
  u8 CNTRH; /*!< counter high */
  u8 CNTRL; /*!< counter low */
  u8 PSCR;  /*!< prescaler register */
  u8 ARRH;  /*!< auto-reload register high */
  u8 ARRL;  /*!< auto-reload register low */
  u8 CCR1H; /*!< capture/compare register 1 high */
  u8 CCR1L; /*!< capture/compare register 1 low */
  u8 CCR2H; /*!< capture/compare register 2 high */
  u8 CCR2L; /*!< capture/compare register 2 low */
  u8 CCR3H; /*!< capture/compare register 3 high */
  u8 CCR3L; /*!< capture/compare register 3 low */
}
TIM2_TypeDef;
/* my define for TIM2 value */
#define TIM2_CCMR_CCxS_OC       ((u8)0x00)
#define TIM2_CCMR1_CCxS_IC_TI1  ((u8)0x01)
#define TIM2_CCMR1_CCxS_IC_TI2  ((u8)0x02)
#define TIM2_CCMR_ICxF_8        ((u8)0x30)
#define TIM2_CCMR2_CCxS_IC_TI1  ((u8)0x02)
#define TIM2_CCMR2_CCxS_IC_TI2  ((u8)0x01)
#define TIM2_CCMR3_CCxS_IC_TI3  ((u8)0x01)

/* TIM2_Registers_Reset_Value */
#define TIM2_CR1_RESET_VALUE   ((u8)0x00)
#define TIM2_IER_RESET_VALUE   ((u8)0x00)
#define TIM2_SR1_RESET_VALUE   ((u8)0x00)
#define TIM2_SR2_RESET_VALUE   ((u8)0x00)
#define TIM2_EGR_RESET_VALUE   ((u8)0x00)
#define TIM2_CCMR1_RESET_VALUE ((u8)0x00)
#define TIM2_CCMR2_RESET_VALUE ((u8)0x00)
#define TIM2_CCMR3_RESET_VALUE ((u8)0x00)
#define TIM2_CCER1_RESET_VALUE ((u8)0x00)
#define TIM2_CCER2_RESET_VALUE ((u8)0x00)
#define TIM2_CNTRH_RESET_VALUE ((u8)0x00)
#define TIM2_CNTRL_RESET_VALUE ((u8)0x00)
#define TIM2_PSCR_RESET_VALUE  ((u8)0x00)
#define TIM2_ARRH_RESET_VALUE  ((u8)0xFF)
#define TIM2_ARRL_RESET_VALUE  ((u8)0xFF)
#define TIM2_CCR1H_RESET_VALUE ((u8)0x00)
#define TIM2_CCR1L_RESET_VALUE ((u8)0x00)
#define TIM2_CCR2H_RESET_VALUE ((u8)0x00)
#define TIM2_CCR2L_RESET_VALUE ((u8)0x00)
#define TIM2_CCR3H_RESET_VALUE ((u8)0x00)
#define TIM2_CCR3L_RESET_VALUE ((u8)0x00)

/**
  * @}
  */

/** @addtogroup TIM2_Registers_Bits_Definition
  * @{
  */

#define TIM2_CR1_ARPE ((u8)0x80) /*!< Auto-Reload Preload Enable mask. */
#define TIM2_CR1_OPM  ((u8)0x08) /*!< One Pulse Mode mask. */
#define TIM2_CR1_URS  ((u8)0x04) /*!< Update Request Source mask. */
#define TIM2_CR1_UDIS ((u8)0x02) /*!< Update DIsable mask. */
#define TIM2_CR1_CEN  ((u8)0x01) /*!< Counter Enable mask. */

#define TIM2_IER_CC3IE ((u8)0x08) /*!< Capture/Compare 3 Interrupt Enable mask. */
#define TIM2_IER_CC2IE ((u8)0x04) /*!< Capture/Compare 2 Interrupt Enable mask. */
#define TIM2_IER_CC1IE ((u8)0x02) /*!< Capture/Compare 1 Interrupt Enable mask. */
#define TIM2_IER_UIE   ((u8)0x01) /*!< Update Interrupt Enable mask. */

#define TIM2_SR1_CC3IF ((u8)0x08) /*!< Capture/Compare 3 Interrupt Flag mask. */
#define TIM2_SR1_CC2IF ((u8)0x04) /*!< Capture/Compare 2 Interrupt Flag mask. */
#define TIM2_SR1_CC1IF ((u8)0x02) /*!< Capture/Compare 1 Interrupt Flag mask. */
#define TIM2_SR1_UIF   ((u8)0x01) /*!< Update Interrupt Flag mask. */

#define TIM2_SR2_CC3OF ((u8)0x08) /*!< Capture/Compare 3 Overcapture Flag mask. */
#define TIM2_SR2_CC2OF ((u8)0x04) /*!< Capture/Compare 2 Overcapture Flag mask. */
#define TIM2_SR2_CC1OF ((u8)0x02) /*!< Capture/Compare 1 Overcapture Flag mask. */

#define TIM2_EGR_CC3G  ((u8)0x08) /*!< Capture/Compare 3 Generation mask. */
#define TIM2_EGR_CC2G  ((u8)0x04) /*!< Capture/Compare 2 Generation mask. */
#define TIM2_EGR_CC1G  ((u8)0x02) /*!< Capture/Compare 1 Generation mask. */
#define TIM2_EGR_UG    ((u8)0x01) /*!< Update Generation mask. */

#define TIM2_CCMR_ICxPSC ((u8)0x0C) /*!< Input Capture x Prescaler mask. */
#define TIM2_CCMR_ICxF   ((u8)0xF0) /*!< Input Capture x Filter mask. */
#define TIM2_CCMR_OCM    ((u8)0x70) /*!< Output Compare x Mode mask. */
#define	TIM2_CCMR_OCxPE  ((u8)0x08) /*!< Output Compare x Preload Enable mask. */
#define TIM2_CCMR_CCxS   ((u8)0x03) /*!< Capture/Compare x Selection mask. */

#define TIM2_CCER1_CC2P ((u8)0x20) /*!< Capture/Compare 2 output Polarity mask. */
#define TIM2_CCER1_CC2E ((u8)0x10) /*!< Capture/Compare 2 output enable mask. */
#define TIM2_CCER1_CC1P ((u8)0x02) /*!< Capture/Compare 1 output Polarity mask. */
#define TIM2_CCER1_CC1E ((u8)0x01) /*!< Capture/Compare 1 output enable mask. */

#define TIM2_CCER2_CC3P ((u8)0x02) /*!< Capture/Compare 3 output Polarity mask. */
#define TIM2_CCER2_CC3E ((u8)0x01) /*!< Capture/Compare 3 output enable mask. */

#define TIM2_CNTRH_CNT ((u8)0xFF) /*!< Counter Value (MSB) mask. */
#define TIM2_CNTRL_CNT ((u8)0xFF) /*!< Counter Value (LSB) mask. */

#define TIM2_PSCR_PSC ((u8)0xFF) /*!< Prescaler Value (MSB) mask. */

#define TIM2_ARRH_ARR ((u8)0xFF) /*!< Autoreload Value (MSB) mask. */
#define TIM2_ARRL_ARR ((u8)0xFF) /*!< Autoreload Value (LSB) mask. */

#define TIM2_CCR1H_CCR1 ((u8)0xFF) /*!< Capture/Compare 1 Value (MSB) mask. */
#define TIM2_CCR1L_CCR1 ((u8)0xFF) /*!< Capture/Compare 1 Value (LSB) mask. */

#define TIM2_CCR2H_CCR2 ((u8)0xFF) /*!< Capture/Compare 2 Value (MSB) mask. */
#define TIM2_CCR2L_CCR2 ((u8)0xFF) /*!< Capture/Compare 2 Value (LSB) mask. */

#define TIM2_CCR3H_CCR3 ((u8)0xFF) /*!< Capture/Compare 3 Value (MSB) mask. */
#define TIM2_CCR3L_CCR3 ((u8)0xFF) /*!< Capture/Compare 3 Value (LSB) mask. */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief 16-bit timer (TIM3)
  */
typedef volatile struct TIM3_struct
{
  u8 CR1;   /*!< control register 1 */
  u8 IER;   /*!< interrupt enable register */
  u8 SR1;   /*!< status register 1 */
  u8 SR2;   /*!< status register 2 */
  u8 EGR;   /*!< event generation register */
  u8 CCMR1; /*!< CC mode register 1 */
  u8 CCMR2; /*!< CC mode register 2 */
  u8 CCER1; /*!< CC enable register 1 */
  u8 CNTRH; /*!< counter high */
  u8 CNTRL; /*!< counter low */
  u8 PSCR;  /*!< prescaler register */
  u8 ARRH;  /*!< auto-reload register high */
  u8 ARRL;  /*!< auto-reload register low */
  u8 CCR1H; /*!< capture/compare register 1 high */
  u8 CCR1L; /*!< capture/compare register 1 low */
  u8 CCR2H; /*!< capture/compare register 2 high */
  u8 CCR2L; /*!< capture/compare register 2 low */
}
TIM3_TypeDef;

/** @addtogroup TIM3_Registers_Reset_Value
  * @{
  */

#define TIM3_CR1_RESET_VALUE   ((u8)0x00)
#define TIM3_IER_RESET_VALUE   ((u8)0x00)
#define TIM3_SR1_RESET_VALUE   ((u8)0x00)
#define TIM3_SR2_RESET_VALUE   ((u8)0x00)
#define TIM3_EGR_RESET_VALUE   ((u8)0x00)
#define TIM3_CCMR1_RESET_VALUE ((u8)0x00)
#define TIM3_CCMR2_RESET_VALUE ((u8)0x00)
#define TIM3_CCER1_RESET_VALUE ((u8)0x00)
#define TIM3_CNTRH_RESET_VALUE ((u8)0x00)
#define TIM3_CNTRL_RESET_VALUE ((u8)0x00)
#define TIM3_PSCR_RESET_VALUE  ((u8)0x00)
#define TIM3_ARRH_RESET_VALUE  ((u8)0xFF)
#define TIM3_ARRL_RESET_VALUE  ((u8)0xFF)
#define TIM3_CCR1H_RESET_VALUE ((u8)0x00)
#define TIM3_CCR1L_RESET_VALUE ((u8)0x00)
#define TIM3_CCR2H_RESET_VALUE ((u8)0x00)
#define TIM3_CCR2L_RESET_VALUE ((u8)0x00)

/**
  * @}
  */

/** @addtogroup TIM3_Registers_Bits_Definition
  * @{
  */

#define TIM3_CR1_ARPE ((u8)0x80) /*!< Auto-Reload Preload Enable mask. */
#define TIM3_CR1_OPM  ((u8)0x08) /*!< One Pulse Mode mask. */
#define TIM3_CR1_URS  ((u8)0x04) /*!< Update Request Source mask. */
#define TIM3_CR1_UDIS ((u8)0x02) /*!< Update DIsable mask. */
#define TIM3_CR1_CEN  ((u8)0x01) /*!< Counter Enable mask. */

/*#define TIM3_IER_CC3IE ((u8)0x08)*/ /*!< Capture/Compare 3 Interrupt Enable mask. */
#define TIM3_IER_CC2IE ((u8)0x04) /*!< Capture/Compare 2 Interrupt Enable mask. */
#define TIM3_IER_CC1IE ((u8)0x02) /*!< Capture/Compare 1 Interrupt Enable mask. */
#define TIM3_IER_UIE   ((u8)0x01) /*!< Update Interrupt Enable mask. */

/*#define TIM3_SR1_CC3IF ((u8)0x08)*/ /*!< Capture/Compare 3 Interrupt Flag mask. */
#define TIM3_SR1_CC2IF ((u8)0x04) /*!< Capture/Compare 2 Interrupt Flag mask. */
#define TIM3_SR1_CC1IF ((u8)0x02) /*!< Capture/Compare 1 Interrupt Flag mask. */
#define TIM3_SR1_UIF   ((u8)0x01) /*!< Update Interrupt Flag mask. */

/*#define TIM3_SR2_CC3OF ((u8)0x08)*/ /*!< Capture/Compare 3 Overcapture Flag mask. */
#define TIM3_SR2_CC2OF ((u8)0x04) /*!< Capture/Compare 2 Overcapture Flag mask. */
#define TIM3_SR2_CC1OF ((u8)0x02) /*!< Capture/Compare 1 Overcapture Flag mask. */

/*#define TIM3_EGR_CC3G ((u8)0x08)*/ /*!< Capture/Compare 3 Generation mask. */
#define TIM3_EGR_CC2G ((u8)0x04) /*!< Capture/Compare 2 Generation mask. */
#define TIM3_EGR_CC1G ((u8)0x02) /*!< Capture/Compare 1 Generation mask. */
#define TIM3_EGR_UG   ((u8)0x01) /*!< Update Generation mask. */

#define TIM3_CCMR_ICxPSC ((u8)0x0C) /*!< Input Capture x Prescaler mask. */
#define TIM3_CCMR_ICxF   ((u8)0xF0) /*!< Input Capture x Filter mask. */
#define TIM3_CCMR_OCM    ((u8)0x70) /*!< Output Compare x Mode mask. */
#define TIM3_CCMR_OCxPE  ((u8)0x08) /*!< Output Compare x Preload Enable mask. */
#define TIM3_CCMR_CCxS   ((u8)0x03) /*!< Capture/Compare x Selection mask. */

#define TIM3_CCER1_CC2P ((u8)0x20) /*!< Capture/Compare 2 output Polarity mask. */
#define TIM3_CCER1_CC2E ((u8)0x10) /*!< Capture/Compare 2 output enable mask. */
#define TIM3_CCER1_CC1P ((u8)0x02) /*!< Capture/Compare 1 output Polarity mask. */
#define TIM3_CCER1_CC1E ((u8)0x01) /*!< Capture/Compare 1 output enable mask. */

#define TIM3_CNTRH_CNT ((u8)0xFF) /*!< Counter Value (MSB) mask. */
#define TIM3_CNTRL_CNT ((u8)0xFF) /*!< Counter Value (LSB) mask. */

#define TIM3_PSCR_PSC ((u8)0xFF) /*!< Prescaler Value (MSB) mask. */

#define TIM3_ARRH_ARR ((u8)0xFF) /*!< Autoreload Value (MSB) mask. */
#define TIM3_ARRL_ARR ((u8)0xFF) /*!< Autoreload Value (LSB) mask. */

#define TIM3_CCR1H_CCR1 ((u8)0xFF) /*!< Capture/Compare 1 Value (MSB) mask. */
#define TIM3_CCR1L_CCR1 ((u8)0xFF) /*!< Capture/Compare 1 Value (LSB) mask. */

#define TIM3_CCR2H_CCR2 ((u8)0xFF) /*!< Capture/Compare 2 Value (MSB) mask. */
#define TIM3_CCR2L_CCR2 ((u8)0xFF) /*!< Capture/Compare 2 Value (LSB) mask. */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief 8-bit system timer (TIM4)
  */

typedef volatile struct TIM4_struct
{
  u8 CR1;  /*!< control register 1 */
  u8 IER;  /*!< interrupt enable register */
  u8 SR1;  /*!< status register 1 */
  u8 EGR;  /*!< event generation register */
  u8 CNTR; /*!< counter register */
  u8 PSCR; /*!< prescaler register */
  u8 ARR;  /*!< auto-reload register */
}
TIM4_TypeDef;

/** @addtogroup TIM4_Registers_Reset_Value
  * @{
  */

#define TIM4_CR1_RESET_VALUE  ((u8)0x00)
#define TIM4_IER_RESET_VALUE  ((u8)0x00)
#define TIM4_SR1_RESET_VALUE  ((u8)0x00)
#define TIM4_EGR_RESET_VALUE  ((u8)0x00)
#define TIM4_CNTR_RESET_VALUE ((u8)0x00)
#define TIM4_PSCR_RESET_VALUE ((u8)0x00)
#define TIM4_ARR_RESET_VALUE  ((u8)0xFF)

/**
  * @}
  */

/** @addtogroup TIM4_Registers_Bits_Definition
  * @{
  */

#define TIM4_CR1_ARPE ((u8)0x80) /*!< Auto-Reload Preload Enable mask. */
#define TIM4_CR1_OPM  ((u8)0x08) /*!< One Pulse Mode mask. */
#define TIM4_CR1_URS  ((u8)0x04) /*!< Update Request Source mask. */
#define TIM4_CR1_UDIS ((u8)0x02) /*!< Update DIsable mask. */
#define TIM4_CR1_CEN  ((u8)0x01) /*!< Counter Enable mask. */

#define TIM4_IER_UIE ((u8)0x01) /*!< Update Interrupt Enable mask. */

#define TIM4_SR1_UIF ((u8)0x01) /*!< Update Interrupt Flag mask. */

#define TIM4_EGR_UG ((u8)0x01) /*!< Update Generation mask. */

#define TIM4_CNTR_CNT ((u8)0xFF) /*!< Counter Value (LSB) mask. */

#define TIM4_PSCR_PSC ((u8)0x07) /*!< Prescaler Value  mask. */

#define TIM4_ARR_ARR ((u8)0xFF) /*!< Autoreload Value mask. */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Inter-Integrated Circuit (I2C)
  */

typedef volatile struct I2C_struct
{
  u8 CR1;       /*!< I2C control register 1 */
  u8 CR2;       /*!< I2C control register 2 */
  u8 FREQR;     /*!< I2C frequency register */
  u8 OARL;      /*!< I2C own address register LSB */
  u8 OARH;      /*!< I2C own address register MSB */
  u8 RESERVED1; /*!< Reserved byte */
  u8 DR;        /*!< I2C data register */
  u8 SR1;       /*!< I2C status register 1 */
  u8 SR2;       /*!< I2C status register 2 */
  u8 SR3;       /*!< I2C status register 3 */
  u8 ITR;       /*!< I2C interrupt register */
  u8 CCRL;      /*!< I2C clock control register low */
  u8 CCRH;      /*!< I2C clock control register high */
  u8 TRISER;    /*!< I2C maximum rise time register */
  u8 RESERVED2; /*!< Reserved byte */
}
I2C_TypeDef;

/** @addtogroup I2C_Registers_Reset_Value
  * @{
  */

#define I2C_CR1_RESET_VALUE    ((u8)0x00)
#define I2C_CR2_RESET_VALUE    ((u8)0x00)
#define I2C_FREQR_RESET_VALUE  ((u8)0x00)
#define I2C_OARL_RESET_VALUE   ((u8)0x00)
#define I2C_OARH_RESET_VALUE   ((u8)0x00)
#define I2C_DR_RESET_VALUE     ((u8)0x00)
#define I2C_SR1_RESET_VALUE    ((u8)0x00)
#define I2C_SR2_RESET_VALUE    ((u8)0x00)
#define I2C_SR3_RESET_VALUE    ((u8)0x00)
#define I2C_ITR_RESET_VALUE    ((u8)0x00)
#define I2C_CCRL_RESET_VALUE   ((u8)0x00)
#define I2C_CCRH_RESET_VALUE   ((u8)0x00)
#define I2C_TRISER_RESET_VALUE ((u8)0x02)

/**
  * @}
  */

/** @addtogroup I2C_Registers_Bits_Definition
  * @{
  */

#define I2C_CR1_NOSTRETCH ((u8)0x80) /*!< Clock Stretching Disable (Slave mode) */
#define I2C_CR1_ENGC      ((u8)0x40) /*!< General Call Enable */
#define I2C_CR1_PE        ((u8)0x01) /*!< Peripheral Enable */

#define I2C_CR2_SWRST ((u8)0x80) /*!< Software Reset */
#define I2C_CR2_POS   ((u8)0x08) /*!< Acknowledge */
#define I2C_CR2_ACK   ((u8)0x04) /*!< Acknowledge Enable */
#define I2C_CR2_STOP  ((u8)0x02) /*!< Stop Generation */
#define I2C_CR2_START ((u8)0x01) /*!< Start Generation */

#define I2C_FREQR_FREQ ((u8)0x3F) /*!< Peripheral Clock Frequency */

#define I2C_OARL_ADD  ((u8)0xFE) /*!< Interface Address bits [7..1] */
#define I2C_OARL_ADD0 ((u8)0x01) /*!< Interface Address bit0 */

#define I2C_OARH_ADDMODE ((u8)0x80) /*!< Addressing Mode (Slave mode) */
#define I2C_OARH_ADDCONF ((u8)0x40) /*!< Address Mode Configuration */
#define I2C_OARH_ADD     ((u8)0x06) /*!< Interface Address bits [9..8] */

#define I2C_DR_DR ((u8)0xFF) /*!< Data Register */

#define I2C_SR1_TXE   ((u8)0x80) /*!< Data Register Empty (transmitters) */
#define I2C_SR1_RXNE  ((u8)0x40) /*!< Data Register not Empty (receivers) */
#define I2C_SR1_STOPF ((u8)0x10) /*!< Stop detection (Slave mode) */
#define I2C_SR1_ADD10 ((u8)0x08) /*!< 10-bit header sent (Master mode) */
#define I2C_SR1_BTF   ((u8)0x04) /*!< Byte Transfer Finished */
#define I2C_SR1_ADDR  ((u8)0x02) /*!< Address sent (master mode)/matched (slave mode) */
#define I2C_SR1_SB    ((u8)0x01) /*!< Start Bit (Master mode) */

#define I2C_SR2_WUFH    ((u8)0x20) /*!< Wake-up from Halt */
#define I2C_SR2_OVR     ((u8)0x08) /*!< Overrun/Underrun */
#define I2C_SR2_AF      ((u8)0x04) /*!< Acknowledge Failure */
#define I2C_SR2_ARLO    ((u8)0x02) /*!< Arbitration Lost (master mode) */
#define I2C_SR2_BERR    ((u8)0x01) /*!< Bus Error */

#define I2C_SR3_GENCALL ((u8)0x10) /*!< General Call Header (Slave mode) */
#define I2C_SR3_TRA     ((u8)0x04) /*!< Transmitter/Receiver */
#define I2C_SR3_BUSY    ((u8)0x02) /*!< Bus Busy */
#define I2C_SR3_MSL     ((u8)0x01) /*!< Master/Slave */

#define I2C_ITR_ITBUFEN ((u8)0x04) /*!< Buffer Interrupt Enable */
#define I2C_ITR_ITEVTEN ((u8)0x02) /*!< Event Interrupt Enable */
#define I2C_ITR_ITERREN ((u8)0x01) /*!< Error Interrupt Enable */

#define I2C_CCRL_CCR ((u8)0xFF) /*!< Clock Control Register (Master mode) */

#define I2C_CCRH_FS   ((u8)0x80) /*!< Master Mode Selection */
#define I2C_CCRH_DUTY ((u8)0x40) /*!< Fast Mode Duty Cycle */
#define I2C_CCRH_CCR  ((u8)0x0F) /*!< Clock Control Register in Fast/Standard mode (Master mode) bits [11..8] */

#define I2C_TRISER_TRISE ((u8)0x3F) /*!< Maximum Rise Time in Fast/Standard mode (Master mode) */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Interrupt Controller (ITC)
  */

typedef volatile struct ITC_struct
{
  u8 ISPR1; /*!< Interrupt Software Priority register 1 */
  u8 ISPR2; /*!< Interrupt Software Priority register 2 */
  u8 ISPR3; /*!< Interrupt Software Priority register 3 */
  u8 ISPR4; /*!< Interrupt Software Priority register 4 */
  u8 ISPR5; /*!< Interrupt Software Priority register 5 */
  u8 ISPR6; /*!< Interrupt Software Priority register 6 */
  u8 ISPR7; /*!< Interrupt Software Priority register 7 */
  u8 ISPR8; /*!< Interrupt Software Priority register 8 */  
}
ITC_TypeDef;

/** @addtogroup ITC_Registers_Reset_Value
  * @{
  */

#define ITC_SPRX_RESET_VALUE ((u8)0xFF) /*!< Reset value of Software Priority registers */

/**
  * @}
  */

/** @addtogroup CPU_Registers_Bits_Definition
  * @{
  */

#define CPU_CC_I1I0 ((u8)0x28) /*!< Condition Code register, I1 and I0 bits mask */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief External Interrupt Controller (EXTI)
  */

typedef volatile struct EXTI_struct
{
  u8 CR1; /*!< External Interrupt Control Register for PORTA to PORTD */
  u8 CR2; /*!< External Interrupt Control Register for PORTE and TLI */
}
EXTI_TypeDef;

/** @addtogroup EXTI_Registers_Reset_Value
  * @{
  */

#define EXTI_CR1_RESET_VALUE ((u8)0x00)
#define EXTI_CR2_RESET_VALUE ((u8)0x00)

/**
  * @}
  */

/** @addtogroup EXTI_Registers_Bits_Definition
  * @{
  */

#define EXTI_CR1_PDIS ((u8)0xC0) /*!< PORTD external interrupt sensitivity bits mask */
#define EXTI_CR1_PCIS ((u8)0x30) /*!< PORTC external interrupt sensitivity bits mask */
#define EXTI_CR1_PBIS ((u8)0x0C) /*!< PORTB external interrupt sensitivity bits mask */
#define EXTI_CR1_PAIS ((u8)0x03) /*!< PORTA external interrupt sensitivity bits mask */

#define EXTI_CR2_TLIS ((u8)0x04) /*!< Top level interrupt sensitivity bit mask */
#define EXTI_CR2_PEIS ((u8)0x03) /*!< PORTE external interrupt sensitivity bits mask */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief General Purpose I/Os (GPIO)
  */

typedef volatile struct GPIO_struct
{
  BYTE_TypeDef ODR; /*!< Output Data Register */
  BYTE_TypeDef IDR; /*!< Input Data Register */
  u8 DDR; /*!< Data Direction Register */
  u8 CR1; /*!< Configuration Register 1 */
  u8 CR2; /*!< Configuration Register 2 */
}
GPIO_TypeDef;

/** @addtogroup GPIO_Registers_Reset_Value
  * @{
  */

#define GPIO_ODR_RESET_VALUE ((u8)0x00)
#define GPIO_DDR_RESET_VALUE ((u8)0x00)
#define GPIO_CR1_RESET_VALUE ((u8)0x00)
#define GPIO_CR2_RESET_VALUE ((u8)0x00)

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief FLASH program and Data memory (FLASH)
  */

typedef volatile struct FLASH_struct
{
  u8 CR1;       /*!< Flash control register 1 */
  u8 CR2;       /*!< Flash control register 2 */
  u8 NCR2;      /*!< Flash complementary control register 2 */
  u8 FPR;       /*!< Flash protection register */
  u8 NFPR;      /*!< Flash complementary protection register */
  u8 IAPSR;     /*!< Flash in-application programming status register */
  u8 RESERVED1; /*!< Reserved byte */
  u8 RESERVED2; /*!< Reserved byte */
  u8 PUKR;      /*!< Flash program memory unprotection register */
  u8 RESERVED3; /*!< Reserved byte */
  u8 DUKR;      /*!< Data EEPROM unprotection register */
}
FLASH_TypeDef;

/** @addtogroup FLASH_Registers_Reset_Value
  * @{
  */

#define FLASH_CR1_RESET_VALUE   ((u8)0x00)
#define FLASH_CR2_RESET_VALUE   ((u8)0x00)
#define FLASH_NCR2_RESET_VALUE  ((u8)0xFF)
#define FLASH_IAPSR_RESET_VALUE ((u8)0x40)
#define FLASH_PUKR_RESET_VALUE  ((u8)0x00)
#define FLASH_DUKR_RESET_VALUE  ((u8)0x00)

/**
  * @}
  */

/** @addtogroup FLASH_Registers_Bits_Definition
  * @{
  */

#define FLASH_CR1_HALT  ((u8)0x08) /*!< Standby in Halt mode mask */
#define FLASH_CR1_AHALT ((u8)0x04) /*!< Standby in Active Halt mode mask */
#define FLASH_CR1_IE    ((u8)0x02) /*!< Flash Interrupt enable mask */
#define FLASH_CR1_FIX   ((u8)0x01) /*!< Fix programming time mask */

#define FLASH_CR2_OPT   ((u8)0x80) /*!< Select option byte mask */
#define FLASH_CR2_WPRG  ((u8)0x40) /*!< Word Programming mask */
#define FLASH_CR2_ERASE ((u8)0x20) /*!< Erase block mask */
#define FLASH_CR2_FPRG  ((u8)0x10) /*!< Fast programming mode mask */
#define FLASH_CR2_PRG   ((u8)0x01) /*!< Program block mask */

#define FLASH_NCR2_NOPT   ((u8)0x80) /*!< Select option byte mask */
#define FLASH_NCR2_NWPRG  ((u8)0x40) /*!< Word Programming mask */
#define FLASH_NCR2_NERASE ((u8)0x20) /*!< Erase block mask */
#define FLASH_NCR2_NFPRG  ((u8)0x10) /*!< Fast programming mode mask */
#define FLASH_NCR2_NPRG   ((u8)0x01) /*!< Program block mask */

#define FLASH_IAPSR_HVOFF     ((u8)0x40) /*!< End of high voltage flag mask */
#define FLASH_IAPSR_DUL       ((u8)0x08) /*!< Data EEPROM unlocked flag mask */
#define FLASH_IAPSR_EOP       ((u8)0x04) /*!< End of operation flag mask */
#define FLASH_IAPSR_PUL       ((u8)0x02) /*!< Flash Program memory unlocked flag mask */
#define FLASH_IAPSR_WR_PG_DIS ((u8)0x01) /*!< Write attempted to protected page mask */

#define FLASH_PUKR_PUK ((u8)0xFF) /*!< Flash Program memory unprotection mask */

#define FLASH_DUKR_DUK ((u8)0xFF) /*!< Data EEPROM unprotection mask */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Option Bytes (OPT)
  */
typedef volatile struct OPT_struct
{
  u8 OPT0;  /*!< Option byte 0: Read-out protection (not accessible in IAP mode) */
  u8 OPT1;  /*!< Option byte 1: User boot code */
  u8 NOPT1; /*!< Complementary Option byte 1 */
  u8 OPT2;  /*!< Option byte 2: Alternate function remapping */
  u8 NOPT2; /*!< Complementary Option byte 2 */
  u8 OPT3;  /*!< Option byte 3: Watchdog option */
  u8 NOPT3; /*!< Complementary Option byte 3 */
  u8 OPT4;  /*!< Option byte 4: Clock option */
  u8 NOPT4; /*!< Complementary Option byte 4 */
  u8 OPT5;  /*!< Option byte 5: HSE clock startup */
  u8 NOPT5; /*!< Complementary Option byte 5 */
  u8 OPT6;  /*!< Option byte 6: Reserved */
  u8 NOPT6; /*!< Complementary Option byte 6 */
  u8 OPT7;  /*!< Option byte 7: flash wait states */
  u8 NOPT7; /*!< Complementary Option byte 7 */
} OPT_TypeDef;

/*----------------------------------------------------------------------------*/
/**
  * @brief Independent Watchdog (IWDG)
  */

typedef volatile struct IWDG_struct
{
  u8 KR;  /*!< Key Register */
  u8 PR;  /*!< Prescaler Register */
  u8 RLR; /*!< Reload Register */
}
IWDG_TypeDef;

/** @addtogroup IWDG_Registers_Reset_Value
  * @{
  */

#define IWDG_PR_RESET_VALUE  ((u8)0x00)
#define IWDG_RLR_RESET_VALUE ((u8)0xFF)

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Window Watchdog (WWDG)
  */

typedef volatile struct WWDG_struct
{
  u8 CR; /*!< Control Register */
  u8 WR; /*!< Window Register */
}
WWDG_TypeDef;

/** @addtogroup WWDG_Registers_Reset_Value
  * @{
  */

#define WWDG_CR_RESET_VALUE ((u8)0x7F)
#define WWDG_WR_RESET_VALUE ((u8)0x7F)

/**
  * @}
  */

/** @addtogroup WWDG_Registers_Bits_Definition
  * @{
  */

#define WWDG_CR_WDGA ((u8)0x80) /*!< WDGA bit mask */
#define WWDG_CR_T6   ((u8)0x40) /*!< T6 bit mask */
#define WWDG_CR_T    ((u8)0x7F) /*!< T bits mask */

#define WWDG_WR_MSB  ((u8)0x80) /*!< MSB bit mask */
#define WWDG_WR_W    ((u8)0x7F) /*!< W bits mask */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Reset Controller (RST)
  */

typedef volatile struct RST_struct
{
  u8 SR; /*!< Reset status register */
}
RST_TypeDef;

/** @addtogroup RST_Registers_Bits_Definition
  * @{
  */

#define RST_SR_EMCF   ((u8)0x10) /*!< EMC reset flag bit mask */
#define RST_SR_SWIMF  ((u8)0x08) /*!< SWIM reset flag bit mask */
#define RST_SR_ILLOPF ((u8)0x04) /*!< Illegal opcode reset flag bit mask */
#define RST_SR_IWDGF  ((u8)0x02) /*!< IWDG reset flag bit mask */
#define RST_SR_WWDGF  ((u8)0x01) /*!< WWDG reset flag bit mask */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Serial Peripheral Interface (SPI)
  */

typedef volatile struct SPI_struct
{
  u8 CR1;    /*!< SPI control register 1 */
  u8 CR2;    /*!< SPI control register 2 */
  u8 ICR;    /*!< SPI interrupt control register */
  u8 SR;     /*!< SPI status register */
  u8 DR;     /*!< SPI data I/O register */
  u8 CRCPR;  /*!< SPI CRC polynomial register */
  u8 RXCRCR; /*!< SPI Rx CRC register */
  u8 TXCRCR; /*!< SPI Tx CRC register */
}
SPI_TypeDef;

/** @addtogroup SPI_Registers_Reset_Value
  * @{
  */

#define SPI_CR1_RESET_VALUE    ((u8)0x00) /*!< Control Register 1 reset value */
#define SPI_CR2_RESET_VALUE    ((u8)0x00) /*!< Control Register 2 reset value */
#define SPI_ICR_RESET_VALUE    ((u8)0x00) /*!< Interrupt Control Register reset value */
#define SPI_SR_RESET_VALUE     ((u8)0x02) /*!< Status Register reset value */
#define SPI_DR_RESET_VALUE     ((u8)0x00) /*!< Data Register reset value */
#define SPI_CRCPR_RESET_VALUE  ((u8)0x07) /*!< Polynomial Register reset value */
#define SPI_RXCRCR_RESET_VALUE ((u8)0x00) /*!< RX CRC Register reset value */
#define SPI_TXCRCR_RESET_VALUE ((u8)0x00) /*!< TX CRC Register reset value */

/**
  * @}
  */

/** @addtogroup SPI_Registers_Bits_Definition
  * @{
  */

#define SPI_CR1_LSBFIRST ((u8)0x80) /*!< Frame format mask */
#define SPI_CR1_SPE      ((u8)0x40) /*!< Enable bits mask */
#define SPI_CR1_BR       ((u8)0x38) /*!< Baud rate control mask */
#define SPI_CR1_MSTR     ((u8)0x04) /*!< Master Selection mask */
#define SPI_CR1_CPOL     ((u8)0x02) /*!< Clock Polarity mask */
#define SPI_CR1_CPHA     ((u8)0x01) /*!< Clock Phase mask */

#define SPI_CR2_BDM     ((u8)0x80) /*!< Bi-directional data mode enable mask */
#define SPI_CR2_BDOE    ((u8)0x40) /*!< Output enable in bi-directional mode mask */
#define SPI_CR2_CRCEN   ((u8)0x20) /*!< Hardware CRC calculation enable mask */
#define SPI_CR2_CRCNEXT ((u8)0x10) /*!< Transmit CRC next mask */
#define SPI_CR2_RXONLY  ((u8)0x04) /*!< Receive only mask */
#define SPI_CR2_SSM     ((u8)0x02) /*!< Software slave management mask */
#define SPI_CR2_SSI     ((u8)0x01) /*!< Internal slave select mask */

#define SPI_ICR_TXIE    ((u8)0x80) /*!< Tx buffer empty interrupt enable mask */
#define SPI_ICR_RXIE    ((u8)0x40) /*!< Rx buffer empty interrupt enable mask */
#define SPI_ICR_ERRIE   ((u8)0x20) /*!< Error interrupt enable mask */
#define SPI_ICR_WKIE    ((u8)0x10) /*!< Wake-up interrupt enable mask */

#define SPI_SR_BSY    ((u8)0x80) /*!< Busy flag */
#define SPI_SR_OVR    ((u8)0x40) /*!< Overrun flag */
#define SPI_SR_MODF   ((u8)0x20) /*!< Mode fault */
#define SPI_SR_CRCERR ((u8)0x10) /*!< CRC error flag */
#define SPI_SR_WKUP   ((u8)0x08) /*!< Wake-Up flag */
#define SPI_SR_TXE    ((u8)0x02) /*!< Transmit buffer empty */
#define SPI_SR_RXNE   ((u8)0x01) /*!< Receive buffer not empty */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief Single Wire Interface Module (SWIM)
  */
typedef volatile struct SWIM_struct
{
  u8 CSR; /*!< Control/Status register */
  u8 DR;  /*!< Data register */
}
SWIM_TypeDef;

/*----------------------------------------------------------------------------*/
/**
  * @brief Universal Synchronous Asynchronous Receiver Transmitter (USART)
  */

typedef volatile struct USART_struct
{
  u8 SR;   /*!< USART status register */
  u8 DR;   /*!< USART data register */
  u8 BRR1; /*!< USART baud rate register */
  u8 BRR2; /*!< USART DIV mantissa[11:8] SCIDIV fraction */
  u8 CR1;  /*!< USART control register 1 */
  u8 CR2;  /*!< USART control register 2 */
  u8 CR3;  /*!< USART control register 3 */
  u8 CR4;  /*!< USART control register 4 */
  u8 CR5;  /*!< USART control register 5 */
  u8 GTR;  /*!< USART guard time register */
  u8 PSCR; /*!< USART prescaler register */
}
USART_TypeDef;

/** @addtogroup USART_Registers_Reset_Value
  * @{
  */

#define USART_SR_RESET_VALUE   ((u8)0xC0)
#define USART_BRR1_RESET_VALUE ((u8)0x00)
#define USART_BRR2_RESET_VALUE ((u8)0x00)
#define USART_CR1_RESET_VALUE  ((u8)0x00)
#define USART_CR2_RESET_VALUE  ((u8)0x00)
#define USART_CR3_RESET_VALUE  ((u8)0x00)
#define USART_CR4_RESET_VALUE  ((u8)0x00)
#define USART_CR5_RESET_VALUE  ((u8)0x00)
#define USART_GTR_RESET_VALUE  ((u8)0x00)
#define USART_PSCR_RESET_VALUE ((u8)0x00)

/**
  * @}
  */

/** @addtogroup USART_Registers_Bits_Definition
  * @{
  */

#define USART_SR_TXE  ((u8)0x80) /*!< Transmit Data Register Empty mask */
#define USART_SR_TC   ((u8)0x40) /*!< Transmission Complete mask */
#define USART_SR_RXNE ((u8)0x20) /*!< Read Data Register Not Empty mask */
#define USART_SR_IDLE ((u8)0x10) /*!< IDLE line detected mask */
#define USART_SR_OR   ((u8)0x08) /*!< OverRun error mask */
#define USART_SR_NF   ((u8)0x04) /*!< Noise Flag mask */
#define USART_SR_FE   ((u8)0x02) /*!< Framing Error mask */
#define USART_SR_PE   ((u8)0x01) /*!< Parity Error mask */

#define USART_BRR1_DIVM ((u8)0xFF) /*!< LSB mantissa of USARTDIV [7:0] mask */

#define USART_BRR2_DIVM ((u8)0xF0) /*!< MSB mantissa of USARTDIV [11:8] mask */
#define USART_BRR2_DIVF ((u8)0x0F) /*!< Fraction bits of USARTDIV [3:0] mask */

#define USART_CR1_R8     ((u8)0x80) /*!< Receive Data bit 8 */
#define USART_CR1_T8     ((u8)0x40) /*!< Transmit data bit 8 */
#define USART_CR1_USARTD ((u8)0x20) /*!< USART Disable (for low power consumption) */
#define USART_CR1_M      ((u8)0x10) /*!< Word length mask */
#define USART_CR1_WAKE   ((u8)0x08) /*!< Wake-up method mask */
#define USART_CR1_PCEN   ((u8)0x04) /*!< Parity Control Enable mask */
#define USART_CR1_PS     ((u8)0x02) /*!< USART LINBreakLength mask */
#define USART_CR1_PIEN   ((u8)0x01) /*!< USART Parity Interrupt Enable mask */

#define USART_CR2_TIEN  ((u8)0x80) /*!< Transmitter Interrupt Enable mask */
#define USART_CR2_TCIEN ((u8)0x40) /*!< TransmissionComplete Interrupt Enable mask */
#define USART_CR2_RIEN  ((u8)0x20) /*!< Receiver Interrupt Enable mask */
#define USART_CR2_ILIEN ((u8)0x10) /*!< IDLE Line Interrupt Enable mask */
#define USART_CR2_TEN   ((u8)0x08) /*!< Transmitter Enable mask */
#define USART_CR2_REN   ((u8)0x04) /*!< Receiver Enable mask */
#define USART_CR2_RWU   ((u8)0x02) /*!< Receiver Wake-Up mask */
#define USART_CR2_SBK   ((u8)0x01) /*!< Send Break mask */

#define USART_CR3_LINEN ((u8)0x40) /*!< Alternate Function outpu mask */
#define USART_CR3_STOP  ((u8)0x30) /*!< STOP bits [1:0] mask */
#define USART_CR3_CLKEN ((u8)0x08) /*!< Clock Enable mask */
#define USART_CR3_CPOL  ((u8)0x04) /*!< Clock Polarity mask */
#define USART_CR3_CPHA  ((u8)0x02) /*!< Clock Phase mask */
#define USART_CR3_LBCL  ((u8)0x01) /*!< Last Bit Clock pulse mask */

#define USART_CR4_LBDIEN ((u8)0x40) /*!< LIN Break Detection Interrupt Enable mask */
#define USART_CR4_LBDL   ((u8)0x20) /*!< LIN Break Detection Length mask */
#define USART_CR4_LBDF   ((u8)0x10) /*!< LIN Break Detection Flag mask */
#define USART_CR4_ADD    ((u8)0x0F) /*!< Address of the USART node mask */

#define USART_CR5_SCEN  ((u8)0x20) /*!< Smart Card Enable mask */
#define USART_CR5_NACK  ((u8)0x10) /*!< Smart Card Nack Enable mask */
#define USART_CR5_HDSEL ((u8)0x08) /*!< Half-Duplex Selection mask */
#define USART_CR5_IRLP  ((u8)0x04) /*!< Irda Low Power Selection mask */
#define USART_CR5_IREN  ((u8)0x02) /*!< Irda Enable mask */

/**
  * @}
  */

/*----------------------------------------------------------------------------*/
/**
  * @brief LIN Universal Asynchronous Receiver Transmitter (LINUART)
  */

typedef volatile struct LINUART_struct
{
  u8 SR;       /*!< status register */
  u8 DR;       /*!< data register */
  u8 BRR1;     /*!< baud rate register */
  u8 BRR2;     /*!< DIV mantissa[11:8] SCIDIV fraction */
  u8 CR1;      /*!< control register 1 */
  u8 CR2;      /*!< control register 2 */
  u8 CR3;      /*!< control register 3 */
  u8 CR4;      /*!< control register 4 */
  u8 CR5;      /*!< control register 5 */
  u8 CR6;      /*!< control register 6 */
}
LINUART_TypeDef;

/** @addtogroup LINUART_Registers_Reset_Value
  * @{
  */

#define LINUART_SR_RESET_VALUE   ((u8)0xC0)
#define LINUART_BRR1_RESET_VALUE ((u8)0x00)
#define LINUART_BRR2_RESET_VALUE ((u8)0x00)
#define LINUART_CR1_RESET_VALUE  ((u8)0x00)
#define LINUART_CR2_RESET_VALUE  ((u8)0x00)
#define LINUART_CR3_RESET_VALUE  ((u8)0x00)
#define LINUART_CR4_RESET_VALUE  ((u8)0x00)
#define LINUART_CR5_RESET_VALUE  ((u8)0x00)

/**
  * @}
  */

/** @addtogroup LINUART_Registers_Bits_Definition
  * @{
  */

#define LINUART_SR_TXE  ((u8)0x80) /*!< Transmit Data Register Empty mask */
#define LINUART_SR_TC   ((u8)0x40) /*!< Transmission Complete mask */
#define LINUART_SR_RXNE ((u8)0x20) /*!< Read Data Register Not Empty mask */
#define LINUART_SR_IDLE ((u8)0x10) /*!< IDLE line detected mask */
#define LINUART_SR_OR   ((u8)0x08) /*!< OverRun error mask */
#define LINUART_SR_LHE  ((u8)0x08) /*!< LIN Header error mask */
#define LINUART_SR_NF   ((u8)0x04) /*!< Noise Flag mask */
#define LINUART_SR_FE   ((u8)0x02) /*!< Framing Error mask */
#define LINUART_SR_PE   ((u8)0x01) /*!< Parity Error mask */

#define LINUART_BRR1_DIVM ((u8)0xFF) /*!< LSB mantissa of LINUARTDIV [7:0] mask */

#define LINUART_BRR2_DIVM ((u8)0xF0) /*!< MSB mantissa of LINUARTDIV [11:8] mask */
#define LINUART_BRR2_DIVF ((u8)0x0F) /*!< Fraction bits of LINUARTDIV [3:0] mask */

#define LINUART_CR1_R8    ((u8)0x80) /*!< Receive Data bit 8 */
#define LINUART_CR1_T8    ((u8)0x40) /*!< Transmit data bit 8 */
#define LINUART_CR1_UARTD ((u8)0x20) /*!< UART Disable (for low power consumption) */
#define LINUART_CR1_M     ((u8)0x10) /*!< Word length mask */
#define LINUART_CR1_WAKE  ((u8)0x08) /*!< Wake-up method mask */
#define LINUART_CR1_PCEN  ((u8)0x04) /*!< Parity control enable mask */
#define LINUART_CR1_PS    ((u8)0x02) /*!< Parity selection bit mask */
#define LINUART_CR1_PIEN  ((u8)0x01) /*!< Parity interrupt enable bit mask */

#define LINUART_CR2_TIEN  ((u8)0x80) /*!< Transmitter Interrupt Enable mask */
#define LINUART_CR2_TCIEN ((u8)0x40) /*!< TransmissionComplete Interrupt Enable mask */
#define LINUART_CR2_RIEN  ((u8)0x20) /*!< Receiver Interrupt Enable mask */
#define LINUART_CR2_ILIEN ((u8)0x10) /*!< IDLE Line Interrupt Enable mask */
#define LINUART_CR2_TEN   ((u8)0x08) /*!< Transmitter Enable mask */
#define LINUART_CR2_REN   ((u8)0x04) /*!< Receiver Enable mask */
#define LINUART_CR2_RWU   ((u8)0x02) /*!< Receiver Wake-Up mask */
#define LINUART_CR2_SBK   ((u8)0x01) /*!< Send Break mask */

#define LINUART_CR3_LINEN ((u8)0x40) /*!< Alternate Function outpu mask */
#define LINUART_CR3_STOP  ((u8)0x30) /*!< STOP bits [1:0] mask */

#define LINUART_CR4_LBDIEN ((u8)0x40) /*!< LIN Break Detection Interrupt Enable mask */
#define LINUART_CR4_LBDL   ((u8)0x20) /*!< LIN Break Detection Length mask */
#define LINUART_CR4_LBDF   ((u8)0x10) /*!< LIN Break Detection Flag mask */
#define LINUART_CR4_ADD    ((u8)0x0F) /*!< Address of the LINUART node mask */

#define LINUART_CR6_LDUM   ((u8)0x80) /*!< LIN Divider Update Method */
#define LINUART_CR6_LSLV   ((u8)0x20) /*!< LIN Slave Enable */
#define LINUART_CR6_LASE   ((u8)0x10) /*!< LIN Autosynchronization Enable */
#define LINUART_CR6_LHDIEN ((u8)0x04) /*!< LIN Header Detection Interrupt Enable */
#define LINUART_CR6_LHDF   ((u8)0x02) /*!< LIN Header Detection Flag */
#define LINUART_CR6_LSF    ((u8)0x01) /*!< LIN Synch Field */

#define LINUART_CR5_SCEN   ((u8)0x20)
#define LINUART_CR5_NACK   ((u8)0x10)
#define LINUART_CR5_HDSEL  ((u8)0x08)
#define LINUART_CR5_IRLP   ((u8)0x04)
#define LINUART_CR5_IREN   ((u8)0x02)

/**
  * @}
  */
  
/*----------------------------------------------------------------------------*/
/**
  * @brief CAN Control Area Network
  */
typedef volatile struct CAN_struct
{
  u8 MCR;       /*!< main control register */
  u8 MSR;       /*!< main status register */
  u8 TSR;       /*!< transmit status register */
  u8 TPR;       /*!< transmit polarity register */
  u8 RFR;       /*!< receive FIFO register */
  u8 IER;       /*!< interrupt enable register */
  u8 DGR;       /*!< diagnose register */
  u8 PSR;       /*!< page select register 4 */
  u8 PR0;       /*!< page register 0 */
  u8 PR1;       /*!< page register 1 */
  u8 PR2;       /*!< page register 2 */
  u8 PR3;       /*!< page register 3 */
  u8 PR4;       /*!< page register 4 */
  u8 PR5;       /*!< page register 5 */
  u8 PR6;       /*!< page register 6 */
  u8 PR7;       /*!< page register 7 */
  u8 PR8;       /*!< page register 8 */
  u8 PR9;       /*!< page register 9 */
  u8 PR10;      /*!< page register 10 */
  u8 PR11;      /*!< page register 11 */
  u8 PR12;      /*!< page register 12 */
  u8 PR13;      /*!< page register 13 */
  u8 PR14;      /*!< page register 14 */
  u8 PR15;      /*!< page register 15 */
}
CAN_TypeDef;

/*****        CAN_Registers_Bits_Reset_Value        *****/

#define CAN_PAGE_BTR1_SJW_RESET_VALUE ((u8)3)
#define CAN_PAGE_BTR1_BRP_RESET_VALUE ((u8)30) //bondrate==33.33kHz
#define CAN_PAGE_BTR2_BS2_RESET_VALUE ((u8)3)
#define CAN_PAGE_BTR2_BS1_RESET_VALUE ((u8)4)


/*****        CAN_Registers_Bits_Definition        *****/

#define CAN_MCR_INRQ    ((u8)0x01)
#define CAN_MCR_SLEEP   ((u8)0x02)
#define CAN_MCR_TXFP    ((u8)0x04)
#define CAN_MCR_RFLM    ((u8)0x08)
#define CAN_MCR_NART    ((u8)0x10)
#define CAN_MCR_AWUM    ((u8)0x20)
#define CAN_MCR_ABOM    ((u8)0x40)
#define CAN_MCR_TTCM    ((u8)0x80)

#define CAN_MSR_INAK    ((u8)0x01)
#define CAN_MSR_SLAK    ((u8)0x02)
#define CAN_MSR_ERRI    ((u8)0x04)
#define CAN_MSR_WKUI    ((u8)0x08)
#define CAN_MSR_TX      ((u8)0x10)
#define CAN_MSR_RX      ((u8)0x20)

#define CAN_TSR_RQCP0   ((u8)0x01)
#define CAN_TSR_RQCP1   ((u8)0x02)
#define CAN_TSR_RQCP2   ((u8)0x04)
#define CAN_TSR_TXOK0   ((u8)0x10)
#define CAN_TSR_TXOK1   ((u8)0x20)
#define CAN_TSR_TXOK2   ((u8)0x40)

#define CAN_TPR_CODE    ((u8)0x03)
#define CAN_TPR_TME0    ((u8)0x04)
#define CAN_TPR_TME1    ((u8)0x08)
#define CAN_TPR_TME2    ((u8)0x10)
#define CAN_TPR_LOW0    ((u8)0x20)
#define CAN_TPR_LOW1    ((u8)0x40)
#define CAN_TPR_LOW2    ((u8)0x80)

#define CAN_RFR_FMP     ((u8)0x03)
#define CAN_RFR_FULL    ((u8)0x08)
#define CAN_RFR_FOVR    ((u8)0x10)
#define CAN_RFR_RFOM    ((u8)0x20)

#define CAN_IER_TMEIE   ((u8)0x01)
#define CAN_IER_FMPIE   ((u8)0x02)
#define CAN_IER_FFIE    ((u8)0x04)
#define CAN_IER_FOVIE   ((u8)0x08)
#define CAN_IER_WKUIE   ((u8)0x80)

#define CAN_DGR_LBKM    ((u8)0x01)
#define CAN_DGR_SILM    ((u8)0x02)
#define CAN_DGR_SAMP    ((u8)0x04)
#define CAN_DGR_RX      ((u8)0x08)
#define CAN_DGR_TXM2E   ((u8)0x10)

#define CAN_PSR_PS      ((u8)0x07)

#define CAN_PAGE_MCSR_ABRQ   ((u8)0x02)
#define CAN_PAGE_MCSR_TXRQ   ((u8)0x01)

#define CAN_PAGE_BTR1_SJW  ((u8)0xc0)
#define CAN_PAGE_BTR1_BRP  ((u8)0x3f)
#define CAN_PAGE_BTR2_CLKS ((u8)0x80)
#define CAN_PAGE_BTR2_BS2  ((u8)0x70)
#define CAN_PAGE_BTR2_BS1  ((u8)0x0f)

#define CAN_PAGE_ESR_LEC   ((u8)0x70)

#define CAN_PAGE_EIER_EWGIE  ((u8)0x01)
#define CAN_PAGE_EIER_EPVIE  ((u8)0x02)
#define CAN_PAGE_EIER_BOFIE  ((u8)0x04)
#define CAN_PAGE_EIER_LECIE  ((u8)0x10)
#define CAN_PAGE_EIER_ERRIE  ((u8)0x80)

#define CAN_ID_EXT      ((u8)0x40)

/*****        CAN_Page_Registers_Definition        *****/

// Tx MailBox
#define CAN_PAGE_MCSR    CAN.PR0
#define CAN_PAGE_MDLCR   CAN.PR1
#define CAN_PAGE_MIDR1   CAN.PR2
#define CAN_PAGE_MIDR2   CAN.PR3
#define CAN_PAGE_MIDR3   CAN.PR4
#define CAN_PAGE_MIDR4   CAN.PR5
#define CAN_PAGE_MDAR1   CAN.PR6
#define CAN_PAGE_MDAR2   CAN.PR7
#define CAN_PAGE_MDAR3   CAN.PR8
#define CAN_PAGE_MDAR4   CAN.PR9
#define CAN_PAGE_MDAR5   CAN.PR10
#define CAN_PAGE_MDAR6   CAN.PR11
#define CAN_PAGE_MDAR7   CAN.PR12
#define CAN_PAGE_MDAR8   CAN.PR13
#define CAN_PAGE_MTSRL   CAN.PR14
#define CAN_PAGE_MTSRH   CAN.PR15
// Acceptance Filter
#define CAN_PAGE_FLR1   CAN.PR0
#define CAN_PAGE_FLR2   CAN.PR1
#define CAN_PAGE_FLR3   CAN.PR2
#define CAN_PAGE_FLR4   CAN.PR3
#define CAN_PAGE_FLR5   CAN.PR4
#define CAN_PAGE_FLR6   CAN.PR5
#define CAN_PAGE_FLR7   CAN.PR6
#define CAN_PAGE_FLR8   CAN.PR7
#define CAN_PAGE_FHR1   CAN.PR8
#define CAN_PAGE_FHR2   CAN.PR9
#define CAN_PAGE_FHR3   CAN.PR10
#define CAN_PAGE_FHR4   CAN.PR11
#define CAN_PAGE_FHR5   CAN.PR12
#define CAN_PAGE_FHR6   CAN.PR13
#define CAN_PAGE_FHR7   CAN.PR14
#define CAN_PAGE_FHR8   CAN.PR15
// Control Diagnostic
#define CAN_PAGE_ESR    CAN.PR0
#define CAN_PAGE_EIER   CAN.PR1
#define CAN_PAGE_TECR   CAN.PR2
#define CAN_PAGE_RECR   CAN.PR3
#define CAN_PAGE_BTR1   CAN.PR4
#define CAN_PAGE_BTR2   CAN.PR5
#define CAN_PAGE_FMR1   CAN.PR8
#define CAN_PAGE_FMR2   CAN.PR9
#define CAN_PAGE_FCR1   CAN.PR10
#define CAN_PAGE_FCR2   CAN.PR11
#define CAN_PAGE_FCR3   CAN.PR12
//Receive FIFO
#define CAN_PAGE_MFMIR   CAN.PR0
/* 以下寄存器,Receive FIFO与Tx MailBox相同,不再重复定义
#define CAN_PAGE_MDLCR   CAN.PR1
#define CAN_PAGE_MIDR1   CAN.PR2
#define CAN_PAGE_MIDR2   CAN.PR3
#define CAN_PAGE_MIDR3   CAN.PR4
#define CAN_PAGE_MIDR4   CAN.PR5
#define CAN_PAGE_MDAR1   CAN.PR6
#define CAN_PAGE_MDAR2   CAN.PR7
#define CAN_PAGE_MDAR3   CAN.PR8
#define CAN_PAGE_MDAR4   CAN.PR9
#define CAN_PAGE_MDAR5   CAN.PR10
#define CAN_PAGE_MDAR6   CAN.PR11
#define CAN_PAGE_MDAR7   CAN.PR12
#define CAN_PAGE_MDAR8   CAN.PR13
#define CAN_PAGE_MTSRL   CAN.PR14
#define CAN_PAGE_MTSRH   CAN.PR15
*/
#define CAN_PS_TXMB0       ((u8)0) /* CAN TX mailbox 0 reg page selected */
#define CAN_PS_TXMB1       ((u8)1) /* CAN TX mailbox 1 reg page selected */
#define CAN_PS_FILTER01    ((u8)2) /* CAN Filters 0 & 1 reg page selected */
#define CAN_PS_FILTER23    ((u8)3) /* CAN Filters 2 & 3 reg page selected */
#define CAN_PS_FILTER45    ((u8)4) /* CAN Filters 4 & 5 reg page selected */
#define CAN_PS_TXMB2       ((u8)5) /* CAN TX mailbox 2 reg page selected */
#define CAN_PS_CTRL        ((u8)6) /* CAN control/status reg page selected */
#define CAN_PS_FIFO        ((u8)7) /* CAN FIFO registers page selected */


/*----------------------------------------------------------------------------*/
/**
  * @brief Configuration Registers (CFG)
  */

typedef volatile struct CFG_struct
{
  u8 GCR; /*!< Global Configuration register */
}
CFG_TypeDef;

/** @addtogroup CFG_Registers_Reset_Value
  * @{
  */

#define CFG_GCR_RESET_VALUE ((u8)0x00)

/**
  * @}
  */

/** @addtogroup CFG_Registers_Bits_Definition
  * @{
  */

#define CFG_GCR_SWD ((u8)0x01) /*!< Swim disable bit mask */
#define CFG_GCR_AL  ((u8)0x02) /*!< Activation Level bit mask */

/**
  * @}
  */
typedef volatile struct DM_struct
{
  u8 DBR0;
  u8 DBR1;
  u8 DBR2;
  u8 DBR3;
  u8 DBR4;
  u8 DBR5;
  u8 DBR6;
  u8 DBR7;
  u8 DBR8;
  u8 DBR9;
  u8 DBRA;
}
DM_TypeDef;
/**
  * @}
  */

/******************************************************************************/
/*                          Peripherals Base Address                          */
/******************************************************************************/

/** @addtogroup MAP_FILE_Base_Addresses
  * @{
  */

#define GPIOA_BaseAddress       0x5000
#define GPIOB_BaseAddress       0x5005
#define GPIOC_BaseAddress       0x500A
#define GPIOD_BaseAddress       0x500F
#define GPIOE_BaseAddress       0x5014
#define GPIOF_BaseAddress       0x5019
#define GPIOG_BaseAddress       0x501E
#define GPIOH_BaseAddress       0x5023
#define GPIOI_BaseAddress       0x5028

#define FLASH_BaseAddress       0x505A
#define OPT_BaseAddress         0x5067
#define EXTI_BaseAddress        0x50A0
#define RST_BaseAddress         0x50B3
#define CLK_BaseAddress         0x50C0
#define WWDG_BaseAddress        0x50D1
#define IWDG_BaseAddress        0x50E0
#define AWU_BaseAddress         0x50F0
#define BEEP_BaseAddress        0x50F3
#define SPI_BaseAddress         0x5200
#define I2C_BaseAddress         0x5210
#define USART_BaseAddress       0x5230
#define LINUART_BaseAddress     0x5240
#define TIM1_BaseAddress        0x5250
#define TIM2_BaseAddress        0x5300
#define TIM3_BaseAddress        0x5320
#define TIM4_BaseAddress        0x5340
#define ADC_BaseAddress         0x5400
#define CAN_BaseAddress         0x5420

#define CFG_BaseAddress         0x7F60
#define ITC_BaseAddress         0x7F70
#define SWIM_BaseAddress        0x7F80
#define DM_BaseAddress          0x7F90

/**
  * @}
  */

/******************************************************************************/
/*                          Peripherals declarations                          */
/******************************************************************************/
#if 0 //将外设寄存器定义为指针
#define GPIOA ((GPIO_TypeDef *) GPIOA_BaseAddress)
#define GPIOB ((GPIO_TypeDef *) GPIOB_BaseAddress)
#define GPIOC ((GPIO_TypeDef *) GPIOC_BaseAddress)
#define GPIOD ((GPIO_TypeDef *) GPIOD_BaseAddress)
#define GPIOE ((GPIO_TypeDef *) GPIOE_BaseAddress)
#define GPIOF ((GPIO_TypeDef *) GPIOF_BaseAddress)
#define GPIOG ((GPIO_TypeDef *) GPIOG_BaseAddress)
#define GPIOH ((GPIO_TypeDef *) GPIOH_BaseAddress)
#define GPIOI ((GPIO_TypeDef *) GPIOI_BaseAddress)
#define FLASH ((FLASH_TypeDef *) FLASH_BaseAddress)
#define OPT ((OPT_TypeDef *) OPT_BaseAddress)
#define EXTI ((EXTI_TypeDef *) EXTI_BaseAddress)
#define RST ((RST_TypeDef *) RST_BaseAddress)
#define CLK ((CLK_TypeDef *) CLK_BaseAddress)
#define WWDG ((WWDG_TypeDef *) WWDG_BaseAddress)
#define IWDG ((IWDG_TypeDef *) IWDG_BaseAddress)
#define AWU ((AWU_TypeDef *) AWU_BaseAddress)
#define BEEP ((BEEP_TypeDef *) BEEP_BaseAddress)
#define SPI ((SPI_TypeDef *) SPI_BaseAddress)
#define I2C ((I2C_TypeDef *) I2C_BaseAddress)
#define USART ((USART_TypeDef *) USART_BaseAddress)
#define LINUART ((LINUART_TypeDef *) LINUART_BaseAddress)
#define TIM1 ((TIM1_TypeDef *) TIM1_BaseAddress)
#define TIM2 ((TIM2_TypeDef *) TIM2_BaseAddress)
#define TIM3 ((TIM3_TypeDef *) TIM3_BaseAddress)
#define TIM4 ((TIM4_TypeDef *) TIM4_BaseAddress)
#define ADC ((ADC_TypeDef *) ADC_BaseAddress)
#define ITC ((ITC_TypeDef *) ITC_BaseAddress)
#define CFG ((CFG_TypeDef *) CFG_BaseAddress)
#define SWIM ((SWIM_TypeDef *) SWIM_BaseAddress)
#define DM ((DM_TypeDef *) DM_BaseAddress)
#else //将外设寄存器定义为指定地址变量
GPIO_TypeDef    GPIOA @(GPIOA_BaseAddress);
GPIO_TypeDef    GPIOB @(GPIOB_BaseAddress);
GPIO_TypeDef    GPIOC @(GPIOC_BaseAddress);
GPIO_TypeDef    GPIOD @(GPIOD_BaseAddress);
GPIO_TypeDef    GPIOE @(GPIOE_BaseAddress);
GPIO_TypeDef    GPIOF @(GPIOF_BaseAddress);
GPIO_TypeDef    GPIOG @(GPIOG_BaseAddress);
GPIO_TypeDef    GPIOH @(GPIOH_BaseAddress);
GPIO_TypeDef    GPIOI @(GPIOI_BaseAddress);
FLASH_TypeDef   FLASH @(FLASH_BaseAddress);
OPT_TypeDef     OPT 	@(OPT_BaseAddress);
EXTI_TypeDef    EXTI 	@(EXTI_BaseAddress);
RST_TypeDef     RST 	@(RST_BaseAddress);
CLK_TypeDef     CLK 	@(CLK_BaseAddress);
WWDG_TypeDef    WWDG 	@(WWDG_BaseAddress);
IWDG_TypeDef    IWDG 	@(IWDG_BaseAddress);
AWU_TypeDef     AWU 	@(AWU_BaseAddress);
BEEP_TypeDef    BEEP 	@(BEEP_BaseAddress);
SPI_TypeDef     SPI 	@(SPI_BaseAddress);
I2C_TypeDef     I2C 	@(I2C_BaseAddress);
USART_TypeDef   USART @(USART_BaseAddress);
LINUART_TypeDef LINUART @(LINUART_BaseAddress);
TIM1_TypeDef    TIM1 	@(TIM1_BaseAddress);
TIM2_TypeDef    TIM2 	@(TIM2_BaseAddress);
TIM3_TypeDef    TIM3 	@(TIM3_BaseAddress);
TIM4_TypeDef    TIM4 	@(TIM4_BaseAddress);
ADC_TypeDef     ADC 	@(ADC_BaseAddress);
CAN_TypeDef     CAN @(CAN_BaseAddress);
ITC_TypeDef     ITC 	@(ITC_BaseAddress);
CFG_TypeDef     CFG 	@(CFG_BaseAddress);
SWIM_TypeDef    SWIM 	@(SWIM_BaseAddress);
DM_TypeDef      DM 	@(DM_BaseAddress);
#endif /* Peripherals declarations */

#endif /* __STM8_MAP_H */

/******************* (C) COPYRIGHT 2007 STMicroelectronics *****END OF FILE****/
