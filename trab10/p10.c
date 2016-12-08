#include "SPI.h"
#include "Rs232.h"
//#include "Timer1.h"
#include <htc.h>

void interrupt RSI(void){

 if(RCIF==1){
RCIF=0;
}
}

void main(void){
TRISB0=0;
RB0=0;
//initSPI();
//TIMER1ON();
Rs232Conf(9600, 4);

SPI_Config();


unsigned char a[2]={0,0};
float temperatura=0.0;
unsigned int i=0;
char env[7]={0,0,0,0,0,0,' '};

while(1){
RB4=1;
//esperanmseg(30);
for(i=0;i<30000;i++){}

RB4=0;

SSPBUF=0x00;
while(BF==0);
a[0]=SSPBUF;

SSPBUF=0x00;
while(BF==0);
a[1]=SSPBUF;

i=a[0];
i=i<<8;
i=i+a[1];

temperatura =convert_temp(i);

if(temperatura<0.0){
env[0]='-';
temperatura=-temperatura;
}
else{
env[0]=' ';
}

if(temperatura>=100.0){
env[1]=((unsigned char)(temperatura/100.0))+48;
env[2]=((unsigned char)(temperatura/10.0))-(unsigned char)((float)(env[1]-48)*10.0)+48;
}
else{
env[2]=(unsigned char)(temperatura/10.0)+48;
}
env[3]=(unsigned char)(temperatura)-((unsigned char)((temperatura/10.0))*10)+48;
env[4]='.';
env[5]=(unsigned char)((temperatura-(float)((unsigned char)(temperatura)))*10.0)+48;

RS232Tx(&env[0], 7);
}

}