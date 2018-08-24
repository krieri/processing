class FlowField {
  PVector[][] field;
  int cols, rows, resolution;
  
  FlowField(int r) {
    resolution = r;
    cols = width/resolution;
    rows = height/resolution;
    field = new PVector[cols][rows];
    init();
  }
  void init() {
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff,yoff,t),0,1,0,TWO_PI);
        field[i][j] = PVector.fromAngle(theta);
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }
  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution,0,cols-1));
    int row = int(constrain(lookup.y/resolution,0,rows-1));
    return field[column][row].copy();
  }
  void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(field[i][j],i*resolution,j*resolution,resolution);
      }
    }
  }
  void drawVector(PVector v, float x, float y, float scale) {
    pushMatrix();
    float arrowsize = 4;
    translate(x,y);
    stroke(0,100);
    rotate(v.heading());
    float len = v.mag()*scale;
    line(0,0,len,0);
    line(len,0,len-arrowsize,arrowsize/2);
    line(len,0,len-arrowsize,-arrowsize/2);
    popMatrix();
  }
}