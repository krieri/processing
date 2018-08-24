float t = 0;
void setup() {
  size(600,400);
  frameRate(30);
}
void draw() {
  background(0);
  fill(255);
  float a = random(0,width);
  float b = noise(t);
  b = map(b, 0, 1, 0, width);
  ellipse(a, 2*height/3, 40, 40);
  ellipse(b, height/3, 40, 40);
  t += 0.05;
}