class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  
  Ball() {
    pos = new PVector(random(width),random(height));
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    mass = random(5,20);
  }
  PVector pull(Ball b) {
    PVector force = PVector.sub(pos, b.pos);
    float distance = force.mag();
    float strength = (G*mass*b.mass)/(distance*distance);
    force.mult(strength);
    return force;
  }
  PVector calcForce() {
    PVector force_sum = new PVector(0,0);
    for (Ball a : balls) {
      if (a != this) {
        force_sum.add(a.pull(this));
      }
    }
    return force_sum;
  }
  void applyForce(PVector force) {
      PVector f = PVector.div(force,mass);
      acc.add(f);
  }
  void bounce() {
    if (pos.x > width) {
      pos.x = width;
      vel.x *= -1;
    } if (pos.x < 0) {
      pos.x = 0;
      vel.x *= -1;
    } if (pos.y > height) {
      pos.y = height;
      vel.y *= -1;
    } if (pos.y < 0) {
      pos.y = 0;
      vel.y *= -1;
    }
  }
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(100,100);
    ellipse(pos.x,pos.y,mass*3,mass*3);
  }
}