void setup() {
  size(400, 400);
}

void draw() {
  background(255, 255, 255);
  tree(height/2, width/2, 1);
  tree(height/2-40, width/2-50, 2);
  tree(height/2+40, width/2-50, 0.5);
}

void tree(float x, float y, float scale) {
  rectMode(CENTER);
  fill(200, 200, 200);
  rect(x, y, 20*scale, 100*scale);
  fill(30, 255, 30);
  ellipse(x, y - 35*scale, 45*scale, 60*scale);
}
