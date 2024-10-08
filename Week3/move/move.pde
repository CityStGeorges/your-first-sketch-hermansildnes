float x, y;

void setup()
{
  size(400, 400);
  rectMode(CENTER);
  x = width/2;
  y = height/2;
}

void draw()
{
  rect(x, y, 60, 60);
}

void keyPressed() {
  if (key == 'w') {
    y-=1;
  } else if (key == 's') {
    y +=1;
  } else if (key == 'a') {
    x -=1;
  } else if (key == 'd') {
    x+=1;
  }
}
