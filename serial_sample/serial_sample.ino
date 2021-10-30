int val=0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}

void loop() {
  // put your main code here, to run repeatedly:
  //Serial.print("start loop\n");
  //delay(3000);
  val = hallRead();
  if(val>150){
   Serial.println(val); 
   delay(500);
  }
}
