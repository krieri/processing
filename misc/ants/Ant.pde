class Ant {
  PVector pos,vel;
  float size;
  Array inventory;
  boolean ret; //returning home
  
  Ant(PVector p, float s) {
    pos = new PVector(p.x,p.y);
    vel = new PVector(0.2,0.2);
    size = s;
    inventory = new Array[1];
    ret = false;
  }
  
  void follow(ScentTrails s) {
    vel = (s.lookup(pos));
    vel.setMag(4*size);
    if (ret) {
      vel.mult(-1);
    }
  }
  
  void search() {
  }
  
  void attack() {
  }
  
  void update() {
    pos.add(vel);
  }
  
  void display(float t) {
    float theta = vel.heading();
    noStroke();
    fill(0);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    ellipse(-3.2*size,0,3.2*size,2.4*size);
    ellipse(0,0,3.6*size,1.2*size);
    ellipse(3.1*size,0,2.6*size,2.2*size);
    
    popMatrix();
  }
}