class GoL {
  int unit, cols, rows;
  float[][] board;
  
  GoL() {
    unit = 6;
    init();
  }
  
  void init() {
    cols = width/unit;
    rows = height/unit;
    board = new float[cols][rows];
    for (int i = 1; i < cols-1; i++) {
      for (int j = 1; j < rows-1; j++) {
        board[i][j] = random(-1,1);
      }
    }
  }
  
  void run() {
    float inc = 0.1;
    float thr = 2*inc;
    float n = map(mouseX,0,width,0,15);
    float s = map(mouseY,height,0,0,3);
    float[][] next = new float[cols][rows];
    for (int i = 1; i < cols-1; i++) {
      for (int j = 1; j < rows-1; j++) {
        float c = board[i][j];
        if (c > 1)         c = 1;
        else if (c < -1)   c = -1;
        float t = -c;
        for (int k = -1; k < 2; k++) {
          for (int l = -1; l < 2; l++) {
            t += board[i+k][j+l];
          }
        }
        if (t >= 0) {
          if (c < 0)              next[i][j] = c+inc;
          else if (t > thr+3*s)   next[i][j] = c-inc;
          else if (t > thr+2*s)   next[i][j] = c+n*inc;
          else if (t > thr)       next[i][j] = c-inc;
          else                    next[i][j] = 0.0;
        } else {
          if (c > 0)              next[i][j] = c-inc;
          else if (t < -thr-3*s)  next[i][j] = c+inc;
          else if (t < -thr-2*s)  next[i][j] = c-n*inc;
          else if (t < -thr)      next[i][j] = c+inc;
          else                    next[i][j] = 0.0;
        }
      }
    }
    board = next;
  }
  
  void display() {
    for (int i = 1; i < cols-1; i++) {
      for (int j = 1; j < rows-1; j++) {
        float v = board[i][j];
        if (v >= 0) fill(0,map(v,0,1,0,255),0);
        else fill(0,0,map(v,0,-1,0,255));
        ellipse(i*unit, j*unit, unit, unit);
      }
    }
  }
}