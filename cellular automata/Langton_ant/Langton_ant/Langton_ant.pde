int[][] board;
int unit, cols, rows;
ArrayList<Ant> ants;

void setup() {
  size(800,600);
  unit = 10;
  cols = width/unit;
  rows = height/unit;
  board = new int[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = 0;
    }
  }
  ants = new ArrayList<Ant>();
  stroke(50);
  ellipseMode(CENTER);
}

void draw() {
  background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (board[i][j] == 1) {
        fill(0);
      } else fill(255);
      rect(i*unit,j*unit,unit,unit);
    }
  }
  for (int i = ants.size()-1; i >= 0; i--) {
    Ant a = ants.get(i);
    a.move();
  }
}

void mouseClicked() {
  ants.add(new Ant(new PVector(int(mouseX/unit),int(mouseY/unit))));
}