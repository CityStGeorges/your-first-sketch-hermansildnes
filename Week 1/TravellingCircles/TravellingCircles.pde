float x, y;

void setup() {
  size(400, 400);
  x = 0;
  y = 0;

}

void draw() {
  background(0,0,0);
  x = x+1;
  y = y-1;

  translate(width/2, height/2);
  ellipse(x, y, 60, 60);
  ellipse(x, -y, 60, 60);
  ellipse(-x, y, 60, 60);
  ellipse(-x, -y, 60, 60);
}
