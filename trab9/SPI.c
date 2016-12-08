#include <htc.h>

//DEFINICAO DOS VALORES PARA I/O
#define INPUT 1
#define OUTPUT 0
//DEFINICAO DOS ESTADOS DO PINO DE SELECCAO DA EEPROM
#define DESACTIVA_CHIP 1 //VALOR 1 CORRESPONDE A DESACTIVACAO DA EEPROM
#define ACTIVA_CHIP 0 //VALOR 0 CORRESPONDE A ACTIVACAO DA EEPROM
//ATRIBUICAO DE NOMES AOS PINOS E REGISTOS A SEREM UTILIZADOS
#define SPI_CS RB4
#define SPI_CS_TRIS TRISB4
#define SDI_TRIS TRISC4
#define SDO_TRIS TRISC5
#define SCK_TRIS TRISC3
/*
void SPI_Config(void){
// Neste exemplo as interrupções ficam desligadas GIE=0, PEIE=0,SSPIE=0
TRISC3=0; //Configura o pino de RC3/CLK como Output
TRISC4=1; // Configura o pino RC4/SDI como Input ( SDI automatically controlled by SPI module, but..).
TRISC5=0; // Configura o pino RC5/SDO como Output
TRISB4=0; // RB4 controla o pino CS do slave, RB4passa a output
SSPEN=0; // Activa porta série SPI
SSPM0=0; // SSPM0:3 = 0000 O uC actua como Master SPI com Clock= Fosc/4
SSPM1=0;
SSPM2=0;
SSPM3=0;
CKP=0; // ClocK Polarity - Quando não há transmissão de dados a linha de CLK tem 0 volt
CKE=1; // Clock Edge – o Bit é transmitido quando a linha de CLK volta à tensão de inactividade
SMP=0; // Bit reception, sample time at middle of bit time
SSPEN=1; // enable Serial Port, SDO, SDI,CLK,SS
RB4=1; //cs=1;
}

void escreveByteEEPROM(unsigned char valor, unsigned int posicao)
{
unsigned char lixo; //DEFINICAO VARIAVEL PARA LIMPAR O BUFFER SPI
//SPI_CS = ACTIVA_CHIP; //ACTIVA EEPROM
SSPBUF = 0x06; //ENVIA O VALOR 6 PARA EEPROM (PERMISSAO DE ESCRITA)
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
//SPI_CS = DESACTIVA_CHIP; //DESACTIVA EEPROMM
//SPI_CS = ACTIVA_CHIP; //ACTIVA EEPROM
SSPBUF = 0x02; //ENVIO INSTRUCAO DE ESCRITA -> 0x02
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
SSPBUF = posicao>>8; //ENVIO BYTE MAIS SIGNIFICATIVO DA POSICAO DE MEMORIA
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
SSPBUF = posicao&0xFF; //ENVIO BYTE MENOS SIGNIFICATIVO DA POSICAO DE MEMORIA
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
SSPBUF = valor; //ENVIO BYTE A SER ESCRITO NA MEMORIA
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
//SPI_CS = DESACTIVA_CHIP; //DESACTIVA EEPROM
}

unsigned char lerByteEEPROM(unsigned int posicao)
{
unsigned char byte;
unsigned char lixo;

SSPBUF = 0x03; //ENVIO INSTRUCAO DE LEITURA -> 0x03
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
SSPBUF = posicao>>8; //ENVIO BYTE MAIS SIGNIFICATIVO DA POSICAO DE MEMORIA
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
SSPBUF = posicao&0xFF; //ENVIO BYTE MENOS SIGNIFICATIVO DA POSICAO DE MEMORIA
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
SSPBUF = 0x00;
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
byte = SSPBUF; //LE VALOR DO BUFFER SPI

return byte;
}
*/


/*/////////////////////////////////////////////////////////////////////
FUNCAO readStatus()
ESTA FUNCAO LE O REGISTO STATUS DA EEPROM
////////////////////////////////////////////////////////////////////*/
unsigned char readStatus(void)
{
unsigned char lixo;
unsigned char status;
SPI_CS = ACTIVA_CHIP; //ACTIVA EEPROM

SSPBUF = 0x05; //ENVIO INSTRUCAO DE LEITURA STATUS -> 0x05
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
SSPBUF = 0x00;
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
status = SSPBUF;
SPI_CS = DESACTIVA_CHIP; //DESACTIVA EEPROM
return status;
}


/*/////////////////////////////////////////////////////////////////////
FUNCAO enableWrite()
ESTA FUNCAO ACTIVA A ESCRITA NA EEPROM
////////////////////////////////////////////////////////////////////*/
void enableWrite(void){
unsigned char lixo; //DEFINICAO VARIAVEL PARA LIMPAR O BUFFER SPI
SPI_CS = ACTIVA_CHIP; //ACTIVA EEPROM
SSPBUF = 0x06; //ENVIA O VALOR 6 PARA EEPROM (PERMISSAO DE ESCRITA)
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
SPI_CS = DESACTIVA_CHIP; //DESACTIVA EEPROM
}

/*/////////////////////////////////////////////////////////////////////
FUNCAO escreveByteEEPROM()
ESTA FUNCAO ESCREVE UM BYTE NUMA POSICAO DE MEMORIA
INPUTS:
- valor -> byte a ser escrito na memÛria
- posicao -> posicao de memoria
////////////////////////////////////////////////////////////////////*/
void escreveByteEEPROM(unsigned char* valor, unsigned char len,unsigned char posicao)
{
unsigned char lixo; //DEFINICAO VARIAVEL PARA LIMPAR O BUFFER SPI
for(unsigned char i=0;i++;i<len){
SPI_CS = ACTIVA_CHIP; //ACTIVA EEPROM
SSPBUF = 0x06; //ENVIA O VALOR 6 PARA EEPROM (PERMISSAO DE ESCRITA)
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
SPI_CS = DESACTIVA_CHIP; //DESACTIVA EEPROMM
SPI_CS = ACTIVA_CHIP; //ACTIVA EEPROM
SSPBUF = 0x02; //ENVIO INSTRUCAO DE ESCRITA -> 0x02
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
SSPBUF = (posicao+i)>>8; //ENVIO BYTE MAIS SIGNIFICATIVO DA POSICAO DE MEMORIA
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
SSPBUF = (posicao+i)&0xFF; //ENVIO BYTE MENOS SIGNIFICATIVO DA POSICAO DE MEMORIA
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
SSPBUF = *(valor+i); //ENVIO BYTE A SER ESCRITO NA MEMORIA
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
SPI_CS = DESACTIVA_CHIP; //DESACTIVA EEPROM
}
}

/*/////////////////////////////////////////////////////////////////////
FUNCAO lerByteEEPROM()
ESTA FUNCAO LE UM BYTE NUMA POSICAO DE MEMORIA
INPUTS:
- posicao -> posicao de memoria
OUTPUTS:
- byte -> valor lido
////////////////////////////////////////////////////////////////////*/
void lerByteEEPROM(unsigned char* destino,unsigned char len, unsigned char posicao)
{
unsigned char byte;
unsigned char lixo;

for(unsigned char i=0;i++;i<len){
SPI_CS = ACTIVA_CHIP; //ACTIVA EEPROM
SSPBUF = 0x03; //ENVIO INSTRUCAO DE LEITURA -> 0x03
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
SSPBUF = (posicao+i)>>8; //ENVIO BYTE MAIS SIGNIFICATIVO DA POSICAO DE MEMORIA
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
SSPBUF = (posicao+i)&0xFF; //ENVIO BYTE MENOS SIGNIFICATIVO DA POSICAO DE MEMORIA
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
lixo = SSPBUF; //LIMPA O BUFFER
SSPBUF = 0x00;
while(BF==0); //ESPERA CONCLUSAO DO ENVIO
*(destino+i) = SSPBUF; //LE VALOR DO BUFFER SPI
SPI_CS = DESACTIVA_CHIP; //DESACTIVA EEPROM
}
}

/*/////////////////////////////////////////////////////////////////////
FUNCAO initSPI()
ESTA FUNCAO CONFIGURA O MODULO MSSP PARA O FUNCINAMENTO
EM MODO MASTER SPI
////////////////////////////////////////////////////////////////////*/
void initSPI(void)
{
SDI_TRIS = INPUT; //SDI COMO INPUT
SDO_TRIS = OUTPUT; //SDO COMO OUTPUT
SCK_TRIS = OUTPUT; //SCK COMO OUTPUT
SPI_CS_TRIS = OUTPUT; //SPI_CS COMO OUTPUT
SPI_CS = 1;
//SSPSTAT
SMP = 0; //Input data sampled at end of data output time
CKE = 1; //SPI Clock Edge Select: Data transmitted on falling edge of SCK
//BF = 1;
//SSPCON
SSPEN = 1; //Enables serial port and configures SCK, SDO, SDI, and SS as the source of the serial port pins
CKP = 0; //Clock Polarity: Idle state for clock is a high level
SSPM3 = 0; //SPI Master mode, clock = FOSC/4
SSPM2 = 0;
SSPM1 = 0;
SSPM0 = 0;
RB4=1; //cs=1;
}

/*/////////////////////////////////////////////////////////////////////
FUNCAO delay()
ESTA FUNCAO EFECTUA UMA PEQUENA PAUSA
////////////////////////////////////////////////////////////////////*/
void delay(void)
{
unsigned long i = 0;
for(i=0;i<50000;i++)
{
NOP();
}
}