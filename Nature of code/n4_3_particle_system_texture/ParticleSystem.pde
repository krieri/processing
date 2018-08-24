class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  PImage img;
  
  ParticleSystem(PVector location, PImage img_) {
    origin = location.copy();
    particles = new ArrayList<Particle>();
    img = img_;
  }
  void addParticle() {
    particles.add(new Particle(origin, img));
  }
  void applyForce(PVector force) {
    for (Particle p : particles) {
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