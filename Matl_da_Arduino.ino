#define sensorPin A0

void setup() {
  // Hur snabbt kommunikationen mellan Arduino och datorn kommer vara. Just nu är den på default som är Baud rate 9600:
  Serial.begin(9600);
}

void loop() {
  //läsning från analog input:
  int reading = analogRead(sensorPin);

  // Ge läsningen ett float värde:
  float x = reading * (5000 / 1024.0);

  // Konvertera värdet till celsius genom att ta det genom 10:
  float temperature = x / 10;

  // Sedan printar man ut temperaturen i serial kommandon:
  Serial.print(temperature);
  Serial.print(" \xC2\xB0"); // Visar celsius symbolen:
  Serial.println("C");

  delay(1000); // Hur länge det dröjer tills nästa temp läsning:
}
