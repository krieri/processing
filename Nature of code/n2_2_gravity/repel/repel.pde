Ball[] balls;

void setup() {
  size(500, 500);
  balls = new Ball[5];
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
}
void draw() {
  background(200, 240, 240);
  translate(width/2,height/2);
  for (Ball b : balls) {
    b.applyForce();
    b.update();
    b.display();
    line(0,0,b.pos.x,b.pos.y);
  }
}