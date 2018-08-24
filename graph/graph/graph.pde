int unit, xpmin, xpmax, ypmin, ypmax, tx, ty;

void setup() {
  size(800, 600);
  unit = 25;
  xpmax = (int)(width/2);
  xpmin = -xpmax;
  ypmax = (int)(height/2);
  ypmin = -ypmax;
  strokeWeight(3);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  stroke(150);
  line(-width/2,0, width/2,0);
  line(0,-height/2, 0,height/2);
  for (int i = 1; i < (int)(width/2)/unit; i++) {
    line(i*unit,-5, i*unit,5);
    line(-i*unit,-5, -i*unit,5);
  }
  for(int i = 1; i < (int)(height/2)/unit; i++) {
    line(-5,i*unit,5,i*unit);
    line(-5,-i*unit,5,-i*unit);
  }
  float py1, py2, py3, py4, py5, py6;
  py1 = py2 = py3 = py4 = py5 = py6 = 0;
  for (int i = xpmin; i < xpmax; i++) {
    float x = 1.0*i/unit;
    
    /*********FUNCTIONS*********/
    float y1 = pow(x,2)-5*x+3;
    float y2 = 8*x;
    float y3 = sin(1/x); 
    
    if (i > xpmin) {
      stroke(255,0,0);
      line(i-1,py1*unit, i,y1*unit);
      stroke(0,0,255);
      line(i-1,py2*unit, i,y2*unit);
      stroke(0,255,0);
      line(i-1,py3*unit, i,y3*unit);
    }
    py1 = y1;
    py2 = y2;
    py3 = y3;
    //py4 = y4;
    //py5 = y5;
    //py6 = y6;
  }
  if (mousePressed) {
    stroke(100);
    noFill();
    rect(tx,ty, mouseX-width/2-tx,mouseY-height/2-ty);
    println(tx, mouseX, width/2);
  }
}

void mouseWheel(MouseEvent event) {
  if (unit - 5*event.getCount() > 0) {
    unit -= 5*event.getCount();
  }
}

void mousePressed() {
  tx = (int)map(mouseX,0,width,xpmin,xpmax);
  ty = (int)map(mouseY,0,height,ypmin,ypmax);
}

void mouseReleased() {
  int dx = (int)map(mouseX,0,width,xpmin,xpmax) - tx;
  int dy = (int)map(mouseY,0,height,ypmin,ypmax) - ty;
  if (dx > 0) { xpmin = tx; xpmax = dx + tx; }
  else if (dx < 0) { xpmin = dx + tx; xpmax = tx; }
  if (dy > 0) { ypmin = ty; ypmax = dy + ty; }
  else if (dy < 0) { ypmin = dy + ty; ypmax = ty; }
}

void keyPressed() {
  if (key == 'r') {
    unit = 25;
    xpmax = (int)(width/2);
    xpmin = -xpmax;
    ypmax = (int)(height/2);
    ypmin = -ypmax;
  }
}