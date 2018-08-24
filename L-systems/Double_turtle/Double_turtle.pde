Turtle t = new Turtle();
Turtle u = new Turtle();
int n = 1;

void setup() {
  size(800,800);
  background(255);
  frameRate(200);
  u.vel.mult(-1);
}

void draw() {
  stroke(0,35);
  strokeWeight(3);
  t.turn(0.05);
  u.turn(0.05);
  t.run();
  u.run();
  t.adjust(0.999);
  u.adjust(0.999);
  n++;
}