#include <math.h>
#include<stdio.h>
#include<stdlib.h>
#include<SD.h>
#define PIN_NTC A0
#define inPin 22

File myFile;
double Rref=1500.0;
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
   Serial.print("Initializing SD card...");
  // On the Ethernet Shield, CS is pin 4. It's set as an output by default.
  // Note that even if it's not used as the CS pin, the hardware SS pin
  // (10 on most Arduino boards, 53 on the Mega) must be left as an output
  // or the SD library functions will not work.
   pinMode(10, OUTPUT);
   
  if (!SD.begin()) {
    Serial.println("initialization failed!");
    return;
  }
  Serial.println("initialization done.");
 
  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  myFile = SD.open("BMONS.txt", FILE_WRITE);
  if (myFile) {
    Serial.println("test.txt:");
  } else {
    // if the file didn't open, print an error:
    Serial.println("error opening test.txt");
  }
}
  int t=0;
  
void loop()
{

  double valeurAnalog=analogRead(PIN_NTC);
  Serial.print("valeurAnalog: ");
   Serial.println(valeurAnalog);
  double V=valeurAnalog/1024*V_IN;
  Serial.print("V: ");
   Serial.println(V);
  double Rth=(Rref*V)/(V_IN-V);
  Serial.print("Rth = ");
  Serial.print(Rth);
  
  double kelvin = steinhartHarteq(Rth);
  double celsius = kelvin-273.15;
  Serial.print("Ohm - T = ");
  Serial.print(celsius);
  Serial.print("C\n");
  if (myFile){
    Serial.println("Writing to BMONS.txt");
    myFile.println(celsius);
 }
  t=t+1;
   Serial.print("T is ");
    Serial.println(t);
  if (t==5){
        // close the file:
    myFile.close();
    Serial.println("Finish!");
  }
  delay(2000);
}

