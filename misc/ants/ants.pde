ArrayList<Ant> colony;
ArrayList<Needle> needles;
ScentTrails scents;

void setup() {
  size(800,600);
  colony = new ArrayList<Ant>();
  for (int i = 0; i < 20; i++) {
    colony.add(new Ant(new PVector(10,10), (float)random(1,2)));
  }
  needles = new ArrayList<Needle>();
  for (int i = 0; i < 200; i++) {
    PVector p = new PVector(random(width),random(height));
    needles.add(new Needle(p, random(TWO_PI)));
  }
  scents = new ScentTrails(20);
}

void draw() {
  background(50,120,60);
  float t = 0;
  for (Ant a : colony) {
    
    a.update();
    a.display();
  }
  for (Needle n : needles) {
    n.update();
    n.display();
  }
}