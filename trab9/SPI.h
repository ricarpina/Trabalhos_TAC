/*extern void escreveByteEEPROM(unsigned char valor, unsigned int posicao);
extern void SPI_Config(void);
extern unsigned char lerByteEEPROM(unsigned int posicao);
*/
extern unsigned char readStatus(void);
extern void enableWrite(void);
extern void escreveByteEEPROM(unsigned char* valor, unsigned char len, unsigned char posicao);
extern void lerByteEEPROM(unsigned char* destino,unsigned char len, unsigned char posicao);
extern void initSPI(void);
extern void delay(void);