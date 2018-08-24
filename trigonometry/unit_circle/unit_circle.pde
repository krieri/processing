float r;

void setup() {
  size(800, 800);
  strokeWeight(4);
  noFill();
  if (width > height) r = width*3/7;
  else r = height*3/7;
}

void draw() {
  translate(width/2, height/2);
  background(255);
  float v = atan2(mouseY-height/2, mouseX-width/2);
  stroke(220);
  line(0, -r, 0, r);
  line(-r, 0, r, 0);
  stroke(0,255,0);
  line(0, 0, cos(v)*r, sin(v)*r);
  stroke(255,0,0);
  line(cos(v)*r, 0, cos(v)*r, sin(v)*r);
  stroke(0,0,255);
  line(0, 0, cos(v)*r, 0);
  stroke(0);
  ellipse(0, 0, 2*r, 2*r);
}