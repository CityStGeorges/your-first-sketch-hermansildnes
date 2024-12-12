class Illustration {
  float position;
  float duration;
  int rating;
  int fellAsleepMinutes;
  int wokeUpMinutes;

  Illustration(float position, float duration, int rating, int fellAsleepMinutes, int wokeUpMinutes) {
    this.position = position;
    this.duration = duration;
    this.rating = rating;
    this.fellAsleepMinutes = fellAsleepMinutes;
    this.wokeUpMinutes = wokeUpMinutes;

    noStroke();
  }
  
  // Not quite sure how processing built-ins work, but came to think abut that naming this function draw might not be the best move
  void draw() {
    // Set the color of the pillar for a given night to be more red the worse it is rated, and more blue/green the better it is rated
    fill(255-(rating*15), 0+(rating*15), 0+(rating*20));
    // Really bad position calculation for each pillar :)
    rect(position+15, 100, 20, duration);
  }
}
