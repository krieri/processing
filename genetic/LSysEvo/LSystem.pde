class Rule {
  char input; // pred, succ;
  float prob;
  String output;
  
  Rule(char input_, float prob_, String output_) {
    input = input_;  prob = prob_;  output = output_;
  }
  Rule(int len_, String avail) {
    input = avail.charAt((int)random(avail.length()));
    boolean branch = (random(1) > .1) ? true : false;
    prob = random(1);  output = (branch) ? "[" : "";
    for (int j = 0; j < len_; j++) {
      output += symbols.charAt((int)random(symbols.length()));
    }
    if (branch) output += "]";
  }
}


String generate(String data, ArrayList<Rule> rules) {
  StringBuffer nextStage = new StringBuffer();
  
  mainLoop:
  for (int i = 0; i < data.length(); i++) {
    char c = data.charAt(i);
    if (c == '[' || c == ']') {
      nextStage.append(c);  continue;
    }
    ArrayList<Rule> candidates = new ArrayList<Rule>();
    for (int j = 0; j < rules.size(); j++) {
      if (rules.get(j).input != c) continue;
      else {
        candidates.add(rules.get(j));
      }
    }
    if (candidates.size() > 1) {
      for (int k = 0; k < 100; k++) {
        for (Rule r : candidates) {
          if (random(1) < r.prob) {
            nextStage.append(r.output);
            continue mainLoop;
          }
        }
      }
    } else if (candidates.size() == 1) {
      nextStage.append(candidates.get(0).output);
    } else nextStage.append(c);
  }
  return nextStage.toString();
}