class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  boolean full;
  
  ParticleSystem(PVector location) {
    origin = location.copy();
    particles = new ArrayList<Particle>();
    full = false;
  }
  void addParticle() {
    particles.add(new Particle(origin));
  }
  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      p.display();
      if (p.isDead()) {
        particles.remove(i);
        full = true;
      }
    }
  }
}