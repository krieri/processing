LSystem lsys;
Turtle turtle;
float t, p, s;

void setup() {
  size(800,800);
  Rule[] ruleset = new Rule[2];
  ruleset[0] = new Rule('X',"F[+X]F[-X]+X");
  ruleset[1] = new Rule('F',"FF");
  lsys = new LSystem("X",ruleset);
  turtle = new Turtle(lsys.getSentence());
  p = s = PI/2;
}

void draw() {
  background(255);
  fill(0);
  translate(width/2,height);
  rotate(-PI/2);
  t = map(mouseY,0,height,p-s,p+s);
  turtle.render(t);
  pushMatrix();
  resetMatrix();
  textSize(20);
  text("Gen " + lsys.getGen(),20,30);
  text(nf(t/PI,1,8) + " PI",20,55);
  popMatrix();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    lsys.generate();
    turtle.setToDo(lsys.getSentence());
    turtle.multLen(0.5);
  }
  //if (mouseButton == RIGHT) {
    //if (lsys.getGen() > 0) {
      //lsys.degenerate();
      //turtle.setToDo(lsys.getSentence());
      //turtle.multLen(2);
    //}
  //}
}

void mouseWheel(MouseEvent event) {
  float m = 1-0.5*event.getCount();
  turtle.multLen(m);
}

void keyPressed() {
  if (key == 'q') {
    p = t;
  }
  else if (key == 'r') {
    p = PI/2;
  }
  else if (key == '1') {
    s = PI/2;
  }
  else if (key == '2') {
    s = PI/25;
  }
  else if (key == '3') {
    s = PI/100;
  }
  else if (key == '4') {
    s = PI/1000;
  }
  else if (key == '5') {
    s = PI/10000;
  }
  else if (key == '6') {
    s = PI/100000;
  }
}