class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  
  Ball() {
    pos = new PVector(random(width/3,2*width/3),random(height/3,2*height/3));
    vel = new PVector(random(10),random(10));
    acc = new PVector(0,0);
    mass = random(30,80);
  }
  void applyForce() {
    PVector force = PVector.div(pos,mass);
    force.mult(-.01);
    acc.add(force);
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
    ellipse(pos.x,pos.y,mass/2,mass/2);
  }
}