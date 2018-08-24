class KochLine {
  PVector start, end;
  
  KochLine(PVector a, PVector b) {
    start = a.copy();
    end = b.copy();
  }
  PVector vrtx(int n) {
    if (n == 0) {
      return start.copy();
    } else if (n == 1) {
      PVector v = PVector.sub(end,start);
      v.div(3);
      v.add(start);
      return v;
    } else if (n == 2) {
      PVector v = PVector.sub(end,start);
      PVector a = start.copy();
      v.div(3);
      a.add(v);
      v.rotate(-PI/3);
      a.add(v);
      return a;
    } else if (n == 3) {
      PVector v = PVector.sub(end,start);
      v.mult(2/3.0);
      v.add(start);
      return v;
    } else {
      return end.copy();
    }
  }
  void display() {
    stroke(0);
    line(start.x,start.y,end.x,end.y);
  }
}