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
    force.limit(maxforce);
    acc.add(force);
  }
  
  void follow(Path p) {
    PVector fpos = vel.copy();
    fpos.setMag(40);
    int closest = 0;
    float distance = PVector.dist(pos,p.points[0]);
    for (int i = 1; i <= p.points.length-1; i++) {
      if (PVector.dist(pos,p.points[i]) < distance) {
        closest = i;
        distance = PVector.dist(pos,p.points[i]);
      }
    }
    PVector v0 = PVector.sub(pos,p.points[closest]);
    PVector v1 = new PVector(0,0);
    PVector v2 = new PVector(0,0);
    PVector steer = new PVector(0,0);
    float d1 = 0;
    float d2 = 0;
    strokeWeight(1);
    if (closest != p.points.length-1) {
      v1 = PVector.sub(p.points[closest+1],p.points[closest]);
      d1 = v0.mag()*sin(acos((v0.dot(v1))/(v0.mag()*v1.mag())));
      d2 = 2*d1;
    }
    if (closest != 0) {
      v2 = PVector.sub(p.points[closest-1],p.points[closest]);
      d2 = v0.mag()*sin(acos((v0.dot(v2))/(v0.mag()*v2.mag())));
      d1 = 2*d2;
    }
    if (d1 < d2) {
      steer = v1.setMag(v0.mag()).sub(v0);
    } else {
      steer = v2.setMag(v0.mag()).sub(v0);
    }
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void display() {
    float theta = vel.heading() + PI/2;
    fill(0,0,255);
    stroke(0);
    strokeWeight(8);
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