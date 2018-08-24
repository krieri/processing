class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector location) {
    origin = location.copy();
    particles = new ArrayList<Particle>();
  }
  void addParticle() {
    particles.add(new Particle(origin));
  }
  void applyForce(PVector force) {
    for (Particle p : particles) {
      p.applyForce(force);
    }
  }
  void applyRepeller(Repeller r) {
    for (Particle p : particles) {
      PVector force = r.repel(p);
      p.applyForce(force);
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