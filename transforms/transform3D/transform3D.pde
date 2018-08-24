int h;
float a;
boolean[] mode = {false,false,false,false}; //skalering/rotasjon/translasjon/r
boolean[] affAx = {false,false,false,false}; //x/y/z/r
float[] scAff = {0,0,0,0, 0,0,0,0, 0,0,0,0}; //for skalering av enkeltceller
boolean[] draw = {true,false,true,true,true,false}; //rutenett/plan/xyz-akser/cAxis/cube/img
PShape grid, axis1, axis2, axis3, cAxis, plane, cube;
PVector trns, cAxisN; // translasjonsvektor, fri rotasjonsakse
PMatrix3D M, N;  // primær-/sekundærmatrise
PImage img;


void setup() {
  size(1000,1000,P3D);
  noLoop();
  h = (height <= width) ? int(height/2) : int(width/2);
  trns = new PVector(0,0,0);
  cAxisN = new PVector(1,1,1);  cAxisN.div(sqrt(3));
  M = new PMatrix3D(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
  N = M.get();
  img = loadImage("julia.bmp");  imageMode(CENTER);
  pShapeInit();
}


void draw() {
  background(0);  textSize(25);  noStroke();
  int col = (mode[0]) ? 200 : 50;
  fill(col);  text("Skalering",10,30,0);
  for (int i = 0; i < 9; i++) {
    col = (scAff[i] == 1) ? 200 : 50;  fill(col);
    ellipse(50+15*i-45*floor(i/3),45+15*floor(i/3),12,12);
  }
  char[] axes = {'x','y','z','r'};
  col = (mode[1]) ? 200 : 50;
  fill(col);  text("Rotasjon",140,30,0);
  for (int i = 0; i < 4; i++) {
    col = (affAx[i]) ? 200 : 70;  fill(col);
    text(axes[i],150+25*i,60,0);
  }
  col = (mode[2]) ? 200 : 50;
  fill(col);  text("Translasjon",260,30,0);
  for (int i = 0; i < 4; i++) {
    col = (affAx[i]) ? 200 : 70;  fill(col);
    text(axes[i],287+25*i,60,0);
  }
  col = (mode[3]) ? 200 : 50;
  fill(col);  text('r',430,45);
  
  translate(h,h,-h*5/3);
  translate(trns.x,trns.y,trns.z);
  a = map(mouseX,0,width,-1,1);
  //b = map(mouseY,0,height,-1,1);
  
  pushMatrix();
  applyMatrix(M);
  applyMatrix(N);
  if (draw[0] || draw[1]) {
    pushMatrix();
    if (draw[0]) shape(grid);  if (draw[1]) shape(plane);
    applyMatrix(1,0,0,0, 0,0,-1,0, 0,1,0,0, 0,0,0,1);
    if (draw[0]) shape(grid);  if (draw[1]) shape(plane);
    applyMatrix(0,0,1,0, 0,1,0,0, -1,0,0,0, 0,0,0,1);
    if (draw[0]) shape(grid);  if (draw[1]) shape(plane);
    popMatrix();
  }
  if (draw[2]) { shape(axis1); shape(axis2); shape(axis3); }
  if (draw[3]) shape(cAxis);
  if (draw[4]) shape(cube);
  if (draw[5]) image(img,0,0);
  popMatrix();
}


void mouseMoved() {
  N.reset();
  if (mode[0]) {
    N.m00 += scAff[0]*2*a;  N.m01 += scAff[1]*2*a;  N.m02 += scAff[2]*2*a;
    N.m10 += scAff[3]*2*a;  N.m11 += scAff[4]*2*a;  N.m12 += scAff[5]*2*a;
    N.m20 += scAff[6]*2*a;  N.m21 += scAff[7]*2*a;  N.m22 += scAff[8]*2*a;
  }
  if (mode[1]) {
    float api = a*PI;
    if (affAx[0]) N.apply(1,0,0,0, 0,cos(api),-sin(api),0, 0,sin(api),cos(api),0, 0,0,0,1);
    if (affAx[1]) N.apply(cos(api),0,sin(api),0, 0,1,0,0, -sin(api),0,cos(api),0, 0,0,0,1);
    if (affAx[2]) N.apply(cos(api),-sin(api),0,0, sin(api),cos(api),0,0, 0,0,1,0, 0,0,0,1);
    if (affAx[3]) {
      float theta, phi, s1, c1, s2, c2, ss, sc, cs, cc;
      theta = atan2(cAxisN.y, sqrt(sq(cAxisN.x)+sq(cAxisN.z)));
      phi = atan2(cAxisN.z, cAxisN.x);
      s1 = sin(theta);  c1 = cos(theta);  s2 = sin(phi);  c2 = cos(phi);
      ss = s1*s2;  sc = s1*c2;  cs = c1*s2;  cc = c1*c2;
      /*
      N.apply(cc,sc,s2,0, -s1,c1,0,0, -cs,-ss,c2,0, 0,0,0,1);
      N.apply(1,0,0,0, 0,cos(api),-sin(api),0, 0,sin(api),cos(api),0, 0,0,0,1);
      N.apply(cc,-s1,-cs,0, sc,c1,-ss,0, s2,0,c2,0, 0,0,0,1);
      */
      N.apply(cc,-s1,-cs,0, sc,c1,-ss,0, s2,0,c2,0, 0,0,0,1);
      N.apply(1,0,0,0, 0,cos(api),-sin(api),0, 0,sin(api),cos(api),0, 0,0,0,1);
      N.apply(cc,sc,s2,0, -s1,c1,0,0, -cs,-ss,c2,0, 0,0,0,1);
    }
  }
  if (mode[2]) {
    if (affAx[0]) trns.x = 2*a*h;
    if (affAx[1]) trns.y = 2*a*h;
    if (affAx[2]) trns.z = 2*a*h;
  }
  if (mode[3]) {
    if (affAx[0]) cAxisN.x = a;
    if (affAx[1]) cAxisN.y = a;
    if (affAx[2]) cAxisN.z = a;
    cAxisN.div(sqrt(sq(cAxisN.x)+sq(cAxisN.y)+sq(cAxisN.z)));
    cAxis.setVertex(0, -h*cAxisN.x, -h*cAxisN.y, -h*cAxisN.z);
    cAxis.setVertex(1, h*cAxisN.x, h*cAxisN.y, h*cAxisN.z);
  }
  redraw();
}


void keyPressed() {
  switch (key) {
    case 'f':  M.apply(N);  break;
    case 'v':  M.reset();  break;
    case 'g':  draw[0] = (draw[0]) ? false : true;  break;
    case 'h':  draw[1] = (draw[1]) ? false : true;  break;
    case 'j':  draw[2] = (draw[2]) ? false : true;  break;
    case 'b':  draw[3] = (draw[3]) ? false : true;  break;
    case 'n':  draw[4] = (draw[4]) ? false : true;  break;
    case 'm':  draw[5] = (draw[5]) ? false : true;  break;
  }
  for (int i = 0; i < 4; i++) {
    if (key == char(i + 1 + '0')) {
      mode[i] = (mode[i]) ? false : true;
      redraw();  return;
    }
  }
  if (mode[1] || mode[2] || mode[3]) switch (key) {
    case 'q':  affAx[0] = (affAx[0]) ? false : true;  break;
    case 'w':  affAx[1] = (affAx[1]) ? false : true;  break;
    case 'e':  affAx[2] = (affAx[2]) ? false : true;  break;
    case 'r':  affAx[3] = (affAx[3]) ? false : true;  break;
  } else if (mode[0]) switch (key) {
    case 'q':  scAff[0] = (scAff[0] == 1) ? 0 : 1;  break;
    case 'w':  scAff[1] = (scAff[1] == 1) ? 0 : 1;  break;
    case 'e':  scAff[2] = (scAff[2] == 1) ? 0 : 1;  break;
    case 'a':  scAff[3] = (scAff[3] == 1) ? 0 : 1;  break;
    case 's':  scAff[4] = (scAff[4] == 1) ? 0 : 1;  break;
    case 'd':  scAff[5] = (scAff[5] == 1) ? 0 : 1;  break;
    case 'z':  scAff[6] = (scAff[6] == 1) ? 0 : 1;  break;
    case 'x':  scAff[7] = (scAff[7] == 1) ? 0 : 1;  break;
    case 'c':  scAff[8] = (scAff[8] == 1) ? 0 : 1;  break;
  }
  redraw();
}


void pShapeInit() {
  int unit = int(height)/10;
  grid = createShape();  grid.beginShape(LINES);
  grid.stroke(200,20);  grid.strokeWeight(3);
  for (int i = -h; i <= h; i += unit) {
    for (int j = -h; j <= h; j += unit) {
      grid.vertex(i,-h,j);  grid.vertex(i,h,j);
      grid.vertex(-h,i,j);  grid.vertex(h,i,j);
    }
  }
  grid.endShape();
  
  strokeWeight(6);
  axis1 = createShape();
  axis1.beginShape(LINES);  axis1.stroke(255,0,0);
  axis1.vertex(-h,0,0);  axis1.vertex(h,0,0);  axis1.endShape();
  
  axis2 = createShape();
  axis2.beginShape(LINES);  axis2.stroke(0,255,0);
  axis2.vertex(0,-h,0);  axis2.vertex(0,h,0);  axis2.endShape();
  
  axis3 = createShape();
  axis3.beginShape(LINES);  axis3.stroke(0,0,255);
  axis3.vertex(0,0,-h);  axis3.vertex(0,0,h);  axis3.endShape();
  
  cAxis = createShape();
  cAxis.beginShape(LINES);  cAxis.stroke(255,255,0);
  cAxis.vertex(-h*cAxisN.x,-h*cAxisN.y,-h*cAxisN.z);
  cAxis.vertex(h*cAxisN.x,h*cAxisN.y,h*cAxisN.z);  cAxis.endShape();
  
  plane = createShape();
  plane.beginShape();  plane.strokeWeight(0.5);  plane.fill(0,0,255,150);
  plane.vertex(-h,-h,0);  plane.vertex(-h,h,0);
  plane.vertex(h,h,0);  plane.vertex(h,-h,0);  plane.endShape();
  
  int hs = height/8;
  cube = createShape();  cube.beginShape();  cube.stroke(255,200);
  cube.vertex(hs,hs,hs);  cube.vertex(-hs,hs,hs);  cube.vertex(-hs,-hs,hs);
  cube.vertex(hs,-hs,hs);  cube.vertex(hs,hs,hs);  cube.vertex(hs,hs,-hs);
  cube.vertex(hs,-hs,-hs);  cube.vertex(-hs,-hs,-hs);  cube.vertex(-hs,hs,-hs);
  cube.vertex(hs,hs,-hs);  cube.vertex(hs,-hs,-hs);  cube.vertex(hs,-hs,hs);
  cube.vertex(-hs,-hs,hs);  cube.vertex(-hs,-hs,-hs);  cube.vertex(-hs,hs,-hs);
  cube.vertex(-hs,hs,hs);  cube.endShape();
}