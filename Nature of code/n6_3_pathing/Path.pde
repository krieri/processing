class Path {
  PVector[] points;
  float r;
  
  Path(int turns, float radius) {
    r = radius;
    points = new PVector[turns];
    points[0] = new PVector(0,height/2);
    for (int i = 1; i <= turns-1; i++) {
      float pn = random(1);
      if (pn > 0.5)  pn = 1;
      if (pn != 1)   pn = -1;
      points[i] = new PVector(i*width/(points.length-1),points[i-1].y+50*pn*noise(i));
    }
  }
  
  void display() {
    strokeWeight(r*2);
    stroke(200);
    for (int i = 0; i <= points.length-2; i++) {
      line(points[i].x,points[i].y,points[i+1].x,points[i+1].y);
    }
  }
}