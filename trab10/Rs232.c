# include <htc.h>

static int f=0;

void Rs232Conf(unsigned int m,unsigned int fosc){
f=fosc;
// Conf rs232
SYNC=0; //2400 BPS C/ 4MHz //pag 114 datasheet
BRGH=1;
SPBRG=(char)(((float)(fosc*1000000)/((float)16*((float)m+(float)1))));
/* Equavalente a
BRGH=1;
SPBRG=103;*/

TXEN=1; //Autorizar  envio para do uc para pc
CREN=1; //Autorizar a recepção
SPEN=1; //ligar circuitos internos Rs232
TRISC7=1; //Ativar pino RX
TRISC6=1; // Ativar pino Tx

// Configurar interrupcoes
GIE=1;
PEIE=1; //peripheral interrupt enable
RCIE=1; //Reception interrupt enable
//TXIE=1;
}

void RS232Tx(unsigned char* s, unsigned char tam){

for(unsigned char k=0; k<tam;k++){
TXREG=*(s+k);
for(unsigned short int m=0;m<500;m++){}
}
}

unsigned char* RS232Rx(void){
return &RCREG;
}