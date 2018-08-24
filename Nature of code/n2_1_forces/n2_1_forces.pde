Mover[] movers;

void setup() {
  size(640, 360);
  movers = new Mover[10];
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}
void draw() {
  background(200, 240, 240);
  
  for (Mover m : movers) {
    PVector gravity = new PVector(0, 0.3);
    //multiply by mass so that it will cancel out in apply.Force
    gravity.mult(m.mass);
    m.applyForce(gravity);
    if (mousePressed) {
      PVector wind = new PVector(0.2, 0);
      m.applyForce(wind);
    }
    PVector drag = m.velocity.get();
    drag.normalize();
    drag.mult(-1);
    float c = 0.001;
    float speed = m.velocity.mag();
    drag.mult(c*speed*speed);
    m.applyForce(drag);
    
    m.update();
    m.bounce();
    m.display();
  }
}