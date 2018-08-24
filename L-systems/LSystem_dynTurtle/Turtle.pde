class Turtle {
  
  String todo;
  float len;
  float theta;
  
  Turtle(String s) {
    todo = s;
    len = height/10;
  }
  
  void render(float t) {
    theta = t;
    stroke(0,175);
    for (int i = 0; i < todo.length(); i++) {
      char c = todo.charAt(i);
      if (c == 'F' || c == 'L' || c == 'R') {
        line(0, 0, len, 0);
        translate(len, 0);
      } else if (c == 'f') {
        translate(len, 0);
      } else if (c == '+') {
        rotate(theta);
      } else if (c == '-') {
        rotate (-theta);
      } else if (c == '[') {
        pushMatrix();
      } else if (c == ']') {
        popMatrix();
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