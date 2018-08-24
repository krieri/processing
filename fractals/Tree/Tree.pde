float angle;

void setup() { size(800, 600); }

void draw() {
  background(0);
  translate(width/2, height);
  angle = (mouseX/(float)width) * PI;
  branch(190);
}
void branch(float len) {
  strokeWeight(len/6);
  stroke(75, map(len,50,0,130,255), 0);
  line(0,0,0,-len);
  translate(0,-len);
  len *= 0.67;
  if (len > 2) {
    pushMatrix();  rotate(angle);  branch(len);  popMatrix();
    pushMatrix();  rotate(-angle); branch(len);  popMatrix();
  }
}