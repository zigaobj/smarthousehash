/*#define GPIO_A 	0
#define GPIO_B 	1
#define GPIO_C 	2
#define GPIO_D 	3
#define GPIO_E 	4
#define GPIO_F 	5
#define GPIO_G 	6
#define GPIO_H 	7
#define GPIO_I 	8
*/
/********          I/O定义                      *********/
/******          GPIO_A               *****/

/******          GPIO_B               *****/

/******          GPIO_C               *****/
#define LED     GPIOC.ODR.byte
#define LED_1   GPIOC.ODR.field.bit1
#define LED_2   GPIOC.ODR.field.bit2
#define LED_3   GPIOC.ODR.field.bit3
#define LED_4   GPIOC.ODR.field.bit4
#define LED_5   GPIOC.ODR.field.bit5
#define LED_6   GPIOC.ODR.field.bit6
#define LED_7   GPIOC.ODR.field.bit7

/******          GPIO_D               *****/
#define BEEP_PWM    GPIOD.ODR.field.bit4

/******          GPIO_E               *****/
#define CAN_EN    GPIOE.ODR.field.bit3

/******          GPIO_F               *****/
#define	LIN_NSLP	    GPIOF.ODR.field.bit3
#define PARKING_LEVEL   GPIOF.ODR.field.bit6
#define REVERSE_LEVEL   GPIOF.ODR.field.bit7

#define LinBusNormal()  {LIN_NSLP=1;} //设置TJA1020为normal状态
#define LinBusSleep()   {LIN_NSLP=0;} //设置TJA1020为sleep状态

/******          GPIO_G               *****/

/******          GPIO_H               *****/
#define ACC_CTRL        GPIOH.ODR.field.bit2
#define ILLUMI_LEVEL    GPIOH.ODR.field.bit3

/******          GPIO_I               *****/


#define SetPin(Pin) Pin=1;//SetBit(*((volatile char *)(&(GPIOA.ODR.byte)+(Pin/8)*5)),(Pin%8))
#define ClrPin(Pin) Pin=0;//ClrBit(*((volatile char *)(&(GPIOA.ODR.byte)+(Pin/8)*5)),(Pin%8))

void GPIOInit(void);

