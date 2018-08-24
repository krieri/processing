Predator p;
Target t;

void setup() {
  size(800, 600);
  p = new Predator(width/2,height/2);
  t = new Target(mouseX,mouseY);
}

void draw() {
  background(255);
  
  t.update();
  t.display();
  p.pursue(t);
  p.display_self();
  p.display_plan();
  p.update();
}