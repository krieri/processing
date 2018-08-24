float txmin, txmax, tymin, tymax, zxmin, zxmax, zymin, zymax, jxmin, jxmax, jymin, jymax, jzxmin, jzxmax, jzymin, jzymax, s;
boolean jzoom;

void setup() {
  size(1000,500);
  txmin = zxmin = jxmin = jzxmin = -2.2;
  txmax = zxmax = jxmax = jzxmax = 0.8;
  tymax = zymax = jymax = jzymax = (abs(txmin)+abs(txmax))*height/width;
  tymin = zymin = jymin = jzymin = -tymax;
  jzoom = false;
  s = 3;
  drawMB(); }

void drawMB() {
  float x, y, t, a, b, n;
  x = y = n = 0;
  loadPixels();
  for(int i = 0; i < width/2; i++) {
    a = map(i,0,width/2,zxmin,zxmax);
    for(int j = 0; j < height; j++) {
      b = map(j,0,height,zymax,zymin);
      while (n < 50) {
        t = x;
        x = sq(x)-sq(y)+a;
        y = 2*t*y+b;
        if (dist(0,0,x,y) > 3) break;
        n += 1; }
      pixels[i+j*width] = color(map(n,0,50,250,0));
      x = y = n = 0; }
    updatePixels(); } }

void draw() {
  float x, y, ix, jy, t;
  int n = 0;
  if (jzoom == true) {
    jxmin = jzxmin;  jxmax = jzxmax;  jymin = jzxmin;  jymax = jzymax; }
  else {
    jxmin = txmin;  jxmax = txmax;  jymin = tymin;  jymax = tymax; }
  loadPixels();
  for(int i = width/2; i < width; i++) {
    x = ix = map(i,width/2,width,jxmin,jxmax);
    for(int j = 0; j < height; j++) {
      y = jy = map(j,0,height,jymax,jymin);
      while (n < 50) {
        t = x;
        x = sq(x)-sq(y)+map(mouseX,0,width/2,zxmin,zxmax);
        y = 2*t*y+map(mouseY,0,height,zymax,zymin);
        if (dist(0,0,x,y) > 2) break;
        n++; }
      pixels[i+j*width] = color(map(n,0,50,250,0));
      x = ix;
      y = jy;
      n = 0; }
    updatePixels(); } }

void mouseClicked() {
  float xshift = map(mouseX,0,width/2,zxmin,zxmax)-(zxmin+zxmax)/2;
  float yshift = map(mouseY,0,height,zymax,zymin)-(zymin+zymax)/2;
  zxmin += xshift + (zxmax-zxmin)/s;
  zxmax += xshift - (zxmax-zxmin)/s;
  zymin += yshift + (zymax-zymin)/s;
  zymax += yshift - (zymax-zymin)/s;
  if (jzoom == true) {
    jzxmin += (jzxmax-jzxmin)/s;
    jzxmax -= (jzxmax-jzxmin)/s;
    jzymin += (jzymax-jzymin)/s;
    jzymax -= (jzymax-jzymin)/s; }
  drawMB(); }

void keyPressed() {
  if (jzoom == false) { jzoom = true; }
  else { jzoom = false; } }