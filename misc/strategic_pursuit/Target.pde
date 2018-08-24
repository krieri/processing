class Target {
  PVector pos;
  
  Target(float x, float y) {
    pos = new PVector(x,y);
  }
  
  void update() {
    pos = new PVector(mouseX,mouseY);
  }
  
  void display() {
    fill(0,255,0);
    stroke(0);
    ellipse(pos.x,pos.y,20,20);
  }
}