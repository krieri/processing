void setup() { size(550,500);  loadPixels();  noLoop(); }

void mouseMoved() { redraw(); }

void draw() {
  float x, y, t, a, b;  int n;
  for(int i = 0; i < width; i++) {
    a = map(i,0,width,-2.2,0.7);
    for(int j = 0; j < height; j++) {
      b = map(j,0,height,-1.3,1.3);
      x = y = n = 0;
      while (n < map(mouseY,0,height,25,0)) {
        t = x;  x = sq(x)-sq(y)+a;  y = 2*t*y+b;
        if (sqrt(sq(x)+sq(y)) > map(mouseX,0,width,0,2.5)) break;
        n++;
      }
      pixels[i+j*width] = color(map(n,0,map(mouseY,0,height,25,0),250,0));
    }
    updatePixels();
  }
}