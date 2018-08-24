PVector origin;
Mover bob;
Spring s;
PVector gravity;

void setup() {
  size(640,360);
  origin = new PVector(width/2,0);
  bob = new Mover();
  s = new Spring(0.1,height/2);
  gravity = new PVector(0, 0.3);
}
void draw() {
  background(255);
  s.connect(bob);
  //gravity.mult(bob.mass);
  bob.applyForce(gravity);
  bob.update();
  bob.display();
  line(origin.x,origin.y,bob.location.x,bob.location.y);
}