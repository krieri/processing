class DNA {
  
  ArrayList<Rule> rules;
  
  DNA(ArrayList rules_) {
    rules = rules_;
  }
  
  DNA(int num_rules) {
    rules = new ArrayList<Rule>();
    for (int i = 0; i < num_rules; i++) {
      rules.add(new Rule((int)random(1,4),symbols));
    }
  }
  
  DNA crossover(DNA partner) {
    ArrayList<Rule> newRules = new ArrayList<Rule>(rules);
    newRules.addAll(partner.rules);
    Collections.shuffle(newRules);
    newRules.subList((int)newRules.size()/2,newRules.size()).clear();
    return new DNA(newRules);
  }
  
  void mutate(float rate) {
    for (Rule r : rules) {
      if (random(1) < rate) r.input = symbols.charAt((int)random(symbols.length()));
      if (random(1) < rate) r.prob *= (1 + random(-.1, .1));
      String newOutput = "";
      for (int i = 0; i < r.output.length(); i++) {
        char c = r.output.charAt(i);
        if (random(1) < rate && c != '[' && c != ']') {
          newOutput += symbols.charAt((int)random(symbols.length()));
        } else newOutput += c;
      }
      r.output = newOutput;
    }
    if (random(1) < rate) {
      if (rules.size() > (int)random(4,8)) {
        rules.remove((int)random(rules.size()));
      } else rules.add(new Rule((int)random(1,4),symbols));
    }
  }
}