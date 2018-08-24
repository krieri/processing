import java.util.ArrayDeque;
import java.util.Collections;

PVector origin;
PMatrix3D M;
Population pop;
PShape soil, leaf;
String symbols, axiom;
float theta;

void setup() {
  size(1000,800,P3D);
  origin = new PVector((int)width/2, (int)height*3/4);
  M = new PMatrix3D(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
  symbols = "FL+-^v<>/\\";
  axiom = "FF<[FL]>/[FL]\\vL^";
  theta = 0;
  pop = new Population(1, 3, axiom, 15, theta);
  PShapeInit();
}

void draw() {
  background(0);//(200,240,255);
  translate(origin.x, origin.y, 0);  // (x, -z, -y)
  applyMatrix(M);  shape(soil);
  stroke(100,100,0);  strokeWeight(2);
  for (Vessel v : pop.pop) {
    pushMatrix();  rotateZ(-PI/2);
    translate(0,v.pos.x,-v.pos.y);    // (z, x, -y)
    v.display();  popMatrix();
  }
  pop.evaluate();
}

void keyPressed() {
  switch (key) {
    case 'g': {
      for (Vessel v : pop.pop) {
        v.phenotype = generate(v.phenotype, v.genotype.rules);
        v.stage++;
      } break; }
    case 'e':  pop.evaluate();  pop.nextGen();  break;
    case 'd': {
      pop.reset();
      for (Vessel v : pop.pop) v.genotype.mutate(0.2);
      break; }
    case 'r':  pop.reset();  break;
  }
}

void mouseMoved () {
  //float xa = map(mouseY,0,height,1,-1)*PI;
  float ya = map(mouseX,0,width,-1,1)*PI;
  //float za = map(mouseX,0,width,-1,1)*PI;
  //M.set(1,0,0,0, 0,cos(xa),-sin(xa),0, 0,sin(xa),cos(xa),0, 0,0,0,1);  // = rotateX
  M.set(cos(ya),0,sin(ya),0, 0,1,0,0, -sin(ya),0,cos(ya),0, 0,0,0,1);  // = rotateY
  //M.set(cos(za),-sin(za),0,0, sin(za),cos(za),0,0, 0,0,1,0, 0,0,0,1);  // = rotateZ
  
  theta = map(mouseY,0,height,-PI,PI);
}


void PShapeInit() {
  
  int hs = (width >= height) ? (int)height*3/8 : (int)width*3/8;
  soil = createShape();  soil.beginShape();
  soil.fill(30);  soil.noStroke();//soil.stroke(50);  soil.strokeWeight(2);
  soil.vertex(-hs,0,hs);  soil.vertex(hs,0,hs);  soil.vertex(hs,0,-hs);
  soil.vertex(-hs,0,-hs);  soil.endShape();
  
  leaf = createShape();  leaf.beginShape();
  leaf.stroke(0,25);  leaf.fill(70,180,0);
  int dx = 0;
  for (float j = 0; j < PI+0.00001; j += PI/10) {
    leaf.vertex(dx,sin(j)*5);
    dx += 2;
  }
  dx = 0;
  for (float j = PI; j > -0.00001; j -= PI/10) {
    leaf.vertex(dx,-sin(j)*5);
    dx += 2;
  }
  leaf.endShape(CLOSE);  leaf.scale(1);
}