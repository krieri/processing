int pix;  float hw, hh;  color[] buffer;

void setup() {
  size(600,600);  pix = width*height;
  hw = width/2;  hh = height/2;
  buffer = new color[pix];
  loadPixels();  noLoop();
}

void draw() {
  background(0);  stroke(0,255,0);  strokeWeight(1);
  for (int i = 0; i <= width; i+= width/30) line(i,0,i,height);
  for (int i = 0; i <= height; i+= height/30) line(0,i,width,i);
  
  float lat, lon, x, y, c, a, d;
  a = TWO_PI*mouseX/width;  d = 300*mouseY/height;
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      x = i-hw;  y = j-hh;  c = sqrt(x*x+y*y);
      lon = atan2(y,x);  lat = PI-2*atan(c/d);
      lat += a;  //transform
      c = d*tan((PI-lat)/2);
      x = c*cos(lon)+hw;  y = c*sin(lon)+hh;
      if (x >= 0 && y >= 0 && x < width && y < height) {
        buffer[i+j*width] = get(floor(x),floor(y));
      } else buffer[i+j*width] = color(0);
    }
  }
  for (int i = 0; i < pix; i++) pixels[i] = buffer[i];
  updatePixels();
}

void mouseMoved() { redraw(); }