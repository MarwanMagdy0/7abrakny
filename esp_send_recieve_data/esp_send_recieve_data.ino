#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>

// Replace with your desired Access Point (AP) credentials
const char* apSSID = "MyESP8266";
const char* apPassword = "mypassword";

ESP8266WebServer server(80);

void setup() {
  Serial.begin(115200);

  // Create an Access Point
  WiFi.mode(WIFI_AP);
  WiFi.softAP(apSSID, apPassword);

  Serial.print("Access Point SSID: ");
  Serial.println(apSSID);
  Serial.print("Access Point Password: ");
  Serial.println(apPassword);

  // Define a route that will handle POST requests
  server.on("/post_data", HTTP_POST, handlePostData);

  // Start the server
  server.begin();
}

void loop() {
  server.handleClient();
}

// Handler for the "/post_data" route
void handlePostData() {
  if (server.hasArg("plain")) {
    String postData = server.arg("plain");
    int value = postData.toInt(); // Convert the received data to an integer

    // You can use the 'value' variable as needed
    Serial.print("Received integer via POST: ");
    Serial.println(value);

    // You can add your custom logic here based on the received integer value

    server.send(200, "text/plain", "Data received successfully");
  } else {
    server.send(400, "text/plain", "Bad Request");
  }
}
