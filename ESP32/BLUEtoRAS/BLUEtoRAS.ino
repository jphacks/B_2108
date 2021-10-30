#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>

#define SERVICE_UUID           "要検討"
#define CHARACTERISTIC_UUID_TX "要検討"

#define DEVICENAME "ESP32"

#define SPI_SPEED 115200
const int JOY_STICK_VRX = 33;
const int JOY_STICK_VRY = 32;
const int PUSH_BUTTON = 35;
BLECharacteristic *pCharacteristicTX;
bool deviceConnected = false;
int senddata = 0;
int senddata2 = 0;
int senddata3 = 0;
class funcServerCallbacks: public BLEServerCallbacks {
    void onConnect(BLEServer* pServer) {
      deviceConnected = true;
    }
    void onDisconnect(BLEServer* pServer) {
      deviceConnected = false;
    }
};

void doPrepare(BLEService *pService) {

  pCharacteristicTX = pService->createCharacteristic(
                        CHARACTERISTIC_UUID_TX,
                        BLECharacteristic::PROPERTY_NOTIFY
                      );
  pCharacteristicTX->addDescriptor(new BLE2902());
}
void doInitialize() {
  pinMode(PUSH_BUTTON, INPUT_PULLUP);
  Serial.begin(SPI_SPEED);
}
void setup() {
  doInitialize();
  BLEDevice::init(DEVICENAME);

  BLEServer *pServer = BLEDevice::createServer();
  pServer->setCallbacks(new funcServerCallbacks);

  BLEService *pService = pServer->createService(SERVICE_UUID);
  doPrepare(pService);

  pService->start();

  BLEAdvertising *pAdvertising = pServer->getAdvertising();
  pAdvertising->addServiceUUID(SERVICE_UUID);
  pAdvertising->start();
  Serial.println("Waiting to connect...");
  while (!deviceConnected) {
    delay(1000);
  }
  // Connection
  Serial.println("Connection!");
  delay(1000);
}
void loop() {

} else {
  Serial.println("disconnect");
}
delay(500);
}
