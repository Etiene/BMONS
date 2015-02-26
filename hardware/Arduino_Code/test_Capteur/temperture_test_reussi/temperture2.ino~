#include <math.h>
#define PIN_NTC A0
#define inPin 22

double Rref=15000.0;
double V_IN=5.0;

double steinhartHarteq(double R)
{
  double T0=273.15+25;
  double R0=1000.0;
  double B=3920.0;
  double T=1.0/(1.0/T0+1.0/B*log(R/R0));
  return T;
} 

void setup()
{
  Serial.begin(9600);
 // pinMode(i)
}

void loop()
{
  double valeurAnalog=analogRead(PIN_NTC);
  double V=valeurAnalog/1024*V_IN;
  double Rth=(Rref*V)/(V_IN-V);
  Serial.print("Rth = ");
  Serial.print(Rth);
  
  double kelvin = steinhartHarteq(Rth);
  double celsius = kelvin-273.15;
  Serial.print("Ohm - T = ");
  Serial.print(celsius);
  Serial.print("C\n");
  
  delay(2000);
}

