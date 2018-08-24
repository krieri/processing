class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector location) {
    origin = location.copy();
    particles = new ArrayList<Particle>();
  }
  void addParticle() {
    float r = random(1);
    if (r > 0.5) {
      particles.add(new SquareParticle(origin));
    } else {
      particles.add(new Particle(origin));
    }
  }
  void run() {
    origin = mouse;
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      p.display();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}