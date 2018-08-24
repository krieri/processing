PVector origin;
PMatrix3D M, N;
Population pop;
PShape soil, leaf;

void setup() {
  size(1000,800,P3D);  noLoop();
  origin = new PVector((int)width/2, (int)height*3/4);
  M = new PMatrix3D(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
  N = M.get();
  pop = new Population(10);
  PShapeInit();
}

void draw() {
  background(200,240,255);
  translate(origin.x, origin.y, 0);  // x --> x,  y --> -z,  z --> -y
  pushMatrix();  applyMatrix(M);  applyMatrix(N);  shape(soil);
  for (Plant p : pop.pop) {
    p.display();
  }
  popMatrix();
}

void keyPressed() {
  if (key == 'g') {
    
  }
}

void mouseDragged () {
  N.reset();
  //float xa = map(mouseY,0,height,1,-1)*PI;
  float ya = map(mouseX,0,width,-1,1)*PI;
  //float za = map(mouseX,0,width,-1,1)*PI;
  //N.apply(1,0,0,0, 0,cos(xa),-sin(xa),0, 0,sin(xa),cos(xa),0, 0,0,0,1);
  N.apply(cos(ya),0,sin(ya),0, 0,1,0,0, -sin(ya),0,cos(ya),0, 0,0,0,1);
  //N.apply(cos(za),-sin(za),0,0, sin(za),cos(za),0,0, 0,0,1,0, 0,0,0,1);
  redraw();
}

void mouseReleased() { M.apply(N); }


void PShapeInit() {
  
  int hs = (width >= height) ? (int)height*3/8 : (int)width*3/8;
  soil = createShape();  soil.beginShape();
  soil.fill(50,200,0,180);  soil.stroke(60,120,0);
  soil.vertex(-hs,0,hs);  soil.vertex(hs,0,hs);  soil.vertex(hs,0,-hs);
  soil.vertex(-hs,0,-hs);  soil.endShape();
  
  leaf = createShape();  leaf.beginShape();
  leaf.stroke(0,25);  leaf.fill(100,230,0,200);
  int dx = 0;
  for (float j = 0; j < PI+0.00001; j += PI/10) {
    leaf.vertex(dx,sin(j)*5);
    dx += 2;
  }
  leaf.endShape(CLOSE);  leaf.scale(1);
}