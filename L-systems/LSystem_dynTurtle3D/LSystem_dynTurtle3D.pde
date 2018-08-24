LSystem lsys;
Turtle turtle;
PShape leaf;
float theta, p, s, xr, radius;
String axiom, cExclude;


void setup() {
  size(600,800,P3D);
  cExclude = "";
  axiom = "X";
  Rule[] ruleset = new Rule[10];
  ruleset[0] = new Rule('X',0.25,"F/[<YL]F\\[>YL]F/[vYL]F\\[^YL]X");
  ruleset[1] = new Rule('X',0.25,"F\\[>YL]F/[<YL]F\\[^YL]F/[vYL]X");
  ruleset[2] = new Rule('X',0.25,"F/[vYL]F\\[^YL]F/[>YL]F\\[<YL]X");
  ruleset[3] = new Rule('X',0.25,"F\\[^YL]F/[vYL]F\\[<YL]F/[>YL]X");
  ruleset[4] = new Rule('Y',0.25,"B/[<YL]B\\[>YL]B/[vYL]B\\[^YL]Y");
  ruleset[5] = new Rule('Y',0.25,"B\\[>YL]B/[<YL]B\\[^YL]B/[vYL]Y");
  ruleset[6] = new Rule('Y',0.25,"B/[vYL]B\\[^YL]B/[>YL]B\\[<YL]Y");
  ruleset[7] = new Rule('Y',0.25,"B\\[^YL]B/[vYL]B\\[<YL]B/[>YL]Y");
  ruleset[8] = new Rule('F',"FF");
  ruleset[9] = new Rule('B',"BB");
  lsys = new LSystem(axiom,ruleset);
  turtle = new Turtle(axiom);
  
  leaf = createShape();
  leaf.beginShape();
  leaf.stroke(0,25);
  leaf.fill((int)random(0,225),(int)random(200,225),0,200);
  float x = 0;
  for (float a = 0; a < PI+0.00001; a += PI/10) {
    leaf.vertex(x,sin(a)*5);
    x += 2;
  }
  x = 0;
  for (float a = PI; a > -0.00001; a -= PI/10) {
    leaf.vertex(x,-sin(a)*5);
    x += 2;
  }
  leaf.endShape(CLOSE);
  leaf.scale(1);
  
  p = s = PI/2;
  xr = 0;
  fill(0);
}


void draw() {
  
  background(255);
  radius = 8;
  theta = map(mouseY,0,height,p-s,p+s);
  
  pushMatrix();
  translate(width/2,height*9/10);
  rotateX(xr);
  rotateY(map(mouseX,0,width,0,TWO_PI));
  rotateZ(-PI/2);
  turtle.render(theta);
  popMatrix();
  
  textSize(20);
  fill(0);
  text("Gen " + lsys.getGen(),20,30);
  text(nf(theta/PI,1,10) + " PI",20,50);
}


void mousePressed() {
  
  if (mouseButton == LEFT) {
    lsys.generate();
    turtle.setToDo(lsys.getSentence());
    turtle.multLen(0.5);
  }
  //println(lsys.getSentence());
  /*
  if (mouseButton == RIGHT) {
    if (lsys.getGen() > 0) {
      lsys.degenerate();
      turtle.setToDo(lsys.getSentence());
      turtle.multLen(2);
    }
  }
  */
}


void mouseWheel(MouseEvent event) {
  
  float m = 1-0.5*event.getCount();
  turtle.multLen(m);
}


void keyPressed() {
  
  if (key == 's') {
    lsys.sentence = axiom;
    turtle.setToDo(axiom);
    turtle.len = height/5;
    leaf.setFill(color((int)random(0,225),(int)random(200,225),0,200));
    lsys.gen = 0;
  }
  else if (key == 'q') {
    p = theta;
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
  else if (key == 'w') {
    xr += PI/20;
  }
  else if (key == 'e') {
    xr -= PI/20;
  }
}