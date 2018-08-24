Walker w;
void setup() {
  size(800, 600);
  w = new Walker();
  background(255);
}
void draw() {
  w.step();
  w.render();
}
class Walker {
  int x, y;
  Walker() {
    x = width/2;
    y = height/2;
  }
  void render() {
    stroke(0);
    point(x, y);
  }
  void step() {  
    float choice = (random(1));
    if (choice > 0.75) {
      if (mouseX > x) {
        x += 1;
      } else {
        x -= 1;
      }
    } else if (choice > 0.5) {
      if (mouseY > y) {
        y += 1;
      } else {
        y -= 1;
      }
    } else if (choice > 0.375) {
      x += 1;
    } else if (choice > 0.250) {
      x -= 1;
    } else if (choice > 0.125) {
      y += 1;
    } else {
      y -= 1;
    }
    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
  }
}