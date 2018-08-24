class Population {
  ArrayList<Vessel> pop;
  int gen;
  
  Population(int size, int num_rules, String axiom_, float len_, float theta_) {
    pop = new ArrayList<Vessel>();
    for (int i = 0; i < size; i++) {
      pop.add(new Vessel(new PVector(random(-250,250),random(-250,250)),
              new DNA(num_rules), axiom_, len_, theta_));
    }
    gen = 0;
  }
  
  void evaluate() {
    // optimal leaf distribution
    // balanced, symmetric branching
    // minimum total length
    for (Vessel v : pop) {
      int score = 0;
      PVector trace = new PVector(0,0,0);
      PVector dir = new PVector(0,-1,0);  // (x, -z, -y)
      float len = v.init_len;
      float theta = v.init_theta;
      ArrayDeque traceStack = new ArrayDeque();
      ArrayDeque dirStack = new ArrayDeque();
      ArrayDeque lenStack = new ArrayDeque();
      ArrayList<PVector> leaves = new ArrayList<PVector>();
      // Traverse
      for (int i = 0; i < v.phenotype.length(); i++) {
        switch(v.phenotype.charAt(i)) {
          case 'F': {
            beginShape(); vertex(trace.x,trace.y,trace.z);
            vertex(trace.x+0.0001,trace.y,trace.z);
            trace.add(dir.copy().mult(len));
            vertex(trace.x,trace.y,trace.z);
            endShape();
            score -= len + sqrt(sq(trace.y)+sq(trace.z));
                                       break; }
          case 'L': {
            translate(trace.x,trace.y,trace.z);
            shape(leaf);
            translate(-trace.x,-trace.y,-trace.z);
            for (PVector l : leaves) {
              float dist = sqrt(sq(l.x-trace.x)+sq(l.y-trace.y)+sq(l.z-trace.z));
              if (dist >= 20) score += 100;
              else if (dist < 1) score -= 50;
              else score -= 50/dist;
            }
            leaves.add(trace.copy());  break; }
          case '+':  len *= 1.2;      break;
          case '-':  len *= 0.8;      break;
          case '\\': {
            dir.set(dir.x, dir.y*cos(theta)-dir.z*sin(theta),
            dir.y*sin(theta)+dir.z*cos(theta));  break; }
          case '/': {
            dir.set(dir.x, dir.y*cos(theta)+dir.z*sin(theta),
                -dir.y*sin(theta)+dir.z*cos(theta));  break; }
          case 'v': {
            dir.set(dir.x*cos(theta)+dir.z*sin(theta), dir.y,
                -dir.x*sin(theta)+dir.z*cos(theta));  break; }
          case '^': {
            dir.set(dir.x*cos(theta)-dir.z*sin(theta), dir.y,
                dir.x*sin(theta)+dir.z*cos(theta));  break; }
          case '<': {
            dir.set(dir.x*cos(theta)-dir.y*sin(theta),
                dir.x*sin(theta)+dir.y*cos(theta), dir.z);  break; }
          case '>': {
            dir.set(dir.x*cos(theta)+dir.y*sin(theta),
                -dir.x*sin(theta)+dir.y*cos(theta), dir.z);  break; }
          case '|':  dir.set(-dir.x, -dir.y, dir.z);  break;
          case '[': {
            traceStack.push(trace);  dirStack.push(dir);
            lenStack.push(len);  break; }
          case ']': {
            trace.set((PVector)traceStack.pop());
            dir.set((PVector)dirStack.pop());
            len = (float)lenStack.pop();  break; }
          default:  break;
        }
      }
      v.fitness = score;
    }
  }
  
  void nextGen() {
    Collections.sort(pop);
    ArrayList<Vessel> newPop = new ArrayList<Vessel>();
    ArrayList<DNA> matingPool = new ArrayList<DNA>();
    int count = 0;
    while (count < pop.size()*2) {
      for (Vessel v : pop) {
        if (random(1) > pop.indexOf(v)/pop.size()) {
          matingPool.add(v.genotype);  count++;
        }
      }
    }
    Collections.shuffle(matingPool);
    for (int i = 0; i < matingPool.size(); i += 2) {
      DNA newDna = matingPool.get(i).crossover(matingPool.get(i+1));
      newPop.add(new Vessel(new PVector(random(-250,250),random(-250,250)),
              newDna, axiom, 15, 0));
    }
    pop = newPop;  gen++;
    for (Vessel v : pop) v.genotype.mutate(.01);
  }
  
  void reset() {
    ArrayList<Vessel> newPop = new ArrayList<Vessel>();
    for (Vessel v : pop) {
      newPop.add(new Vessel(v.pos,v.genotype,axiom,v.init_len,v.init_theta));
    }
    pop = newPop;
  }
}


class Vessel implements Comparable<Vessel>{
  PVector pos;
  DNA genotype;
  String phenotype; // String[] devStages
  float init_len, init_theta;
  int fitness, stage;
  
  Vessel(PVector pos_, DNA dna, String axiom_, float len_, float theta_) {
    pos = pos_;  genotype = dna;  phenotype = axiom_;
    init_len = len_;  init_theta = theta_;  stage = 1;
  }
  
  int compareTo(Vessel b) {
    return Integer.compare(b.fitness, this.fitness);
  }
  
  void display() {
    //float theta = init_theta;
    float len = init_len;
    ArrayDeque lenStack = new ArrayDeque();
    for (int i = 0; i < phenotype.length(); i++) {
      switch(phenotype.charAt(i)) {
        case 'F': {
          //strokeWeight(len/8);
          line(0,0,len,0);
          translate(len,0,0);        break; }
        case 'L':  shape(leaf);      break;
        case '+':  len *= 1.2;       break;
        case '-':  len *= 0.8;       break;
        case '\\': rotateX(theta);   break;
        case '/':  rotateX(-theta);  break;
        case 'v':  rotateY(theta);   break;
        case '^':  rotateY(-theta);  break;
        case '<':  rotateZ(theta);   break;
        case '>':  rotateZ(-theta);  break;
        case '|':  rotateZ(PI);      break;
        case '[':  pushMatrix();  lenStack.push(len);  break;
        case ']':  popMatrix();  len = (float)lenStack.pop();  break;
        default:   break;
      }
    }
  }
}