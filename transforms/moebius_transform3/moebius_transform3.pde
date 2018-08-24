int pix, hw, hh, mode, magn;
float z1, z2, w1, w2, thr1, thr2;
float[][] p;  color[] buffer;
PImage img;  boolean info, auto;

void setup() {
  size(1000,800);  textSize(25);  fill(255,0,0);
  pix = width*height;  hw = width/2;  hh = height/2;
  magn = 200;  thr1 = 10;  thr2 = 0.1;
  p = new float[4][2];  p_reset();
  buffer = new color[pix];  img = loadImage("bilde4.jpg");
  loadPixels();  img.loadPixels();
  info = false;  auto = false;
  mode = (auto) ? 4 : 3;  if (!auto) noLoop();
}

void draw() {
  float alpha, beta, gamma, delta, sumSq;  int mz1, mz2;
  for (int i = 0; i < width; i++) {
    w1 = i-hw;
    for (int j = 0; j < height; j++) {
      w2 = j-hh;
      alpha = p[1][0] - p[3][0]*w1 + p[3][1]*w2;
      beta = p[1][1] - p[3][0]*w2 - p[3][1]*w1;
      gamma = p[2][0]*w1 - p[2][1]*w2 - p[0][0];
      delta = p[2][0]*w2 + p[2][1]*w1 - p[0][1];
      sumSq = sq(gamma) + sq(delta);
      z1 = (alpha*gamma + beta*delta) / sumSq;
      z2 = (beta*gamma - alpha*delta) / sumSq;
      mz1 = (int)(magn*z1)%img.width;
      mz2 = (int)(magn*z2)%img.height;
      mz1 = (mz1 < 0) ? img.width+mz1 : mz1;
      mz2 = (mz2 < 0) ? img.height+mz2 : mz2;
      buffer[i+j*width] = img.pixels[mz1+mz2*img.width];
    }
  }
  for (int i = 0; i < pix; i++) pixels[i] = buffer[i];
  updatePixels();
  if (info) {
    text("a: " + p[0][0] + ", " + p[0][1] + 'i',25,25);
    text("b: " + p[1][0] + ", " + p[1][1] + 'i',25,50);
    text("c: " + p[2][0] + ", " + p[2][1] + 'i',25,75);
    text("d: " + p[3][0] + ", " + p[3][1] + 'i',25,100);
  }
  if (auto) { p[3][0] += 0.0001;  p[3][1] += 0.0001; }
}

void mouseMoved() {
  if (mode < 2) {
    p[mode][0] = map(mouseX,0,width,-thr1,thr1);
    p[mode][1] = map(mouseY,0,height,-thr1,thr1);
  } else if (mode < 4) {
    p[mode][0] = map(mouseX,0,width,-thr2,thr2);
    p[mode][1] = map(mouseY,0,height,-thr2,thr2);
  }
  redraw();
}

void keyPressed() {
  mode = 4;
  for (int i = 0; i < 4; i++) {
    if (key == char(i + 1 + '0')) mode = i;
  }
  if (key == 'r') { p_reset();  mode = 3; }
  if (key == 's') { save("image.jpg"); }
}

void p_reset() {
  p[0][0] = 0;  p[0][1] = 0;  p[1][0] = 0;  p[1][0] = 3;
  p[2][0] = -0.005;  p[2][1] = -0.005;  p[3][0] = 0.0027;  p[3][1] = 0.025;
}