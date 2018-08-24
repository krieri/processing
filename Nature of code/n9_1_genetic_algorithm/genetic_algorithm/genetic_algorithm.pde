String target;
int popmax;
float mutationRate;
Population pop;

void setup() {
  size(600,200);
  target = "To be or not to be";
  popmax = 150;
  mutationRate = 0.05;
  pop = new Population(target, mutationRate, popmax);
}

void draw() {
  pop.select();
  pop.generate();
  pop.calcFitness();
  displayInfo();
  if (pop.finished()) {
    println(millis()/1000.0);
    noLoop();
  }
}

void displayInfo() {
  background(255);
  String answer = pop.getBest();
  textAlign(LEFT);
  fill(0);
  textSize(16);
  text("Best phrase:",20,30);
  textSize(32);
  text(answer,20,75);
  textSize(12);
  text("total generations: " + pop.getGen(),20,140);
  text("average fitness: " + nf(pop.getAvgFitness(),0,2),20,155);
  text("total population: " + popmax,20,170);
  text("mutation rate: " + int(mutationRate * 100) + "%",20,185);
  textSize(10);
  text("All phrases:\n" + pop.allPhrases(),450,10);
}