/*
import java.awt.Robot;
import java.awt.AWTException;
import java.awt.event.InputEvent;
import java.awt.Point;
import java.awt.AWTEvent;
import java.awt.event.*;
import java.awt.MouseInfo;

class Solver {
  int x, y, px, py, minesLeft;
  Robot rob;
  
  Solver() {
    x = (int)(rows/2);
    y = (int)(cols/2);
    //x = y = 0;
    px = x;
    py = y;
    minesLeft = mines;
    press(1,x,y);
    solve(x,y);
    
    try {
      rob = new Robot();
    }
    catch(AWTException e) {
      println("Robot class not supported by your system!");
      exit();
    }
  }
  
  void press(int button, int a, int b) {
    px = x;
    py = y;
    x = a;
    y = b;
    Point relPos = new Point((int)(x+s/2), (int)(y+s/2));
    
    Point absPos = relPos.getLocationOnScreen();
    println(absPos.x, absPos.y);
    rob.mouseMove(absPos.x, absPos.y);
    rob.mousePress(button);
  }
    
  void solve(int a, int b) {
    
  }
}
*/