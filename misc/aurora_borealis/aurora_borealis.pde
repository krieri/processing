static final int NUM_LINES = 30;
float t;

void setup() {
  size(800, 600);
}
void draw() {
  background(20);
  strokeWeight(5);
  translate(width/2, height/2);
  for (int i = 0; i < NUM_LINES; i++) {
    stroke(20, 220, 200, 255 - map(i, 0, NUM_LINES, 255, 0));
    line(x1(t + i), y1(t + i), x2(t + i), y2(t + i));
  }
  t += 0.5;
}

float x1(float t) {
  return sin(t / 8) * mouseX/2 + cos(t / 5);
}
float y1(float t) {
  return sin(t / 14) * mouseY/2 - cos(t / 15);
}
float x2(float t) {
  return sin(t / 10) * mouseX - cos(t / 10);
}
float y2(float t) {
  return sin(t / 12) * mouseY + cos(t / 20);
}