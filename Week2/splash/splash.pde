// Splash

void setup(){
  size(1000,1000);
  background(255,255,255);
}

void draw(){
  fill (mouseX, 248, mouseY, 90);
  noStroke();
  circle(mouseX, mouseY, 50);
}
