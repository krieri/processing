class CVector {
  float a, b;
  
  CVector(float a_, float b_) {
    a = a_;  b = b_;
  }
  
  void set(float a_, float b_) {
    a = a_;  b = b_;
  }
  CVector add(CVector w) {
    return new CVector(a+w.a, b+w.b);
  }
  CVector sub(CVector w) {
    return new CVector(a-w.a, b-w.b);
  }
  CVector mult(CVector w) {
    return new CVector(a*w.a-b*w.b, a*w.b+b*w.a);
  }
  CVector div(CVector w) {
    return new CVector((a*w.a+b*w.b)/(w.a*w.a+w.b*w.b),
                        (b*w.a-a*w.b)/(w.a*w.a+w.b*w.b));
  }
}