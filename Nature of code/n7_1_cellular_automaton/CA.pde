class CA {
  int generation, cols, rows;
  int[] ruleset = {0,1,0,1,1,0,1,0};
  int w = 4;
  int[][] matrix;
  
  CA(int[] r) {
    ruleset = r;
    cols = width/w;
    rows = height/w;
    matrix = new int[cols][rows];
    restart();
  }
  
  void randomize() {
    for (int i = 0; i < 8; i++) {
      ruleset[i] = int(random(2));
    }
  }
  
  void restart() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        matrix[i][j] = 0;
      }
    }
    matrix[cols/2][0] = 1;
    generation = 0;
  }
    
  void generate() {
    for (int i = 0; i < cols; i++) {
      int left = matrix[(i+cols-1)%cols][generation%rows];
      int me = matrix[i][generation%rows];
      int right = matrix[(i+cols+1)%cols][generation%rows];
      matrix[i][(generation+1)%rows] = rules(left,me,right);
    }
    generation++;
  }
  
  int rules (int a, int b, int c) {
    String s = "" + a + b + c;
    int index = Integer.parseInt(s, 2);
    return ruleset[index];
  }
  
  void display() {
    int offset = generation%rows;
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int y = j - offset;
        if (y <= 0)  y += rows;
        if (matrix[i][j] == 1) {
          fill(0);
          noStroke();
          rect(i*w,(y-1)*w,w,w);
        }
      }
    }
  }
  
  boolean finished() {
    if (generation > height/w) {
      return true;
    } else {
      return false;
    }
  }
}