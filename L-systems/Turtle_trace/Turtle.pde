class Turtle {
  PVector pos;
  PVector vel;
  
  Turtle() {
    pos = new PVector(400,400);
    vel = new PVector(10,0);
  }
  
  void update() {
    pos.add(vel);
    if (pos.x > width) {
      pos.sub(width,0);
    }
    if (pos.x < 0) {
      pos.add(width,0);
    }
    if (pos.y > height) {
      pos.sub(0,height);
    }
    if (pos.y < 0) {
      pos.add(0,height);
    }
  }
  
  void turn(float v) {
    vel.rotate(-v);
  }
  
  void adjust(float s) {
    vel.mult(s);
  }
}