import processing.serial.*;
Serial Port; 


float distance;
int score1=0;
int score2=0;

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
  background(0,255,0);
  fill(69,0,0);
  rect(0,0, width, 200);
  strokeWeight(20);
  line(width/2, 0, width/2, height);
  strokeWeight(20);
  line(0, 200, width, 200);
  if (data!=null) {
    distance= float(data[0]);
  }

  fill(255);
  textSize(40);
  text("Player 1:-", 100, 75);
  text("Samaksh Gupta", 100, 125);
  fill(255);
  textSize(40);
  text("Player 2:-", 600, 75);
  text("Karish Grover", 600, 125);


  fill(69, 0, 0);
  textSize(50);
  text("Your score is:", 80, 500);

  fill(69, 0, 0);
  textSize(50);
  text("Your score is:", 580, 500);


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
 if (keyCode==DOWN){
  if (distance<1.25) {
    score1=score1+1;

    fill(255, 0, 0);
    textSize(100);

    text(score1, 150, 600);
  } 
  else {
    fill(255, 0, 0);
    textSize(100);
    text(score1, 150, 600);
  }
 }

if (keyCode==UP) {
  if (distance<1.25) {
    score2=score2+1;

    fill(255, 0, 0);
    textSize(100);

    text(score2, 650, 600);
  } else {
    fill(255, 0, 0);
    textSize(100);
    text(score2, 650, 600);
  }
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
