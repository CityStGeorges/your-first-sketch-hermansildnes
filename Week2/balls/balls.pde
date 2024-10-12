class Ball
{
  PVector position;    // Position of the ball.
  PVector velocity;    // Amount it moves on each redraw.
  float radius;        // Radius of ball.
  color colour;        // Colour of ball.
 
  // -- This 'constructor' method is called when we instantiate a new ball and initialises its state.
  Ball()
  {
    position = new PVector(0,height/2);
    velocity = new PVector(random(-3,3),random(-3,3));
    radius = 1;
    colour   = color(214, 93, 69);
  }
 
  // -- These are methods associated with any instance of a Ball object.
  // -- draw() draws the ball at its current position.
  void draw()
  {
    noStroke();
    fill(colour);
    circle(position.x, position.y, radius * 2);
  }
 
  // -- Moves the ball according to its current velocity and checks for boundary bounces.
  void move()
  {
    position.x = position.x + velocity.x;
    position.y = position.y + velocity.y;
 
    if (position.x-radius < 0 && velocity.x < 0)
    {
      // Escaping to the left, start moving right.
      velocity.x = -1*velocity.x;
    }
    else if (position.x+radius > width && velocity.x > 0)
    {
      // Escaping to the right, start moving left.
      velocity.x = -1*velocity.x;
    }
 
    if (position.y-radius < 0 && velocity.y < 0)
    {
      // Escaping upwards, start moving down.
      velocity.y = -1*velocity.y;
    }
    else if (position.y+radius > height && velocity.y > 0)
    {
      // Escaping downwards, start moving up.
      velocity.y = -1*velocity.y;
    }
  }
}
