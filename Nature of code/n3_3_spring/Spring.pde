class Spring {
  float k;
  float restLength;
  float displacement;
  Spring(float a, float b) {
    k = a;
    restLength = b;
  }
  void connect(Mover m) {
    PVector force = PVector.sub(m.location,origin);
    displacement = force.mag() - restLength;
    force.normalize();
    force.mult(-1 * k * displacement);
    m.applyForce(force);
  }
}