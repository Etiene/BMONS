#define Pin A0

void setup() {
   Serial.begin(9600);
 
}
void loop(){
// read the state of the tilt Sensor value:
   double v=analogRead(Pin);
   Serial.print("analog is : ");
   Serial.print(v);
   v=v/1024*3.3;
   Serial.println(" ");
  Serial.print("real val is : ");
  Serial.println(v);
  delay(1000);
}
