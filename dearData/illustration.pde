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

  void draw() {
    fill(110-(rating*15), 50+(rating*10), 100+(rating*15));
    rect(position, 100, 40, duration);
  }
}
