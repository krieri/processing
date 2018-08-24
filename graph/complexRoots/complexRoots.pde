int unit, n, disp;
PVector z;
ArrayList<PVector> w;

void setup() {
  size(800,800);
  if (width < height) unit = (int)width/10;
  else unit = (int)height/10;
  z = new PVector(0,0);
  w = new ArrayList<PVector>();
  n = 2;
  disp = 1;
}

void draw() {
  translate(width/2, height/2);
  background(20);
  stroke(100);
  strokeWeight(2);
  line(-width/2,0,width/2,0);
  line(0,-height/2,0,height/2);
  noFill();
  ellipse(0,0, 2*unit,2*unit);
  for(int i = 1; i < (width/2.0)/unit; i++) {
    line(i*unit,-5,i*unit,5);
    line(-i*unit,-5,-i*unit,5);
  }
  for(int i = 1; i < (height/2.0)/unit; i++) {
    line(-5,i*unit,5,i*unit);
    line(-5,-i*unit,5,-i*unit);
  }
  z.set(mouseX-width/2, mouseY-height/2);
  float r = sqrt(sq(z.x/unit)+sq(-z.y/unit));
  float theta = atan2(-z.y,z.x);
  float _x = pow(r,1.0/n)*cos(theta/n);
  float _y = pow(r,1.0/n)*sin(theta/n);
  w.add(new PVector(_x,_y));
  for (int i = 2; i <= n; i++) {
    float tx = _x;
    _x = _x*cos(TWO_PI/n)-_y*sin(TWO_PI/n);
    _y = tx*sin(TWO_PI/n)+_y*cos(TWO_PI/n);
    w.add(new PVector(_x,_y));
  }
  strokeWeight(15);
  for (PVector v : w) {
    if (w.indexOf(v) == disp-1) stroke(0,0,255);
    else stroke(0,255,0);
    point(v.x*unit,-v.y*unit);
  }
  pushMatrix();
  resetMatrix();
  fill(200);
  textSize(20);
  textAlign(RIGHT);
  if (n > 2) text(nf(n,1,0),30,30);
  textSize(32);
  textAlign(LEFT);
  text("√("+nf(z.x/unit,1,3)+nfp(-z.y/unit,1,3)+"i)", 20,45);
  textAlign(RIGHT);
  text(nf(r,1,3)+"e^(i*"+nf(theta,1,3)+")", width-20,45);
  if (disp != 0) {
    textSize(28);
    text(nf(w.get(disp-1).mag(),1,3)+"e^(i*"+nf(atan2(w.get(disp-1).x,-w.get(disp-1).y),1,3)+")",width-20,100);
    textAlign(LEFT);
    text("#"+nf(disp)+" = "+nf(w.get(disp-1).x,1,3)+nfp(w.get(disp-1).y,1,3)+"i", 20,100);
  }
  popMatrix();
  w.clear();
}

void keyPressed() {
  if (key == 'r') {
    n = 2;
    disp = 1;
  }
  else if (key == 'd') n ++;
  else if (key == 's' && n > 2) {
    n--;
    if (disp > n) disp = n;
  }
  else if (key == 'f') {
    if (disp >= n) disp = 0;
    else disp++;
  }
  else if (key == 'a') {
    if (disp <= 0) disp = n;
    else disp--;
  }
}

void mouseWheel(MouseEvent event) {
  if (unit - 5*event.getCount() > 0) {
    unit -= 5*event.getCount();
  }
}