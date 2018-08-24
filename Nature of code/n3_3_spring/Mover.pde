class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  Mover() {
    location = new PVector(random(width/3,2*width/3), random(height/3,2*height/3));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(5, 10);
  }
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    //velocity.limit(10);
    acceleration.mult(0);
  }
  void bounce() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    } if (location.y > height) {
      location.y = height;
      velocity.y *= -1;
    } else if (location.y < 0) {
      location.y = 0;
      velocity.y *= -1;
    }
  }
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(100, 100);
    ellipse(location.x, location.y, mass*5, mass*5);
  }
}