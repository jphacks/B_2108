#include <WiFi.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BMP280.h>
#include "Ambient.h"

WiFiClient client;

Ambient ambient;
Adafruit_BMP280 bmp;

const char* ssid = "要検討"; 
const char* password = "要検討";



unsigned int channelId = ; // AmbientのチャネルID

const char* writeKey = ""; // Ambientのアカウントから得られるライトキー



void setup()

{
  Serial.begin(115200);
  delay(10);
  Serial.println("Start");
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(100);
  }

  Serial.print("WiFi connected\r\nIP address: ");
  Serial.println(WiFi.localIP());

  ambient.begin(channelId, writeKey, &client); // チャネルIDとライトキーを指定してAmbientの初期化

  if (!bmp.begin()) {
    Serial.println(F("Could not find BMP280!"));
    while (1);
  }
}


void loop(){

  Serial.println("Writing");
  ambient.set(1, bmp.readTemperature()); // 温度をデータ1にセット
  ambient.set(2, bmp.readPressure()); // 湿度をデータ2にセット
  ambient.send(); // データをAmbientに送信
  delay(10000);
}
