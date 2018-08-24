class SquareParticle extends Particle {
  SquareParticle(PVector location) {
    super(location);
  }
  void display() {
    fill(100,100,255,lifespan);
    stroke(0,lifespan);
    rectMode(CENTER);
    rect(pos.x,pos.y,12,12);
  }
}