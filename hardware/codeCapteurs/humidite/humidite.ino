// humidite.ino

const int Pin=A0;

void setup(){
  Serial.begin(9600);
}
void loop(){
  double sensor = analogRead(Pin);
  sensor=sensor*100/1023;
  Serial.println(sensor);
  delay(2000);
}
