ArrayList<KochLine> lines;

void setup() {
  size(600,600);
  lines = new ArrayList<KochLine>();
  lines.add(new KochLine(new PVector(width/20,height/3.5),new PVector(width*19/20,height/3.5)));
  lines.add(new KochLine(new PVector(width*19/20,height/3.5),new PVector(width/2,height*19/20)));
  lines.add(new KochLine(new PVector(width/2,height*19/20),new PVector(width/20,height/3.5)));
}
void keyPressed() {
  if (key == ' ') {
    generate();
  }
}
void draw() {
  background(255);
  for (KochLine l : lines) {
    l.display();
  }
}
void generate() {
  ArrayList next = new ArrayList<KochLine>();
  for (KochLine l : lines) {
    PVector a = l.vrtx(0);
    PVector b = l.vrtx(1);
    PVector c = l.vrtx(2);
    PVector d = l.vrtx(3);
    PVector e = l.vrtx(4);
    next.add(new KochLine(a,b));
    next.add(new KochLine(b,c));
    next.add(new KochLine(c,d));
    next.add(new KochLine(d,e));
  }
  lines = next;
}