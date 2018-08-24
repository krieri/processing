int hw, hh, step;
float pwr;
boolean wait;

void setup() {
  size(1000,800);
  hw = (int)width/2;  hh = (int)height/2;
  step = 10;
  stroke(200);  strokeWeight(2);
}

void draw() {
  background(0);
  translate(hw,hh);
  pwr = map(mouseX,0,width,0,2);
  step = int(30-14*pwr);
  int[] prev = {0,0};
  for (int i = 0; i <= width; i += step) {
    wait = true;
    for (int j = 0; j <= height; j += step) {
      float r = sqrt(sq(i-hw)+sq(j-hh));
      float theta = atan2(j-hh,i-hw);
      int[] orig = inv(r,theta);
      if (abs(orig[0]) > hw || abs(orig[1]) > hh) continue;
      if (!wait) line(prev[0],prev[1],orig[0],orig[1]);
      prev = orig;  wait = false;
    }
  }
}

int[] inv(float r, float theta) {
  int[] orig = { round(pow(r,pwr)*cos(theta*pwr)), round(pow(r,pwr)*sin(theta*pwr)) };
  return orig;
}