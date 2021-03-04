import processing.serial.*;
Serial Port; 


float distance;
int sum=0;

int numStars = 200;
float xPos[] = new float [numStars];
float yPos[] = new float [numStars];
float xSpeed[] = new float [numStars];
float ySpeed[] = new float [numStars];

String input_string;
String[] data;

void setup() {

  size(1000, 1000);
  Port= new Serial(this, "/dev/cu.usbmodem141201", 9600);
  Port.bufferUntil('\n');
  setup_stars();

  ellipseMode(CENTER);
}


void draw() {
  background(0);

  if (data!=null) {
    distance= float(data[0]);
  }
  fill(255);
  textSize(40);
  text("Player Name: Karish Grover ", width/2-250, 50);
  fill(255,0,0);
  textSize(100);
  text("Your score is:", 100, 500);
  draw_stars();
  score();
}

void serialEvent(Serial Port)
{
  String input_string = Port.readStringUntil('\n');
  if (input_string!= null) {
    input_string=trim(input_string);
    data=split(input_string, '\n');
  }
  //a=input_string.length();
  //b=int(input_string.substring(0,a-1));
}


void score() {

  if (distance<1.20) {
    sum=sum+1;

    fill(255, 0, 0);
    textSize(100);

    text(sum, 800, 500);
  } 
  
  else {
    fill(255,0,0);
    textSize(100);
    text(sum, 800, 500);
  }
}


void setup_stars() {
  for (int i = 20; i < numStars; i += random(10000, 100000)) {
    fill(255);
    ellipse(random(width), random(height), 10, 10);
  }
}


void draw_stars() {

  fill(0, 3);
  rect(0, 0, width, height);


  for (int i = 50; i < numStars; i += random(10000, 100000)) {
    fill(255);
    ellipse(random(width), random(height), 10, 10);
  }
}  
