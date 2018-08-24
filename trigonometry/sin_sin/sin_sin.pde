float b;

void setup() {
  size(800, 800);
  strokeWeight(5);
  b = 200;
}

void draw() {
  translate(0, height/2);
  background(255);
  stroke(230);
  line(0,0,width,0);
  float a, x, xx, k, c, p;
  xx = 0;
  for (int i = 0; i < width; i++) {
    x = map(i, 0, width, 0, TWO_PI);
    k = map(mouseX, width, 0, 0, TWO_PI);
    a = map(mouseY, height, 0, 0, 200);
    c = sqrt(sq(a)+2*a*b*cos(k)+sq(b));
    p = atan2(b*sin(k),(a+b*cos(k)));
    if (i > 0) {
      strokeWeight(5);
      stroke(0,255,0);
      line(i-1, a*sin(xx)+b*sin(xx+k), i, a*sin(x)+b*sin(x+k));
      stroke(255,0,0);
      line(i-1, a*sin(xx), i, a*sin(x));
      stroke(0,0,255);
      line(i-1, b*sin(xx+k), i, b*sin(x+k));
      stroke(0);
      strokeWeight(4);
      line(i-1, c*sin(xx+p), i, c*sin(x+p));
    }
    xx = x;
  }
}