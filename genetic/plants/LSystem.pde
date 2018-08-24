class Rule {
  
  char a;
  String b;
  float prob;
  
  Rule(char a_, String b_, float p_) {
    a = a_;  b = b_;  prob = p_;
  }

  String getB() { return b; }
}


String generate(String code, Rule[] ruleset) {
  
  StringBuffer nextStage = new StringBuffer();
  boolean skip = false;
  
  mainLoop:
  for (int i = 0; i < code.length(); i++) {
    char c = code.charAt(i);
    String replace = "" + c;
    
    // Skip function parameters
    if (c == '(') skip = true;
    if (skip) {
      nextStage.append(replace);
      if (c == ')') skip = false;
      continue;
    }
    
    // Begin candidate selection procedure
    ArrayList<Rule> candidates = new ArrayList<Rule>();
    
    for (int j = 0; j < ruleset.length; j++) {
      if (ruleset[j].a != c) continue;
      else {
        
      }
    }
    // Candidate selection procedure
    if (candidates.size() > 0) {
      boolean done = false;
      while (!done) {
        for (Rule r : candidates) {
          if (random(1) < r.prob) {
            replace = r.getB();
            done = true;
          }
        }
      }
    }
    nextStage.append(replace);
  }
  return nextStage.toString();
}