int unit;  float step;

void setup() {
  size(800,800);
  if (width < height) unit = (int)width/2;
  else unit = (int)height/2;
  step = TWO_PI/200;
}

float f(float a) {
  float x = map(mouseX,0,width,0,PI);
  float y = map(mouseY,height,0,0,PI);
  //return sin(a+x)*cos(a+y);
  //return sin(a*x)*cos(a*y);
  return (sin(a*x*10)+2)/4;
  //return (cos(a*x*3)+1)/4;
  //return cos((int)(x*3)*a);
}

void draw() {
  translate(width/2,height/2);
  background(0);
  stroke(75);  strokeWeight(2);
  line(-width/2,0,width/2,0);
  line(0,-height/2,0,height/2);
  for(int i = 1; i < (width/2.0)/unit; i++) {
    line(i*unit,-5,i*unit,5);
    line(-i*unit,-5,-i*unit,5);
  }
  for(int i = 1; i < (height/2.0)/unit; i++) {
    line(-5,i*unit,5,i*unit);
    line(-5,-i*unit,5,-i*unit);
  }
  stroke(0,200,0);
  strokeWeight(5);
  float a, r, rp;
  a = 0;  rp = f(-step)*unit;
  while (a <= TWO_PI) {
    r = f(a)*unit;
    line(r*cos(a),r*sin(a),rp*cos(a-step),rp*sin(a-step));
    rp = r;
    a += step;
  }
}

void mouseWheel(MouseEvent event) {
  if (unit - 20*event.getCount() > 0) {
    unit -= 20*event.getCount();
  }
}