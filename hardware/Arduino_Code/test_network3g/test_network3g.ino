/*
 *  Description: This example shows how to do a GET method. So the buffer of 
 *  is limited, we recommend to use the GET method with short answer for the
 *  requested webs. 
 *  This example shows the AT commands (and the answers of the module) used
 *  to work with HTTP. For more information about the AT commands, 
 *  refer to the AT command manual.
 *
 *  Copyright (C) 2013 Libelium Comunicaciones Distribuidas S.L.
 *  http://www.libelium.com
 *
 *  This program is free software: you can redistribute it and/or modify 
 *  it under the terms of the GNU General Public License as published by 
 *  the Free Software Foundation, either version 3 of the License, or 
 *  (at your option) any later version. 
 *  
 *  This program is distributed in the hope that it will be useful, 
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of 
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
 *  GNU General Public License for more details. 
 *  
 *  You should have received a copy of the GNU General Public License 
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>. 
 *
 *  Version 0.2
 *  Author: Alejandro Gallego 
 */


int8_t answer;
int onModulePin = 2, aux;
int data_size = 0;
int end_file = 0;

char aux_str[100];

char data[250];
int x = 0;
long previous;

char url[ ]="";
int port= 3000;
char request[ ]="ok";



void setup(){

    pinMode(onModulePin, OUTPUT);
    Serial.begin(9600);   

    Serial.println("Starting...");
    power_on();

    delay(3000);

    // sets the PIN code
    sendATcommand("AT+CPIN=1234", "OK", 2000);

    delay(3000);

    while( (sendATcommand("AT+CREG?", "+CREG: 0,1", 500) || 
        sendATcommand("AT+CREG?", "+CREG: 0,5", 500)) == 0 );

    // sets APN, user name and password
    sendATcommand("AT+CGSOCKCONT=1,\"127.0.0.1\",\"free\"", "OK", 2000);
    sendATcommand("AT+CSOCKAUTH=1,1,\"\",\"\"", "OK", 2000);
}
void loop(){
/*
    // request the url
    sprintf(aux_str, "AT+CHTTPACT=\"%s\",%d", url, port);
    answer = sendATcommand(aux_str, "+CHTTPACT: REQUEST", 60000);

    if (answer == 1)
    {        
        Serial.println(request);
        // Sends <Ctrl+Z>
        aux_str[0] = 0x1A;
        aux_str[1] = 0x00;
        answer = sendATcommand(aux_str, "+CHTTPACT: DATA,", 60000);

        x=0;
        do{
            if (answer == 1)
            {
                data_size = 0;
                while(Serial.available()==0);
                aux = Serial.read();
                do{
                    data_size *= 10;
                    data_size += (aux-0x30);
                    while(Serial.available()==0);
                    aux = Serial.read();        
                }
                while(aux != 0x0D);

                Serial.print("Data received: ");
                Serial.println(data_size);

                if (data_size > 0)
                {
                    while(Serial.available() < data_size);
                    Serial.read();

                    for (int y = 0; y < data_size; y++)
                    {
                        data[x] = Serial.read();
                        x++;
                    }
                    data[x] = '\0';
                }
                else
                {
                    Serial.println("Download finished");    
                }
            }
            else
            {
                Serial.println("Error getting the url");
                data_size = 0;
            }

            answer = sendATcommand2("", "+CHTTPACT: DATA,", "+CHTTPACT:0", 20000);
            
        }while (answer != 1);

        if (answer == 2)
        {
            Serial.print("Data received:");
            Serial.println(data);
        }
        else
        {
            Serial.println("Error getting data");
        }
    }
    else
    {
        Serial.println("Error waiting the request");    
    }

    delay(10000);
*/
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


int8_t sendATcommand(char* ATcommand, char* expected_answer1,
            unsigned int timeout)
{

    uint8_t x=0,  answer=0;
    char response[100];
    unsigned long previous;

    memset(response, '\0', 100);    // Initialize the string
    delay(100);
    while( Serial.available() > 0) Serial.read();    // Clean the input buffer
    Serial.println(ATcommand);    // Send the AT command 
    x = 0;
    previous = millis();

    // this loop waits for the answer
    do{

        if(Serial.available() != 0){    
            response[x] = Serial.read();
            x++;
            // check if the desired answer is in the response of the module
            Serial.println(response[x]);
            if (strstr(response, expected_answer1) != NULL)    
            {
                answer = 1;
            }
        }
        // Waits for the asnwer with time out
    }
    while((answer == 0) && ((millis() - previous) < timeout));    
    return answer;
}

/*
int8_t sendATcommand2(char* ATcommand, char* expected_answer1,
         char* expected_answer2, unsigned int timeout)
{

    uint8_t x=0,  answer=0;
    char response[100];
    unsigned long previous;

    memset(response, '\0', 100);    // Initialize the string

    delay(100);

    while( Serial.available() > 0) Serial.read();    // Clean the input buffer

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
}*/
