ArrayList<ParticleSystem> systems;

void setup() {
  size(800, 600);
  systems = new ArrayList<ParticleSystem>();
}
void draw() {
  background(200,240,240);
  for (int i = systems.size()-1; i >= 0; i--) {
    ParticleSystem ps = systems.get(i);
    ps.run();
    if (ps.full == false) {
      ps.addParticle();
    }
    if (ps.particles.isEmpty()) {
      systems.remove(ps);
    }
  }
}
void mousePressed() {
  systems.add(new ParticleSystem(new PVector(mouseX,mouseY)));
}