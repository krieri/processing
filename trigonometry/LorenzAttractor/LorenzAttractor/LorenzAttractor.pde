float x, y, z, a, b, c, dt, n;
ArrayList<PVector> points;

void setup() {
  size(800,600,P3D);
  background(0);
  x = 0.01;
  y = 0;
  z = 0;
  a = 10.0;
  b = 28.0;
  c = 8.0/3;
  dt = 0.01;
  points = new ArrayList<PVector>();
  frameRate(300);
  n = 0;
}

void draw() {
  float dx = a*(y-x)*dt;
  float dy = (x*(b-z)-y)*dt;
  float dz = (x*y-c*z)*dt;
  x += dx;  y += dy;  z += dz;
  points.add(new PVector(x,y,z));
  
  background(0);
  translate(width/2, height/2, 20);
  scale(5);
  rotateY(n);
  stroke(0,255,100);
  strokeWeight(0.2);
  noFill();
  beginShape();
  for (PVector v : points) {
    vertex(v.x, v.y, v.z);
  }
  endShape();
  n += 0.001;
}