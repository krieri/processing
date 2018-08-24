class LSystem {
  
  String sentence;
  Rule[] ruleset;
  int gen;
  
  LSystem(String axiom, Rule[] r) {
    sentence = axiom;
    ruleset = r;
    gen = 0;
  }
  
  void generate() {
    StringBuffer nextgen = new StringBuffer();
    for (int i = 0; i < sentence.length(); i++) {
      char cc = sentence.charAt(i);
      String replace = "" + cc;
      for (int j = 0; j < ruleset.length; j++) {
        char a = ruleset[j].getA();
        if (a == cc) {
          replace = ruleset[j].getB();
          break;
        }
      }
      nextgen.append(replace);
    }
    sentence = nextgen.toString();
    gen++;
  }
  
  String getSentence() {
    return sentence;
  }
  
  int getGeneration() {
    return gen;
  }
}