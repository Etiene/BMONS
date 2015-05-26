// microphone.ino
// Affiche le niveau du volume sonore sur le port serie

const int audioPin=A0;
int A=0;
int b=0;
// const int sensitivity=800;
void setup(){
  Serial.begin(9600);
}
void loop(){
  int soundWave = analogRead(audioPin);
  // soundWave prendra une valeur comprise entre 0 et 1023. Cette valeur sera proportionnelle au volume sonnore.
  if(A==0){
    while(Serial.available()==0);
    while(Serial.read()!=-1);
    A=1;
  } 
  
  if(Serial.available()>0){
    
    while(Serial.read()!=-1);
    while(Serial.available()==0);
    while(Serial.read()!=-1);
  }
  if(b>2000){
    while(Serial.available()==0);
    }
  Serial.print(soundWave);
  Serial.print(" ");
  b=b+1;
  delay(0.02);
}
