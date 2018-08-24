class Population {
  
  float mutationRate;
  DNA[] pop;
  ArrayList<DNA> matingPool;
  String target;
  int gen;
  boolean finished;
  int perfectScore;
  
  Population(String p, float m, int num) {
    target = p;
    mutationRate = m;
    pop = new DNA[num];
    for (int i = 0; i < pop.length; i++) {
      pop[i] = new DNA(target.length());
    }
    calcFitness();
    matingPool = new ArrayList<DNA>();
    finished = false;
    gen = 0;
    perfectScore = int(pow(2,target.length()));
  }
  
  void calcFitness() {
    for (int i = 0; i < pop.length; i++) {
      pop[i].fitness(target);
    }
  }
  
  void select() {
    matingPool.clear();
    float maxFitness = 0;
    for (int i = 0; i < pop.length; i++) {
      if (pop[i].fitness > maxFitness) {
        maxFitness = pop[i].fitness;
      }
    }
    for (int i = 0; i < pop.length; i++) {
      float fitness = map(pop[i].fitness,0,maxFitness,0,1);
      int n = int(fitness*100);
      for (int j = 0; j < n; j++) {
        matingPool.add(pop[i]);
      }
    }
  }
  
  void generate() {
    for (int i = 0; i < pop.length; i++) {
      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));
      DNA partnerA = matingPool.get(a);
      DNA partnerB = matingPool.get(b);
      DNA child = partnerA.crossover(partnerB);
      child.mutate(mutationRate);
      pop[i] = child;
    }
    gen++;
  }
  
  String getBest() {
    float record = 0.0f;
    int index = 0;
    for (int i = 0; i < pop.length; i++) {
      if (pop[i].fitness > record) {
        index = i;
        record = pop[i].fitness;
      }
    }
    if (record == perfectScore) finished = true;
    return pop[index].getPhrase();
  }
  
  boolean finished() {
    return finished;
  }
  
  int getGen() {
    return gen;
  }
  
  float getAvgFitness() {
    float total = 0;
    for (int i = 0; i < pop.length; i++) {
      total += pop[i].fitness;
    }
    return total/pop.length;
  }
  
  String allPhrases() {
    String everything = "";
    int displayLimit = min(pop.length,50);
    for (int i = 0; i < displayLimit; i++) {
      everything += pop[i].getPhrase() + "\n";
    }
    return everything;
  }
}