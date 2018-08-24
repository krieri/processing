Attractor a;
Mover[] movers = new Mover[5];

void setup() {
  size(600, 600, P3D);
  for(int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
  a = new Attractor();
}
void draw() {
  background(200, 240, 240);
  a.display();
  for(int i = 0; i < movers.length; i++) {
    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);
    movers[i].update();
    movers[i].display();
  }
}