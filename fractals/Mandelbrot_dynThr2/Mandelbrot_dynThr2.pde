void setup() {
  size(550,500); }
void draw() {
  float x, y, t, a, b;
  int n;
  x = y = n = 0;
  loadPixels();
  for(int i = 0; i < width; i++) {
    a = map(i,0,width,-2.2,0.7);
    for(int j = 0; j < height;j++) {
      b = map(j,0,height,-1.3,1.3);
      while (n < 25) {
        t = x;
        x = sq(x)-sq(y)+a;
        y = map(mouseX,0,width,-8,8)*t*y+b;
        if (dist(0,0,x,y) > 2.5) break;
        n ++; }
      pixels[i+j*width] = color(map(n,0,25,250,0));
      x = y = n = 0; }
    updatePixels(); } }