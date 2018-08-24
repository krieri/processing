float xmin, xmax, offset, ymin, ymax;  int imax;

void setup() {
  size(1250,500);
  imax = (int)height*5/2;
  xmin = -2.2;  xmax = 0.7;
  ymin = -1.3;  ymax = 1.3;
  offset = -(xmin+xmax)/2;
  loadPixels();  noLoop();
  
  float x, y, a, b, t;  int n;
  for(int i = 0; i < height; i++) {
    a = map(i,0,height,xmin,xmax);
    for(int j = 0; j < height; j++) {
      b = map(j,height,0,ymin,ymax);
      x = y = n = 0;
      while (n < 50) {
        t = x;  x = sq(x)-sq(y)+a;  y = 2*t*y+b;
        if (sqrt(sq(x)+sq(y)) > 3) break;
        n++;
      }
      pixels[i+j*width] = color(map(n,0,50,255,0));
    }
  }
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
      while (n < 50) {
        t = xj;  xj = sq(xj)-sq(yj)+mx;  yj = 2*t*yj+my;
        if (sqrt(sq(xj)+sq(yj)) > 3) break;
        n++;
      }
      pixels[i+j*width] = color(map(n,0,50,255,0));
    }
  }
  updatePixels();
}

void mouseMoved() { redraw(); }