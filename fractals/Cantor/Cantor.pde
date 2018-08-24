void setup() {
  size(640,360);
  noLoop();
}
void draw() {
  background(255);
  cantor(0, 100, width);
}
void cantor(float x,float y,float l) {
  noStroke();
  fill(0);
  if (l >= 1) {
    rect(x,y,l,10);
    y += 30;
    cantor(x,y,l/3);
    cantor(x+l*2/3,y,l/3);
  }
}