class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  Mover() {
    location = new PVector(random(width/4, 3*width/4), random(height/4, 3*height/4), random(150,450));
    velocity = new PVector(random(-7, 7), random(-7, 7), random(-7,7));
    acceleration = new PVector(0, 0, 0);
    mass = random(1, 2);
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
    } if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    } if (location.y > height) {
      location.y = height;
      velocity.y *= -1;
    } if (location.y < 0) {
      location.y = 0;
      velocity.y *= -1;
    } if (location.z > 600) {
      location.z = 600;
      velocity.z *= -1;
    } if (location.z < 0) {
      location.z = 0;
      velocity.z *= -1;
    }
  }
  void display() {
    stroke(0);
    fill(200);
    pushMatrix();
    translate(location.x, location.y, location.z);
    sphere(mass*10);
    popMatrix();
  }
}