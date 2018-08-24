import java.util.Random;
Random generator;

void setup() {
  size(400, 400);
  background(0);
  generator = new Random();
}

void draw() {
  float num = (float) generator.nextGaussian();
  float x = num * 60;
  noStroke();
  fill(random(255), random(255), random(255));
  translate(width/2, height/2);
  rotate(random(TWO_PI));
  ellipse(x,0,16,16);
}