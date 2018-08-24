class Rule {
  
  char a;
  String b, pred, succ;
  float prob;
  boolean context, stoch;
  
  Rule(char a_, String b_) {
    a = a_;
    b = b_;
    context = false;
    stoch = false;
  }
  
  Rule(char a_, float p, String b_) {
    a = a_;
    prob = p;
    b = b_;
    context = false;
    stoch = true;
  }
  
  Rule(String leftC, char a_, String rightC, String b_) {
    pred = leftC;
    a = a_;
    succ = rightC;
    b = b_;
    context = true;
    stoch = false;
  }
  
  Rule(String leftC, char a_, String rightC, float p, String b_) {
    pred = leftC;
    a = a_;
    succ = rightC;
    prob = p;
    b = b_;
    context = true;
    stoch = true;
  }
  
  String getPred() {
    return pred;
  }
  
  char getA() {
    return a;
  }
  
  String getSucc() {
    return succ;
  }
  
  String getB() {
    return b;
  }
}