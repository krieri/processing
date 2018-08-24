Vehicle v;
PVector mouse;

void setup() {
  size(600,600);
  v = new Vehicle(width/2,height/2);
}
void draw() {
  background(255);
  mouse = new PVector(mouseX,mouseY);
  
  fill(255,0,0);
  stroke(0);
  strokeWeight(2);
  ellipse(mouseX,mouseY,20,20);
  
  float distance = PVector.dist(v.pos,mouse);
  if (distance <= v.r) {
    v.arrive(mouse);
  } else {
    v.seek(mouse);
  }
  v.update();
  v.display();
}