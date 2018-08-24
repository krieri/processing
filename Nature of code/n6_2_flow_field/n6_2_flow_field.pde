ArrayList<Vehicle> vehicles;
FlowField flow;
float t;
boolean showfield;

void setup() {
  size(600,600);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 120; i++) {
    vehicles.add(new Vehicle(new PVector(random(width),random(height)),random(2,5),random(0.1,0.5)));
  }
  flow = new FlowField(20);
  t = 0;
  showfield = false;
}
void draw() {
  background(255);
  for (Vehicle v : vehicles) {
    v.follow(flow);
    v.update();
    v.borders();
    v.display();
  }
  if (showfield) {
    flow.display();
  }
  t += 0.02;
  flow.init();
}
void keyPressed() {
  if (key == ' ') {
    showfield = !showfield;
  }
}