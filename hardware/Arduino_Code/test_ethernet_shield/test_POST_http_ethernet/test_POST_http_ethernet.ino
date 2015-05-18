/*
  Web client
 
 This sketch connects to a website (http://www.google.com)
 using an Arduino Wiznet Ethernet shield.
 
 Circuit:
 * Ethernet shield attached to pins 10, 11, 12, 13
 
 created 18 Dec 2009
 by David A. Mellis
 modified 9 Apr 2012
 by Tom Igoe, based on work by Adrian McEwen
 
 */
 
 /*useful links
http://forum.arduino.cc/index.php?topic=214378.0

https://flowingdata.com/2014/12/11/how-to-download-and-use-online-data-with-arduino/
*/
 

#include <SPI.h>
#include <Ethernet.h>

// Enter a MAC address for your controller below.
// Newer Ethernet shields have a MAC address printed on a sticker on the shield
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
// if you don't want to use DNS (and reduce your sketch size)
// use the numeric IP instead of the name for the server:
//IPAddress server(74,125,232,128);  // numeric IP for Google (no DNS)
char server[] = "172.20.10.207";    // name address for Google (using DNS)

// Set the static IP address to use if the DHCP fails to assign
//IPAddress ip(192,168,0,177);

// Initialize the Ethernet client library
// with the IP address and port of the server
// that you want to connect to (port 80 is default for HTTP):
EthernetClient client;

void setup() {
 // Open serial communications and wait for port to open:
  Serial.begin(9600);
   while (!Serial) {
    ; // wait for serial port to connect. Needed for Leonardo only
  }

  // start the Ethernet connection:
  if (Ethernet.begin(mac) == 0) {
    Serial.println("Failed to configure Ethernet using DHCP");
    // no point in carrying on, so do nothing forevermore:
    // try to congifure using IP address instead of DHCP:
    Ethernet.begin(mac, Ethernet.localIP());
  }
  // give the Ethernet shield a second to initialize:
  delay(1000);
  Serial.println("connecting...");

  // if you get a connection, report back via serial:
  
  if (client.connect(server, 8080)) {
    Serial.println("connected");
    char * Data1="{\"email\":\"nicolas3lee@gmail.com\",\"password\=\"zt3931221\"}";
    char * Data = "email=nicolas3lee@gmail.com&password=zt3931221";
    String PostData=URLEncode(Data1);
    
    //String PostData="someDatatoPost";
    // Make a HTTP request:
    client.println("POST /login HTTP/1.1");
    client.println("Host: 172.20.10.207");
    
    //client.println("Connection: close");
    //String PostData="{\"user\":{\"name\":\"abcdefg\",\"email\":\"leilei.zheng@gmail.com\",\"password\":\"zt3931221\",\"passwrd_confirmation\":\"zt3931221\"}}";
    //String PostData="{ name : \"abcdefg\", email : \"leilei.zheng@gmail.com\", password : \"zt3931221\", passwrd_confirmation : \"zt3931221\"}";
   
    //Serial.println(PostData.length());
    
    //client.println("Content-Type: application/x-www-form-urlencoded;");
    client.println("Content-Type: application/json;");
   // client.print("Content-Length: ");
    //client.println(PostData.length());  
    
    client.println();
    client.println(PostData);
    //client.println();
  }
  else {
    // kf you didn't get a connection to the server:
    Serial.println("connection failed");
  }
}

String URLEncode(const char* msg)
{
    const char *hex = "0123456789abcdef";
    String encodedMsg = "";

    while (*msg!='\0'){
        if( ('a' <= *msg && *msg <= 'z')
                || ('A' <= *msg && *msg <= 'Z')
                || ('0' <= *msg && *msg <= '9') ) {
            encodedMsg += *msg;
        } else {
            encodedMsg += '%';
            encodedMsg += hex[*msg >> 4];
            encodedMsg += hex[*msg & 15];
        }
        msg++;
    }
    return encodedMsg;
}

void loop()
{
  // if there are incoming bytes available
  // from the server, read them and print them:
  if (client.available()) {
    char c = client.read();
    Serial.print(c);
  }

  // if the server's disconnected, stop the client:
  if (!client.connected()) {
    Serial.println();
    Serial.println("disconnecting.");
    client.stop();

    // do nothing forevermore:
    while(true);
  }
}
