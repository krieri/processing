class DNA {
  
  ArrayList<Gene> genes;
  String seed;
  float fitness;
  
  DNA(ArrayList genes_) {
    genes = genes_;
  }
  
  DNA crossover(DNA partner) {
    ArrayList<Gene> newGenes = new ArrayList<Gene>();
    
    return new DNA(newGenes);
  }
  
  DNA mutate() {
    ArrayList<Gene> newGenes = new ArrayList<Gene>();
    
    return new DNA(newGenes);
  }
}


class Gene {
  
  ArrayList<Gene> subset;
  Rule rule;
  boolean parent;
  
  Gene(ArrayList subset_) {
    subset = subset_;  rule = null;  parent = true;
  }
  Gene(Rule rule_) {
    subset = null;  rule = rule_;  parent = false;
  }
}