Turtle t = new Turtle();
int num = 100;
int[] x = new int[num];
int[] y = new int[num];
int indexPosition = 0;
int n = 1;

void setup() {
  size(800,800);
  background(255);
  frameRate(60);
}

void draw() {
  background(255);
  x[indexPosition] = (int)t.pos.x;
  y[indexPosition] = (int)t.pos.y;
  for (int i = 0; i < num; i++) {
    int ipos = (indexPosition + i) % num;
    stroke(0,35);
    strokeWeight(3);
    if (x[ipos] != y[ipos]) {
      if (ipos > 0) {
        line(x[ipos],y[ipos],x[ipos-1],y[ipos-1]);
      } else {
        line(x[ipos],y[ipos],x[num-1],y[num-1]);
      }
    }
  }
  //float r = map(noise(n/25),0,1,-PI/6,PI/6);
  t.turn(n/10);
  //t.adjust(1);
  t.update();
  indexPosition = (indexPosition + 1) % num;
  n++;
}