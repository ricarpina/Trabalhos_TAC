# include <htc.h>

void TIMER1ON(void){

TMR1ON=0;
TMR1CS=0; //Fcristal - incrementa tmr0  a partir do cristal
//PSA=0; // N�o era necess�rio, est� a 0 por defeni��o
T1OSCEN=1;
T1SYNC=0;
T1CKPS1=1;
T1CKPS0=1;
TMR1ON=1;
//TMR1IE=1; // habilita a interrup��o do timer1
}

void esperanmseg(int n){
	int x=(int)((float)500*(float)11955/(float)n);
	//int cont=(int)((float)n/(float)100); //N�mero de estouros necess�rios para obter tempo n
	for (int i=0; i<x; i++){
	TIMER1ON();
	TMR1ON=0;
	//TMR1=15535; // Para conseguir um tempo de estouro do timer de 100ms
	}

}