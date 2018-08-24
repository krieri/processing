Ball[] balls;
float G;

void setup() {
  size(600, 600);
  balls = new Ball[5];
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
  G = 0.03;
}

void draw() {
  background(200, 240, 240);
  for (Ball b : balls) {
    PVector force_sum = b.calcForce();
    b.applyForce(force_sum);
    b.update();
    b.bounce();
    b.display();
  }
}