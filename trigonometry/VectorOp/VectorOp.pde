PVector stat_op;
int unit;
boolean disp_sum, disp_prod, disp_cprod;

void setup() {
  size(800,600);
  stat_op = new PVector(0,0);
  unit = 25;
  disp_sum = disp_prod = disp_cprod = true;
}

void draw() {
  background(255);
  translate(width/2,height/2);
  stroke(0,100);
  strokeWeight(2);
  line(-width/2,0,width/2,0);
  line(0,-height/2,0,height/2);
  for(int i = 1; i < (int)(width/2)/unit; i++) {
    line(i*unit,-5,i*unit,5);
    line(-i*unit,-5,-i*unit,5);
  }
  for(int i = 1; i < (int)(height/2)/unit; i++) {
    line(-5,i*unit,5,i*unit);
    line(-5,-i*unit,5,-i*unit);
  }
  if (mousePressed) {
    stat_op = new PVector(mouseX-width/2,mouseY-height/2);
  }
  stroke(255,0,0);
  strokeWeight(4);
  line(0,0,stat_op.x,stat_op.y);
  stroke(0,0,255);
  line(0,0,mouseX-width/2,mouseY-height/2);
  
  //flip y axes to avoid confusion in product calculation
  float x1 = stat_op.x;
  float y1 = -stat_op.y;
  float x2 = (mouseX-width/2);
  float y2 = -(mouseY-height/2);
  PVector sum = new PVector(x1+x2,y1+y2);
  PVector prod = new PVector(x1*x2/unit,y1*y2/unit);
  PVector cprod = new PVector((x1*x2-y1*y2)/unit,(x1*y2+x2*y1)/unit);
  if (disp_sum) {
    stroke(50);
    line(0,0,sum.x,-sum.y);
  }
  if (disp_prod) {
    stroke(0,255,0);
    line(0,0,prod.x,-prod.y);
  }
  if (disp_cprod) {
    stroke(255,0,255);
    line(0,0,cprod.x,-cprod.y);
  }
  //flip back y
}

void mouseWheel(MouseEvent event) {
  if (unit - 5*event.getCount() > 0) {
    stat_op.div(unit);
    unit -= 5*event.getCount();
    stat_op.mult(unit);
  }
}

void keyPressed() {
  if (key == 'q') {
    if (disp_sum) disp_sum = false;
    else disp_sum = true;
  } else if (key == 'w') {
    if (disp_prod) disp_prod = false;
    else disp_prod = true;
  } else if (key == 'e') {
    if (disp_cprod) disp_cprod = false;
    else disp_cprod = true;
  }
}
    