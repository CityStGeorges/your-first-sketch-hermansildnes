//Colour

int red;

void setup(){
  size(400,400);
  red = 128;
}

void draw()
{
  background(100);
  fill(red, 128, 128);
  rect(100, 100, 60, 60);
}

void keyPressed(){
  if (key == 'R') {
    red+=10;
  }
  if (key == 'r') {
    red -=10;
  }
}
