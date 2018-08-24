CVector z;
int hw, hh;
float xlim, ylim, unit;
ArrayList<PVector> trace;

void setup() {
  size(1000,1000);
  hw = (int)width/2;  hh = (int)height/2;
  z = new CVector(0,0);
  unit = 50;  xlim = width/(2*unit);  ylim = height/(2*unit);
  trace = new ArrayList<PVector>();
}

void draw() {
  background(0);
  translate(width/2,height/2);
  stroke(50);  strokeWeight(2);
  for (int i = -hw; i <= hw; i += unit) line(i,-hh,i,hh);
  for (int i = -hh; i <= hh; i += unit) line(-hw,i,hw,i);
  stroke(200);  strokeWeight(3);
  line(-hw,0,hw,0);  line(0,-hh,0,hh);
  z.set(map(mouseX,0,width,-xlim,xlim),map(mouseY,height,0,-ylim,ylim));
  CVector w = f(z);
  fill(0,255,0);
  ellipse(w.a*unit, -w.b*unit, 10, 10);
}

CVector f(CVector cv) {
  return cv.mult(cv);
}