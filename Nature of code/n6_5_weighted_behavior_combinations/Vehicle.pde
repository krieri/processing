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
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,pos);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,vel);
    steer.limit(maxforce);
    return steer;
  }
  PVector align(ArrayList<Vehicle> vehicles) {
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
    PVector steer;
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      steer = PVector.sub(sum,vel);
      steer.limit(maxforce);
      } else {
      steer = new PVector(0,0);
    }
    return steer;
  }
  PVector separate (ArrayList<Vehicle> vehicles) {
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
    PVector steer;
    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);
      steer = PVector.sub(sum,vel);
      steer.limit(maxforce);
    } else {
      steer = new PVector(0,0);
    }
    return steer;
  }
  void applyBehaviors(ArrayList<Vehicle> vehicles) {
    PVector separateForce = separate(vehicles);
    //PVector alignForce = align(vehicles);
    PVector seekForce = seek(new PVector(mouseX,mouseY));
    separateForce.mult(map(mouseY,0,height,0,2));
    seekForce.mult(map(mouseX,0,width,0,2));
    applyForce(separateForce);
    //applyForce(alignForce);
    applyForce(seekForce);
  }
  void display() {
    fill(0,100,255);
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