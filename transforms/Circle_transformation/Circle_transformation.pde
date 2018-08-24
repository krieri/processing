int r, w;

void setup() {
  size(1000,500);
  r = 50;
  w = 4;
}

void draw() {
  background(0);
  stroke(65);
  strokeWeight(2);
  line(0,height/2,width/2,height/2);
  line(width/4,0,width/4,height);
  
  if (mouseX < width/2) {
    stroke(0,255,0);
    strokeWeight(w);
    noFill();
    ellipseMode(CENTER);
    ellipse(mouseX,mouseY,r,r);
    if (mouseX > width/2-r) {
      fill(0);
      noStroke();
      rect(width/2,0,width/2,height);
    }
  }
  stroke(65);
  strokeWeight(2);
  line(width/2,height/2,width,height/2);
  line(width*3/4,0,width*3/4,height);
  stroke(200);
  line(width/2,0,width/2,height);
  
  int mx = mouseX-width/4;
  //flipping the y coordinate
  int my = height/2-mouseY;
  pushMatrix();
  translate(width*3/4,height/2);
  stroke(0,0,255);
  strokeWeight(w);
  int tx, ty;
  for (int x = -r; x <= r; x++) {
    for (int y = -r; y <= r; y++) {
      if (x*x+y*y > (r-w)*(r-w) && (x*x+y*y) < r*r) {
        //flipping y again
        tx = (int)(sq(mx+x)-sq(my+y));
        ty = -2*(mx+x)*(my+y);
        point(tx,ty);
      }
    }
  }
  popMatrix();
}