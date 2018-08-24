class Attractor {
  float mass;
  PVector pos;
  float G;
  boolean gotBall;
  
  Attractor(int x_, int y_) {
    pos = new PVector(x_,y_);
    mass = 200;
    G = 13;
    gotBall = false;
  }
  PVector attract(Ball b) {
    PVector force = PVector.sub(pos, b.pos);
    float dist = force.mag();
    if (dist < 10) gotBall = true;
    force.normalize();
    float sqDistLim = (dist < 10) ? 10 : sq(dist);
    float str = (G * mass * b.mass) / sqDistLim;
    force.mult(str);
    return force;
  }    
  void display() {
    noStroke();
    fill(0);
    ellipse(pos.x, pos.y, height/15, height/15);
  }
}