Ball[] balls;

void setup() {
  size (400, 300);
  balls = new Ball[30];
  for (int i = 0; i< balls.length; i++) {
    balls[i] = new Ball();
    balls[i].position.x = i*20;
    balls[i].radius = 10;
  }
}

void draw() {
  background(254, 244, 232);
  for (Ball ball : balls) {
    ball.draw();
    ball.move();
    for (Ball otherBall : balls) {
      if (dist(ball.position.x, ball.position.y, otherBall.position.x, otherBall.position.y) < ball.radius+otherBall.radius && dist(ball.position.x, ball.position.y, otherBall.position.x, otherBall.position.y) != 0) {
        ball.colour = color(20,20,200);
      }
    }
  }
}
