LSystem lsys;
Turtle turtle;

void setup() {
  size(800,800);
  Rule[] ruleset = new Rule[2];
  ruleset[0] = new Rule('X',"F[+X]F[-X]+X");
  ruleset[1] = new Rule('F',"FF");
  lsys = new LSystem("X",ruleset);
  turtle = new Turtle(lsys.getSentence(),width/2,radians(20));
  smooth();
}

void draw() {
  background(255);
  fill(0);
  translate(width/2, height);
  rotate(-PI/2);
  turtle.render();
  noLoop();
}

int counter = 0;

void mousePressed() {
  if (counter < 9) {
    pushMatrix();
    lsys.generate();
    turtle.setToDo(lsys.getSentence());
    turtle.changeLen(0.5);
    popMatrix();
    redraw();
    counter++;
  }
}