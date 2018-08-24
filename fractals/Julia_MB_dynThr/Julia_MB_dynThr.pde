float xmin, xmax, offset, ymin, ymax, escThr;
int imax, maxIter;  boolean adj;

void setup() {
  size(1500,600);
  imax = (int)height*5/2;
  xmin = -2.2;  xmax = 0.7;
  ymin = -1.3;  ymax = 1.3;
  offset = -(xmin+xmax)/2;
  maxIter = 50;  escThr = 3;
  adj = false;
  loadPixels();  noLoop();
  drawMB();
}

void draw() {
  float x, y, xj, yj, t, mx, my, cxmin, cxmax;  int n;
  mx = map(mouseX,0,height,-2.2,0.7);
  my = map(mouseY,height,0,-1.3,1.3);
  cxmin = (xmin+offset)*1.5;  cxmax = (xmax+offset)*1.5;
  for(int i = height; i < imax; i++) {
    x = map(i,height,imax,cxmin,cxmax);
    for(int j = 0; j < height; j++) {
      y = map(j,height,0,ymin*1.2,ymax*1.2);
      xj = x;  yj = y;  n = 0;
      while (n < maxIter) {
        t = xj;  xj = sq(xj)-sq(yj)+mx;  yj = 2*t*yj+my;
        if (sqrt(sq(xj)+sq(yj)) > escThr) break;
        n++;
      }
      pixels[i+j*width] = color(map(n,0,maxIter,255,0));
    }
  }
  updatePixels();
}

void drawMB() {
  float x, y, a, b, t;  int n;
  for(int i = 0; i < height; i++) {
    a = map(i,0,height,xmin,xmax);
    for(int j = 0; j < height; j++) {
      b = map(j,height,0,ymin,ymax);
      x = y = n = 0;
      while (n < maxIter) {
        t = x;  x = sq(x)-sq(y)+a;  y = 2*t*y+b;
        if (sqrt(sq(x)+sq(y)) > escThr) break;
        n++;
      }
      pixels[i+j*width] = color(map(n,0,maxIter,255,0));
    }
  }
  updatePixels();
}

void mouseMoved() {
  int n = 0;
  if (adj) {
    escThr = map(mouseX,0,height,0,3);
    maxIter = (int)map(mouseY,height,0,1,60);
    if (n < 3) {
      for (int i = 0; i < width*height; i++) pixels[i] = color(255);
      n++;
    }
    drawMB();
  } else redraw();
}

void keyPressed() { if (key == 'a') adj = adj ? false : true; }