// Chess Board

void setup() {
  size(1028, 1028);
  noStroke();
}

void draw() {
  for (int i = 0; i<8; i++) {
    for (int j = 0; j<8; j++) {
      if ((i+j)%2 == 1) {
        fill(255, 255, 255);
      } else {
        fill(0, 0, 0);
      }
      rect(width/8*j, height/8*i, width/8, height/8);
    }
  }
}
