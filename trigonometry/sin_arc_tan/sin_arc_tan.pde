void setup() {
  size(1000,500);
  strokeWeight(3);
  noFill();
}

void draw() {
  translate(width/2,height/2);
  background(255);
  stroke(0);
  
  float x = mouseX-width/2;
  float y = mouseY-height/2;
  
  float ang;
  if (x != 0) ang = abs(atan(-y/x));
  else ang = 0;
  
  float hyp1 = sqrt(x*x+y*y);
  float hyp2 = (x*x+y*y)/x;
  
  line(0,0,x,y);
  line(0,0,hyp2,0);
  stroke(255,0,0);
  line(x,0,x,y);
  stroke(0,0,255);
  line(hyp2,0,x,y);
  
  float start, stop;
  if (x > 0) {
    if (y < 0) {
      start = -ang;
      stop = 0;
    } else {
      start = 0;
      stop = ang;
    }
  } else if (y < 0) {
    start = PI;
    stop = PI+ang;
  } else {
    start = PI-ang;
    stop = PI;
  }
  stroke(0,255,0);
  arc(0,0,2*hyp1,2*hyp1,start,stop);
}