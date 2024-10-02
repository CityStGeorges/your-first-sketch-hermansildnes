float x;
float y;

void setup(){
  size(400,400);
  x = 0;
  y = height;
}

void draw(){
  x = x+1;
  y = y-1;
  ellipse(x,y,60,60);
}
