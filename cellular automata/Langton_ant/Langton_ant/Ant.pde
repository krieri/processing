class Ant {
  PVector pos;
  int dir; //0=up, 1=right, 2=down, 3=left
  
  Ant(PVector p) {
    pos = p;
    dir = 1;
  }
  
  void move() {
    if (board[int(pos.x)][int(pos.y)] == 0) {
      dir = (dir+1)%4;
      board[int(pos.x)][int(pos.y)] = 1;
    } else {
      if (dir != 0) dir -= 1;
      else dir = 3;
      board[int(pos.x)][int(pos.y)] = 0;
    }
    if (dir == 0)       pos.y += 1;
    else if (dir == 1)  pos.x += 1;
    else if (dir == 2)  pos.y -= 1;
    else                pos.x -= 1;
    
    if (pos.x < 0)           pos.x = cols-1;
    else if (pos.x >= cols)  pos.x = 0;
    else if (pos.y < 0)      pos.y = rows-1;
    else if (pos.y >= rows)  pos.y = 0;
  }
}