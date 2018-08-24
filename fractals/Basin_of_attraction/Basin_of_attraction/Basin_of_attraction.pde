Attractor A, B, C;
Ball b;
int xp, yp, unit, n;

void setup() {
  size(200,200);
  A = new Attractor(int(width/2), int(height*3/8));
  B = new Attractor(int(width/2-height/(4*sqrt(3))), int(height*5/8));
  C = new Attractor(int(width/2+height/(4*sqrt(3))), int(height*5/8));
  b = new Ball(0,0);
  xp = yp = 0;
  unit = 2;
  n = 0;
  frameRate(1000);
  loadPixels();
}

void draw() {
  PVector force_A = A.attract(b);
  PVector force_B = B.attract(b);
  PVector force_C = C.attract(b);
  b.applyForce(force_A);
  b.applyForce(force_B);
  b.applyForce(force_C);
  b.update();
  if (A.gotBall || B.gotBall || C.gotBall || n > 10000) {
    color c;
    if (A.gotBall) c = color(255,0,0);
    else if (B.gotBall) c = color(255,255,0);
    else if (C.gotBall) c = color(0,0,255);
    else c = color(255,255,255);
    if (xp < width) xp++;
    else if (yp < height-unit) {
      xp = 0;
      yp++;
      println(yp);
    }
    else {
      updatePixels();
      A.display();
      B.display();
      C.display();
      save("image.jpg");
      save("image.tif");
      save("image.png");
      println("complete");
      noLoop();
    }
    b.pos.set(xp,yp);
    b.vel.mult(0);
    b.acc.mult(0);
    A.gotBall = B.gotBall = C.gotBall = false;
    //noStroke();
    //fill(c);
    //rect(xp-unit,yp,unit,unit);
    pixels[xp+yp*width] = c;
    n = 0;
  }
  n++;
}