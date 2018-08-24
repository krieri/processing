class ScentTrails {
  PVector[][] field;
  int cols, rows, res;
  
  ScentTrails(int r) {
    res = r;
    cols = width/res;
    rows = height/res;
    field = new PVector[cols][rows];
    field.mult(0);
  }
  
  void fade() {
    field.mult(0.95);
  }
  
  PVector lookup(PVector p) {
    int col = int(constrain(p.x/res,0,cols-1);
    int row = int(constrain(p.y/res,0,rows-1);
    return field[col][row].copy();
  }
  
  void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(field[i][j],i*res,j*res);
      }
    }
  }
  
  void drawVector(PVector v, float x, float y) {
    pushMatrix();
    translate(x,y);
    stroke(0,100);
    rotate(v.heading());
    line(0,0,res,0);
    popMatrix();
  }
}