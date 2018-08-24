Path p;
ArrayList<Vehicle> vehicles;

void setup() {
  size(800,600);
  p = new Path((int)(random(2,10)),(float)random(50,100));
  vehicles = new ArrayList<Vehicle>();
}

void draw() {
  background(255);
  if (keyPressed) {
    p = new Path((int)(random(2,10)),(float)random(25));
  }
  p.display();
  for (Vehicle v : vehicles) {
    v.follow(p);
    v.update();
    v.borders();
    v.display();
  }
}

void mousePressed() {
  PVector mouse = new PVector(mouseX,mouseY);
  vehicles.add(new Vehicle(mouse,random(5,10),random(2,6)));
}