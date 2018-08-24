GoL game;
int t, skip, x1, y1;
boolean pause;

void setup() {
  size(800,800);
  t = 0;
  skip = 4;
  pause = false;
  textSize(22);
  game = new GoL();
}

void draw() {
  int a = int(map(mouseX,0,width,0,8.9));
  int b = int(map(mouseY,height,0,0,8.9));
  if (t >= skip &! pause) {
    background(0);
    game.run();
    game.display();
    t = 0;
  }
  fill(255);
  text(String.valueOf(game.incLT)+", "+String.valueOf(game.incUT)+" ("+
      String.valueOf(skip)+")",8,25);
  t++;
}

void keyPressed() {
  if (key == 'q') {
    game.init();
  } else if (key == 'e') {
    game.board[int(width/(2*game.unit))][int(height/(2*game.unit))] = 1;
  } else if (key == 'r') {
    for (int i = 1; i < game.cols-1; i++) {
      game.board[i][0] = 1;
      game.board[i][game.cols-1] = 1;
    }
    for (int j = 1; j < game.rows-1; j++) {
      game.board[0][j] = 1;
      game.board[game.rows-1][j] = 1;
    }
  }
  else if (key == 'w') {
    game.kill();
  }
  else if (key == 'z' && skip > 1) skip--;
  else if (key == 'c') skip++;
  else if (key == 'x') {
    if (pause) pause = false;
    else pause = true;
  }
}

void mousePressed() {
  x1 = int(mouseX/game.unit);
  y1 = int(mouseY/game.unit);
}

void mouseReleased() {
  int x2 = int(mouseX/game.unit);
  int y2 = int(mouseY/game.unit);
  for (int i = min(x1,x2); i <= max(x1,x2); i++) {
    for (int j = min(y1,y2); j <= max(y1,y2); j++) {
      game.board[i][j] = 1;
    }
  }
}