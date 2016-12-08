#include "SPI.h"
#include "htc.h"

void main(void){
unsigned char env[10]={52,100,0,0,200,0,33,0,0,15};
unsigned char recp[10]={0,0,0,0,0,0,0,0,0,0};
unsigned char idx = 0,tam=10, val=0;
initSPI();
while(1) {
val = readStatus();
escreveByteEEPROM(&env[0],tam,0x30);
delay(); //ESPERA ALGUM TEMPO
lerByteEEPROM(&recp[0],tam,0x30);
//idx ++;
} // end while
}