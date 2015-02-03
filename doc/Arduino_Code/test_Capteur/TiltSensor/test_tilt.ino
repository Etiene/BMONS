

/*
Tilt
Turns on and off a T010111 LED Module connected to O0 (digital
pin 11), triggered by a T000190 Tilt Sensor attached to I0 (analog pin 0).
created 2005
by DojoDave <http://www.0j0.org>
modified 17 Jun 2009
by Tom Igoe
modified 7 dec 2010
by Davide Gomba
This example code is in the public domain.
*/
#define O0 11
#define O1 10
#define O2 9
#define O3 6
#define O4 5
#define O5 3
#define I0 A0
#define I1 A1
#define I2 A2
#define I3 A3
#define I4 A4
#define I5 A5
// constants won't change. They're used here to
// set pin numbers:
const int tiltPin = I0;
// the number of the Tilt Sensor pin
const int ledPin = O0;
// the number of the LED pin
// variables will change:
int tiltState = 0;
// variable for reading the tilt Sensor status
void setup() {
   Serial.begin(9600);
// initialize the LED pin as an output:
  pinMode(ledPin,OUTPUT);
// initialize the tilt Sensor pin as an input:
  pinMode(tiltPin,INPUT);
}
void loop(){
// read the state of the tilt Sensor value:
   Serial.println("OK");
  tiltState =digitalRead(tiltPin);
  Serial.println(tiltState); 
// check if the tilt Sensor is tilted.
// if it is, the buttonState is HIGH:
  if(tiltState ==HIGH) {
// turn LED on:
  digitalWrite(ledPin,HIGH);
  }
  else
  {
// turn LED off:
    digitalWrite(ledPin,LOW);
  }
  delay(1000);
}
