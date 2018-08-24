ArrayList<Vehicle> vehicles;

void setup() {
  size(600,600);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 200; i++) {
    vehicles.add(new Vehicle(new PVector(random(width),random(height)),random(5,10),random(0.1,0.5)));
  }
}
void draw() {
  background(190,240,240);
  for (Vehicle v : vehicles) {
    v.applyBehaviors(vehicles);
    v.update();
    v.display();
    if (mousePressed) {
      PVector repel = PVector.sub(v.pos,new PVector(mouseX,mouseY));
      repel.setMag(map(repel.mag(),0,100,10,0));
      v.applyForce(repel);
    }
  }
}