ArrayList<Vehicle> vehicles;

void setup() {
  size(600,600);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 200; i++) {
    vehicles.add(new Vehicle(new PVector(random(width),random(height)),random(5,10),random(0.1,0.5)));
  }
}
void draw() {
  background(255);
  for (Vehicle v : vehicles) {
    v.align(vehicles);
    v.separate(vehicles);
    v.update();
    v.borders();
    v.display();
  }
}