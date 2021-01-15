//DAYANA VELIYEVA - github: @dveliyeva
//WINTER-WONDERLAND PROGRAM

/**********************
Variables:
Variables provide a way to save information within your sketch and are used to control the size, position, shape, etc. of what you are drawing.
*********************/

int quantity = 70; //quantity of snow 
float [] xPosition = new float[quantity]; 
float [] yPosition = new float[quantity];
int [] snowSize = new int[quantity]; 
int [] direction = new int[quantity];
int minSnowSize = 1;
int maxSnowSize = 5;


/**********************
setup():
*********************/

void setup() {
  size(350, 350);
  frameRate(20);
  noStroke();
  smooth();
 
  for(int i = 0; i < quantity; i++) {
    snowSize[i] = round(random(minSnowSize, maxSnowSize));
    xPosition[i] = random(0, width);
    yPosition[i] = random(0, height);
    direction[i] = round(random(0, 1));
  }
  
}

/**********************
Use draw() to specify things that you want
repeatedly. NOTE: draw() must be present in your program, even if it is left empty.
******************** */ 
void draw() {
  
 //background(mouseX,0,mouseY,100);
 background(#5a6e9f);
  
  
  //snowy slopes
  fill(#c2c2c2);
  ellipse(270,200,300,200); //circle 1
  
  fill(#dddfdf);
  ellipse(50,250,300,225); //circle 2
  
  fill(#f8f8f8);
  ellipse(260,325,320,275);  //circle 3
 
 
  //pine tree: 3 triangles, 1 rectangle 
  fill(#132823);
  triangle(215,250,260,150,305,250);
  triangle(225,200,260,125,295,200);
  triangle(240,150,260,100,280,150);
  fill(#625855);
  stroke(#6f6f6f);
  rect(252,250,15,15);
  
  
  //call for the snow animation method
  snowAnimation(xPosition, yPosition, snowSize, direction, minSnowSize, maxSnowSize);
}

/**********************
Event Listeners:
Use event-listeners like keyPressed() to allow users of your program to cause things to happen.
*********************/ 
 
void mouseDragged(){
  //base where snowman stands 
  rect(0,240,350,300);
  background(mouseX,0,mouseY);
  fill(230);
  rect(0,230,350,300);
  println("Frosty the Snowman says hi!");
  
  
  //body of snowman
  //bottom portion of body
  fill(250);
  ellipse(175,210,100,100);
  //middle portion of body
  fill(250);
  ellipse(175,150,75,75);
  // head
  fill(250);
  ellipse(175,100,60,60);

   //eyes of snowman
  fill(0);
  ellipse(168,102,5,5);
  ellipse(184,102,5,5);

  //nose of snowman
  fill(270,210,0);
  ellipse(175,112,7,7);
  
  //smile
  fill(255);
  stroke(#0f0f0f);
  arc(175, 118, 15, 10, -TWO_PI, -PI);
}

void mouseReleased(){
  stroke(#6f6f6f);
}

void keyPressed(){
 if(key=='p' || key=='P'){
   background(mouseX,0,mouseY);
   println("Party Time!");
 }
 else if(key=='b' || key=='B'){
   background(0);
   println("Black Out!");
 }
 else if(key=='s' || key=='S'){
   background(#FFFFFF);
   println("S");
 }
 else if(key=='n' || key=='N'){
   background(#FFFFFF);
   println("N");
 }
 else if(key=='o' || key=='O'){
   background(#FFFFFF);
   println("O");
 }
 else if(key=='w' || key=='W'){
   background(#FFFFFF);
   println("W! Winter Time is Here!");
 }
}
  

/** ********************
Custom Functions:
Functions are sections of code that you create and name.
*********************/

void snowAnimation(float [] xPosition, float [] yPosition, int [] snowSize, int [] direction, int minSnowSize, int maxSnowSize){
  
  //loop that creates circles 
  for(int i = 0; i < xPosition.length; i++) {
    fill(#ffffff);
    ellipse(xPosition[i], yPosition[i], snowSize[i], snowSize[i]);
   
   //different sizes of circles implemented here 
    if(direction[i] == 0) {
      xPosition[i] += map(snowSize[i], minSnowSize, maxSnowSize, .1, .5);
    } else {
      xPosition[i] -= map(snowSize[i], minSnowSize, maxSnowSize, .1, .5);
    }
    
    yPosition[i] += snowSize[i] + direction[i]; 
    
    if(xPosition[i] > width + snowSize[i] || xPosition[i] < -snowSize[i] || yPosition[i] > height + snowSize[i]) {
      xPosition[i] = random(0, width);
      yPosition[i] = -snowSize[i];
    }
    
  }
}
