int JUMP_LABEL_DURATION = 1;

class JumpLabel extends Label {
  
  int time;
  
  JumpLabel(String text, PVector position) {
    super(text, position);
    
    time = millis();
  }
  
  void draw() {
    super.position.y--;
    super.draw();
  }
  
  boolean isTimeToDelete() {
    int timeNow = millis();
    
    if(timeNow - time > JUMP_LABEL_DURATION*1000)
      return true;
    
    return false;
  }
}