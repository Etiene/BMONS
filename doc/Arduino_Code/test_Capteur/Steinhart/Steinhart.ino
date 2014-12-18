#include <math.h>
#define PIN_NTC A0

double Rref=4700.0;
double V_IN=5.0;

double A_1=3.354016E-03;
double B_1=3.349290E-04;
double C_1=3.683843E-06;
double D_1=7.050455E-07;

double steinhartHart(double R)
{
  double equationB1=B_1*log(R/Rref);
  double equationC1=C_1*pow(log(R/Rref),2);
  double equationD1=D_1*pow(log(R/Rref),3);
  double equation=A_1+equationB1+equationC1+equationD1;
  return pow(equation,-1);
} 

void setup()
{
  Serial.begin(9600);
}

void loop()
{
  double valeurAnalog=analogRead(PIN_NTC);
  double V=valeurAnalog/1024*V_IN;
  double Rth=(Rref*V)/(V_IN-V);
  Serial.print("Rth = ");
  Serial.print(Rth);
  
  double kelvin = steinhartHart(Rth);
  double celsius = kelvin-273.15;
  Serial.print("Ohm - T = ");
  Serial.print(celsius);
  Serial.print("C\n");
  
  delay(2000);
}
