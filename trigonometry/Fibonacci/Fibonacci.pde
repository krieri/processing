ArrayList<Particle> particles;
PVector angle;
boolean fibonacci;
String info;

void setup() {
  size(600, 600);
  particles = new ArrayList<Particle>();
  angle = new PVector (1.9,0);
  fibonacci = true;
}
void draw() {
  background(0);
  particles.add(new Particle(angle.copy()));
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update();
    p.display();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
  float r;
  if (fibonacci) {
    r = 2.3998;
    info = "137.5°";
  } else {
    r = (map(mouseX,0,width,0,TWO_PI));
    info = nf(r*180/PI,3,1)+"°";
  }
  angle.rotate(r);
  textSize(32);
  fill(255);
  text(info,10,40);
}
void mouseClicked() {
  if (fibonacci) {
    fibonacci = false;
  } else {
    fibonacci = true;
    info = "137.5°";
  }
}