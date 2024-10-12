// Target
float x, y, radius;

void setup() {
  size(1000, 1000);
  background(255, 255, 255);
  radius = random(10,100);
  x = random(radius, width-radius);
  y = random(radius, height-radius);

}

void draw() {

  noStroke();
  circle(x, y, radius*2);
  if (isMouseInsideCircle(x, y)) {
    fill(220, 50, 50);
  } else {
    fill (255, 248, 231, 60);
  }
}

boolean isMouseInsideCircle(float circleX, float circleY) {
  if (dist(circleX, circleY, mouseX, mouseY) < radius) {
    return true;
  } else {
    return false;
  }
}

void mouseClicked() {
  if (isMouseInsideCircle(x,y)) {
    fill(255, 248,231, 60);
    radius = random(10,100);
    x = random(radius, width-radius);
    y = random(radius, height-radius);
    
  }
}
