class Particle {
  PVector pos, vel;
  int lifespan;
  Particle(PVector v) {
    pos = new PVector(width/2,height/2);
    vel = v;
    lifespan = 200;
  }
  void update() {
    vel.mult(0.995);
    pos.add(vel);
    lifespan -= 1;
  }
  boolean isDead() {
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }
  void display() {
    stroke(50,lifespan);
    fill(230,170,50,lifespan);
    ellipse(pos.x,pos.y,35-lifespan/18,35-lifespan/18);
  }
}