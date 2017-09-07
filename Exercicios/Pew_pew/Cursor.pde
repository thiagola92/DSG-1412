public class Cursor {
  
  HashMap<Integer, Boolean> buttons = new HashMap<Integer, Boolean>();
  
  public boolean isButtonDown(Integer button) {
    if(buttons.get(button) == null) {
      setButtonDown(button, false);
      return false;
    }
    
    if(buttons.get(button) == true)
      return true;
    
    return false;
  }
  
  public void setButtonDown(Integer button, Boolean pressed) {
    buttons.put(button, pressed);
  }
  
  public float angleCompareTo(ObjectBase object) {
        float y = mouseY - object.physic.position_y;
        float x = mouseX - object.physic.position_x;
        float angle = atan2(y, x);
        
        return angle;
  }
  
}