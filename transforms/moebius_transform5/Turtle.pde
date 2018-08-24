class Turtle {
  String todo;  float len, theta;
  
  Turtle(String s, float l, float t) {
    todo = s;  len = l;  theta = t;
  }
  void setLen(float l) { len = l; }
  void changeLen(float pc) { len *= pc; }
  void setToDo(String s) { todo = s; }
  void render() {
    for (int i = 0; i < todo.length(); i++) {
      char c = todo.charAt(i);
      switch (c) {
        case 'F': { line(0,0,len,0); translate(len,0); break; }
        case 'f': { translate(len,0); break; }
        case '+': { rotate(theta); break; }
        case '-': { rotate(-theta); break; }
        case '[': { pushMatrix(); break; }
        case ']': { popMatrix(); break; }
      }
    }
  }
}