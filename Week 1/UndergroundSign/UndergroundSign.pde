void setup() {
  size(600,400);
}

void draw() {
  stroke(255,0,0);
  strokeWeight(75);
  noFill();
  ellipse(width/2,height/2, 300, 300);
  noStroke();
  fill(0,0,255);
  rectMode(CENTER);
  rect(width/2,height/2,450,75);
  fill(255,255,255);
  textSize(65);
  textAlign(CENTER);
  text("UNDERGROUND", width/2,223);

}
