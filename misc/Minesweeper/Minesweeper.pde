int[][] board;
int rows, cols, mines;
float s;
boolean first, left, right;
PShape square;
//Solver solver;

// BOARD VALUES
// -10:              flagged (uninitialized)
// 0/10/20:          empty (covered/flagged/uncovered)
// 1-8/11-18/21-28:  numbers (covered/flagged/uncovered)
// 9/19/29:          mine (covered/flagged/uncovered)


void setup() {
  //size(800,430);
  //rows = 30;
  //cols = 16;
  size(1600,860);
  rows = 90;
  cols = 48;
  mines = 594;
  board = new int[rows][cols];
  if (width / rows < height / cols) {
    s = width / rows;
  } else s = height / cols;
  first = true;
  left = right = false;
  
  //solver = new Solver();
  
  background(255);
  stroke(0);
  textAlign(CENTER);
  ellipseMode(CENTER);
  textSize(21);
  noLoop();
}


void draw() {
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (board[i][j] < 20) {
        fill(200);
        rect(i*s,j*s,s,s);
        if (board[i][j] > 9 || board[i][j] == -10) {
          fill(225);
          rect(i*s,j*s,s,s);
          fill(255,0,0);
          text("X",i*s+s/2,j*s+s/2+8);
        }
      } else {
        fill(175);
        rect(i*s,j*s,s,s);
        int num = board[i][j];
        if (num == 29) {
          fill(225,0,0);
          rect(i*s,j*s,s,s);
          fill(0);
          ellipse(i*s+s/2,j*s+s/2,s/2,s/2);
        }
        else if (num == 21) fill(0,0,255);
        else if (num == 22) fill(0,255,0);
        else if (num == 23) fill(255,0,0);
        else if (num == 24) fill(0,0,125);
        else if (num == 25) fill(0);
        else if (num == 26) fill(0);
        else if (num == 27) fill(0);
        else if (num == 28) fill(0);
        text(num-20,i*s+s/2,j*s+s/2+8);
      }
    }
  }
}


void mousePressed() {
  if (mouseButton == RIGHT) {
    right = true;
    int x = (int)(mouseX/s);
    int y = (int)(mouseY/s);
    if (x >= 0 && x < rows && y >= 0 && y < cols) {
      int num = board[x][y];
      if (first == true) {
        board[x][y] = -10;
      } else if (num < 10) {
        board[x][y] += 10;
      } else if (num < 20) {
        board[x][y] -= 10;
      }
      redraw();
    }
  } else if (mouseButton == LEFT) left = true;
}


void mouseReleased() {
  int x = (int)(mouseX/s);
  int y = (int)(mouseY/s);
  if (x >= 0 && x < rows && y >= 0 && y < cols) {
    int num = board[x][y];
    if (mouseButton == LEFT && first == true && (left && right) == false) {
      int[] mm = minMax(x,y);
      for (int i = mm[0]; i <= mm[1]; i++) {
        for (int j = mm[2]; j <= mm[3]; j++) {
          //arbitrary number above 20
          board[x+i][y+j] = 21;
        }
      }
      board[x][y] = 20;
      initialize();
    } else if ((left && right) == true && num > 20) {
      int fCount = 0;
      int[] mm = minMax(x,y);
      for (int i = mm[0]; i <= mm[1]; i++) {
        for (int j = mm[2]; j <= mm[3]; j++) {
          if (board[x+i][y+j] > 9 && board[x+i][y+j] < 20) fCount++;
        }
      }
      if (fCount == board[x][y]-20) {
        for (int i = mm[0]; i <= mm[1]; i++) {
          for (int j = mm[2]; j <= mm[3]; j++) {
            if (board[x+i][y+j] == 0) open(x+i,y+j);
            if (board[x+i][y+j] < 10) board[x+i][y+j] += 20;
          }
        }
      }
    } else if (mouseButton == LEFT && num < 10) {
      if (num == 0) open(x,y);
      else board[x][y] += 20;
    }
    redraw();
  }
  if (mouseButton == LEFT) left = false;
  if (mouseButton == RIGHT) right = false;
}


int[] minMax(int x, int y) {
  // 0: imin    1: imax    2: jmin    3: jmax
  int[] minMax = new int[4];
  if (x == 0) minMax[0] = 0;
  else minMax[0] = -1;
  if (x == rows-1) minMax[1] = 0;
  else minMax[1] = 1;
  if (y == 0) minMax[2] = 0;
  else minMax[2] = -1;
  if (y == cols-1) minMax[3] = 0;
  else minMax[3] = 1;
  return minMax;
}


void open(int x, int y) {
  int[] mm = minMax(x,y);
  for (int i = mm[0]; i <= mm[1]; i++) {
    for (int j = mm[2]; j <= mm[3]; j++) {
      if (board[x+i][y+j] < 9) {
        board[x+i][y+j] += 20;
        if (board[x+i][y+j] == 20) open(x+i,y+j);
      }
    }
  }
}


void initialize() {
  first = false;
  float mRatio = 1.0 * mines / (rows * cols);
  int m = 0;
  while (m < mines) {
    for (int x = 0; x < rows; x++) {
      for (int y = 0; y < cols; y++) {
        if (board[x][y] < 20) {
          if (random(0,1) < mRatio) {
            if (board[x][y] == -10) board[x][y] = 19;
            else board[x][y] = 9;
            m++;
          }
        }
      }
    }
  }
  int sx, sy;
  sx = sy = -1; //default value
  for (int x = 0; x < rows; x++) {
    for (int y = 0; y < cols; y++) {
      if (board[x][y] == 21) board[x][y] = 0;
      if (board[x][y] != 9 && board[x][y] != 19) {
        int mCount = 0;
        int[] mm = minMax(x,y);
        for (int i = mm[0]; i <= mm[1]; i++) {
          for (int j = mm[2]; j <= mm[3]; j++) {
            if (board[x+i][y+j] == 9 || board[x+i][y+j] == 19) mCount++;
          }
        }
        if (board[x][y] == 20) {
          sx = x;
          sy = y;
        }
        if (board[x][y] < 20) {
          board[x][y] += mCount;
          if (board[x][y] < 0) board[x][y] += 20;
        }
      }
    }
  }
  if (sx != -1 && sy != -1) {
    open(sx,sy);
  }
}