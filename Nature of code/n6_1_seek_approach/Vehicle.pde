class Vehicle {
  PVector pos, vel, acc;
  float maxspeed, maxforce, r;
  Vehicle(float x, float y) {
    pos = new PVector(x,y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    maxspeed = 10;
    maxforce = 0.5;
    r = 0;
  }
  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);
    r = 100;
  }
  void applyForce(PVector force) {
    acc.add(force);
  }
  void seek(PVector target) {
    PVector desired = PVector.sub(target,pos);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,vel);
    steer.limit(maxforce);
    applyForce(steer);
  }
  void arrive(PVector target) {
    PVector desired = PVector.sub(target,pos);
    float d = desired.mag();
    float m = map(d,0,r,0,maxspeed);
    desired.setMag(m);
    PVector steer = PVector.sub(desired,vel);
    applyForce(steer);
  }
  void display() {
    float theta = vel.heading() + PI/2;
    fill(0,0,255);
    stroke(0);
    
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    beginShape();
    vertex(0, -20);
    vertex(-10, 20);
    vertex(10, 20);
    endShape(CLOSE);
    popMatrix();
  }
}