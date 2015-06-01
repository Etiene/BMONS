/*  
 *  3G + GPS shield
 *  
 *  Copyright (C) Libelium Comunicaciones Distribuidas S.L. 
 *  http://www.libelium.com 
 *  
 *  This program is free software: you can redistribute it and/or modify 
 *  it under the terms of the GNU General Public License as published by 
 *  the Free Software Foundation, either version 3 of the License, or 
 *  (at your option) any later version. 
 *  a
 *  This program is distributed in the hope that it will be useful, 
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of 
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
 *  GNU General Public License for more details.
 *  
 *  You should have received a copy of the GNU General Public License 
 *  along with this program.  If not, see http://www.gnu.org/licenses/. 
 *  
 *  Version:           2.0
 *  Design:            David Gascón 
 *  Implementation:    Alejandro Gallego & Victor Boria
 */

//Change here your data
const char pin_number[] = "1234";
const char apn[] = "*********";
const char user_name[] = "*********";
const char password[] = "*********";

char url[ ]="haggis.ensta-bretagne.fr";
int port= 3000;
char post[ ] ="{\"sensor_id\":\"1\",\"value\":\"58\",\"datetime\":\"2015-06-01 23:56:52\"}\r\n\r\n";
String postdata=post;
char request_first[ ]="POST /measurements HTTP/1.1\r\nHost: haggis.ensta-bretagne.fr\r\nContent-Type: application/json\r\nContent-Length: 63\r\n\r\n";
char request[500];


//sprintf(postHeader2,"%s%d\r\n\r\n",postLen,postdata.length());
//sprintf(postHeader,"%s%s",postHeader1,postHeader2);
//sprintf(request, "%s%s", postHeader,postdata);

int8_t answer;
int onModulePin = 2, aux;
int data_size = 0;
int end_file = 0;
char aux_str[50];
char data[400];
int http_x;
int http_status; // 0: end, 1 waiting data with header, 2 waiting data without header, 3 timeout waiting data, 4 unknow response
int x = 0;
long previous;

void setup(){
  pinMode(onModulePin, OUTPUT);
  Serial.begin(115200);
  sprintf( request,"%s%s",request_first, post);
  Serial.println("Starting...");
  power_on();

  delay(3000);

  //sets the PIN code
  sprintf(aux_str, "AT+CPIN=%s", pin_number);
  sendATcommand(aux_str, "OK", 2000);

  delay(3000);

  while( (sendATcommand("AT+CREG?", "+CREG: 0,1", 500) ||
    sendATcommand("AT+CREG?", "+CREG: 0,5", 500)) == 0 );

  // sets APN, user name and password
  sprintf(aux_str, "AT+CGSOCKCONT=1,\"IP\",\"%s\"", apn);
  sendATcommand(aux_str, "OK", 2000);

  sprintf(aux_str, "AT+CSOCKAUTH=1,1,\"%s\",\"%s\"", user_name, password);
  sendATcommand(aux_str, "OK", 2000);
}

void loop(){

  // request the url
 
  previous = millis();
  sprintf(aux_str, "AT+CHTTPACT=\"%s\",%d", url, port);
  answer = sendATcommand(aux_str, "+CHTTPACT: REQUEST", 60000);

  // Sends the request
  Serial.println(request);
  // Sends <Ctrl+Z>
  Serial.write(0x1A);
  http_status = 1;

  while ((http_status == 1) || (http_status == 2))
  {
    answer = sendATcommand("", "+CHTTPACT: ", 60000);
    if (answer == 0)
    {
      if (http_status == 1)
      {
        http_status = 3;
      }
      if (http_status == 2)
      {
        http_status = 5;
      }
    }
    else
    {
      // answer == 1
      while(Serial.available()==0);
      aux_str[0] = Serial.read();
      
      if ((aux_str[0] == 'D') && (http_status == 1))
      {
        // Data packet with header
        while(Serial.available()<4);
        Serial.read();  // A
        Serial.read();  // T
        Serial.read();  // A
        Serial.read();  // ,

        // Reads the packet size
        x=0;
        do{
          while(Serial.available()==0);
          aux_str[x] = Serial.read();
          x++;
        }
        while((aux_str[x-1] != '\r') && (aux_str[x-1] != '\n'));

        aux_str[x-1] = '\0';
        data_size = atoi(aux_str);

        // Now, search the end of the HTTP header (\r\n\r\n)
        do{
          while (Serial.available() < 3);

          data_size--;
          if (Serial.read() == '\r')
          {
            data_size--;
            if (Serial.read() == '\n')
            {
              data_size--;
              if (Serial.read() == '\r')
              {
                data_size--;
                if (Serial.read() == '\n')
                {
                  // End of the header found
                  http_status = 2;
                }
              }
            }	
          }
        }
        while ((http_status == 1) && (data_size > 0));

        if (http_status == 2)
        {
          // Reads the data
          http_x = 0;
          do{
            if(Serial.available() != 0){
              data[http_x] = Serial.read();
              http_x++;
              data_size--;
            }
            else
            {
              delay(1);
            }
          }
          while(data_size > 0);
          data[http_x] = '\0';
        }
      }
      else if ((aux_str[0] == 'D') && (http_status == 2))
      {
        // Data packet with header
        while(Serial.available()<4);
        Serial.read();  // A
        Serial.read();  // T
        Serial.read();  // A
        Serial.read();  // ,

        // Reads the packet size
        x=0;
        do{
          while(Serial.available()==0);
          aux_str[x] = Serial.read();
          x++;
        }
        while((aux_str[x-1] != '\r') && (aux_str[x-1] != '\n'));

        aux_str[x-1] = '\0';
        data_size = atoi(aux_str);

        do{
          if(Serial.available() != 0){
            data[http_x] = Serial.read();
            http_x++;
          }
          else
          {
            delay(1);
          }
        }
        while(data_size > 0);
        data[http_x] = '\0';

      }
      else if (aux_str[0] == '0')
      {
        // end of the AT command
        http_status = 0;
      }
      else
      {
        // unknow response
        http_status = 4;
        Serial.print(char(aux_str[0]));
        Serial.print(char(Serial.read()));
        Serial.print(char(Serial.read()));
        Serial.print(char(Serial.read()));
        Serial.print(char(Serial.read()));
        Serial.print(char(Serial.read()));
        Serial.print(char(Serial.read()));
        Serial.print(char(Serial.read()));
        Serial.print(char(Serial.read()));
      }			
    }		
  }

  previous = millis() - previous;
  
  Serial.println(previous, DEC);
  if (http_status == 0)
  {
    Serial.print(F("HTTP data: "));
    Serial.println(data);
  }
  else
  {
    Serial.print(F("http_status: "));
    Serial.println(http_status, DEC);
  }



  delay(10000);

}

void power_on(){

  uint8_t answer=0;

  // checks if the module is started
  answer = sendATcommand("AT", "OK", 2000);
  if (answer == 0)
  {
    // power on pulse
    digitalWrite(onModulePin,HIGH);
    delay(3000);
    digitalWrite(onModulePin,LOW);

    // waits for an answer from the module
    while(answer == 0){
      // Send AT every two seconds and wait for the answer
      answer = sendATcommand("AT", "OK", 2000);
    }
  }

}


int8_t sendATcommand(char* ATcommand, char* expected_answer1, unsigned int timeout) {

  uint8_t x = 0,  answer = 0;
  char response[100];
  unsigned long previous;

  memset(response, '\0', 100);    // Initialize the string

  delay(100);

  while ( Serial.available() > 0) Serial.read();   // Clean the input buffer

  Serial.println(ATcommand);    // Send the AT command


  x = 0;
  previous = millis();

  // this loop waits for the answer
  do {
    // if there are data in the UART input buffer, reads it and checks for the asnwer
    if (Serial.available() != 0) {
      response[x] = Serial.read();
      x++;
      // check if the desired answer is in the response of the module
      if (strstr(response, expected_answer1) != NULL)
      {
        answer = 1;
      }
    }
    // Waits for the asnwer with time out
  }
  while ((answer == 0) && ((millis() - previous) < timeout));

  return answer;
}

int8_t sendATcommand2(char* ATcommand, char* expected_answer1, char* expected_answer2, unsigned int timeout)
{

  uint8_t x=0,  answer=0;
  char response[100];
  unsigned long previous;

  memset(response, '\0', 100);    // Initialize the string

  delay(100);

 // while( Serial.available() > 0) Serial.read();    // Clean the input buffer

  Serial.println(ATcommand);    // Send the AT command


    x = 0;
  previous = millis();

  // this loop waits for the answer
  do{

    if(Serial.available() != 0){
      response[x] = Serial.read();
      x++;
      // check if the desired answer is in the response of the module
      if (strstr(response, expected_answer1) != NULL)
      {
        answer = 1;
      }
      // check if the desired answer is in the response of the module
      if (strstr(response, expected_answer2) != NULL)
      {
        answer = 2;
      }
    }
    // Waits for the asnwer with time out
  }
  while((answer == 0) && ((millis() - previous) < timeout));

  return answer;
} 

        
