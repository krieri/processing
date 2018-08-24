class GoL {
  int unit, cols, rows, bornLT, bornUT, survLT, survUT;
  int[][] board;
  
  GoL() {
    unit = 4;
    bornLT = 3;  bornUT = 3;
    survLT = 2;  survUT = 3;
    init();
  }
  
  void init() {
    cols = width/unit;
    rows = height/unit;
    board = new int[cols][rows];
    for (int i = 1; i < cols-1; i++) {
      for (int j = 1; j < rows-1; j++) {
        board[i][j] = int(random(2));
      }
    }
  }
  
  void run() {
    int[][] next = new int[cols][rows];
    for (int i = 1; i < cols-1; i++) {
      for (int j = 1; j < rows-1; j++) {
        int c = board[i][j];
        int t = - c;
        for (int k = -1; k < 2; k++) {
          for (int l = -1; l < 2; l++) {
            t += board[i+k][j+l];
          }
        }
        if (c == 1 && (t < survLT || t > survUT)) {
          next[i][j] = 0;
        } else if (c == 0 && t >= bornLT && t <= bornUT){
          next[i][j] = 1;
        } else next[i][j] = c;
      }
    }
    board = next;
  }
  
  void display() {
    stroke(50);
    noStroke();
    for (int i = 1; i < cols-1; i++) {
      for (int j = 1; j < rows-1; j++) {
        if (board[i][j] == 1) fill(0,200,0);
        else fill(0);
        rect(i*unit,j*unit,unit,unit);
      }
    }
  }
  
  void kill() {
    for (int i = 1; i < cols-1; i++) {
      for (int j = 1; j < rows-1; j++) {
        board[i][j] = 0;
      }
    }
  }
}