PImage img;
int imgPixels;

void setup() {
  size(1000,1000,P3D);
  img = loadImage("image4.jpg");
  img.loadPixels();
  imgPixels = img.width*img.height;
}

void draw() {
  translate(width/2,height/2,0);
  background(0);
  float a = map(mouseX,0,width,0,TWO_PI);
  float b = map(mouseY,0,height,0,TWO_PI);
  float c = (a+b)/2;
  float ca, cb, cc, sa, sb, sc;
  ca = cos(a);  cb = cos(b);  cc = cos(c);  sa = sin(a);  sb = sin(b);  sc = sin(c);
  pushMatrix();
  //applyMatrix(sin(a),cos(b),mouseX,cos(a),sin(b),mouseY);
  //applyMatrix(a*cos(b),-sin(a),0, -cos(b),b*sin(a),0);
  applyMatrix(cb*cc,cb*sc,-sb,0,sa*sb*cc-ca*sc,sa*sb*sc+ca*cc,sa*sb,0,ca*sb*cc+sa*cc,ca*sb*sc-sa*cc,ca*cb,0,0,0,0,a*2);
  image(img,0,0);
  popMatrix();
}