class LSystem {
  String sentence;  Rule[] ruleset;  int gen;
  
  LSystem(String axiom, Rule[] r) {
    sentence = axiom;  ruleset = r;  gen = 0;
  }
  String getSentence() { return sentence; }
  int getGeneration() { return gen; }
  
  void generate() {
    StringBuffer nextGen = new StringBuffer();
    for (int i = 0; i < sentence.length(); i++) {
      char c = sentence.charAt(i);
      String replace = "" + c;
      for (int j = 0; j < ruleset.length; j++) {
        char a = ruleset[j].getA();
        if (a == c) {
          replace = ruleset[j].getB();
          break;
        }
      }
      nextGen.append(replace);
    }
    sentence = nextGen.toString();
    gen++;
  }
}