class LSystem {
  
  String sentence;
  Rule[] ruleset;
  int gen;
  
  LSystem(String ax, Rule[] r) {
    sentence = ax;
    ruleset = r;
    gen = 0;
  }
  
  
  void generate() {
    
    StringBuffer nextgen = new StringBuffer();
    
    mainLoop:
    for (int i = 0; i < sentence.length(); i++) {
      char cc = sentence.charAt(i);
      //default replacement
      String replace = "" + cc;
      //in case of multiple stochastic rules
      ArrayList<Rule> candidates = new ArrayList<Rule>();
      
      for (int j = 0; j < ruleset.length; j++) {
        char a = ruleset[j].getA();
        if (a != cc) {
          continue;
        } else {
          
          //prioritize context-sensitive rules
          if (ruleset[j].context == true) {
            if (checkContext(ruleset[j].getPred(),ruleset[j].getSucc(),i) == true) {
              if (ruleset[j].stoch == true) {
                candidates.add(ruleset[j]);
              } else {
                replace = ruleset[j].getB();
                nextgen.append(replace);
                continue mainLoop;
              }
            }
          } else if (ruleset[j].stoch == true) {
            candidates.add(ruleset[j]);
          } else {
            replace = ruleset[j].getB();
            nextgen.append(replace);
            continue mainLoop;
          }
        }
      }
      // candidate selection procedure
      if (candidates.size() > 0) {
        boolean done = false;
        while (done != true) {
          for (Rule c : candidates) {
            if ((float)random(0,1) < c.prob) {
              replace = c.getB();
              done = true;
            }
          }
        }
      }
      nextgen.append(replace);
    }
    sentence = nextgen.toString();
    gen++;
  }
  
  
  boolean checkContext(String rp, String rs, int sPos) {
    
    String sp = "";
    String ss = "";
    if (!rp.equals("*")) {
      loop_1:
      for (int i = sPos-1; i >= 0; i--) {
        for (int j = 0; j < cExclude.length(); j++) {
          if (sentence.charAt(i) == cExclude.charAt(j)) {
            continue loop_1;
          }
        }
        sp += sentence.charAt(i);
        if (sp.length() == rp.length()) break;
      }
    }
    if (!rs.equals("*")) {
      loop_2:
      for (int i = sPos+1; i < sentence.length(); i++) {
        for (int j = 0; j < cExclude.length(); j++) {
          if (sentence.charAt(i) == cExclude.charAt(j)) {
            continue loop_2;
          }
        }
        ss += sentence.charAt(i);
        if (ss.length() == rs.length()) break;
      }
    }
    if (sPos >= rp.length() && sPos+rs.length() < sentence.length()) {
      if ((rp.equals(sp) || rp.equals("*")) && (rs.equals(ss) || rs.equals("*"))) {
        return true;
      }
    }
    return false;
  }
  
  
  String getSentence() {
    return sentence;
  }
  
  
  int getGen() {
    return gen;
  }
}