class Turtle {
  
  String todo;
  float len;
  float theta;
  
  Turtle(String s) {
    todo = s;
    len = height/5;
  }
  
  
  void render(float t) {
    
    theta = t;
    stroke(80,80,50);
    for (int i = 0; i < todo.length(); i++) {
      char c = todo.charAt(i);
      if (c == 'F') {
        /*
        strokeWeight(5);
        stroke(0,255,0);
        line(0,0,0,0,len,0);
        stroke(0,0,255);
        line(0,0,0,0,0,len);
        stroke(255,0,0);
        line(0,0,0,len,0,0);
        */
        strokeWeight(radius-5+2*lsys.gen);
        line(0, 0, len, 0);
        translate(len, 0, 0);
      } else if (c == 'f') {
        translate(len, 0, 0);
      } else if (c == 'L') {
        shape(leaf,0,0);
      } else if (c == '\\') {
        rotateX(theta);
      } else if (c == '/') {
        rotateX(-theta);
      } else if (c == 'v') {
        rotateY(theta);
      } else if (c == '^') {
        rotateY(-theta);
      } else if (c == '<') {
        rotateZ(theta);
      } else if (c == '>') {
        rotateZ(-theta);
      } else if (c == '|') {
        rotateZ(PI);
      } else if (c == '[') {
        pushMatrix();
        radius -= 4;
      } else if (c == ']') {
        popMatrix();
        radius += 4;
      } else if (c == 'B') {
        /*
        rotateX(map(mouseX,0,width,0,PI));
        strokeWeight(5);
        stroke(0,0,255);
        line(0,0,0,0,0,len);
        stroke(0,255,0);
        line(0,0,0,0,len,0);
        stroke(255,0,0);
        line(0,0,0,len,0,0);
        */
        rotateY(theta*pow(4.2,lsys.gen)/(lsys.gen*lsys.sentence.length()));
        strokeWeight(radius-5+2*lsys.gen);
        line(0, 0, len, 0);
        translate(len, 0, 0);
      }
    }
  }
  
  void setToDo(String s) {
    todo = s;
  }
  
  void multLen(float m) {
    len *= m;
  }
}