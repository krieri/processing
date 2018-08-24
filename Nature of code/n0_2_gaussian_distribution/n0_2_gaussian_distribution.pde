import java.util.Random;
Random generator;
void setup() {
  size(800, 200);
  background(255);
  generator = new Random();
  smooth();
}
void draw() {
  float xloc = (float)generator.nextGaussian();
  float sd = 120;
  float mean = width/2;
  xloc = (xloc * sd) + mean;
  noStroke();
  fill(0, 10);
  ellipse(xloc, height/2, 16, 16);
}