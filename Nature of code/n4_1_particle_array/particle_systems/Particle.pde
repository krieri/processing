class Particle {
  PVector pos, vel, acc;
  int lifespan;
  Particle(PVector location) {
    pos = location.get();
    vel = new PVector(random(-1,1),random(-1,1));
    acc = new PVector(0,0.05);
    lifespan = 255;
  }
  void update() {
    vel.add(acc);
    pos.add(vel);
    lifespan -= 2;
  }
  boolean isDead() {
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }
  void display() {
    stroke(0,0,0,lifespan);
    fill(100,100,255,lifespan);
    ellipse(pos.x,pos.y,12,12);
  }
}