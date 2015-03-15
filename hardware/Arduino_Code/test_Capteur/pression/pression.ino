#define V_IN 5
#define Rref 1800

int fsrAnalogPin=0;
int LEDpin=11;
int fsrReading;

int LEDbrightness;

void setup(void)
{
  Serial.begin(9600);
  pinMode(LEDpin,OUTPUT);
}

void loop(void)
{
  fsrReading=analogRead(fsrAnalogPin);
  Serial.print("Analog reading = ");
  Serial.println(fsrReading);
  
  LEDbrightness=map(fsrReading,0,1023,0,255);
  analogWrite(LEDpin,LEDbrightness);
  double V=fsrReading/1024.0*V_IN;
  
  //double R=Rref*(V_IN-V)/V;
 
  Serial.print("Vout = ");
  Serial.println(V);
  
  delay(2000);
}
