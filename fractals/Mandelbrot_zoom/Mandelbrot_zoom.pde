float xmin, xmax, ymin, ymax, tx, ty;

void setup() {
  size(1200,1000);
  xmin = -2.2;
  xmax = 0.7;
  ymin = -1.3;
  ymax = 1.3;
}
void draw() {
  float x, y, t, a, b, n;
  x = y = n = 0;
  loadPixels();
  for(int i = 0; i < width; i++) {
    a = map(i, 0, width, xmin, xmax);
    for(int j = 0; j < height; j++) {
      b = map(j, 0, height, ymin, ymax);
      while (n < 50) {
        t = x;
        x = sq(x)-sq(y)+a;
        y = 2*t*y+b;
        if (dist(0,0,x,y) > 10) break;
        n += 1; }
      pixels[i+j*width] = color(map(n,0,50,250,0));
      x = y = n = 0; }
    updatePixels();
  }
}
void mousePressed() {
  tx = map(mouseX,0,width,xmin,xmax);
  ty = map(mouseY,0,height,ymin,ymax);
}
void mouseReleased() {
  float dx = map(mouseX,0,width,xmin,xmax) - tx;
  float dy = map(mouseY,0,height,ymin,ymax) - ty;
  if (dx > 0) { xmin = tx; xmax = dx + tx; }
  else if (dx < 0) { xmin = dx + tx; xmax = tx; }
  if (dy > 0) { ymin = ty; ymax = dy + ty; }
  else if (dy < 0) { ymin = dy + ty; ymax = ty; }
}