class Predator {
  PVector pos, vel, acc, prev, predict;
  float maxspeed, maxforce, r;
  //float[][] memory;
  
  Predator(float x, float y) {
    pos = new PVector(x,y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    maxspeed = 5;
    maxforce = 0.5;
    //memory = new float[2][2];
    prev = new PVector(0,0);
    predict = new PVector(0,0);
  }
    
  void pursue(Target t) {
    PVector direct = PVector.sub(t.pos,pos);
    float eta = (-vel.mag()+sqrt(vel.mag()*vel.mag()+2*maxforce*direct.mag())/maxforce);
    direct.setMag(maxspeed);
    
    predict = PVector.sub(t.pos,prev);
    predict.mult(eta);
    
    PVector force = PVector.sub(direct,vel,predict.copy());
    force.limit(maxforce);
    applyForce(force);
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);
    prev = t.pos;
    
    //reset memory if the target is standing still or has made a sharp turn
    //if (t.pos.x == memory[1][1] && t.pos.y == memory[1][2] || turn()) {
    //}
    //shift memory values to the right
    //for (int i = memory.length-1; i > 0; i--) {
      //memory[i][1] = memory[i-1][1];
      //memory[i][2] = memory[i-1][2];
    //}
    //add new memory values
    //memory[0][1] = t.pos.x;
    //memory[0][2] = t.pos.y;
  }
  
  void display_self() {
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
  
  void display_plan() {
    stroke(255,0,0);
    strokeWeight(2);
    line(t.pos.x,t.pos.y,t.pos.x+predict.x,t.pos.y+predict.y);
    line(pos.x,pos.y,t.pos.x+predict.x,t.pos.y+predict.y);
  }
}