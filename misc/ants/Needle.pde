class Needle {
  PVector pos;
  float ori;
  
  Needle(PVector p, float o) {
    pos = new PVector(p.x,p.y);
    ori = o;
  }
  
  void display() {
    stroke(210,160,90);
    fill(110,140,40);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(ori);
    arc(0,0,