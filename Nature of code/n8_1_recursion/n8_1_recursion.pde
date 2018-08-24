void setup() {
  size(640,360);
  noLoop();
}
void draw() {
  background(255);
  drawCircle(width/2,height/2,300);
}
void drawCircle(float x, float y, float d) {
  stroke(0);
  noFill();
  ellipse(x,y,d,d);
  while (d > 10) {
    d /= 2;
    drawCircle(x+d,y,d);
    drawCircle(x-d,y,d);
    //drawCircle(x,y+d,d);
    //drawCircle(x,y-d,d);
  }
}