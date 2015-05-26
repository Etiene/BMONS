#define V_IN 5
#define Rref 1800

int fsrAnalogPin0=6;
int fsrAnalogPin1=7;
int fsrAnalogPin2=8;
int fsrAnalogPin3=9;

int LEDpin=11;
int fsrReading0;
int fsrReading1;
int fsrReading2;
int fsrReading3;

int LEDbrightness;

void setup(void)
{
  Serial.begin(9600);
  pinMode(LEDpin,OUTPUT);
}

void loop(void)
{
  fsrReading0=analogRead(fsrAnalogPin0);
  fsrReading1=analogRead(fsrAnalogPin1);
  fsrReading2=analogRead(fsrAnalogPin2);
  fsrReading3=analogRead(fsrAnalogPin3);
  
  //Serial.print("Analog reading = ");
  //Serial.println(fsrReading);
  
  //LEDbrightness=map(fsrReading,0,1023,0,255);
  //analogWrite(LED pin,LEDbrightness);
  
  double V0=fsrReading0/1024.0*V_IN;
  double V1=fsrReading1/1024.0*V_IN;
  double V2=fsrReading2/1024.0*V_IN;
  double V3=fsrReading3/1024.0*V_IN;

  
  // double R=Rref*(V_IN-V)/V;
 
  Serial.print("Vout0 = ");
  Serial.println(V0);
  
  Serial.print("Vout1 = ");
  Serial.println(V1);
  
  Serial.print("Vout2 = ");
  Serial.println(V2);
  
  Serial.print("Vout3 = ");
  Serial.println(V3);
  
  delay(2000);
}
