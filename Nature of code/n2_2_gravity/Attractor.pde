class Attractor {
  float mass;
  PVector location;
  float G;
  
  Attractor() {
    location = new PVector(width/2, height/2);
    mass = 20;
    G = 0.02;
  }
  PVector attract(Mover m) {
    //Direction
    PVector force = PVector.sub(location, m.location);
    force.normalize();
    //Magnitude
    float distance = force.mag();
    float strength = (G * mass * m.mass) / (distance*distance);
    //In combination
    force.mult(strength);
    return force;
  }
  void display() {
    stroke(0);
    fill(0);
    ellipse(location.x, location.y, mass*2, mass*2);
  }
}