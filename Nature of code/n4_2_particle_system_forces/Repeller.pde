class Repeller {
  PVector pos;
  Repeller(PVector position) {
    pos = position;
  }
  PVector repel(Particle p) {
    PVector distance = PVector.sub(pos,p.pos);
    float strength = -10/distance.mag();
    distance.normalize();
    PVector force = distance.mult(strength);
    return force;
  }
  void display() {
    noStroke();
    fill(255,0,0);
    ellipse(pos.x,pos.y,20,20);
  }
}