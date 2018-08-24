class KochLine {
  PVector start, end;
  
  KochLine(PVector a, PVector b) {
    start = a.copy();
    end = b.copy();
  }
  void wiggle() {
    PVector vel = PVector.random2D();
    start.add(vel);
    vel = PVector.random2D();
    end.add(vel);
  }
  PVector kochA() {
    return start.copy();
  }
  PVector kochB() {
    PVector v = PVector.sub(end,start);
    v.div(3);
    v.add(start);
    return v;
  }
  PVector kochC() {
    PVector v = PVector.sub(end,start);
    PVector a = start.copy();
    v.div(3);
    a.add(v);
    v.rotate(-PI/3);
    a.add(v);
    return a;
  }
  PVector kochD() {
    PVector v = PVector.sub(end,start);
    v.mult(2/3.0);
    v.add(start);
    return v;
  }
  PVector kochE() {
    return end.copy();
  }
  void display() {
    stroke(0);
    line(start.x,start.y,end.x,end.y);
  }
}