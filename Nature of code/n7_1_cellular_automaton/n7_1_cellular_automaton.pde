CA ca;

void setup() {
  size(640,800);
  frameRate(24);
  background(255);
  //int[] ruleset = {0,1,0,1,1,0,1,0};
  int[] ruleset = {0,1,1,1,1,0,0,0};
  // {000, 001, 010, 011, 100, 101, 110, 111}
  ca = new CA(ruleset);
}

void draw() {
  background(255);
  ca.display();
  ca.generate();
}