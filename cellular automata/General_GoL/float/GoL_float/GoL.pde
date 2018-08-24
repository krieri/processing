class GoL {
  int unit, cols, rows;
  float incLT, incUT;
  float[][] board;
  
  GoL() {
    unit = 4;
    incLT = 2;
    incUT = 3.5;
    init();
  }
  
  void init() {
    cols = width/unit;
    rows = height/unit;
    board = new float[cols][rows];
    for (int i = 1; i < cols-1; i++) {
      for (int j = 1; j < rows-1; j++) {
        board[i][j] = random(0,1);
      }
    }
  }
  
  void run() {
    float delta = 0.25;
    incLT = map(mouseX,0,width,0,8);
    incUT = map(mouseY,height,0,incLT,8);
    float[][] next = new float[cols][rows];
    for (int i = 1; i < cols-1; i++) {
      for (int j = 1; j < rows-1; j++) {
        float c = board[i][j];
        if (c > 1)        c = 1;
        else if (c < -1)  c = -1;
        float t = - c;
        for (int k = -1; k < 2; k++) {
          for (int l = -1; l < 2; l++) {
            t += board[i+k][j+l];
          }
        }
        if (t < incLT || t > incUT) next[i][j] = c-delta;
        else next[i][j] = c+10*delta;
      }
    }
    board = next;
  }
  
  void display() {
    noStroke();
    for (int i = 1; i < cols-1; i++) {
      for (int j = 1; j < rows-1; j++) {
        fill(0,map(board[i][j],0,1,0,255),0);
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