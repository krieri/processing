ArrayList<Vehicle> vehicles;
FlowField flow;
PImage img;
boolean showfield;

void setup() {
  img = loadImage("image1.jpg");
  size(736,739);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 120; i++) {
    vehicles.add(new Vehicle(new PVector(random(width),random(height)),random(2,5),random(0.1,0.5)));
  }
  flow = new FlowField(5);
  showfield = false;
}
void draw() {
  image(img,0,0);
  for (Vehicle v : vehicles) {
    v.follow(flow);
    v.update();
    v.borders();
    v.display();
  }
  if (showfield) {
    flow.display();
  }
  flow.init();
}
void keyPressed() {
  if (key == ' ') {
    showfield = !showfield;
  }
}