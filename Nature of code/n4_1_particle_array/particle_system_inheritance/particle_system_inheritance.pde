ParticleSystem system;
PVector mouse;

void setup() {
  size(800, 600);
  mouse = new PVector(mouseX,mouseY);
  system = new ParticleSystem(mouse);
}
void draw() {
  background(200,240,240);
  mouse = new PVector(mouseX,mouseY);
  system.addParticle();
  system.run();
}