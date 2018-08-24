class Vehicle {
  PVector pos, vel, acc;
  float maxspeed, maxforce, r;
  
  Vehicle(PVector p, float ms, float mf) {
    pos = new PVector(p.x,p.y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    maxspeed = ms;
    maxforce = mf;
    r = 3;
  }
  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);
  }
  void applyForce(PVector force) {
    acc.add(force);
  }
  void follow(FlowField flow) {
    PVector desired = flow.lookup(pos);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,vel);
    steer.limit(maxforce);
    applyForce(steer);
  }
  void display() {
    float theta = vel.heading() + PI/2;
    fill(0,0,255);
    stroke(0);
    
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    popMatrix();
  }
  void borders() {
    if (pos.x < -r)        pos.x = width+r;
    if (pos.y < -r)        pos.y = height+r;
    if (pos.x > width+r)   pos.x = -r;
    if (pos.y > height+r)  pos.y = -r;
  }
}