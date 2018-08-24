ParticleSystem system;
PVector mouse;

void setup() {
  size(800,600,P2D);
  mouse = new PVector(mouseX,mouseY);
  PImage img = loadImage("png6.png");
  system = new ParticleSystem(mouse, img);
}
void draw() {
  background(0);
  blendMode(ADD);
  mouse = new PVector(mouseX,mouseY);
  PVector gravity = new PVector(0,-0.06);
  system.applyForce(gravity);
  if (mousePressed) {
    PVector wind = new PVector(0.1,0);
    system.applyForce(wind);
  }
  system.addParticle();
  system.run();
}