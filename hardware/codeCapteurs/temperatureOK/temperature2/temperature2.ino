#include <math.h>
#define PIN_NTC0 A0
#define PIN_NTC1 A1
#define PIN_NTC2 A2
#define PIN_NTC3 A3
#define PIN_NTC4 A4
#define PIN_NTC5 A5

double Rref=10000.0;
double V_IN=5.0;

double steinhartHarteq(double R)
{
  double T0=273.15+25;
  double R0=1000;
  double B=3920;
  double T=pow((1/T0+1/B*log(R/R0)),-1);
  return T;
} 

void setup()
{
  Serial.begin(9600);
}

void loop()
{
  double valeurAnalog0=analogRead(PIN_NTC0);
  double valeurAnalog1=analogRead(PIN_NTC1);
  double valeurAnalog2=analogRead(PIN_NTC2);
  double valeurAnalog3=analogRead(PIN_NTC3);
  double valeurAnalog4=analogRead(PIN_NTC4);
  double valeurAnalog5=analogRead(PIN_NTC5);
  
  double V0=valeurAnalog0/1024*V_IN;
  double V1=valeurAnalog1/1024*V_IN;
  double V2=valeurAnalog2/1024*V_IN;
  double V3=valeurAnalog3/1024*V_IN;
  double V4=valeurAnalog4/1024*V_IN;
  double V5=valeurAnalog5/1024*V_IN;

  double Rth0=(Rref*V0)/(V_IN-V0);
  double Rth1=(Rref*V1)/(V_IN-V1);
  double Rth2=(Rref*V2)/(V_IN-V2);
  double Rth3=(Rref*V3)/(V_IN-V3);
  double Rth4=(Rref*V4)/(V_IN-V4);
  double Rth5=(Rref*V5)/(V_IN-V5);
  
  /*Serial.print("Rth0 = ");
  Serial.print(Rth0);
  Serial.print("Rth1 = ");
  Serial.print(Rth1);
  Serial.print("Rth2 = ");
  Serial.print(Rth2);
  Serial.print("Rth3 = ");
  Serial.print(Rth3);
  Serial.print("Rth4 = ");
  Serial.print(Rth4);
  Serial.print("Rth5 = ");
  Serial.print(Rth5);*/
  
  double kelvin0 = steinhartHarteq(Rth0);
  double celsius0 = kelvin0-273.15;
  Serial.print("Ohm - T1 = ");
  Serial.print(celsius0);
  Serial.println("C\n");
  
  double kelvin1 = steinhartHarteq(Rth1);
  double celsius1 = kelvin1-273.15;
  Serial.print("Ohm - T2 = ");
  Serial.print(celsius1);
  Serial.println("C\n");
  
  double kelvin2 = steinhartHarteq(Rth2);
  double celsius2 = kelvin2-273.15;
  Serial.print("Ohm - T3 = ");
  Serial.print(celsius2);
  Serial.println("C\n");
  
  double kelvin3 = steinhartHarteq(Rth3);
  double celsius3 = kelvin3-273.15;
  Serial.print("Ohm - T4 = ");
  Serial.print(celsius3);
  Serial.println("C\n");
  
  double kelvin4 = steinhartHarteq(Rth4);
  double celsius4 = kelvin4-273.15;
  Serial.print("Ohm - T5 = ");
  Serial.print(celsius4);
  Serial.println("C\n");
  
  double kelvin5 = steinhartHarteq(Rth5);
  double celsius5 = kelvin5-273.15;
  Serial.print("Ohm - T6 = ");
  Serial.print(celsius5);
  Serial.println("C\n");
  
  
  delay(5000);
}
