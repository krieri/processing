size(1100,1000);
float x, y, t, a, b;
x = y = 0;
loadPixels();
for(int i = 0; i < width; i++) {
  for(int j = 0; j < height; j++) {
    a = map(i,0,width,-2.2,0.7);
    b = map(j,0,height,-1.3,1.3);
    int n = 0;
    while (n < 50) {
      t = x;
      x = sq(x)-sq(y)+a;
      y = 2*t*y+b;
      if (sqrt(sq(x)+sq(y)) > 3) break;
      n += 1; }
    pixels[i+j*width] = color(map(n,0,50,250,0));
    x = y = 0; }
  updatePixels(); }