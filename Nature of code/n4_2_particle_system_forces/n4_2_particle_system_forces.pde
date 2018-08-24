ParticleSystem system;
Repeller r;
PVector mouse;

void setup() {
  size(800, 600);
  mouse = new PVector(mouseX,mouseY);
  system = new ParticleSystem(mouse);
  r = new Repeller(new PVector(width/2,height/2));
}
void draw() {
  background(200,240,240);
  mouse = new PVector(mouseX,mouseY);
  PVector gravity = new PVector(0,0.1);
  system.applyForce(gravity);
  if (mousePressed) {
    PVector wind = new PVector(0.1,0);
    system.applyForce(wind);
  }
  r.display();
  system.applyRepeller(r);
  system.addParticle();
  system.run();
}