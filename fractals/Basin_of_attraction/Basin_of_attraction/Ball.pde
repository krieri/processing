class Ball {
  PVector pos, vel, acc;
  float mass;
  
  Ball(int x_, int y_) {
    pos = new PVector(x_,y_);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    mass = 100;
  }
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
  void update() {
    vel.limit(15);
    //acc.limit(15);
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(100,100);
    ellipse(pos.x, pos.y, 10, 10);
  }
}