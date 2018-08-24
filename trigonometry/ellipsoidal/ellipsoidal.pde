int h, mode, pol;
float a, b, c;
PVector e_R, e_theta, e_phi;

void setup() {
  size(800,800,P3D);
  //noLoop();
  h = (height <= width) ? int(height/2) : int(width/2);
  mode = 0;  // 0: ellipsoid, 1: 1hyperboloid, 2: 2hyperboloid
  pol = (mode == 0) ? 1 : -1;
  a = 200;  b = 100; c = 150;
  e_theta = new PVector(0,0,0);
  e_phi = new PVector(0,0,0);
  e_R = new PVector(0,0,0);
}

void draw() {
  background(0);
  translate(h,h,-h*5/3);
  rotateY(PI/2+1.3);
  rotateX(PI*3/2+.2);
  rotateZ(1);
  float theta, phi, A, R, x, y, z, dRdt, dRdp, temp;
  theta = map(mouseY,height,0,0,PI);
  phi = map(mouseX,0,width,0,TWO_PI);
  A = sq(cos(phi)/a)+sq(sin(phi)/b);
  temp = sq(sin(theta))*A+pol*sq(cos(theta)/c);
  R = pow(temp,-.5);
  dRdt = sin(theta)*cos(theta)*(pol/sq(c)-A) / pow(temp,3/2);
  dRdp = sq(sin(theta))*sin(phi)*cos(phi)*(1/sq(a)-1/sq(b)) / pow(temp,3/2);
  temp = R*sin(theta);
  x = temp*cos(phi);  y = temp*sin(phi);  z = R*cos(theta);
  e_R.set(sin(theta)*cos(phi),sin(theta)*sin(phi),cos(theta));
  e_R.setMag(100);
  temp = R*cos(theta)+dRdt*sin(theta);
  e_theta.set(temp*cos(phi), temp*sin(phi), dRdt*cos(theta)-R*sin(theta));
  //e_theta.mult(1/sqrt(sq(R)+sq(dRdt)));  // (h_theta)
  e_theta.setMag(100);
  e_phi.set(sin(theta)*(R*sin(-phi)+dRdp*cos(phi)),
            sin(theta)*(R*cos(phi)+dRdp*sin(phi)),
            dRdp*cos(theta));
  //e_phi.mult(1/sqrt(sq(R*sin(theta))+sq(dRdp)));  // (h_phi)
  e_phi.setMag(100);
  
  strokeWeight(4);  stroke(200,50,50);
  line(-a,0,0,a,0,0);  stroke(50,200,50);
  line(0,-b,0,0,b,0);  stroke(50,50,200);
  if (mode == 0) line(0,0,-c,0,0,c);
  
  stroke(255);
  line(x,y,z,x+e_R.x,y+e_R.y,z+e_R.z);
  line(x,y,z,x+e_theta.x,y+e_theta.y,z+e_theta.z);
  line(x,y,z,x+e_phi.x,y+e_phi.y,z+e_phi.z);
  
  stroke(200,0,200,100);  noFill();
  ellipseMode(RADIUS);
  if (mode == 0) {
    pushMatrix();  translate(0,0,z);
    temp = sqrt(1-sq(z/c));
    ellipse(0,0,a*temp,b*temp);
    popMatrix();  pushMatrix();
    translate(x,0,0);  rotateY(PI/2);
    temp = sqrt(1-sq(x/a));
    ellipse(0,0,c*temp,b*temp);
    popMatrix();  pushMatrix();
    translate(0,y,0);  rotateX(PI/2);
    temp = sqrt(1-sq(y/b));
    ellipse(0,0,a*temp,c*temp);
    popMatrix();
  } else if (mode == 1) {
    pushMatrix();  translate(0,0,z);
    temp = sqrt(1+sq(z/c));
    ellipse(0,0,a*temp,b*temp);
    popMatrix();  pushMatrix();
    rotateZ(PI/2);  rotateX(PI/2);
    float p, pp;  pp = 0;
    for(int i = (int)-b/2; i <= (int)b/2; i += 2) {
      p = y*c*sqrt((sq(i)/c-1) / (sq(z)/(sq(x/a)-1)-c));
      line(i,pp,x,i+2,p,x);
      pp = p;
    }
    popMatrix();
  }
}

void keyPressed() {
  switch(key) {
    case 'q' : mode = 0;  pol = 1;  break;
    case 'w' : mode = 1;  pol = -1;  break;
    case 'e' : mode = 2;  pol = -1;  break;
  }
}