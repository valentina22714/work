// box
float bx;
float by;
int boxSize = 60;

boolean overBox = false;
boolean locked = false;

float xOffset = 0.0; 
float yOffset = 0.0; 

PImage bgImg;


void setup() {
  size(600, 400);
  bx = width/2.0;
  by = height/2.0;
  rectMode(RADIUS);  
  strokeWeight(4);
  frameRate(25);
}

void draw() { 

  // Test if the cursor is over the box 
  overBox = (mouseX > bx-boxSize && mouseX < bx+boxSize && mouseY > by-boxSize && mouseY < by+boxSize);
  
  // Draw the box
  fill(mouseX%255,mouseY%255,0);
  circle(bx, by, boxSize);
  
  //saveFrame("output/capture-####.tif");
}

void mousePressed() {
  if(overBox) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 
}

void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}

void mouseReleased() {
  locked = false;
}
