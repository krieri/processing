class Vehicle {
  PVector pos, vel, acc;
  float maxspeed, maxforce, r;
  
  Vehicle(PVector p, float ms, float mf) {
    pos = new PVector(p.x,p.y);
    vel = new PVector(random(1,10),random(1,10));
    acc = new PVector(0,0);
    maxspeed = ms;
    maxforce = mf;
    r = 10;
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
  void align(ArrayList<Vehicle> vehicles) {
    float neighborDist = 25;
    PVector sum = new PVector(0,0);
    int count = 0;
    for (Vehicle other : vehicles) {
      float d = PVector.dist(pos,other.pos);
      if (d > 0 && d < neighborDist) {
        sum.add(other.vel);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      PVector steer = PVector.sub(sum,vel);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }
  void separate (ArrayList<Vehicle> vehicles) {
    float desired = r*2;
    PVector sum = new PVector();
    int count = 0;
    for (Vehicle other : vehicles) {
      float d = PVector.dist(pos,other.pos);
      if ((d > 0) && (d < desired)) {
        PVector diff = PVector.sub(pos,other.pos);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum,vel);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }
  void display() {
    float theta = vel.heading() + PI/2;
    fill(0,0,255);
    stroke(0);
    ellipse(pos.x,pos.y,r,r);
  }
  void borders() {
    if (pos.x < -r)        pos.x = width+r;
    if (pos.y < -r)        pos.y = height+r;
    if (pos.x > width+r)   pos.x = -r;
    if (pos.y > height+r)  pos.y = -r;
  }
}