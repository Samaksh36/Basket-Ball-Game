#include<Servo.h>

Servo my_motor;
int Led = 13 ; // define LED Interface
int buttonpin = 3; // define Metal Touch Sensor Interface
float analog_read;
int motor_pin = 6;
float pos = 0;
int trig_pin = 5;
int echo_pin = 9;
float pingtime;
float distance;
float speed_of_sound = 728.00;
int voltage_read;
int potentiometer_pin = A4;
float fake_distance;
int val;
int red_pin = 9;
int green_pin = 10;
int blue_pin = 11;
int brightness = 255;


void setup() {

  Serial.begin(9600);
  my_motor.attach(motor_pin);
  pinMode (Led, LED_BUILTIN) ; // define LED as output interface
  pinMode (buttonpin, INPUT) ; // define metal touch sensor output interface
  pinMode(potentiometer_pin, INPUT);
  pinMode(red_pin, OUTPUT);
  pinMode(green_pin, OUTPUT);
  pinMode(blue_pin, OUTPUT);

}

void loop() {
  //
  voltage_read = analogRead(potentiometer_pin);
  Serial.println(voltage_read);
  
  if (voltage_read > 1021) {
    //multiplayer
 
    val = digitalRead (buttonpin) ; // digital interface will be assigned a value of 3 to read val
    if (val == HIGH) // When the metal touch sensor detects a signal, LED flashes
    {
      digitalWrite (Led, HIGH);
      distance = 3;
    }
    else
    {
      digitalWrite (Led, LOW);
      distance = 1;
    }


    for (pos = 50; pos <= 130; pos += distance) {
      my_motor.write(pos);              // tell servo to go to position in variable 'pos'
      delay(5);                       // waits 15ms for the servo to reach the position
    }
    for (pos = 130; pos >= 50; pos -= distance) { // goes from 180 degrees to 0 degrees
      my_motor.write(pos);              // tell servo to go to position in variable 'pos'
      delay(5);                       // waits 15ms for the servo to reach the position
    }
  }

 if (voltage_read < 2) {

    for (pos = 50; pos <= 130; pos += distance) {
      my_motor.write(pos);              // tell servo to go to position in variable 'pos'
      delay(5);                       // waits 15ms for the servo to reach the position
    }
    for (pos = 130; pos >= 50; pos -= distance) { // goes from 180 degrees to 0 degrees
      my_motor.write(pos);              // tell servo to go to position in variable 'pos'
      delay(5);                       // waits 15ms for the servo to reach the position
    }
  }

  else {
    my_motor.write(90);
 
  }
}
