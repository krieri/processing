class GoL {
  
  int w = 8;
  int cols, rows;
  int[][] board;
  
  GoL() {
    cols = width/w;
    rows = height/w;
    board = new int[cols][rows];
    init();
  }
  
  void init() {
    for (int i = 1; i < cols-1; i++) {
      for (int j = 1; j < rows-1; j++) {
        board[i][j] = int(random(2));
      }
    }
  }
  
  void generate() {
    int[][] next = new int[cols][rows];
    for (int x = 1; x < cols-1; x++) {
      for (int y = 1; y < rows-1; y++) {
        int neighbors = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            neighbors += board[(x+i+cols)%cols][(y+j+rows)%rows];
          }
        }
        neighbors -= board[x][y];
        if ((board[x][y] == 1) && (neighbors < 2))       next[x][y] = 0;
        else if ((board[x][y] == 1) && (neighbors > 3))  next[x][y] = 0;
        else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1;
        else                                             next[x][y] = board[x][y];
      }
    }
    board = next;
  }
  
  void display() {
    for (int i = 1; i < cols-1; i++) {
      for (int j = 1; j < rows-1; j++) {
        if ((board[i][j] == 1)) fill(0,200,0);
        else fill(0);
        stroke(50);
        rect(i*w,j*w,w,w);
      }
    }
  }
}