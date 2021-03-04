
int buzzer_pin = 8;//the pin of the active buzzer
int trig_pin=5;
int echo_pin=9;
float pingtime;
float distance;
float speed_of_sound=728.00;

void setup() {

Serial.begin(9600);
pinMode(trig_pin, OUTPUT);
pinMode(echo_pin, INPUT);
pinMode(buzzer_pin, OUTPUT);

}

void loop() {

digitalWrite(trig_pin, LOW);
delayMicroseconds(2000);
digitalWrite(trig_pin, HIGH);
delayMicroseconds(10);
digitalWrite(trig_pin, LOW);

pingtime= pulseIn(echo_pin, HIGH);
distance= speed_of_sound*pingtime*63360;
distance=distance/1000000;
distance=distance/2;
distance=distance/3600;

Serial.println(distance);


  if (distance < 1.26) {
    digitalWrite(buzzer_pin, HIGH);
    delay(500);
    digitalWrite(buzzer_pin, LOW);
  }
  else {
    digitalWrite(buzzer_pin, LOW);
  }
}
