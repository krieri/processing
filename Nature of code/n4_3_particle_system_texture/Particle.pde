class Particle {
  PVector pos, vel, acc;
  int lifespan;
  PImage img;
  
  Particle(PVector location, PImage img_) {
    pos = location.get();
    vel = new PVector(random(-1,1),random(-1,1));
    acc = new PVector(0,0.05);
    lifespan = 255;
    img = img_;
  }
  void update() {
    vel.add(acc);
    pos.add(vel);
    lifespan -= 2.5;
    acc.mult(0);
  }
  void applyForce(PVector force) {
    acc.add(force);
  }
  boolean isDead() {
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }
  void display() {
    imageMode(CENTER);
    tint(255,lifespan);
    image(img,pos.x,pos.y,60,60);
    //noStroke();
    //fill(255,lifespan);
    //ellipse(pos.x,pos.y,32,32);
  }
}