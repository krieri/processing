GoL life;

void setup() {
  size(600,600);
  frameRate(24);
  life = new GoL();
}

void draw() {
  background(0);
  life.generate();
  life.display();
}

void mousePressed() {
  life.init();
}