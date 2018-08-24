GoL game;

void setup() {
  size(600,600);
  frameRate(40);
  game = new GoL();
}

void draw() {
  background(0);
  game.run();
  game.display();
}

void keyPressed() {
  if (key == 'r') game.init();
}

void mouseWheel(MouseEvent event) {
  float c = event.getCount();
  game.unit -= c;
  game.init();
}