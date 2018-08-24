float scale;

void setup() {
  size(600,600);
  scale = 2; }

void draw() {
  float x, y, ix, jy, t;
  int n = 0;
  loadPixels();
  for(int i = 0; i < width; i++) {
    x = ix = map(i,0,width,-scale,scale);
    for(int j = 0; j < height; j++) {
      y = jy = map(j,0,height,-scale,scale);
      while (n < 50) {
        t = x;
        x = sq(x)-sq(y)+map(mouseX,0,width,-scale,scale);
        y = 2*t*y+map(mouseY,0,height,-scale,scale);
        if (dist(0,0,x,y) > 2) break;
        n++; }
      pixels[i+j*width] = color(map(n,0,50,250,0));
      x = ix;
      y = jy;
      n = 0; }
    updatePixels(); } }