class Population {
  
  Plant[] pop;
  int gen;
  
  Population(int size) {
    pop = new Plant[size];
    for (int i = 0; i < pop.length; i++) {
      pop[i] = new Plant(new PVector(random(0,width),random(0,height)), new DNA(6), "FF");
    }
    gen = 0;
  }
  
  void evaluate() {
    
  }
  
  void prune() {
    
  }
}


class Plant {
  
  PVector pos;
  DNA genotype;
  String[] phenotype;
  
  Plant(PVector pos_, DNA dna, String seed) {
    pos = pos_;  genotype = dna;  phenotype = seed;
  }
  
  void display() {
    for (int i = 0; i < phenotype[-1].length(); i++) {
      switch(phenotype[-1].charAt(i)) {
        case 'F':  line(0,0,10,0);   break;
        case 'L':  shape(leaf);      break;
        case '[':  pushMatrix();     break;
        case ']':  popMatrix();      break;
        default:                     break;
      }
    }
  }
}